#!/usr/bin/env ruby

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

class Annotator
  def compute_displacement(pc, offset)
    pc + offset.half_complement()
  end
  
  def handle_line(line)
    line = line.strip
    md = /^(\w{8}):.*,0x(\w+)\(%pc\)/.match(line)

    if md
      pc = md[1].to_i(16)
      offset = md[2].to_i(16)
      
      puts line + " <0x%x>" % compute_displacement(pc, offset)
    else
      puts line
    end
    
  end
end


a = Annotator.new

File.open(ARGV[0]).each_line do |line|
  a.handle_line(line)
end
