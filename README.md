AT&T 3B2 ROM images
====================

3B2 Model 310
-------------

- 310_AAYYC.bin
- 310_AAYYD.bin
- 310_AAYYE.bin
- 310_AAYYF.bin
- 310_full.bin

These are binary images of Intel D2764A EPROMs from an AT&T 3B2 Model 310.
The 3B2 reads full 32-bit words from the 4 ROMs. The low byte
comes from AAYYC, the next byte from AAYYD, the next byte from AAYYE,
and the high byte from AAYYD.

The file `310_full.bin` contains the output of interleaving the D2764A
images, and contains 8,192 32-bit words.

- 310_full.hex

This is a canonical HEX+ASCII dump of the `310_full.bin` file.

3B2 Model 400
-------------

- 400_AAYYC.bin
- 400_AAYYD.bin
- 400_AAYYE.bin
- 400_AAYYF.bin
- 400_full.bin

These are binary images of Intel D2764A EPROMs from an AT&T 3B2 Model 400.
They appear to be identical to the 310 ROMs except for the final few
bytes. They are included for completeness.

- 400_full.hex

This is a canonical HEX+ASCII dump of the `400_full.bin` file.
