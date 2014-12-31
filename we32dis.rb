#!/usr/bin/env ruby
# 
# Copyright (c) 2015, Seth Morabito <web@loomcom.com>
# 
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation files
# (the "Software"), to deal in the Software without restriction,
# including without limitation the rights to use, copy, modify, merge,
# publish, distribute, sublicense, and/or sell copies of the Software,
# and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
# BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
# ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
##############################################################################
#
# A very bare-bones WE32100 Disassembler. This is presumed to have
# bugs, maybe even terrible ones.
#
# To use:
#
#     we32dis.rb [-s SKIP_BYTES] -i INPUT_FILE
#
# e.g.
#
#     we32dis.rb -s 0x1274 -i 400_full.bin > out.s
#
##############################################################################

require 'optparse'

#
# Monkey patch Numeric with some convenient 2's complement
# features.
#
class Numeric
  def byte_complement()
    if self > 0x7f && self <= 0xff
      return ~0xff + self
    end

    self
  end

  def half_complement()
    if self > 0x7fff && self <= 0xffff
      return ~0xffff + self
    end

    self
  end

  def word_complement()
    if self > 0x7fffffff && self <= 0xffffffff
      return ~0xffffffff + self
    end

    self
  end
end

#
# Class that describes an opcode
#
class Op
  NONE = 0
  COPR = 1
  DESC = 2
  BYTE = 3
  HALF = 4
  WORD = 5

  NA = 0
  BT = 1
  HW = 2
  WD = 4

  attr_accessor :opcode, :op_count, :op_mode, :dtype, :mnemonic

  def initialize(opcode, op_count, op_mode, dtype, mnemonic)
    @opcode = opcode
    @op_count = op_count
    @op_mode = op_mode
    @dtype = dtype
    @mnemonic = mnemonic
  end
end

class Operand
  attr_accessor :mode, :reg, :etype, :data

  def initialize
    @mode = 0
    @reg = 0
    @data = 0
    @etype = -1
  end

  def etype_name
    case @etype
    when 0
      "uword"
    when 2
      "uhalf"
    when 3
      "ubyte"
    when 4
      "word"
    when 6
      "half"
    when 7
      "sbyte"
    else
      "???"
    end
  end

  def register_name
    case @reg
    when 0, 1, 2, 3, 4, 5, 6, 7, 8
      "%%r%d" % @reg
    when 9
      "%fp"
    when 10
      "%ap"
    when 11
      "%psw"
    when 12
      "%sp"
    when 13
      "%pcbp"
    when 14
      "%isp"
    when 15
      "%pc"
    else
      "???"
    end
  end

  def mnemonic
    case mode
    when 0,1,2,3
      "&0x%x" % @data
    when 4
      if reg == 15
        "&0x%x" % @data
      else
        register_name
      end
    when 5
      if reg == 15
        "&0x%x" % @data
      else
        "(%s)" % register_name
      end
    when 6
      if reg == 15
        "&0x%x" % @data
      else
        "%d(%%fp)" % @data
      end
    when 7
      if reg == 15
        "$0x%x" % @data
      else
        "%d(%%ap)" % @data
      end
    when 8
      "%d(%s)" % [@data.word_complement, register_name]
    when 9
      "*%d(%s)" % [@data.word_complement, register_name]
    when 10
      "%d(%s)" % [@data.half_complement, register_name]
    when 11
      "*%d(%s)" % [@data.half_complement, register_name]
    when 12
      "%d(%s)" % [@data.byte_complement, register_name]
    when 13
      "*%d(%s)" % [@data.byte_complement, register_name]
    when 14
      if reg == 15
        "*$0x%x" % @data
      end
    when 15
      "&%d" % @data.byte_complement
    else
      "<rrr=%d;mmm=%d>" % [@reg, @mode]
    end
  end

  def to_s
    if @etype >= 0
      "{%s}%s" % [etype_name, mnemonic]
    else
      mnemonic
    end
  end
