AT&T 3B2 Revision 2 ROM images
==============================

Standard ROMs
-------------

These images are ROMs used on Revision 2 System Boards, including
the 3B2/300, 3B2/310, and 3B2/400.

  - AAYYC.bin
  - AAYYD.bin
  - AAYYE.bin
  - AAYYF.bin

These are binary images of Intel D2764A EPROMs from an AT&T 3B2/400.
The 3B2 reads full 32-bit words, interleaved from the 4 ROMs. The low
byte comes from AAYYC, the next byte from AAYYD, the next byte from
AAYYE, and the high byte from AAYYD.

  - COMBINED.bin

The file `COMBINED.bin` contains the output of interleaving the D2764A
images, and contains 8,192 32-bit words.

  - COMBINED.hex

This is a canonical HEX+ASCII dump of the `COMBINED.bin` file.

  - COMBINED.s

This file contains a disassembled and commented version of the Model
400 ROM. It is a work in progress, and has not been fully commented
yet.

Debug Monitor (DEMON) ROMs
--------------------------

These images are Debug Monitor ROMs that were an option on Revision 2
System Boards.

  - DEMON_0.bin
  - DEMON_1.bin
  - DEMON_2.bin
  - DEMON_3.bin

These are binary images of 16KB Intel D27128A EPROMs containing the
AT&T 3B2 Computer Debug Monitor.

  - DEMON_COMBINED.bin

The file `DEMON_COMBINED.bin` contains the output of interlaving
the D27128A EPROM images.

  - DEMON.jpg

Photograph of DEMON EPROMs installed in a 3B2/400.
