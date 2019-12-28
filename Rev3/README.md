AT&T 3B2 Revision 3 ROM images
==============================

Standard ROMs
-------------

These images are ROMs used on Revision 3 System Boards, including the
3B2/500, 3B2/600, and 3B2/1000.

  - ABTRT.bin
  - ABTRU.bin
  - ABTRW.bin
  - ABTRY.bin

These are binary images of 32KB EPROMs (D27128 or equivalent) from an
AT&T 3B2/600. Together, they comprise a 128KB / 32KW ROM.

  - COMBINED.bin

The file `COMBINED.bin` contains the output of interleaving the D27128
images.

  - COMBINED.hex

This is the canonical HEX+ASCII dump of the `COMBINED.bin` file.

  - COMBINED.s

This file contains a disassembled and commented version of the Model
1000 ROM. It is a work in progress, and has not been fully commented
yet.