end

class Instruction
  attr_accessor :mnemonic, :opcode, :op_count, :op_mode, :operands, :bytes, :lineno

  def initialize
    @operands = []
    @bytes = []
    @lineno = 0
  end

  def to_s
    operand_string = operands.map {|o| o.to_s}.join(",")
    bytes_string = bytes.map {|b| "%02x" % b }.join(" ")
    str = "%08x: " % lineno
    str << bytes_string
    str << " " * (47 - bytes_string.length)
    str << mnemonic
    str << " " << operand_string
    
    return str
  end
end

class Decoder
  @@hw_op_table = [Op.new(0x3009, 0, Op::NONE, Op::NA, "MVERNO"),
                   Op.new(0x300D, 0, Op::NONE, Op::NA, "ENBVJMP"),
                   Op.new(0x3013, 0, Op::NONE, Op::NA, "DISVJMP"),
                   Op.new(0x3019, 0, Op::NONE, Op::NA, "MOVBLW"),
                   Op.new(0x301F, 0, Op::NONE, Op::NA, "STREND"),
                   Op.new(0x302F, 1, Op::DESC, Op::WD, "INTACK"),
                   Op.new(0x30C8, 0, Op::NONE, Op::NA, "RETPS"),
                   Op.new(0x3035, 0, Op::NONE, Op::NA, "STRCPY"),
                   Op.new(0x3045, 0, Op::NONE, Op::NA, "RETG"),
                   Op.new(0x3061, 0, Op::NONE, Op::NA, "GATE"),
                   Op.new(0x30AC, 0, Op::NONE, Op::NA, "CALLPS"),
                   Op.new(0x30C8, 0, Op::NONE, Op::NA, "RETPS")]

  @@op_table = [Op.new(0x00, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x01, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x02,  2, Op::COPR, Op::NA, "SPOPRD"),
                Op.new(0x03,  3, Op::COPR, Op::NA, "SPOPD2"),
                Op.new(0x04,  2, Op::DESC, Op::WD, "MOVAW"),
                Op.new(0x05, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x06,  2, Op::COPR, Op::NA, "SPOPRT"),
                Op.new(0x07,  3, Op::COPR, Op::NA, "SPOPT2"),
                Op.new(0x08,  0, Op::NONE, Op::NA, "RET"),
                Op.new(0x09, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x0a, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x0b, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x0c,  2, Op::DESC, Op::WD, "MOVTRW"),
                Op.new(0x0d, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x0e, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x0f, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x10,  1, Op::DESC, Op::NA, "SAVE"),
                Op.new(0x11, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x12, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x13,  2, Op::COPR, Op::NA, "SPOPWD"),
                Op.new(0x14,  1, Op::BYTE, Op::NA, "EXTOP"),
                Op.new(0x15, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x16, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x17,  2, Op::COPR, Op::NA, "SPOPWT"),
                Op.new(0x18,  1, Op::DESC, Op::NA, "RESTORE"),
                Op.new(0x19, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x1a, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x1b, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x1c,  1, Op::DESC, Op::NA, "SWAPWI"),
                Op.new(0x1d, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x1e,  1, Op::DESC, Op::NA, "SWAPHI"),
                Op.new(0x1f,  1, Op::DESC, Op::NA, "SWAPBI"),
                Op.new(0x20,  1, Op::DESC, Op::NA, "POPW"),
                Op.new(0x21, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x22,  2, Op::COPR, Op::NA, "SPOPRS"),
                Op.new(0x23,  3, Op::COPR, Op::NA, "SPOPS2"),
                Op.new(0x24,  1, Op::DESC, Op::NA, "JMP"),
                Op.new(0x25, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x26, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x27, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x28,  1, Op::DESC, Op::WD, "TSTW"),
                Op.new(0x29, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x2a,  1, Op::DESC, Op::HW, "TSTH"),
                Op.new(0x2b,  1, Op::DESC, Op::BT, "TSTB"),
                Op.new(0x2c,  2, Op::DESC, Op::NA, "CALL"),
                Op.new(0x2d, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x2e,  0, Op::NONE, Op::NA, "BPT"),
                Op.new(0x2f,  0, Op::NONE, Op::NA, "WAIT"),
                Op.new(0x30,  0, Op::NONE, Op::NA, "???"),
                Op.new(0x31, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x32,  1, Op::COPR, Op::NA, "SPOP"),
                Op.new(0x33,  2, Op::COPR, Op::NA, "SOPOWS"),
                Op.new(0x34,  1, Op::DESC, Op::NA, "JSB"),
                Op.new(0x35, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x36,  1, Op::HALF, Op::NA, "BSBH"),
                Op.new(0x37,  1, Op::BYTE, Op::NA, "BSBB"),
                Op.new(0x38,  2, Op::DESC, Op::WD, "BITW"),
                Op.new(0x39, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x3a,  2, Op::DESC, Op::HW, "BITH"),
                Op.new(0x3b,  2, Op::DESC, Op::BT, "BITB"),
                Op.new(0x3c,  2, Op::DESC, Op::WD, "CMPW"),
                Op.new(0x3d, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x3e,  2, Op::DESC, Op::HW, "CMPH"),
                Op.new(0x3f,  2, Op::DESC, Op::BT, "CMPB"),
                Op.new(0x40,  0, Op::NONE, Op::NA, "RGEQ"),
                Op.new(0x41, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x42,  1, Op::HALF, Op::NA, "BGEH"),
                Op.new(0x43,  1, Op::BYTE, Op::NA, "BGEB"),
                Op.new(0x44,  0, Op::NONE, Op::NA, "RGTR"),
                Op.new(0x45, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x46,  1, Op::HALF, Op::NA, "RGH"),
                Op.new(0x47,  1, Op::BYTE, Op::NA, "RGB"),
                Op.new(0x48,  0, Op::NONE, Op::NA, "RLSS"),
                Op.new(0x49, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x4a,  1, Op::HALF, Op::NA, "BLH"),
                Op.new(0x4b,  1, Op::BYTE, Op::NA, "BLB"),
                Op.new(0x4c,  0, Op::NONE, Op::NA, "RLEQ"),
                Op.new(0x4d, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x4e,  1, Op::HALF, Op::NA, "BLEH"),
                Op.new(0x4f,  1, Op::BYTE, Op::NA, "BLEB"),
                Op.new(0x50,  0, Op::NONE, Op::NA, "RGEQU"),
                Op.new(0x51, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x52,  1, Op::HALF, Op::NA, "BGEUH"),
                Op.new(0x53,  1, Op::BYTE, Op::NA, "BGEUB"),
                Op.new(0x54,  0, Op::NONE, Op::NA, "RGTRU"),
                Op.new(0x55, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x56,  1, Op::HALF, Op::NA, "BGUH"),
                Op.new(0x57,  1, Op::BYTE, Op::NA, "BGUB"),
                Op.new(0x58,  0, Op::NONE, Op::NA, "BLSSU"),
                Op.new(0x59, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x5a,  1, Op::HALF, Op::NA, "BLUH"),
                Op.new(0x5b,  1, Op::BYTE, Op::NA, "BLUB"),
                Op.new(0x5c,  0, Op::NONE, Op::NA, "RLEQU"),
                Op.new(0x5d, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x5e,  1, Op::HALF, Op::NA, "BLEUH"),
                Op.new(0x5f,  1, Op::BYTE, Op::NA, "BLEUB"),
                Op.new(0x60,  0, Op::NONE, Op::NA, "RVC"),
                Op.new(0x61, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x62,  1, Op::HALF, Op::NA, "BVCH"),
                Op.new(0x63,  1, Op::BYTE, Op::NA, "BVCB"),
                Op.new(0x64,  0, Op::NONE, Op::NA, "RNEQU"),
                Op.new(0x65, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x66,  1, Op::HALF, Op::NA, "BNEH"),
                Op.new(0x67,  1, Op::BYTE, Op::NA, "BNEB"),
                Op.new(0x68,  0, Op::NONE, Op::NA, "RVS"),
                Op.new(0x69, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x6a,  1, Op::HALF, Op::NA, "BVSH"),
                Op.new(0x6b,  1, Op::BYTE, Op::NA, "BVSB"),
                Op.new(0x6c,  0, Op::NONE, Op::NA, "REQLU"),
                Op.new(0x6d, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x6e,  1, Op::HALF, Op::NA, "BEH"),
                Op.new(0x6f,  1, Op::BYTE, Op::NA, "BEB"),
                Op.new(0x70,  0, Op::NONE, Op::NA, "NOP"),
                Op.new(0x71, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x72,  0, Op::NONE, Op::NA, "NOP3"),
                Op.new(0x73,  0, Op::NONE, Op::NA, "NOP2"),
                Op.new(0x74,  0, Op::NONE, Op::NA, "RNEQ"),
                Op.new(0x75, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x76,  1, Op::HALF, Op::NA, "BNEH"),
                Op.new(0x77,  1, Op::BYTE, Op::NA, "BNEB"),
                Op.new(0x78,  0, Op::NONE, Op::NA, "RSB"),
                Op.new(0x79, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x7a,  1, Op::HALF, Op::NA, "BRH"),
                Op.new(0x7b,  1, Op::BYTE, Op::NA, "BRB"),
                Op.new(0x7c,  0, Op::NONE, Op::NA, "REQL"),
                Op.new(0x7d, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x7e,  1, Op::HALF, Op::NA, "BEH"),
                Op.new(0x7f,  1, Op::BYTE, Op::NA, "BEB"),
                Op.new(0x80,  1, Op::DESC, Op::WD, "CLRW"),
                Op.new(0x81, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x82,  1, Op::DESC, Op::HW, "CLRH"),
                Op.new(0x83,  1, Op::DESC, Op::BT, "CLRB"),
                Op.new(0x84,  2, Op::DESC, Op::WD, "MOVW"),
                Op.new(0x85, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x86,  2, Op::DESC, Op::HW, "MOVH"),
                Op.new(0x87,  2, Op::DESC, Op::BT, "MOVB"),
                Op.new(0x88,  2, Op::DESC, Op::WD, "MCOMW"),
                Op.new(0x89, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x8a,  2, Op::DESC, Op::HW, "MCOMH"),
                Op.new(0x8b,  2, Op::DESC, Op::BT, "MCOMB"),
                Op.new(0x8c,  2, Op::DESC, Op::WD, "MNEGW"),
                Op.new(0x8d, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x8e,  2, Op::DESC, Op::HW, "MNEGH"),
                Op.new(0x8f,  2, Op::DESC, Op::BT, "MNEGB"),
                Op.new(0x90,  1, Op::DESC, Op::WD, "INCW"),
                Op.new(0x91, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x92,  1, Op::DESC, Op::HW, "INCH"),
                Op.new(0x93,  1, Op::DESC, Op::BT, "INCB"),
                Op.new(0x94,  1, Op::DESC, Op::WD, "DECW"),
                Op.new(0x95, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x96,  1, Op::DESC, Op::HW, "DECH"),
                Op.new(0x97,  1, Op::DESC, Op::BT, "DECB"),
                Op.new(0x98, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x99, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x9a, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x9b, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x9c,  2, Op::DESC, Op::WD, "ADDW2"),
                Op.new(0x9d, -1, Op::NONE, Op::NA, "???"),
                Op.new(0x9e,  2, Op::DESC, Op::HW, "ADDH2"),
                Op.new(0x9f,  2, Op::DESC, Op::BT, "ADDB2"),
                Op.new(0xa0,  1, Op::DESC, Op::NA, "PUSHW"),
                Op.new(0xa1, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xa2, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xa3, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xa4,  2, Op::DESC, Op::WD, "MODW2"),
                Op.new(0xa5, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xa6,  2, Op::DESC, Op::HW, "MODH2"),
                Op.new(0xa7,  2, Op::DESC, Op::BT, "MODB2"),
                Op.new(0xa8,  2, Op::DESC, Op::WD, "MULW2"),
                Op.new(0xa9, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xaa,  2, Op::DESC, Op::HW, "MULH2"),
                Op.new(0xab,  2, Op::DESC, Op::BT, "MULB2"),
                Op.new(0xac,  2, Op::DESC, Op::WD, "DIVW2"),
                Op.new(0xad, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xae,  2, Op::DESC, Op::HW, "DIVH2"),
                Op.new(0xaf,  2, Op::DESC, Op::BT, "DIVB2"),
                Op.new(0xb0,  2, Op::DESC, Op::WD, "ORW2"),
                Op.new(0xb1, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xb2,  2, Op::DESC, Op::HW, "ORH2"),
                Op.new(0xb3,  2, Op::DESC, Op::BT, "ORB2"),
                Op.new(0xb4,  2, Op::DESC, Op::WD, "XORW2"),
                Op.new(0xb5, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xb6,  2, Op::DESC, Op::HW, "XORH2"),
                Op.new(0xb7,  2, Op::DESC, Op::BT, "XORB2"),
                Op.new(0xb8,  2, Op::DESC, Op::WD, "ANDW2"),
                Op.new(0xb9, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xba,  2, Op::DESC, Op::HW, "ANDH2"),
                Op.new(0xbb,  2, Op::DESC, Op::BT, "ANDB2"),
                Op.new(0xbc,  2, Op::DESC, Op::WD, "SUBW2"),
                Op.new(0xbd, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xbe,  2, Op::DESC, Op::HW, "SUBH2"),
                Op.new(0xbf,  2, Op::DESC, Op::BT, "SUBB2"),
                Op.new(0xc0,  3, Op::DESC, Op::WD, "ALSW3"),
                Op.new(0xc1, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xc2, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xc3, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xc4,  3, Op::DESC, Op::WD, "ARSW3"),
                Op.new(0xc5, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xc6,  3, Op::DESC, Op::HW, "ARSH3"),
                Op.new(0xc7,  3, Op::DESC, Op::BT, "ARSB3"),
                Op.new(0xc8,  4, Op::DESC, Op::WD, "INSFW"),
                Op.new(0xc9, -1, Op::DESC, Op::NA, "???"),
                Op.new(0xca,  4, Op::DESC, Op::HW, "INSFH"),
                Op.new(0xcb,  4, Op::DESC, Op::BT, "INSFB"),
                Op.new(0xcc,  4, Op::DESC, Op::WD, "EXTFW"),
                Op.new(0xcd, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xce,  4, Op::DESC, Op::HW, "EXTFH"),
                Op.new(0xcf,  4, Op::DESC, Op::BT, "EXTFB"),
                Op.new(0xd0,  3, Op::DESC, Op::WD, "LLSW3"),
                Op.new(0xd1, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xd2,  3, Op::DESC, Op::HW, "LLSH3"),
                Op.new(0xd3,  3, Op::DESC, Op::BT, "LLSB3"),
                Op.new(0xd4,  3, Op::DESC, Op::WD, "LRSW3"),
                Op.new(0xd5, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xd6, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xd7, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xd8,  3, Op::DESC, Op::WD, "ROTW"),
                Op.new(0xd9, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xda, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xdb, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xdc,  3, Op::DESC, Op::WD, "ADDW3"),
                Op.new(0xdd, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xde,  3, Op::DESC, Op::HW, "ADDH3"),
                Op.new(0xdf,  3, Op::DESC, Op::BT, "ADDB3"),
                Op.new(0xe0,  1, Op::DESC, Op::WD, "PUSHAW"),
                Op.new(0xe1, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xe2, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xe3, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xe4,  3, Op::DESC, Op::WD, "MODW3"),
                Op.new(0xe5, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xe6,  3, Op::DESC, Op::HW, "MODH3"),
                Op.new(0xe7,  3, Op::DESC, Op::BT, "MODB3"),
                Op.new(0xe8,  3, Op::DESC, Op::WD, "MULW3"),
                Op.new(0xe9, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xea,  3, Op::DESC, Op::HW, "MULH3"),
                Op.new(0xeb,  3, Op::DESC, Op::BT, "MULB3"),
                Op.new(0xec,  3, Op::DESC, Op::WD, "DIVW3"),
                Op.new(0xed, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xee,  3, Op::DESC, Op::HW, "DIVH3"),
                Op.new(0xef,  3, Op::DESC, Op::BT, "DIVB3"),
                Op.new(0xf0,  3, Op::DESC, Op::WD, "ORW3"),
                Op.new(0xf1, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xf2,  3, Op::DESC, Op::HW, "ORH3"),
                Op.new(0xf3,  3, Op::DESC, Op::BT, "ORB3"),
                Op.new(0xf4,  3, Op::DESC, Op::WD, "XORW3"),
                Op.new(0xf5, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xf6,  3, Op::DESC, Op::HW, "XORH3"),
                Op.new(0xf7,  3, Op::DESC, Op::BT, "XORB3"),
                Op.new(0xf8,  3, Op::DESC, Op::WD, "ANDW3"),
                Op.new(0xf9, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xfa,  3, Op::DESC, Op::HW, "ANDH3"),
                Op.new(0xfb,  3, Op::DESC, Op::BT, "ANDB3"),
                Op.new(0xfc,  3, Op::DESC, Op::WD, "SUBW3"),
                Op.new(0xfd, -1, Op::NONE, Op::NA, "???"),
                Op.new(0xfe,  3, Op::DESC, Op::HW, "SUBH3"),
                Op.new(0xff,  3, Op::DESC, Op::BT, "SUBB3")]


  def consume_byte(byte_stream, offset, instr)
    instr.bytes << byte_stream[offset]

    byte_stream[offset]
  end

  def consume_halfword(byte_stream, offset, instr)
    instr.bytes << byte_stream[offset]
    instr.bytes << byte_stream[offset + 1]
        
    val = byte_stream[offset]
    val |= (byte_stream[offset + 1] << 8)
    val
  end

  def consume_word(byte_stream, offset, instr)
    instr.bytes << byte_stream[offset]
    instr.bytes << byte_stream[offset + 1]
    instr.bytes << byte_stream[offset + 2]
    instr.bytes << byte_stream[offset + 3]

    val = byte_stream[offset]
    val |= (byte_stream[offset + 1] << 8)
    val |= (byte_stream[offset + 2] << 16)
    val |= (byte_stream[offset + 3] << 24)
    val
  end

  #
  # Decode a single operand from the byte stream.
  #
  # Here, the operand is injected so that we can recurse
  # into this method when reading Expanded Data-type operands
  # from the byte stream.
  #
  def decode_operand(byte_stream, offset, instr, operand)
    consumed = 0

    # Grab the descriptor byte
    descriptor = consume_byte(byte_stream, offset, instr)

    consumed += 1

    operand.mode = (descriptor >> 4) & 0xf
    operand.reg  = descriptor & 0xf

    case operand.mode
    when 0, 1, 2, 3
      operand.data = descriptor

    when 4
      if operand.reg == 15  # Word Immediate
        operand.data = consume_word(byte_stream, offset + consumed, instr)
        consumed += 4
      end
      # else: register mode.

    when 5
      if operand.reg == 15 # Halfword Immediate
        operand.data = consume_halfword(byte_stream, offset + consumed, instr)
        consumed += 2
      end
      # else: register deferred mode.

    when 6
      if operand.reg == 15 # Byte Immediate
        operand.data = consume_byte(byte_stream, offset + consumed, instr)
        consumed += 1
      else
        operand.data = operand.reg
      end

    when 7
      if operand.reg == 15 # Absolute
        operand.data = consume_word(byte_stream, offset + consumed, instr)
        consumed += 4
      end

    when 8, 9
      operand.data = consume_word(byte_stream, offset + consumed, instr)
      consumed += 4

    when 10, 11
      operand.data = consume_halfword(byte_stream, offset + consumed, instr)
      consumed += 2

    when 12, 13
      operand.data = consume_byte(byte_stream, offset + consumed, instr)
      consumed += 1

    when 14
      if operand.reg == 15 # Absolute deferred
        operand.data = consume_word(byte_stream, offset + consumed, instr)
        consumed += 4
      else # Expanded
        operand.etype = operand.reg
        # Recurse to get the "real" operand.
        consumed += decode_operand(byte_stream, offset + consumed, instr, operand)
        return consumed
      end

    when 15 # Negative Literal
      operand.data = descriptor
    end
    
    instr.operands << operand
    return consumed
  end

  #
  # Returns the total number of bytes consumed from the byte stream
  #
  def decode_instruction(byte_stream, offset)

    instr = Instruction.new
    consumed = 0
    
    opcode = consume_byte(byte_stream, offset, instr)
    consumed += 1

    op = nil

    if (opcode == 0x30)
      opcode = (opcode << 8)
      opcode |= consume_byte(byte_stream, offset + consumed, instr)
      consumed += 1

      # This is a 16-bit operand
      @@hw_op_table.each do |o|
        if o.opcode == opcode
          op = o
          break
        end
      end

      if op == nil
        # Catch-all if no operand was found.
        op = Op.new(opcode, -1, Op::NONE, Op::NA, "???")
      end
    else
      op = @@op_table[opcode]
    end

    # if (op.op_count < 0)
    #  return consumed
    # end

    instr.mnemonic = op.mnemonic
    instr.op_mode = op.op_mode
    instr.op_count = op.op_count
    instr.lineno = offset

    # Now we can grab the first operand byte

    case instr.op_mode
    when Op::BYTE
      operand = Operand.new
      operand.data = consume_byte(byte_stream, offset + consumed, instr)
      consumed += 1
      instr.operands << operand
    when Op::HALF
      operand = Operand.new
      operand.data = consume_halfword(byte_stream, offset + consumed, instr)
      consumed += 2
      instr.operands << operand
    when Op::COPR
      operand = Operand.new
      operand.data = consume_word(byte_stream, offset + consumed, instr)
      consumed += 4
      instr.operands << operand
      (instr.op_count - 1).times do |i|
        consumed += decode_operand(byte_stream, offset + consumed,
                                   instr, Operand.new)
      end
    when Op::DESC
      instr.op_count.times do |i|
        consumed += decode_operand(byte_stream, offset + consumed,
                                   instr, Operand.new)
      end
    end

    puts instr

    return consumed
  end
  
end


#
# Main
#

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on("-i", "--input FILE", "Input") do |i|
    options[:input] = i
  end

  opts.on("-s", "--skip SKIP_BYTES", Integer, "Skip Bytes") do |s|
    options[:skip] = s
  end
    
end.parse!

if options[:input] == nil
  raise OptionParser::MissingArgument.new("-i (--input) is required.")
end

# Start reading in from the input

decoder = Decoder.new()
offset = options[:skip] || 0

byte_stream = []
File.open(options[:input], "rb").each_byte {|b| byte_stream << b}

while offset < byte_stream.length
  offset += decoder.decode_instruction(byte_stream, offset)
end
