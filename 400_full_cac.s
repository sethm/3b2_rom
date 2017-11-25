##
## This is the disassembled 3B2 Model 400 ROM. I'm attempting to trace it to
## the best of my ability to understand what the 3B2 does at startup.
##
## Disassembled with:
##
##    we32dis.rb -s 0x1274 -i 400_full.bin > disassembled.txt
##
## $ od -Ax -v -t x4 --endian=big 400_full.bin | awk '{printf "\t.word\t 0x%s, 0x%s, 0x%s, 0x%s\t# %s\n", $2, $3, $4, $5, $1}' | less > cac.tmp
## $ od -Ax -v -t x1 -w4 --endian=big 400_full.bin | awk '{printf "\t.byte\t 0x%s, 0x%s, 0x%s, 0x%s\t# %s\n", $2, $3, $4, $5, $1}' | less > cacb.tmp
##

	.section	.text, "x"
	.word	0x00000548, 0xffffffff, 0xffffffff, 0xffffffff	# 000000
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff	# 000010
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff	# 000020
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff	# 000030
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff	# 000040
l50:
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff	# 000050
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff	# 000060
	.word	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff	# 000070
	.word	0x000005d8, 0x02000b78, 0x02000b78            	# 000080

### Exception Vector Table
### ----------------------
###
### Normal Exception Vector = 0x00000548 which points to 0x421F
###
### Interrupt Vector Table Pointers
### -------------------------------
###
### NMI Interrupt Handler
###
###   0x8C = 02000bc8

	.word	                                     0x02000bc8	# 000080

###
### Auto Vector Interrupts
###
###   0x090:  02000bc8
###   0x094:  02000bc8
###   0x098:  02000bc8
###   0x09C:  02000bc8
###   0x0A0:  02000bc8
###   0x0A4:  02000bc8
###   0x0A8:  02000bc8
###   0x0AC:  02000c18
###   0x0B0:  02000c68
###   0x0B4:  02000cb8
###   0x0B8:  02000d08
###   0x0BC:  02000d58
###   0x0C0:  0x200da8
###   0x0C4:  0x200da8
###   0x0C8:  0x200e48
###   0x0CC:  0x200bc8
###   0x0D0:  0x200bc8
###    ... [same] ...
###   0x104:  0x200bc8
###   0x108:  0x200bc8

	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000090
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000c18	# 0000a0
	.word	0x02000c68, 0x02000cb8, 0x02000d08, 0x02000d58	# 0000b0
	.word	0x02000da8, 0x02000da8, 0x02000e48, 0x02000bc8	# 0000c0
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 0000d0
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 0000e0
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 0000f0
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8            	# 000100
###
### Device Interrupt Handlers
###
###   0x10c:  0x200bc8
###   0x110:  0x200bc8
###    ... [same] ...
###   0x484:  0x200bc8
###   0x488:  0x200bc8
###
	.word	                                     0x02000bc8	# 000100
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000110
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000120
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000130
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000140
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000150
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000160
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000170
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000180
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000190
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 0001a0
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 0001b0
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 0001c0
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 0001d0
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 0001e0
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 0001f0
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000200
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000210
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000220
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000230
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000240
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000250
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000260
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000270
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000280
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000290
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 0002a0
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 0002b0
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 0002c0
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 0002d0
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 0002e0
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 0002f0
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000300
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000310
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000320
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000330
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000340
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000350
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000360
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000370
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000380
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000390
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 0003a0
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 0003b0
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 0003c0
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 0003d0
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 0003e0
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 0003f0
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000400
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000410
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000420
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000430
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000440
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000450
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000460
	.word	0x02000bc8, 0x02000bc8, 0x02000bc8, 0x02000bc8	# 000470
	.word	0x02000bc8, 0x02000bc8                        	# 000480

###
### In all, there are 8 distinct interrupt PCBPs:
###
###    02000bc8
###    02000c18
###    02000c68
###    02000d08
###    02000cb8
###    02000d58
###    02000da8
###    02000e48

	.word	                         0x02000bc8, 0x02000864	# 000480
	.word	0x02001514, 0x020011f8, 0x020011f4, 0x02000858	# 000490
	.word	0x02001200, 0x020012a8, 0x0200126c            	# 0004a0


## Indirect entry points

	.word	0x4dd4	# 4ac: 'getedt' routine
	.word	printf	# 4b0: 'printf' routine

	.word	             0x00004360, 0x00004ae4, 0x00007f68	# 0004b0
	.word	0x00002af8, 0x02001268, 0x00004484, 0x00005320	# 0004c0
	.word	0x00005224, 0x000052a0, 0x00007698, 0x00007b2c	# 0004d0
	.word	0x020011f0, 0x020011ec, 0x02001504, 0x00001168	# 0004e0
	.word	0x02000a80, 0x02001258, 0x0200125c, 0x020011e8	# 0004f0
	.word	0x00003d74, 0x02001264, 0x00007ff0, 0x020012d8	# 000500
	.word	0x020012d0, 0x0200086c, 0x00005438, 0x00005450	# 000510
	.word	0x000054a1, 0x00004e14                        	# 000520

	.word	0x5504	# 528 DUART Delay routine

	.word	                                     0x020012dc	# 000520
	.word	0x020012e0, 0x020012e4, 0x000055ec, 0x00005baa	# 000530
	.word	0x000051d2, 0x02000a74, 0x0081e100, 0x0000421f	# 000540
	.word	0x0081e100, 0x00004259, 0x0081e100, 0x0000421f	# 000550
	.word	0x0081e100, 0x0000421f, 0x0081e100, 0x0000421f	# 000560
	.word	0x0081e100, 0x0000421f, 0x0081e100, 0x0000421f	# 000570
	.word	0x0081e100, 0x0000421f, 0x0081e100, 0x0000421f	# 000580
	.word	0x0081e100, 0x0000421f, 0x0081e100, 0x0000421f	# 000590
	.word	0x0081e100, 0x0000421f, 0x0081e100, 0x0000421f	# 0005a0
	.word	0x0081e100, 0x0000421f, 0x0081e100, 0x00004259	# 0005b0
	.word	0x0081e100, 0x0000421f, 0x2f66696c, 0x6c656474	# 0005c0
	.word	0x00464435, 0x00000000, 0x0081e180, 0x00001274	# 0005d0
	.word	0x02000008, 0x00000000, 0x00000000, 0x00000000	# 0005e0
	.word	0x02000008, 0x02000808, 0x00000000, 0x00000000	# 0005f0
	.word	0x00000000, 0x00000000, 0x00000000, 0x00000000	# 000600
	.word	0x00000000, 0x00000000, 0x00000000, 0x00000000	# 000610
	.word	0x00000000, 0x00000000                        	# 000620

### Strings

# 628:	"SBD"
l628:
	.byte	0x53, 0x42, 0x44, 0x00	# 000628

# 62c:	"\nEnter name of program to execute [ %s ]: "
l62c:
	.byte	0x0a, 0x45, 0x6e, 0x74	# 00062c
	.byte	0x65, 0x72, 0x20, 0x6e	# 000630
	.byte	0x61, 0x6d, 0x65, 0x20	# 000634
	.byte	0x6f, 0x66, 0x20, 0x70	# 000638
	.byte	0x72, 0x6f, 0x67, 0x72	# 00063c
	.byte	0x61, 0x6d, 0x20, 0x74	# 000640
	.byte	0x6f, 0x20, 0x65, 0x78	# 000644
	.byte	0x65, 0x63, 0x75, 0x74	# 000648
	.byte	0x65, 0x20, 0x5b, 0x20	# 00064c
	.byte	0x25, 0x73, 0x20, 0x5d	# 000650
	.byte	0x3a, 0x20, 0x00

# 657:	"\n"
l657:
	.byte	0x0a, 0	# 000654


# 659:	"passwd"
l659:
	.byte	       0x70, 0x61, 0x73	# 000658
	.byte	0x73, 0x77, 0x64, 0x00	# 00065c


# 660:	"\nenter old password: "
l660:
	.byte	0x0a, 0x65, 0x6e, 0x74	# 000660
	.byte	0x65, 0x72, 0x20, 0x6f	# 000664
	.byte	0x6c, 0x64, 0x20, 0x70	# 000668
	.byte	0x61, 0x73, 0x73, 0x77	# 00066c
	.byte	0x6f, 0x72, 0x64, 0x3a	# 000670
	.byte	0x20, 0x00            	# 000674

# 676:	"\nenter new password: "
l676:
	.byte	             0x0a, 0x65	# 000674
	.byte	0x6e, 0x74, 0x65, 0x72	# 000678
	.byte	0x20, 0x6e, 0x65, 0x77	# 00067c
	.byte	0x20, 0x70, 0x61, 0x73	# 000680
	.byte	0x73, 0x77, 0x6f, 0x72	# 000684
	.byte	0x64, 0x3a, 0x20, 0x00	# 000688


# 68c:	"\nconfirmation: "
l68c:
	.byte	0x0a, 0x63, 0x6f, 0x6e	# 00068c
	.byte	0x66, 0x69, 0x72, 0x6d	# 000690
	.byte	0x61, 0x74, 0x69, 0x6f	# 000694
	.byte	0x6e, 0x3a, 0x20, 0x00	# 000698


# 69c:	"\n"
l69c:
	.byte	0x0a, 0x00            	# 00069c

# 69e:	"newkey"
l69e:
	.byte	             0x6e, 0x65	# 00069c
	.byte	0x77, 0x6b, 0x65, 0x79	# 0006a0
	.byte	0x00                  	# 0006a4

# 6a5:	"\nCreating a floppy key to enable clearing of saved NVRAM information.\n\n"
l6a5:
	.byte	       0x0a, 0x43, 0x72	# 0006a4
	.byte	0x65, 0x61, 0x74, 0x69	# 0006a8
	.byte	0x6e, 0x67, 0x20, 0x61	# 0006ac
	.byte	0x20, 0x66, 0x6c, 0x6f	# 0006b0
	.byte	0x70, 0x70, 0x79, 0x20	# 0006b4
	.byte	0x6b, 0x65, 0x79, 0x20	# 0006b8
	.byte	0x74, 0x6f, 0x20, 0x65	# 0006bc
	.byte	0x6e, 0x61, 0x62, 0x6c	# 0006c0
	.byte	0x65, 0x20, 0x63, 0x6c	# 0006c4
	.byte	0x65, 0x61, 0x72, 0x69	# 0006c8
	.byte	0x6e, 0x67, 0x20, 0x6f	# 0006cc
	.byte	0x66, 0x20, 0x73, 0x61	# 0006d0
	.byte	0x76, 0x65, 0x64, 0x20	# 0006d4
	.byte	0x4e, 0x56, 0x52, 0x41	# 0006d8
	.byte	0x4d, 0x20, 0x69, 0x6e	# 0006dc
	.byte	0x66, 0x6f, 0x72, 0x6d	# 0006e0
	.byte	0x61, 0x74, 0x69, 0x6f	# 0006e4
	.byte	0x6e, 0x0a, 0x0a, 0x00	# 0006e8


# 6ec:	"go"
l6ec:
	.byte	0x67, 0x6f, 0x00      	# 0006ec

# 6ef:	"Insert a formatted floppy, then type 'go' (q to quit): "
l6ef:
	.byte	                   0x49	# 0006ec
	.byte	0x6e, 0x73, 0x65, 0x72	# 0006f0
	.byte	0x74, 0x20, 0x61, 0x20	# 0006f4
	.byte	0x66, 0x6f, 0x72, 0x6d	# 0006f8
	.byte	0x61, 0x74, 0x74, 0x65	# 0006fc
	.byte	0x64, 0x20, 0x66, 0x6c	# 000700
	.byte	0x6f, 0x70, 0x70, 0x79	# 000704
	.byte	0x2c, 0x20, 0x74, 0x68	# 000708
	.byte	0x65, 0x6e, 0x20, 0x74	# 00070c
	.byte	0x79, 0x70, 0x65, 0x20	# 000710
	.byte	0x27, 0x67, 0x6f, 0x27	# 000714
	.byte	0x20, 0x28, 0x71, 0x20	# 000718
	.byte	0x74, 0x6f, 0x20, 0x71	# 00071c
	.byte	0x75, 0x69, 0x74, 0x29	# 000720
	.byte	0x3a, 0x20, 0x00      	# 000724

# 727:	"\nCreation of floppy key complete\n\n"
l727:
	.byte	                   0x0a	# 000724
	.byte	0x43, 0x72, 0x65, 0x61	# 000728
	.byte	0x74, 0x69, 0x6f, 0x6e	# 00072c
	.byte	0x20, 0x6f, 0x66, 0x20	# 000730
	.byte	0x66, 0x6c, 0x6f, 0x70	# 000734
	.byte	0x70, 0x79, 0x20, 0x6b	# 000738
	.byte	0x65, 0x79, 0x20, 0x63	# 00073c
	.byte	0x6f, 0x6d, 0x70, 0x6c	# 000740
	.byte	0x65, 0x74, 0x65, 0x0a	# 000744
	.byte	0x0a, 0x00            	# 000748

# 74a:	"sysdump"
l74a:
	.byte	             0x73, 0x79	# 000748
	.byte	0x73, 0x64, 0x75, 0x6d	# 00074c
	.byte	0x70, 0x00            	# 000750

# 752:	"version"
l752:
	.byte	             0x76, 0x65	# 000750
	.byte	0x72, 0x73, 0x69, 0x6f	# 000754
	.byte	0x6e, 0x00            	# 000758

# 75a:	"\nCreated: %s\n"
l75a:
	.byte	             0x0a, 0x43	# 000758
	.byte	0x72, 0x65, 0x61, 0x74	# 00075c
	.byte	0x65, 0x64, 0x3a, 0x20	# 000760
	.byte	0x25, 0x73, 0x0a, 0x00	# 000764

# 768:	"Issue: %08lx\n"
l768:
	.byte	0x49, 0x73, 0x73, 0x75	# 000768
	.byte	0x65, 0x3a, 0x20, 0x25	# 00076c
	.byte	0x30, 0x38, 0x6c, 0x78	# 000770
	.byte	0x0a, 0x00            	# 000774

# 776:	"Release: %s\nLoad: %s\n"
l776:
	.byte	             0x52, 0x65	# 000774
	.byte	0x6c, 0x65, 0x61, 0x73	# 000778
	.byte	0x65, 0x3a, 0x20, 0x25	# 00077c
	.byte	0x73, 0x0a, 0x4c, 0x6f	# 000780
	.byte	0x61, 0x64, 0x3a, 0x20	# 000784
	.byte	0x25, 0x73, 0x0a, 0x00	# 000788


# 78c:	"Serial Number: %08lx\n\n"
l78c:
	.byte	0x53, 0x65, 0x72, 0x69	# 00078c
	.byte	0x61, 0x6c, 0x20, 0x4e	# 000790
	.byte	0x75, 0x6d, 0x62, 0x65	# 000794
	.byte	0x72, 0x3a, 0x20, 0x25	# 000798
	.byte	0x30, 0x38, 0x6c, 0x78	# 00079c
	.byte	0x0a, 0x0a, 0x00      	# 0007a0

# 7a3:	"q"
l7a3:
	.byte	                   0x71	# 0007a0
	.byte	0x00                  	# 0007a4

# 7a5:	"edt"
l7a5:
	.byte	       0x65, 0x64, 0x74	# 0007a4
	.byte	0x00                  	# 0007a8

# 7a9:	"error info"
l7a9:
	.byte	       0x65, 0x72, 0x72	# 0007a8
	.byte	0x6f, 0x72, 0x20, 0x69	# 0007ac
	.byte	0x6e, 0x66, 0x6f, 0x00	# 0007b0

# 7b4:	"baud"
l7b4:
	.byte	0x62, 0x61, 0x75, 0x64	# 0007b4
	.byte	0x00                  	# 0007b8

# 7b9:	"?"
l7b9:
	.byte	       0x3f, 0x00      	# 0007b8

# 7bb:	"\nEnter an executable or system file, a directory name,\n"
l7bb:
	.byte	                   0x0a	# 0007b8
	.byte	0x45, 0x6e, 0x74, 0x65	# 0007bc
	.byte	0x72, 0x20, 0x61, 0x6e	# 0007c0
	.byte	0x20, 0x65, 0x78, 0x65	# 0007c4
	.byte	0x63, 0x75, 0x74, 0x61	# 0007c8
	.byte	0x62, 0x6c, 0x65, 0x20	# 0007cc
	.byte	0x6f, 0x72, 0x20, 0x73	# 0007d0
	.byte	0x79, 0x73, 0x74, 0x65	# 0007d4
	.byte	0x6d, 0x20, 0x66, 0x69	# 0007d8
	.byte	0x6c, 0x65, 0x2c, 0x20	# 0007dc
	.byte	0x61, 0x20, 0x64, 0x69	# 0007e0
	.byte	0x72, 0x65, 0x63, 0x74	# 0007e4
	.byte	0x6f, 0x72, 0x79, 0x20	# 0007e8
	.byte	0x6e, 0x61, 0x6d, 0x65	# 0007ec
	.byte	0x2c, 0x0a, 0x00      	# 0007f0

# 7f3:	"or one of the possible firmware program names:\n\n"
l7f3:
	.byte	                   0x6f	# 0007f0
	.byte	0x72, 0x20, 0x6f, 0x6e	# 0007f4
	.byte	0x65, 0x20, 0x6f, 0x66	# 0007f8
	.byte	0x20, 0x74, 0x68, 0x65	# 0007fc
	.byte	0x20, 0x70, 0x6f, 0x73	# 000800
	.byte	0x73, 0x69, 0x62, 0x6c	# 000804
	.byte	0x65, 0x20, 0x66, 0x69	# 000808
	.byte	0x72, 0x6d, 0x77, 0x61	# 00080c
	.byte	0x72, 0x65, 0x20, 0x70	# 000810
	.byte	0x72, 0x6f, 0x67, 0x72	# 000814
	.byte	0x61, 0x6d, 0x20, 0x6e	# 000818
	.byte	0x61, 0x6d, 0x65, 0x73	# 00081c
	.byte	0x3a, 0x0a, 0x0a, 0x00	# 000820

# 824:	"baud    edt    newkey    passwd    sysdump    version    q(uit)\n\n"
l824:
	.byte	0x62, 0x61, 0x75, 0x64	# 000824
	.byte	0x20, 0x20, 0x20, 0x20	# 000828
	.byte	0x65, 0x64, 0x74, 0x20	# 00082c
	.byte	0x20, 0x20, 0x20, 0x6e	# 000830
	.byte	0x65, 0x77, 0x6b, 0x65	# 000834
	.byte	0x79, 0x20, 0x20, 0x20	# 000838
	.byte	0x20, 0x70, 0x61, 0x73	# 00083c
	.byte	0x73, 0x77, 0x64, 0x20	# 000840
	.byte	0x20, 0x20, 0x20, 0x73	# 000844
	.byte	0x79, 0x73, 0x64, 0x75	# 000848
	.byte	0x6d, 0x70, 0x20, 0x20	# 00084c
	.byte	0x20, 0x20, 0x76, 0x65	# 000850
	.byte	0x72, 0x73, 0x69, 0x6f	# 000854
	.byte	0x6e, 0x20, 0x20, 0x20	# 000858
	.byte	0x20, 0x71, 0x28, 0x75	# 00085c
	.byte	0x69, 0x74, 0x29, 0x0a	# 000860
	.byte	0x0a, 0x00            	# 000864

# 866:	"*VOID*"
l866:
	.byte	             0x2a, 0x56	# 000864
	.byte	0x4f, 0x49, 0x44, 0x2a	# 000868
	.byte	0x00                  	# 00086c

# 86d:	"\tPossible load devices are:\n\n"
l86d:
	.byte	       0x09, 0x50, 0x6f	# 00086c
	.byte	0x73, 0x73, 0x69, 0x62	# 000870
	.byte	0x6c, 0x65, 0x20, 0x6c	# 000874
	.byte	0x6f, 0x61, 0x64, 0x20	# 000878
	.byte	0x64, 0x65, 0x76, 0x69	# 00087c
	.byte	0x63, 0x65, 0x73, 0x20	# 000880
	.byte	0x61, 0x72, 0x65, 0x3a	# 000884
	.byte	0x0a, 0x0a, 0x00      	# 000888

# 88b:	"Option Number    Slot     Name\n"
l88b:
	.byte	                   0x4f	# 000888
	.byte	0x70, 0x74, 0x69, 0x6f	# 00088c
	.byte	0x6e, 0x20, 0x4e, 0x75	# 000890
	.byte	0x6d, 0x62, 0x65, 0x72	# 000894
	.byte	0x20, 0x20, 0x20, 0x20	# 000898
	.byte	0x53, 0x6c, 0x6f, 0x74	# 00089c
	.byte	0x20, 0x20, 0x20, 0x20	# 0008a0
	.byte	0x20, 0x4e, 0x61, 0x6d	# 0008a4
	.byte	0x65, 0x0a, 0x00      	# 0008a8

# 8ab:	"---------------------------------------\n"
l8ab:
	.byte	                   0x2d	# 0008a8
	.byte	0x2d, 0x2d, 0x2d, 0x2d	# 0008ac
	.byte	0x2d, 0x2d, 0x2d, 0x2d	# 0008b0
	.byte	0x2d, 0x2d, 0x2d, 0x2d	# 0008b4
	.byte	0x2d, 0x2d, 0x2d, 0x2d	# 0008b8
	.byte	0x2d, 0x2d, 0x2d, 0x2d	# 0008bc
	.byte	0x2d, 0x2d, 0x2d, 0x2d	# 0008c0
	.byte	0x2d, 0x2d, 0x2d, 0x2d	# 0008c4
	.byte	0x2d, 0x2d, 0x2d, 0x2d	# 0008c8
	.byte	0x2d, 0x2d, 0x2d, 0x2d	# 0008cc
	.byte	0x2d, 0x2d, 0x0a, 0x00	# 0008d0

# 8d4:	"      %2d         %2d"
l8d4:
	.byte	0x20, 0x20, 0x20, 0x20	# 0008d4
	.byte	0x20, 0x20, 0x25, 0x32	# 0008d8
	.byte	0x64, 0x20, 0x20, 0x20	# 0008dc
	.byte	0x20, 0x20, 0x20, 0x20	# 0008e0
	.byte	0x20, 0x20, 0x25, 0x32	# 0008e4
	.byte	0x64, 0x00            	# 0008e8

# 8ea:	"*VOID*"
l8ea:
	.byte	             0x2a, 0x56	# 0008e8
	.byte	0x4f, 0x49, 0x44, 0x2a	# 0008ec
	.byte	0x00                  	# 0008f0

# 8f1:	"     %10s\n"
l8f1:
	.byte	       0x20, 0x20, 0x20	# 0008f0
	.byte	0x20, 0x20, 0x25, 0x31	# 0008f4
	.byte	0x30, 0x73, 0x00      	# 0008f8

# 8fb:	"\n"
l8fb:

	.byte	                   0x0a	# 0008f8
	.byte	0x00                  	# 0008fc

# 8fd:	"\nEnter Load Device Option Number "
l8fd:
	.byte	       0x0a, 0x45, 0x6e	# 0008fc
	.byte	0x74, 0x65, 0x72, 0x20	# 000900
	.byte	0x4c, 0x6f, 0x61, 0x64	# 000904
	.byte	0x20, 0x44, 0x65, 0x76	# 000908
	.byte	0x69, 0x63, 0x65, 0x20	# 00090c
	.byte	0x4f, 0x70, 0x74, 0x69	# 000910
	.byte	0x6f, 0x6e, 0x20, 0x4e	# 000914
	.byte	0x75, 0x6d, 0x62, 0x65	# 000918
	.byte	0x72, 0x20, 0x00      	# 00091c

# 91f:	"[%d"
l91f:
	.byte	                   0x5b	# 00091c
	.byte	0x25, 0x64, 0x00      	# 000920

# 923:	"*VOID*"
l923:
	.byte	                   0x2a	# 000920
	.byte	0x56, 0x4f, 0x49, 0x44	# 000924
	.byte	0x2a, 0x00            	# 000928

# 92a:	" (%s)"
l92a:
	.byte	             0x20, 0x28	# 000928
	.byte	0x25, 0x73, 0x29, 0x00	# 00092c

# 930:	"]: "
l930:
	.byte	0x5d, 0x3a, 0x20, 0x00	# 000930

# 934:    "\n"
l934:
	.byte	0x0a, 0x00            	# 000934

# 936:	"\n%s is not a valid option number.\n"
l936:
	.byte	             0x0a, 0x25	# 000934
	.byte	0x73, 0x20, 0x69, 0x73	# 000938
	.byte	0x20, 0x6e, 0x6f, 0x74	# 00093c
	.byte	0x20, 0x61, 0x20, 0x76	# 000940
	.byte	0x61, 0x6c, 0x69, 0x64	# 000944
	.byte	0x20, 0x6f, 0x70, 0x74	# 000948
	.byte	0x69, 0x6f, 0x6e, 0x20	# 00094c
	.byte	0x6e, 0x75, 0x6d, 0x62	# 000950
	.byte	0x65, 0x72, 0x2e, 0x0a	# 000954
	.byte	0x00                  	# 000958

# 959:	"Possible subdevices are:\n\n"
l959:
	.byte	       0x50, 0x6f, 0x73	# 000958
	.byte	0x73, 0x69, 0x62, 0x6c	# 00095c
	.byte	0x65, 0x20, 0x73, 0x75	# 000960
	.byte	0x62, 0x64, 0x65, 0x76	# 000964
	.byte	0x69, 0x63, 0x65, 0x73	# 000968
	.byte	0x20, 0x61, 0x72, 0x65	# 00096c
	.byte	0x3a, 0x0a, 0x0a, 0x00	# 000970

# 974:	"Option Number   Subdevice    Name\n"
l974:
	.byte	0x4f, 0x70, 0x74, 0x69	# 000974
	.byte	0x6f, 0x6e, 0x20, 0x4e	# 000978
	.byte	0x75, 0x6d, 0x62, 0x65	# 00097c
	.byte	0x72, 0x20, 0x20, 0x20	# 000980
	.byte	0x53, 0x75, 0x62, 0x64	# 000984
	.byte	0x65, 0x76, 0x69, 0x63	# 000988
	.byte	0x65, 0x20, 0x20, 0x20	# 00098c
	.byte	0x20, 0x4e, 0x61, 0x6d	# 000990
	.byte	0x65, 0x0a, 0x00      	# 000994

# 997:	"--------------------------------------------\n"
l997:
	.byte	                   0x2d	# 000994
	.byte	0x2d, 0x2d, 0x2d, 0x2d	# 000998
	.byte	0x2d, 0x2d, 0x2d, 0x2d	# 00099c
	.byte	0x2d, 0x2d, 0x2d, 0x2d	# 0009a0
	.byte	0x2d, 0x2d, 0x2d, 0x2d	# 0009a4
	.byte	0x2d, 0x2d, 0x2d, 0x2d	# 0009a8
	.byte	0x2d, 0x2d, 0x2d, 0x2d	# 0009ac
	.byte	0x2d, 0x2d, 0x2d, 0x2d	# 0009b0
	.byte	0x2d, 0x2d, 0x2d, 0x2d	# 0009b4
	.byte	0x2d, 0x2d, 0x2d, 0x2d	# 0009b8
	.byte	0x2d, 0x2d, 0x2d, 0x2d	# 0009bc
	.byte	0x2d, 0x2d, 0x2d, 0x0a	# 0009c0
	.byte	0x00                  	# 0009c4

l9c5: # "      %2d         %2d"
	.byte	0x20, 0x20, 0x20
	.byte	0x20, 0x20, 0x20, 0x25, 0x32, 0x64, 0x20, 0x20	
	.byte	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x25, 0x32, 0x64, 0x00                      

l9dc: # "*VOID*"
	.byte	0x2a, 0x56, 0x4f, 0x49	# 0009dc
	.byte	0x44, 0x2a, 0x00

l9e3: # "         %10s"
	.byte	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x25, 0x31, 0x30, 0x73	# 0009e3
	.byte	0x00

l9f1: # "\n"
	.byte	0x0a, 0x00

l9f3: # "Enter Subdevice Option Number "
	.byte	0x0a, 0x45, 0x6e, 0x74, 0x65, 0x72, 0x20, 0x53
	.byte	0x75, 0x62, 0x64, 0x65, 0x76
	.byte	0x69, 0x63, 0x65, 0x20, 0x4f, 0x70, 0x74, 0x69
	.byte	0x6f, 0x6e, 0x20, 0x4e, 0x75, 0x6d, 0x62, 0x65
	.byte	0x72, 0x20, 0x00

la13: # "[%d"
	.byte	0x5b, 0x25, 0x64, 0x00

la17: # "*VOID*"
	.byte	0x2a, 0x56, 0x4f, 0x49, 0x44, 0x2a, 0x00

la1e: # "(%s)"
	.byte	0x28, 0x25
	.byte	0x73, 0x29, 0x00

la23: # "]: "
	.byte	0x5d, 0x3a, 0x20, 0x00

la27: # "\n"
	.byte	0x0a, 0x00

la29: # "\n%s is not a valid option number\n"
	.byte	0x0a, 0x25, 0x73, 0x20, 0x69, 0x73, 0x20
	.byte	0x6e, 0x6f, 0x74, 0x20, 0x61, 0x20, 0x76, 0x61
	.byte	0x6c, 0x69, 0x64, 0x20, 0x6f, 0x70, 0x74, 0x69
	.byte	0x6f, 0x6e, 0x20, 0x6e, 0x75, 0x6d, 0x62, 0x65
	.byte	0x72, 0x2e, 0x0a, 0x00

la4c: # "\nSORRY!\n"
	.byte	0x0a, 0x53, 0x4f, 0x52
	.byte	0x52, 0x59, 0x21, 0x0a, 0x00

# 0a54:
	.byte	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.word	0x00320100, 0x00000000, 0x004b0200, 0x80000000	# 000a60
	.word	0x006e0311, 0x00000000, 0x00860422, 0x00000000	# 000a70
	.word	0x00960533, 0x80000000, 0x00c80633, 0x00000000	# 000a80
	.word	0x012c0744, 0x00000000, 0x02580855, 0x00000000	# 000a90
	.word	0x04b00966, 0x00000000, 0x07080aaa, 0x80000000	# 000aa0
	.word	0x09600b88, 0x00000000, 0x12c00c99, 0x00000000	# 000ab0
	.word	0x25800dbb, 0x00000000, 0x4b000ecc, 0x80000000	# 000ac0
	.word	0x96000fcc, 0x00000000                        	# 000ad0

lad8: # "Unsupported Baud Rate: %d\n"
	.byte	0x55, 0x6e, 0x73, 0x75, 0x70, 0x70, 0x6f, 0x72
	.byte	0x74, 0x65, 0x64, 0x20, 0x42, 0x61, 0x75, 0x64
	.byte	0x20, 0x52, 0x61, 0x74, 0x65, 0x3a, 0x20, 0x25
	.byte	0x64, 0x0a, 0x00

laf3: # "Enter new rate [%d]: "
	.byte	0x45, 0x6e, 0x74, 0x65, 0x72
	.byte	0x20, 0x6e, 0x65, 0x77, 0x20, 0x72, 0x61, 0x74
	.byte	0x65, 0x20, 0x5b, 0x25, 0x64, 0x5d, 0x3a, 0x20
	.byte	0x00

lb09: # "%d"
	.byte	0x25, 0x64, 0x00

lb0c: # "Change baud rate to %d\n"
	.byte	0x43, 0x68, 0x61, 0x6e
	.byte	0x67, 0x65, 0x20, 0x62, 0x61, 0x75, 0x64, 0x20
	.byte	0x72, 0x61, 0x74, 0x65, 0x20, 0x74, 0x6f, 0x20	
	.byte	0x25, 0x64, 0x0a, 0x00

lb24: # " \b"
	.byte	0x20, 0x08, 0x00

lb27: # "\nmax input of %d characters, re-enter entire line\n"
	.byte	0x0a, 0x6d, 0x61, 0x78, 0x20, 0x69, 0x6e, 0x70, 0x75	# 000b20
	.byte	0x74, 0x20, 0x6f, 0x66, 0x20, 0x25, 0x64, 0x20
	.byte	0x63, 0x68, 0x61, 0x72, 0x61, 0x63, 0x74, 0x65
	.byte	0x72, 0x73, 0x2c, 0x20, 0x72, 0x65, 0x2d, 0x65
	.byte	0x6e, 0x74, 0x65, 0x72, 0x20, 0x65, 0x6e, 0x74
	.byte	0x69, 0x72, 0x65, 0x20, 0x6c, 0x69, 0x6e, 0x65
	.byte	0x0a, 0x00

lb5a:
	.byte	0x00, 0x00

## cac: binary to hex conversion
lb5c: # "0123456789abcdef"
	.byte	0x30, 0x31, 0x32, 0x33
	.byte	0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x00

lb6d:
	.byte	0x00, 0x00, 0x00

lb70: # "(null pointer)"
	.byte	0x28, 0x6e, 0x75, 0x6c, 0x6c, 0x20, 0x70, 0x6f, 0x69, 0x6e, 0x74, 0x65, 0x72, 0x29, 0x00

lb7f:
	.byte	0x00

lb80: # "\n\nCurrent System Configuration\n\n"
	.byte	0x0a, 0x0a, 0x43, 0x75	# 000b80
	.byte	0x72, 0x72, 0x65, 0x6e	# 000b84
	.byte	0x74, 0x20, 0x53, 0x79	# 000b88
	.byte	0x73, 0x74, 0x65, 0x6d	# 000b8c
	.byte	0x20, 0x43, 0x6f, 0x6e	# 000b90
	.byte	0x66, 0x69, 0x67, 0x75	# 000b94
	.byte	0x72, 0x61, 0x74, 0x69	# 000b98
	.byte	0x6f, 0x6e, 0x0a, 0x0a	# 000b9c
	.byte	0x00

lba1: # "System Board memory size: "
	.byte	0x53, 0x79, 0x73
	.byte	0x74, 0x65, 0x6d, 0x20	# 000ba4
	.byte	0x42, 0x6f, 0x61, 0x72	# 000ba8
	.byte	0x64, 0x20, 0x6d, 0x65	# 000bac
	.byte	0x6d, 0x6f, 0x72, 0x79	# 000bb0
	.byte	0x20, 0x73, 0x69, 0x7a	# 000bb4
	.byte	0x65, 0x3a, 0x20, 0x00	# 000bb8

lbbc: # "%d megabyte(s)"
	.byte	0x25, 0x64, 0x20, 0x6d	# 000bbc
	.byte	0x65, 0x67, 0x61, 0x62	# 000bc0
	.byte	0x79, 0x74, 0x65, 0x28	# 000bc4
	.byte	0x73, 0x29, 0x00

lbcb: # "%d kilobytes"
	.byte	0x25
	.byte	0x64, 0x20, 0x6b, 0x69	# 000bcc
	.byte	0x6c, 0x6f, 0x62, 0x79	# 000bd0
	.byte	0x74, 0x65, 0x73, 0x00	# 000bd4

lbd8: # "\n\n%02d - device name = %-9s, "
	.byte	0x0a, 0x0a, 0x25, 0x30	# 000bd8
	.byte	0x32, 0x64, 0x20, 0x2d	# 000bdc
	.byte	0x20, 0x64, 0x65, 0x76	# 000be0
	.byte	0x69, 0x63, 0x65, 0x20	# 000be4
	.byte	0x6e, 0x61, 0x6d, 0x65	# 000be8
	.byte	0x20, 0x3d, 0x20, 0x25	# 000bec
	.byte	0x2d, 0x39, 0x73, 0x2c	# 000bf0
	.byte	0x20, 0x00

lbf6: # "occurrence = %2d, slot = %02d, ID code = 0x%02x\n"
	.byte	0x6f, 0x63
	.byte	0x63, 0x75, 0x72, 0x72	# 000bf8
	.byte	0x65, 0x6e, 0x63, 0x65	# 000bfc
	.byte	0x20, 0x3d, 0x20, 0x25	# 000c00
	.byte	0x32, 0x64, 0x2c, 0x20	# 000c04
	.byte	0x73, 0x6c, 0x6f, 0x74	# 000c08
	.byte	0x20, 0x3d, 0x20, 0x25	# 000c0c
	.byte	0x30, 0x32, 0x64, 0x2c	# 000c10
	.byte	0x20, 0x49, 0x44, 0x20	# 000c14
	.byte	0x63, 0x6f, 0x64, 0x65	# 000c18
	.byte	0x20, 0x3d, 0x20, 0x30	# 000c1c
	.byte	0x78, 0x25, 0x30, 0x32	# 000c20
	.byte	0x78, 0x0a, 0x00

lc27: # "     boot device = %c, board width = %s, word width = %d byte(s),\n"
	.byte	0x20
	.byte	0x20, 0x20, 0x20, 0x20	# 000c28
	.byte	0x62, 0x6f, 0x6f, 0x74	# 000c2c
	.byte	0x20, 0x64, 0x65, 0x76	# 000c30
	.byte	0x69, 0x63, 0x65, 0x20	# 000c34
	.byte	0x3d, 0x20, 0x25, 0x63	# 000c38
	.byte	0x2c, 0x20, 0x62, 0x6f	# 000c3c
	.byte	0x61, 0x72, 0x64, 0x20	# 000c40
	.byte	0x77, 0x69, 0x64, 0x74	# 000c44
	.byte	0x68, 0x20, 0x3d, 0x20	# 000c48
	.byte	0x25, 0x73, 0x2c, 0x20	# 000c4c
	.byte	0x77, 0x6f, 0x72, 0x64	# 000c50
	.byte	0x20, 0x77, 0x69, 0x64	# 000c54
	.byte	0x74, 0x68, 0x20, 0x3d	# 000c58
	.byte	0x20, 0x25, 0x64, 0x20	# 000c5c
	.byte	0x62, 0x79, 0x74, 0x65	# 000c60
	.byte	0x28, 0x73, 0x29, 0x2c	# 000c64
	.byte	0x0a, 0x00

lc6a: # "double"
	.byte	0x64, 0x6f
	.byte	0x75, 0x62, 0x6c, 0x65	# 000c6c
	.byte	0x00

lc71: # "single"
	.byte	0x73, 0x69, 0x6e
	.byte	0x67, 0x6c, 0x65, 0x00	# 000c74

lc78: # "     req Q size = 0x%02x, comp Q size = 0x%02x, "
	.byte	0x20, 0x20, 0x20, 0x20	# 000c78
	.byte	0x20, 0x72, 0x65, 0x71	# 000c7c
	.byte	0x20, 0x51, 0x20, 0x73	# 000c80
	.byte	0x69, 0x7a, 0x65, 0x20	# 000c84
	.byte	0x3d, 0x20, 0x30, 0x78	# 000c88
	.byte	0x25, 0x30, 0x32, 0x78	# 000c8c
	.byte	0x2c, 0x20, 0x63, 0x6f	# 000c90
	.byte	0x6d, 0x70, 0x20, 0x51	# 000c94
	.byte	0x20, 0x73, 0x69, 0x7a	# 000c98
	.byte	0x65, 0x20, 0x3d, 0x20	# 000c9c
	.byte	0x30, 0x78, 0x25, 0x30	# 000ca0
	.byte	0x32, 0x78, 0x2c, 0x20	# 000ca4
	.byte	0x00

lca9: # "console ability = %c"
	.byte	0x63, 0x6f, 0x6e
	.byte	0x73, 0x6f, 0x6c, 0x65	# 000cac
	.byte	0x20, 0x61, 0x62, 0x69	# 000cb0
	.byte	0x6c, 0x69, 0x74, 0x79	# 000cb4
	.byte	0x20, 0x3d, 0x20, 0x25	# 000cb8
	.byte	0x63, 0x00

lcbe: # ", pump file = %c"
	.byte	0x2c, 0x20
	.byte	0x70, 0x75, 0x6d, 0x70	# 000cc0
	.byte	0x20, 0x66, 0x69, 0x6c	# 000cc4
	.byte	0x65, 0x20, 0x3d, 0x20	# 000cc8
	.byte	0x25, 0x63, 0x00

lccf: # "               "
	.byte	0x20
	.byte	0x20, 0x20, 0x20, 0x20	# 000cd0
	.byte	0x20, 0x20, 0x20, 0x20	# 000cd4
	.byte	0x20, 0x20, 0x20, 0x20	# 000cd8
	.byte	0x20, 0x20, 0x00

lcdf: # "\n     subdevice(s)"
	.byte	0x0a
	.byte	0x20, 0x20, 0x20, 0x20	# 000ce0
	.byte	0x20, 0x73, 0x75, 0x62	# 000ce4
	.byte	0x64, 0x65, 0x76, 0x69	# 000ce8
	.byte	0x63, 0x65, 0x28, 0x73	# 000cec
	.byte	0x29, 0x00

lcf2: # "%s#%02d = %-9s, ID code = 0x%02x"
	.byte	0x25, 0x73
	.byte	0x23, 0x25, 0x30, 0x32	# 000cf4
	.byte	0x64, 0x20, 0x3d, 0x20	# 000cf8
	.byte	0x25, 0x2d, 0x39, 0x73	# 000cfc
	.byte	0x2c, 0x20, 0x49, 0x44	# 000d00
	.byte	0x20, 0x63, 0x6f, 0x64	# 000d04
	.byte	0x65, 0x20, 0x3d, 0x20	# 000d08
	.byte	0x30, 0x78, 0x25, 0x30	# 000d0c
	.byte	0x32, 0x78, 0x00

ld13: # "\n     "
	.byte	0x0a
	.byte	0x20, 0x20, 0x20, 0x20	# 000d14
	.byte	0x20, 0x00

ld1a: # ", "
	.byte	0x2c, 0x20	# 000d18
	.byte	0x00

ld1d: # "\n\nPress any key to continue"
	.byte	0x0a, 0x0a, 0x50
	.byte	0x72, 0x65, 0x73, 0x73	# 000d20
	.byte	0x20, 0x61, 0x6e, 0x79	# 000d24
	.byte	0x20, 0x6b, 0x65, 0x79	# 000d28
	.byte	0x20, 0x74, 0x6f, 0x20	# 000d2c
	.byte	0x63, 0x6f, 0x6e, 0x74	# 000d30
	.byte	0x69, 0x6e, 0x75, 0x65	# 000d34
	.byte	0x0a, 0x00

ld3a: # "\nDONE\n"
	.byte	0x0a, 0x44
	.byte	0x4f, 0x4e, 0x45, 0x0a	# 000d3c
	.byte	0x0a, 0x00

ld42:
	.byte	0x00, 0x00

ld44: # "PERIPHERAL I/O %s ERROR AT BLOCK %d, SUBDEVICE %d, SLOT %d\n"
	.byte	0x50, 0x45, 0x52, 0x49	# 000d44
	.byte	0x50, 0x48, 0x45, 0x52	# 000d48
	.byte	0x41, 0x4c, 0x20, 0x49	# 000d4c
	.byte	0x2f, 0x4f, 0x20, 0x25	# 000d50
	.byte	0x73, 0x20, 0x45, 0x52	# 000d54
	.byte	0x52, 0x4f, 0x52, 0x20	# 000d58
	.byte	0x41, 0x54, 0x20, 0x42	# 000d5c
	.byte	0x4c, 0x4f, 0x43, 0x4b	# 000d60
	.byte	0x20, 0x25, 0x64, 0x2c	# 000d64
	.byte	0x20, 0x53, 0x55, 0x42	# 000d68
	.byte	0x44, 0x45, 0x56, 0x49	# 000d6c
	.byte	0x43, 0x45, 0x20, 0x25	# 000d70
	.byte	0x64, 0x2c, 0x20, 0x53	# 000d74
	.byte	0x4c, 0x4f, 0x54, 0x20	# 000d78
	.byte	0x25, 0x64, 0x0a, 0x00	# 000d7c

ld80: # "READ"
	.byte	0x52, 0x45, 0x41, 0x44	# 000d80
	.byte	0x00

ld85: # "WRITE"
	.byte	0x57, 0x52, 0x49
	.byte	0x54, 0x45, 0x00

ld8b:
	.byte	0x00

ld8c: # "\nFW ERROR 1-%s\n"
	.byte	0x0a, 0x46, 0x57, 0x20	# 000d8c
	.byte	0x45, 0x52, 0x52, 0x4f	# 000d90
	.byte	0x52, 0x20, 0x31, 0x2d	# 000d94
	.byte	0x25, 0x73, 0x0a, 0x00	# 000d98

ld9c: # "               EXECUTION HALTED\n"
	.byte	0x20, 0x20, 0x20, 0x20	# 000d9c
	.byte	0x20, 0x20, 0x20, 0x20	# 000da0
	.byte	0x20, 0x20, 0x20, 0x20	# 000da4
	.byte	0x20, 0x20, 0x20, 0x45	# 000da8
	.byte	0x58, 0x45, 0x43, 0x55	# 000dac
	.byte	0x54, 0x49, 0x4f, 0x4e	# 000db0
	.byte	0x20, 0x48, 0x41, 0x4c	# 000db4
	.byte	0x54, 0x45, 0x44, 0x0a	# 000db8
	.byte	0x00

ldbd:
	.byte	0x00, 0x00, 0x00	# 000dbd

ldc0: # "01: NVRAM SANITY FAILURE"
	.byte	0x30, 0x31, 0x3a, 0x20	# 000dc0
	.byte	0x4e, 0x56, 0x52, 0x41	# 000dc4
	.byte	0x4d, 0x20, 0x53, 0x41	# 000dc8
	.byte	0x4e, 0x49, 0x54, 0x59	# 000dcc
	.byte	0x20, 0x46, 0x41, 0x49	# 000dd0
	.byte	0x4c, 0x55, 0x52, 0x45	# 000dd4
	.byte	0x00

ldd9: # "               DEFAULT VALUES ASSUMED\n               IF REPEATED, CHECK THE BATTERY\n"
	.byte	0x20, 0x20, 0x20
	.byte	0x20, 0x20, 0x20, 0x20	# 000ddc
	.byte	0x20, 0x20, 0x20, 0x20	# 000de0
	.byte	0x20, 0x20, 0x20, 0x20	# 000de4
	.byte	0x44, 0x45, 0x46, 0x41	# 000de8
	.byte	0x55, 0x4c, 0x54, 0x20	# 000dec
	.byte	0x56, 0x41, 0x4c, 0x55	# 000df0
	.byte	0x45, 0x53, 0x20, 0x41	# 000df4
	.byte	0x53, 0x53, 0x55, 0x4d	# 000df8
	.byte	0x45, 0x44, 0x0a, 0x20	# 000dfc
	.byte	0x20, 0x20, 0x20, 0x20	# 000e00
	.byte	0x20, 0x20, 0x20, 0x20	# 000e04
	.byte	0x20, 0x20, 0x20, 0x20	# 000e08
	.byte	0x20, 0x20, 0x49, 0x46	# 000e0c
	.byte	0x20, 0x52, 0x45, 0x50	# 000e10
	.byte	0x45, 0x41, 0x54, 0x45	# 000e14
	.byte	0x44, 0x2c, 0x20, 0x43	# 000e18
	.byte	0x48, 0x45, 0x43, 0x4b	# 000e1c
	.byte	0x20, 0x54, 0x48, 0x45	# 000e20
	.byte	0x20, 0x42, 0x41, 0x54	# 000e24
	.byte	0x54, 0x45, 0x52, 0x59	# 000e28
	.byte	0x0a, 0x00

le2e: # "\nFW WARNING: NVRAM DEFAULT VALUES ASSUMED\n\n"
	.byte	0x0a, 0x46
	.byte	0x57, 0x20, 0x57, 0x41	# 000e30
	.byte	0x52, 0x4e, 0x49, 0x4e	# 000e34
	.byte	0x47, 0x3a, 0x20, 0x4e	# 000e38
	.byte	0x56, 0x52, 0x41, 0x4d	# 000e3c
	.byte	0x20, 0x44, 0x45, 0x46	# 000e40
	.byte	0x41, 0x55, 0x4c, 0x54	# 000e44
	.byte	0x20, 0x56, 0x41, 0x4c	# 000e48
	.byte	0x55, 0x45, 0x53, 0x20	# 000e4c
	.byte	0x41, 0x53, 0x53, 0x55	# 000e50
	.byte	0x4d, 0x45, 0x44, 0x0a	# 000e54
	.byte	0x0a, 0x00

le5a: # "02: DISK SANITY FAILURE"
	.byte	0x30, 0x32
	.byte	0x3a, 0x20, 0x44, 0x49	# 000e5c
	.byte	0x53, 0x4b, 0x20, 0x53	# 000e60
	.byte	0x41, 0x4e, 0x49, 0x54	# 000e64
	.byte	0x59, 0x20, 0x46, 0x41	# 000e68
	.byte	0x49, 0x4c, 0x55, 0x52	# 000e6c
	.byte	0x45, 0x00

le72: # "05: SELF-CONFIGURATION FAILURE"
	.byte	0x30, 0x35
	.byte	0x3a, 0x20, 0x53, 0x45	# 000e74
	.byte	0x4c, 0x46, 0x2d, 0x43	# 000e78
	.byte	0x4f, 0x4e, 0x46, 0x49	# 000e7c
	.byte	0x47, 0x55, 0x52, 0x41	# 000e80
	.byte	0x54, 0x49, 0x4f, 0x4e	# 000e84
	.byte	0x20, 0x46, 0x41, 0x49	# 000e88
	.byte	0x4c, 0x55, 0x52, 0x45	# 000e8c
	.byte	0x00

le91: # "06: BOOT FAILURE"
	.byte	0x30, 0x36, 0x3a
	.byte	0x20, 0x42, 0x4f, 0x4f	# 000e94
	.byte	0x54, 0x20, 0x46, 0x41	# 000e98
	.byte	0x49, 0x4c, 0x55, 0x52	# 000e9c
	.byte	0x45, 0x00

lea2: # "07: FLOPPY KEY CREATE FAILURE"
	.byte	0x30, 0x37
	.byte	0x3a, 0x20, 0x46, 0x4c	# 000ea4
	.byte	0x4f, 0x50, 0x50, 0x59	# 000ea8
	.byte	0x20, 0x4b, 0x45, 0x59	# 000eac
	.byte	0x20, 0x43, 0x52, 0x45	# 000eb0
	.byte	0x41, 0x54, 0x45, 0x20	# 000eb4
	.byte	0x46, 0x41, 0x49, 0x4c	# 000eb8
	.byte	0x55, 0x52, 0x45, 0x00	# 000ebc

lec0: # "08: MEMORY TEST FAILURE"
	.byte	0x30, 0x38, 0x3a, 0x20	# 000ec0
	.byte	0x4d, 0x45, 0x4d, 0x4f	# 000ec4
	.byte	0x52, 0x59, 0x20, 0x54	# 000ec8
	.byte	0x45, 0x53, 0x54, 0x20	# 000ecc
	.byte	0x46, 0x41, 0x49, 0x4c	# 000ed0
	.byte	0x55, 0x52, 0x45, 0x00	# 000ed4

led8: # "09: DISK FORMAT NOT COMPATIBLE WITH SYSTEM"
	.byte	0x30, 0x39, 0x3a, 0x20	# 000ed8
	.byte	0x44, 0x49, 0x53, 0x4b	# 000edc
	.byte	0x20, 0x46, 0x4f, 0x52	# 000ee0
	.byte	0x4d, 0x41, 0x54, 0x20	# 000ee4
	.byte	0x4e, 0x4f, 0x54, 0x20	# 000ee8
	.byte	0x43, 0x4f, 0x4d, 0x50	# 000eec
	.byte	0x41, 0x54, 0x49, 0x42	# 000ef0
	.byte	0x4c, 0x45, 0x20, 0x57	# 000ef4
	.byte	0x49, 0x54, 0x48, 0x20	# 000ef8
	.byte	0x53, 0x59, 0x53, 0x54	# 000efc
	.byte	0x45, 0x4d, 0x00

lf03: # "%s"
	.byte	0x25
	.byte	0x73, 0x00

lf06: # "\n\nSELF-CHECK\n"
	.byte	0x0a, 0x0a
	.byte	0x53, 0x45, 0x4c, 0x46	# 000f08
	.byte	0x2d, 0x43, 0x48, 0x45	# 000f0c
	.byte	0x43, 0x4b, 0x0a, 0x00	# 000f10

lf14: # "\nNONE\n\n"
	.byte	0x0a, 0x4e, 0x4f, 0x4e	# 000f14
	.byte	0x45, 0x0a, 0x0a, 0x00	# 000f18

lf1c: # "\nEXCEPTION, PC = 0x%08x, PSW = 0x%08x, CSR = 0x%04x\n\n"
	.byte	0x0a, 0x45, 0x58, 0x43	# 000f1c
	.byte	0x45, 0x50, 0x54, 0x49	# 000f20
	.byte	0x4f, 0x4e, 0x2c, 0x20	# 000f24
	.byte	0x50, 0x43, 0x20, 0x3d	# 000f28
	.byte	0x20, 0x30, 0x78, 0x25	# 000f2c
	.byte	0x30, 0x38, 0x78, 0x2c	# 000f30
	.byte	0x20, 0x50, 0x53, 0x57	# 000f34
	.byte	0x20, 0x3d, 0x20, 0x30	# 000f38
	.byte	0x78, 0x25, 0x30, 0x38	# 000f3c
	.byte	0x78, 0x2c, 0x20, 0x43	# 000f40
	.byte	0x53, 0x52, 0x20, 0x3d	# 000f44
	.byte	0x20, 0x30, 0x78, 0x25	# 000f48
	.byte	0x30, 0x34, 0x78, 0x0a	# 000f4c
	.byte	0x0a, 0x00

lf52: # "\nINTERRUPT, PC = 0x%08x, PSW = 0x%08x, CSR = 0x%04x, LVL = %d\n\n"
	.byte	0x0a, 0x49
	.byte	0x4e, 0x54, 0x45, 0x52	# 000f54
	.byte	0x52, 0x55, 0x50, 0x54	# 000f58
	.byte	0x2c, 0x20, 0x50, 0x43	# 000f5c
	.byte	0x20, 0x3d, 0x20, 0x30	# 000f60
	.byte	0x78, 0x25, 0x30, 0x38	# 000f64
	.byte	0x78, 0x2c, 0x20, 0x50	# 000f68
	.byte	0x53, 0x57, 0x20, 0x3d	# 000f6c
	.byte	0x20, 0x30, 0x78, 0x25	# 000f70
	.byte	0x30, 0x38, 0x78, 0x2c	# 000f74
	.byte	0x20, 0x43, 0x53, 0x52	# 000f78
	.byte	0x20, 0x3d, 0x20, 0x30	# 000f7c
	.byte	0x78, 0x25, 0x30, 0x34	# 000f80
	.byte	0x78, 0x2c, 0x20, 0x4c	# 000f84
	.byte	0x56, 0x4c, 0x20, 0x3d	# 000f88
	.byte	0x20, 0x25, 0x64, 0x0a	# 000f8c
	.byte	0x0a, 0x00

lf92: # "\nSANITY ON DISK %d, ERROR %d\n"
	.byte	0x0a, 0x53
	.byte	0x41, 0x4e, 0x49, 0x54	# 000f94
	.byte	0x59, 0x20, 0x4f, 0x4e	# 000f98
	.byte	0x20, 0x44, 0x49, 0x53	# 000f9c
	.byte	0x4b, 0x20, 0x25, 0x64	# 000fa0
	.byte	0x2c, 0x20, 0x45, 0x52	# 000fa4
	.byte	0x52, 0x4f, 0x52, 0x20	# 000fa8
	.byte	0x25, 0x64, 0x0a, 0x00	# 000fac

lfb0: # "COMMAND = 0x%02x, UNIT STATUS = 0x%02x, ERROR STATUS = 0x%02x, STATUS = 0x%02x"
	.byte	0x43, 0x4f, 0x4d, 0x4d	# 000fb0
	.byte	0x41, 0x4e, 0x44, 0x20	# 000fb4
	.byte	0x3d, 0x20, 0x30, 0x78	# 000fb8
	.byte	0x25, 0x30, 0x32, 0x78	# 000fbc
	.byte	0x2c, 0x20, 0x55, 0x4e	# 000fc0
	.byte	0x49, 0x54, 0x20, 0x53	# 000fc4
	.byte	0x54, 0x41, 0x54, 0x55	# 000fc8
	.byte	0x53, 0x20, 0x3d, 0x20	# 000fcc
	.byte	0x30, 0x78, 0x25, 0x30	# 000fd0
	.byte	0x32, 0x78, 0x2c, 0x20	# 000fd4
	.byte	0x45, 0x52, 0x52, 0x4f	# 000fd8
	.byte	0x52, 0x20, 0x53, 0x54	# 000fdc
	.byte	0x41, 0x54, 0x55, 0x53	# 000fe0
	.byte	0x20, 0x3d, 0x20, 0x30	# 000fe4
	.byte	0x78, 0x25, 0x30, 0x32	# 000fe8
	.byte	0x78, 0x2c, 0x20, 0x53	# 000fec
	.byte	0x54, 0x41, 0x54, 0x55	# 000ff0
	.byte	0x53, 0x20, 0x3d, 0x20	# 000ff4
	.byte	0x30, 0x78, 0x25, 0x30	# 000ff8
	.byte	0x32, 0x78, 0x00

lfff: # "\n\n"
	.byte	0x0a
	.byte	0x0a, 0x00

l1002: # "\n\nNONE\n\n"
	.byte	0x0a, 0x4e	# 001000
	.byte	0x4f, 0x4e, 0x45, 0x0a	# 001004
	.byte	0x0a, 0x00

l100a:
	.byte	0x00, 0x00

l100c: # "04: UNEXPECTED INTERRUPT\n"
	.byte	0x30, 0x34, 0x3a, 0x20	# 00100c
	.byte	0x55, 0x4e, 0x45, 0x58	# 001010
	.byte	0x50, 0x45, 0x43, 0x54	# 001014
	.byte	0x45, 0x44, 0x20, 0x49	# 001018
	.byte	0x4e, 0x54, 0x45, 0x52	# 00101c
	.byte	0x52, 0x55, 0x50, 0x54	# 001020
	.byte	0x0a, 0x00

l1026:
	.byte	0x00, 0x00

l1028: # "03: UNEXPECTED FAULT\n"
	.byte	0x30, 0x33, 0x3a, 0x20	# 001028
	.byte	0x55, 0x4e, 0x45, 0x58	# 00102c
	.byte	0x50, 0x45, 0x43, 0x54	# 001030
	.byte	0x45, 0x44, 0x20, 0x46	# 001034
	.byte	0x41, 0x55, 0x4c, 0x54	# 001038
	.byte	0x0a, 0x00

l103e:
	.byte	0x00, 0x00

l1040: # "mcp"
	.byte	0x6d, 0x63, 0x70, 0x00	# 001040

l1044: # "/filledt"
	.byte	0x2f, 0x66, 0x69, 0x6c	# 001044
	.byte	0x6c, 0x65, 0x64, 0x74	# 001048
	.byte	0x00

l104d: # "\nSYSTEM FAILURE: CONSULT YOUR SYSTEM ADMINISTRATION UTILITIES GUIDE\n\n"
	.byte	0x0a, 0x53, 0x59
	.byte	0x53, 0x54, 0x45, 0x4d	# 001050
	.byte	0x20, 0x46, 0x41, 0x49	# 001054
	.byte	0x4c, 0x55, 0x52, 0x45	# 001058
	.byte	0x3a, 0x20, 0x43, 0x4f	# 00105c
	.byte	0x4e, 0x53, 0x55, 0x4c	# 001060
	.byte	0x54, 0x20, 0x59, 0x4f	# 001064
	.byte	0x55, 0x52, 0x20, 0x53	# 001068
	.byte	0x59, 0x53, 0x54, 0x45	# 00106c
	.byte	0x4d, 0x20, 0x41, 0x44	# 001070
	.byte	0x4d, 0x49, 0x4e, 0x49	# 001074
	.byte	0x53, 0x54, 0x52, 0x41	# 001078
	.byte	0x54, 0x49, 0x4f, 0x4e	# 00107c
	.byte	0x20, 0x55, 0x54, 0x49	# 001080
	.byte	0x4c, 0x49, 0x54, 0x49	# 001084
	.byte	0x45, 0x53, 0x20, 0x47	# 001088
	.byte	0x55, 0x49, 0x44, 0x45	# 00108c
	.byte	0x0a, 0x0a, 0x00

l1093: # "\nFIRMWARE MODE\n\n"
	.byte	0x0a
	.byte	0x46, 0x49, 0x52, 0x4d	# 001094
	.byte	0x57, 0x41, 0x52, 0x45	# 001098
	.byte	0x20, 0x4d, 0x4f, 0x44	# 00109c
	.byte	0x45, 0x0a, 0x0a, 0x00	# 0010a0

l10a4: # "/filledt"
	.byte	0x2f, 0x66, 0x69, 0x6c	# 0010a4
	.byte	0x6c, 0x65, 0x64, 0x74	# 0010a8
	.byte	0x00

l10ad: # "/dgmon"
	.byte	0x2f, 0x64, 0x67
	.byte	0x6d, 0x6f, 0x6e, 0x00	# 0010b0

l10b4: # "/unix"
	.byte	0x2f, 0x75, 0x6e, 0x69	# 0010b4
	.byte	0x78, 0x00

l10ba:
	.byte	0x00, 0x00

l10bc: # "04: UNEXPECTED INTERRUPT"
	.byte	0x30, 0x34, 0x3a, 0x20	# 0010bc
	.byte	0x55, 0x4e, 0x45, 0x58	# 0010c0
	.byte	0x50, 0x45, 0x43, 0x54	# 0010c4
	.byte	0x45, 0x44, 0x20, 0x49	# 0010c8
	.byte	0x4e, 0x54, 0x45, 0x52	# 0010cc
	.byte	0x52, 0x55, 0x50, 0x54	# 0010d0
	.byte	0x00

l10d5: # "03: UNEXPECTED FAULT"
	.byte	0x30, 0x33, 0x3a
	.byte	0x20, 0x55, 0x4e, 0x45	# 0010d8
	.byte	0x58, 0x50, 0x45, 0x43	# 0010dc
	.byte	0x54, 0x45, 0x44, 0x20	# 0010e0
	.byte	0x46, 0x41, 0x55, 0x4c	# 0010e4
	.byte	0x54, 0x00

l10ea:
	.byte	0x00, 0x00

## Lookup table?
l10ec:
	.byte	0x18, 0xf2, 0x00

l10ef:
	.byte	0x03
	.byte	0x11, 0x0d, 0x00

l10f3:
	.byte	0x80

l10f4: # "id%d CRC error at disk address %08x (%d retries)\n"
	.byte	0x69, 0x64, 0x25, 0x64	# 0010f4
	.byte	0x20, 0x43, 0x52, 0x43	# 0010f8
	.byte	0x20, 0x65, 0x72, 0x72	# 0010fc
	.byte	0x6f, 0x72, 0x20, 0x61	# 001100
	.byte	0x74, 0x20, 0x64, 0x69	# 001104
	.byte	0x73, 0x6b, 0x20, 0x61	# 001108
	.byte	0x64, 0x64, 0x72, 0x65	# 00110c
	.byte	0x73, 0x73, 0x20, 0x25	# 001110
	.byte	0x30, 0x38, 0x78, 0x20	# 001114
	.byte	0x28, 0x25, 0x64, 0x20	# 001118
	.byte	0x72, 0x65, 0x74, 0x72	# 00111c
	.byte	0x69, 0x65, 0x73, 0x29	# 001120
	.byte	0x0a, 0x00

l1126:
	.byte	0x00, 0x00	# 001124

l1128: # "if CRC error at disk address %08x (%d retries)\n"
	.byte	0x69, 0x66, 0x20, 0x43	# 001128
	.byte	0x52, 0x43, 0x20, 0x65	# 00112c
	.byte	0x72, 0x72, 0x6f, 0x72	# 001130
	.byte	0x20, 0x61, 0x74, 0x20	# 001134
	.byte	0x64, 0x69, 0x73, 0x6b	# 001138
	.byte	0x20, 0x61, 0x64, 0x64	# 00113c
	.byte	0x72, 0x65, 0x73, 0x73	# 001140
	.byte	0x20, 0x25, 0x30, 0x38	# 001144
	.byte	0x78, 0x20, 0x28, 0x25	# 001148
	.byte	0x64, 0x20, 0x72, 0x65	# 00114c
	.byte	0x74, 0x72, 0x69, 0x65	# 001150
	.byte	0x73, 0x29, 0x0a, 0x00	# 001154

l1158: # "05/31/85"
	.byte	0x30, 0x35, 0x2f, 0x33, 0x31, 0x2f, 0x38, 0x35, 0x00

# 1161:
	.byte	0x00

# 1162:
	.byte	0x00

# 1163:
	.byte	0x00

l1164: # "PF3"
	.byte	0x50, 0x46, 0x33, 0x00

l1168: # "1.2.1"
	.byte	0x31, 0x2e, 0x32, 0x2e, 0x31, 0x00

# 116e:
	.byte	0x00, 0x00

l1170:
	.word	0x00202020, 0x20202020, 0x20202828, 0x28282820	# 001170
	.word	0x20202020, 0x20202020, 0x20202020, 0x20202020	# 001180
	.word	0x20481010, 0x10101010, 0x10101010, 0x10101010	# 001190
	.word	0x10848484, 0x84848484, 0x84848410, 0x10101010	# 0011a0
	.word	0x10108181, 0x81818181, 0x01010101, 0x01010101	# 0011b0
	.word	0x01010101, 0x01010101, 0x01010101, 0x10101010	# 0011c0
	.word	0x10108282, 0x82828282, 0x02020202, 0x02020202	# 0011d0
	.word	0x02020202, 0x02020202, 0x02020202, 0x10101010	# 0011e0
	.word	0x20000000, 0x00000000, 0x00000000, 0x00000000	# 0011f0
	.word	0x00000000, 0x00000000, 0x00000000, 0x00000000	# 001200
	.word	0x00000000, 0x00000000, 0x00000000, 0x00000000	# 001210
	.word	0x00000000, 0x00000000, 0x00000000, 0x00000000	# 001220
	.word	0x00000000, 0x00000000, 0x00000000, 0x00000000	# 001230
	.word	0x00000000, 0x00000000, 0x00000000, 0x00000000	# 001240
	.word	0x00000000, 0x00000000, 0x00000000, 0x00000000	# 001250
	.word	0x00000000, 0x00000000, 0x00000000, 0x00000000	# 001260
	.word	0x00000000                                    	# 001270

	.section	.text2,"x"
#################################################################################
##
## Reset entry point. We start running here at power-up.
##
#################################################################################


## Set up the stack pointer, frame pointer, argument pointer,
## and the interrupt stack pointer.


# 00001274:
	MOVAW	$0x2000008,%sp
	MOVAW	$0x2000008,%fp
	MOVAW	$0x2000008,%ap
	MOVAW	$0x2000808,%isp
 

## Next we set some timers. These commands write to the 8253 programmable
## timer chip and configure Counter 0 and Counter 2. It is as yet unknown what
## these timers are used for or what they're connected to.

## Send 0x16 to the command register of the 8253.
## BCD=0, M=011, RL=01, SC=00
## This selects counter 0, sets Read/Load to "Lest significant byte only",
## and sets mode to "Mode 3" (Square Wave generator)


# 00001290:
	MOVB	&0x16,$0x4200f
	#NOP


## Put 0x64 (SITINIT in firmware.h) into Counter 0
 
# 00001298:
	MOVB	&0x64,$0x42003
	#NOP
 
## Send 0x94 to the command register of the 8253.
## BCD=0, M=010, RL=01, SC=10
## This selects counter 2, sets Read/Load to "Least significant byte only",
## and sets mode to "Mode 2" (Rate generator)

# 000012a1:
	MOVB	&0x94,$0x4200f
	#NOP
 
## Puts 0xa into Counter 2

# 000012ab:
	MOVB	&0xa,$0x4200b
	#NOP

## Send 0x74 to the command register of the 8253.
## BCD=0, M=010, RL=11, SC=01
## Select counter 1, sets Read/Load to "Least, then most SB",
## then sets mode to "Mode 2" (Rate generator)

# 000012b3:
	MOVB	&0x74,$0x4200f
	#NOP
 
## ... but oddly, we don't seem to do anything with timer 1, we just let it
## sit there without loading any data into it, so its period is unknown.
## Counter 1 (0x42007) is unused in the rest of the ROM!

## Unconditional jump to 0x12d5 -- basically we skip the next block

# 000012bc:
	JMP	$0x12d5
	NOP
	NOP
 
################################################################################
## Unknown Entry Point. Who jumps here?

# 000012c4:
	SAVE	%r3
	.byte 	0x9c, 0x4f, 0x08, 0x00, 0x00, 0x00, 0x4c	# ADDW2	&0x8,%sp # 'as' builds with byte immed.
	MOVB	&0x1,$0x4401b
	#NOP
 
################################################################################
## Unknown Entry Point, but my current guess is that this is some
## kind of sanity check or power-on self-test of the CPU.
## 


## Set the PSW's NZCV flags to all '0's, leaving the rest of the PSW
## unaffected.

# 000012d5:
	#NOP
	MOVW	%psw,%r0
	ANDW2	&0xffc3ffff,%r0
	.byte	0x84, 0x40, 0x4b	# MOVW	%r0,%psw # as generates a NOP


## Branches based on the state of the PSW after clearing
## the NZCV bits. In short, each check looks to see if one
## of the bits is set when it should not be set. If they
## are, we jump to 0x1923. If not, we branch to the next
## check.

## If (Z == 0), branch to 0x12e8
# 000012e3:
	BNEB	l12e8
# No, branch to 0x1923
	BRH	l1923
 
## If ((N|Z) == 0), branch to 0x12ed
l12e8:	BGB	l12ed
# No, branch to 0x1923
	BRH	l1923
 
## If ((N == 0)|(Z == 1)), branch to 0x12f2
l12ed:	BGEB	l12f2
# No, branch to 0x1923
	BRH	l1923

# If ((C|Z) == 0), branch to 0x12f7
l12f2:	BGUB	l12f7
# No, branch to 0x1923
	BRH	l1923
 
# If (C == 0) branch to 0x12fc
l12f7:	BGEUB	l12fc
# No, branch to 0x1923
	BRH	l1923
 
# if (C == 0) branch to 0x12fc
# Why are we repeating this check?
# CAC: To make sure that the test does not clear or set the flag as a side effect?
l12fc:	BGEUB	l1301
# No, branch to 0x1923
	BRH	l1923
 
# if (V == 0) branch to 0x1306
l1301:	BVCB	l1306
# No, branch to 0x1923
	BRH	l1923
 
# We've fallen through.
# Now we set the PSW's NZCV flags to all 1's.

l1306:
# 00001306:
	#NOP
	MOVW	%psw,%r0
	ORW2 &0x3c0000,%r0
	.byte	0x84, 0x40, 0x4b	# MOVW %r0,%psw # as inserts a NOP

# Now we do another check of the flags, very similar to
# the behavior above. Each check looks to see if a flag
# is clear when it should not be clear.

 
# If (Z == 1), branch to 0x1319
# 00001314:
	BEB	l1319
# No, branch to 0x1923
	BRH	l1923
 
# If ((N|Z) == 1), branch to 0x131e
l1319:	BLEB	l131e
# No, branch to 0x1923
	BRH	l1923
 
# If ((N == 0) | (Z == 1)), branch to 0x1323
l131e:	BGEB	l1323
# No, branch to 0x1923
	BRH	l1923
 
# If ((C|Z) == 1), branch to 0x1328
l1323:	BLEUB	l1328
# No, branch to 0x1923
	BRH	l1923
 
# If (C == 1), branch to 0x132d
l1328:	BLUB	l132d
# No, branch to 0x1923
	BRH	l1923
 
# If (C == 1), branch to 0x1332.
# Again, we repeat a check -- why?
l132d:	BLUB	l1332
# No, branch to 0x1923
	BRH	l1923
 
# If (V == 1), branch to 0x1337
l1332:	BVSB	l1337
# No, branch to 0x1923
	BRH	l1923
 
# We've fallen through.
# Time for some more self-testing!
 
l1337:	NOP
	.byte	0x84, 0x4b, 0x40	# MOVW %psw,%r0 # as inserts a NOP
# 0000133b:
	ANDW2	&0xffc3ffff,%r0
	ORW2	&0x100000,%r0
	.byte	0x84, 0x40, 0x4b	# MOVW %r0,%psw # as inserts a NOP
	BGEB	l1351
	BRH	l1923
# 00001351:
l1351:
	NOP
	.byte	0x84, 0x4b, 0x40	# MOVW %psw,%r0 # as inserts a NOP
	ANDW2	&0xffc3ffff,%r0
	ORW2	&0x40000,%r0
	.byte	0x84, 0x40, 0x4b	# MOVW %r0,%psw # as inserts a NOP
	BLEUH	l136c
	BRH	l1923
# 0000136c:
l136c:
	NOP
	.byte	0x84, 0x4b, 0x40	# MOVW %psw,%r0 # as inserts a NOP
	ANDW2	&0xffc3ffff,%r0
	ORW2	&0x200000,%r0
	.byte	0x84, 0x40, 0x4b	# MOVW %r0,%psw # as inserts a NOP
	BLB	l1386
	BRH	l1923

# Put 0xff into R0, then rotate it through R1-R8

# 00001386:
l1386:
	MOVW &-1,%r0
l1389:
	MOVW %r0,%r1
	MOVW %r1,%r2
	MOVW %r2,%r3
	MOVW %r3,%r4
	MOVW %r4,%r5
	MOVW %r5,%r6
	MOVW %r6,%r7
	MOVW %r7,%r8
	CMPW %r0,%r8

## If R0 != R8, fail.
# 000013a4:
	BNEH l1923
 
# Success. Now left-shift R0 by 1, store in R0
	LLSW3 &0x1,%r0,%r0
 
# Is zero flag set?
	BGEB l13af
# No, it's not, jump back and keep left-shifting until it is.
	BRB l1389

# Next check:
l13af:	MOVW &-2,%r0
l13b2:
	MCOMW %r0,%r1
	MCOMW %r1,%r2
	MCOMW %r2,%r3
	MCOMW %r3,%r4
	MCOMW %r4,%r5
	MCOMW %r5,%r6
	MCOMW %r6,%r7
	MCOMW %r7,%r8
	MCOMW %r0,%r8
	MCOMW %r1,%r7
	MCOMW %r2,%r6
	MCOMW %r3,%r5
	MCOMW %r8,%r1
	MCOMW %r7,%r2
	MCOMW %r6,%r3
	MCOMW %r4,%r0
	MCOMW %r1,%r4
	CMPW %r0,%r8
	BNEH l1923
	LLSW3 &0x1,%r0,%r0
	BLB l13f6
	MCOMW %r0,%r0
	BRB l13b2




l13f6:
	MOVW %fp,%r1
	MOVW %ap,%r2
	MOVW %sp,%r3
	MOVW %pcbp,%r4
	MOVW %isp,%r5
	MOVW &-1,%r0
l1408:
	MOVW %r0,%fp
	MOVW %fp,%ap
	MOVW %ap,%sp
	MOVW %sp,%pcbp
	MOVW %pcbp,%isp
	CMPW %fp,%isp
	BNEH l1466
	LLSW3 &0x1,%r0,%r0
	BGEB l1425
	BRB l1408


l1425:
	MOVW &0x1,%r0
l1428:
	MCOMW %r0,%fp
	MCOMW %fp,%ap
	MCOMW %ap,%sp
	MCOMW %sp,%pcbp
	MCOMW %pcbp,%isp
	MCOMW %fp,%isp
	MCOMW %ap,%pcbp
	MCOMW %sp,%fp
	MCOMW %isp,%ap
	MCOMW %pcbp,%sp
	CMPW %fp,%isp
	BNEH l1466
	LLSW3 &0x1,%r0,%r0
	BLB l1454
	BRB l1428

l1454:
	MOVW %r1,%fp
	MOVW %r2,%ap
	MOVW %r3,%sp
	MOVW %r4,%pcbp
	MOVW %r5,%isp

	BRH l1478
l1466:
	MOVW %r1,%fp
	MOVW %r2,%ap
	MOVW %r3,%sp
	MOVW %r4,%pcbp
	MOVW %r5,%isp

	BRH l1923

l1478:
	CLRH %r8
	MOVW &0x7fee,%r5
	CLRW %r7

# Tests for the carry bit (I think)
 
# First jump to 14c0 to start the test...
	BRB l14c0
 
 
# While r5 < r7...
l1483:
	MOVH {uhalf}%r8,{uword}%r0
	MOVB (%r7),{uhalf}%r1
	ANDH2 &0xff,%r1
	MOVH {uhalf}%r1,{uword}%r1
	ADDW2 %r1,%r0
	MOVH %r0,%r8
	MOVH {uhalf}%r8,{uword}%r0
	LLSW3 &0x1,%r0,%r0
	MOVH {uhalf}%r0,{uword}%r0
	MOVH {uhalf}%r8,{uword}%r1
	LRSW3 &0xf,%r1,%r1
	MOVH {uhalf}%r1,{uword}%r1
	ORW2 %r1,%r0
	MOVH %r0,%r8
	INCW %r7
l14c0:
	CMPW %r5,%r7
	BLUB l1483
 
	MOVH {uhalf}%r8,{uword}%r0
	MCOMW %r0,%r0
	MOVH %r0,%r8
	MOVH {uhalf}%r8,{uword}%r0
	MOVB (%r7),{uword}%r1
	MOVB 1(%r7),{uword}%r2
	LLSW3 &0x8,%r2,%r2
	ORW2 %r2,%r1
	CMPW %r1,%r0
	BNEB l14f0

	.byte	0x24, 0x7f, 0x6e, 0x15, 0x00, 0x00	# JMP l156e
l14f0:
 
	MOVH {uhalf}%r8,{uword}%r0
	MCOMW %r0,%r0
	MOVH %r0,%r8
	ADDW2 &0x8000,%r5
	BRB l1541
l1504:
	MOVH {uhalf}%r8,{uword}%r0
	MOVB (%r7),{uhalf}%r1
	ANDH2 &0xff,%r1
	MOVH {uhalf}%r1,{uword}%r1
	ADDW2 %r1,%r0
	MOVH %r0,%r8
	MOVH {uhalf}%r8,{uword}%r0
	LLSW3 &0x1,%r0,%r0
	MOVH {uhalf}%r0,{uword}%r0
	MOVH {uhalf}%r8,{uword}%r1
	LRSW3 &0xf,%r1,%r1
	MOVH {uhalf}%r1,{uword}%r1
	ORW2 %r1,%r0
	MOVH %r0,%r8
	INCW %r7
l1541:
	CMPW %r5,%r7
	BLUB l1504
	MOVH {uhalf}%r8,{uword}%r0
	MCOMW %r0,%r0
	MOVH %r0,%r8
	MOVH {uhalf}%r8,{uword}%r0
	MOVB (%r7),{uword}%r1
	MOVB 1(%r7),{uword}%r2
	LLSW3 &0x8,%r2,%r2
	ORW2 %r2,%r1
	CMPW %r1,%r0
	BEB l156e
	BRH l192c
l156e:
	CMPW &0xa11c0ded,$0x2000864
	BEB l158e
	CMPW &0x8badf00d,$0x2000864
	BEB l158e
	.byte	0x24, 0x7f, 0xbc, 0x16, 0x00, 0x00   # JMP l16bc
l158e:
	CALL (%sp),$0x3b90
	ADDW3 &0x1,$0x4a0,%r0
	CMPB &0x2,(%r0)
	BNEB l15a7
	MOVW &0x1,%r0
	BRB l15a9
l15a7:
	CLRW %r0
l15a9:
	PUSHW %r0
	CALL -4(%sp),$0x732c
	PUSHW &0x0
	CALL -4(%sp),$0x798c
	MOVB $0x4d000,{uword}%r5
	MOVB &0x1,$0x4401f
	#NOP
	MOVB &0x10,$0x4900f
	#NOP
	MOVB &0x20,$0x4900f
	#NOP
	MOVB &0x1,$0x2000868
	#NOP
	ADDW3 &0x2,$0x4a4,%r0
	.byte	0x2b, 0x50	# TSTB (%r0) # as adds a NOP
	BEB l15ff
	CALL (%sp),$0x5f72
	CALL (%sp),$0x6378
l15ff:
	ADDW3 &0x4,$0x4a4,%r0
	CMPB &0x1,(%r0)
	BNEB l1612
	.byte	0x24, 0x7f, 0xa0, 0x16, 0x00, 0x00	# JMP l16a0
l1612:
	CALL (%sp),$0x5f72
	PUSHW &0x4300c
	ADDW3 &0x1,$0x4a0,%r0
	PUSHW %r0
	PUSHW &0x1

## Read NVRAM
	CALL -12(%sp),$0x5224
	TSTW %r0
	BNEB l165d
	ADDW3 &0x1,$0x4a0,%r0
	MOVB &0x1,(%r0)
	#NOP
	ADDW3 &0x1,$0x4a0,%r0
	PUSHW %r0
	PUSHW &0x4300c
	PUSHW &0x1
	CALL -12(%sp),$0x52a0
l165d:
	MOVW $0x2000864,(%fp)
	#NOP
	CLRB *$0x4a0
	#NOP
	ADDW3 &0x2,$0x4a0,%r0
## Copy string "/filledt" (to where?)
	PUSHW %r0
	.byte	0xa0, 0x4f, 0xc8, 0x05, 0x00, 0x00	# PUSHW &0x5c8
	CALL -8(%sp),$0x7fb0
	CALL (%sp),$0x6970
	CMPW &0xfeedbeef,$0x2000864
	BEB l16a0
	MOVW (%fp),$0x2000864
	#NOP
l16a0:
	CMPW &0xa11c0ded,$0x2000864
	BNEB l16b6
	CALL (%sp),*$0x2000858
	BRB l16bc
l16b6:
	JMP $0x65f0
l16bc:
	CMPW &0x3b02f1d0,$0x200086c
	BEB l16f1
	MOVB &0x70,$0x49004
	#NOP
	MOVB &0x40,$0x49006
	#NOP
	CLRB $0x49007
	#NOP
	MOVB &0x4,$0x4900d
	#NOP
	CLRW $0x200085c
	#NOP
l16f1:
	MOVW $0x2000864,%r5
	MOVW $0x200086c,%r4
	MOVW $0x200085c,%r3
	MOVW &0x2000000,%r7
	MOVW &0x2001504,%r6
l1714:
	BRB l175f
l1716:
	MOVB &0xff,(%r7)
	#NOP
	CMPB &0xff,(%r7)
	BEB l1729
	.byte	0x24, 0x7f, 0x35, 0x19, 0x00, 0x00	# JMP l1935
l1729:
	MOVB &0xaa,(%r7)
	#NOP
	CMPB &0xaa,(%r7)
	BEB l173c
	JMP $0x1935
l173c:
	MOVB &0x55,(%r7)
	#NOP
	CMPB &0x55,(%r7)
	BEB l174d
	JMP $0x1935
l174d:
	CLRB (%r7)
	#NOP
	MOVW %r7,%r0
	INCW %r7
	.byte	0x2b, 0x50	# TSTB (%r0) # as adds a NOP
	BEB l175f
	JMP $0x1935
l175f:
	CMPW %r6,%r7
	BLUB l1716
	CMPW &0x2004000,%r7
	BLB l176f
	BRB l17ad
l176f:
	CMPW &0xfeedbeef,%r5
	BEB l179c
	CMPW &0x3b02f1d0,%r5
	BEB l179c
	CMPW &0x8badf00d,%r5
	BEB l179c
	CMPW &0xadebac1e,%r5
	BEB l179c
	CMPW &0xa11c0ded,%r5
	BNEB l17a3
l179c:
	MOVW &0x2003000,%r7
l17a3:
	MOVW &0x2004000,%r6
	BRH l1714
l17ad:
	MOVW %r4,$0x200086c
	#NOP
	MOVW %r5,$0x2000864
	#NOP
	MOVW %r3,$0x200085c
	#NOP
	MOVB &0x1,$0x2000868
	#NOP
	CLRH %r8
 
# Put $43800 into R5. This is the top of NVRAM, and the stopping
# point for the upcoming block that clears NVRAM.
 
	MOVW &0x43800,%r5
 
# Put $43000 into R7. This is the base of NVRAM.
	MOVW &0x43000,%r7
 

	BRB l181d
l17df:
	MOVH {uhalf}%r8,{uword}%r0
# Read NVRAM address + 2 into R1
	MOVH {uhalf}2(%r7),{uword}%r1
# Mask the low nybble of R1
	ANDH2 &0xf,%r1
# Zero-extend the halfword into a word
	MOVH {uhalf}%r1,{uword}%r1
# Add R1 to R0, store in R0
	ADDW2 %r1,%r0
# Move R0 to R8
	MOVH %r0,%r8
	MOVH {uhalf}%r8,{uword}%r0
# Left-shift R0 by 1
	LLSW3 &0x1,%r0,%r0
	MOVH {uhalf}%r0,{uword}%r0
	MOVH {uhalf}%r8,{uword}%r1
	LRSW3 &0xf,%r1,%r1
	MOVH {uhalf}%r1,{uword}%r1
	ORW2 %r1,%r0
	MOVH %r0,%r8
 
# Increment the address in R7 by 4 bytes
	ADDW2 &0x4,%r7
 
# While R5 < R7, keep going
l181d:
	CMPW %r5,%r7
	BLUB l17df

## Now we do something odd with 43800, 43804, 43808, and 4380c. What
## is this? Serial number structure of some kind?

	MOVH {uhalf}%r8,{uword}%r0
	MCOMW %r0,%r0
	MOVH %r0,%r8
	MOVH {uhalf}%r8,{uword}%r0
	ANDW3 &0xf,(%r7),%r1
	ANDW3 &0xf,4(%r7),%r2
	LLSW3 &0x4,%r2,%r2
	ORW2 %r2,%r1
	ANDW3 &0xf,8(%r7),%r2
	LLSW3 &0x8,%r2,%r2
	ORW2 %r2,%r1
	ANDW3 &0xf,12(%r7),%r2
	LLSW3 &0xc,%r2,%r2
	ORW2 %r2,%r1
	CMPW %r1,%r0

## If R1 != R0, we clear out the NVRAM. Othwerise, jump to 191d
	BNEB l1865
	JMP $0x191d

## Load the NVRAM base address into R7
l1865:
	MOVW &0x43000,%r7

	BRB l1874

## Clear the NVRAM memory location stored in %r7
l186e:
	CLRW (%r7)
	#NOP

## Add 4 bytes to the address
	ADDW2 &0x4,%r7

## Is %r7 == %r5?
l1874:
	CMPW %r5,%r7

## No, jump back and keep zeroing NVRAM.
	BLUB l186e

## Yes, we're done.

## Store 01 in $43060
	MOVW &0x1,$0x43060
	#NOP

## Store 00 in $43064
	CLRW $0x43064
	#NOP

	CLRH %r8
	MOVW &0x43000,%r7

	BRB l18d1
l1893:
	MOVH {uhalf}%r8,{uword}%r0
	MOVH {uhalf}2(%r7),{uword}%r1
	ANDH2 &0xf,%r1
	MOVH {uhalf}%r1,{uword}%r1
	ADDW2 %r1,%r0
	MOVH %r0,%r8
	MOVH {uhalf}%r8,{uword}%r0
	LLSW3 &0x1,%r0,%r0
	MOVH {uhalf}%r0,{uword}%r0
	MOVH {uhalf}%r8,{uword}%r1
	LRSW3 &0xf,%r1,%r1
	MOVH {uhalf}%r1,{uword}%r1
	ORW2 %r1,%r0
	MOVH %r0,%r8
	ADDW2 &0x4,%r7


l18d1:
	CMPW %r5,%r7
	BLUB l1893
	MOVH {uhalf}%r8,{uword}%r0
	MCOMW %r0,%r0
	MOVH %r0,%r8
	MOVH {uhalf}%r8,{uword}(%r7)
	#NOP
	MOVH {uhalf}%r8,{uword}%r0
	LRSW3 &0x4,%r0,%r0
	MOVW %r0,4(%r7)
	#NOP
	MOVH {uhalf}%r8,{uword}%r0
	LRSW3 &0x8,%r0,%r0
	MOVW %r0,8(%r7)
	#NOP
	MOVH {uhalf}%r8,{uword}%r0
	LRSW3 &0xc,%r0,%r0
	MOVW %r0,12(%r7)
	#NOP
	ORW2 &0x20000000,$0x200085c
	#NOP

##
	JMP $0x21b1

##
## Test failure entry points, I think.
##
## Set %r4 based on the entry point. %r4 will be either: 2, 3, 4 or 5.
##
l1923:

## Set %r4 to 2, then jump to 0x1941
	MOVW &0x2,%r4
	JMP $0x1941

## Set %r4 to 3, then jump to 0x1941
l192c:
	MOVW &0x3,%r4
	JMP $0x1941

## Set %r4 to 4, then jump to 0x1941
l1935:
	MOVW &0x4,%r4
	JMP $0x1941

## Set %r4 to 5, fall through to 0x1941
	MOVW &0x5,%r4

## Set 0x4900d to 0. This is 2681 UART.
	CLRB $0x4900d
	#NOP
	MOVB &0x8,$0x4900f
	#NOP

## 0x440?? == System Board Status register
	MOVB &0x1,$0x44017
	#NOP
	MOVB &0x1,$0x44003
	#NOP

	CLRW %r5
	BRB l1994
l1964:
	CLRW %r3
	BRB l196a
l1968:
	INCW %r3
l196a:
	CMPW &0xc350,%r3
	BLEUB l1968
	MOVB &0x1,$0x44013
	#NOP
	CLRW %r3
	BRB l1981
l197f:
	INCW %r3
l1981:
	CMPW &0xc350,%r3
	BLEUB l197f

## Write to the CSR (what register?)
	MOVB &0x1,$0x44017
	#NOP
	INCW %r5
l1994:
	CMPW %r4,%r5
	BLUB l1964
	CMPB &0x1,*$0x510
	BEB l19cb
	CMPB &0x64,$0x42003

## If *0x42003 == 0x64, jump over the up-coming infinite loop...
	BEB l19cb

## Otherwise, we're terminal. Set some state...
	CLRW *$0x48c
	#NOP
	CLRW *$0x514
	#NOP
	CLRB $0x4900d
	#NOP
	MOVB &0x4,$0x4900e
	#NOP

## ... and then die in an infinite loop (BRB 0)
l19c9:
	BRB l19c9

## R3 = 0
l19cb:
	CLRW %r3

## Skip first increment, so R3 still = 0. Go to 19d1
	BRB l19d1

l19cf:
	INCW %r3

## Multiply R4 by 0xC350 (50000d) and store in R0.
l19d1:
	.byte	0xe8, 0x4f, 0x50, 0xc3, 0x00, 0x00, 0x44, 0x40	#MULW3 &0xc350,%r4,%r0

## While R3 < R0, keep incremting R3.
	CMPW %r0,%r3
	BLEUB l19cf

	JMP $0x1960

## OK, I don't actually see how any code can reach this point. The
## unconditional jump above catches everything, and I don't see any
## other branches to this location. Weird.
	MOVAW (%fp),%sp
	POPW %r8
	POPW %r7
	POPW %r6
	POPW %r5
	POPW %r4
	POPW %r3
	POPW %fp
	RET
	NOP
	NOP

################################################################################
## Unknown Routine - in fact, nothing calls this code! It looks unreachable.
##
# 000019f8:
	SAVE %r3
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp

## Jump point from 0x25d3
	MOVB &0xd0,$0x4d000
	#NOP
	PUSHW &0x1
	CALL -4(%sp),*$0x528 # DUART Delay
	MOVB &0x1,$0x2000870
	#NOP
	MOVB &0xff,$0x2000871
	#NOP
	MOVW &0x43800,%r3
	PUSHW &0x0
	PUSHW &0x2000874
	PUSHW &0x0
	PUSHW &0x3
	CALL -16(%sp),$0x7b2c
	TSTW %r0
	BNEB l1a4c
	JMP $0x1b67
l1a4c:
	ADDW3 &0x3,$0x508,%r0
	CMPB (%r0),$0x2000874
	BEB l1a63
	JMP $0x1b67
l1a63:
	ADDW3 &0x7,$0x508,%r0
	CMPB (%r0),$0x2000875
	BEB l1a7a
	JMP $0x1b67
l1a7a:
	ADDW3 &0xb,$0x508,%r0
	CMPB (%r0),$0x2000876
	BEB l1a91
	JMP $0x1b67
l1a91:
	ADDW3 &0xf,$0x508,%r0
	CMPB (%r0),$0x2000877
	BEB l1aa8
	JMP $0x1b67
l1aa8:
	MOVW &0x43000,%r8
	BRB l1ab7
l1ab1:
	CLRW (%r8)
	#NOP
	ADDW2 &0x4,%r8
l1ab7:
	CMPW %r3,%r8
	BLUB l1ab1
	MOVW &0x1,$0x43060
	#NOP
	CLRW $0x43064
	#NOP
	CLRH %r4
	MOVW &0x43000,%r8
	BRB l1b14
l1ad6:
	MOVH {uhalf}%r4,{uword}%r0
	MOVH {uhalf}2(%r8),{uword}%r1
	ANDH2 &0xf,%r1
	MOVH {uhalf}%r1,{uword}%r1
	ADDW2 %r1,%r0
	MOVH %r0,%r4
	MOVH {uhalf}%r4,{uword}%r0
	LLSW3 &0x1,%r0,%r0
	MOVH {uhalf}%r0,{uword}%r0
	MOVH {uhalf}%r4,{uword}%r1
	LRSW3 &0xf,%r1,%r1
	MOVH {uhalf}%r1,{uword}%r1
	ORW2 %r1,%r0
	MOVH %r0,%r4
	ADDW2 &0x4,%r8
l1b14:
	CMPW %r3,%r8
	BLUB l1ad6
	MOVH {uhalf}%r4,{uword}%r0
	MCOMW %r0,%r0
	MOVH %r0,%r4
	MOVH {uhalf}%r4,{uword}(%r8)
	#NOP
	MOVH {uhalf}%r4,{uword}%r0
	LRSW3 &0x4,%r0,%r0
	MOVW %r0,4(%r8)
	#NOP
	MOVH {uhalf}%r4,{uword}%r0
	LRSW3 &0x8,%r0,%r0
	MOVW %r0,8(%r8)
	#NOP
	MOVH {uhalf}%r4,{uword}%r0
	LRSW3 &0xc,%r0,%r0
	MOVW %r0,12(%r8)
	#NOP
	ORW2 &0x40000000,$0x200085c
	#NOP
	CALL (%sp),$0x5de0
	PUSHW &0x4300c
	PUSHW &0x2000861
	PUSHW &0x1
	CALL -12(%sp),$0x5224
	TSTW %r0
	BNEB l1b9f
	MOVB &0x1,$0x2000861
	#NOP
	PUSHW &0x2000861
	PUSHW &0x4300c
	PUSHW &0x1
	CALL -12(%sp),$0x52a0
l1b9f:
	CMPB &0x1,$0x2000861
	BEB l1bb1
	CMPB &0x2,$0x2000861
	BNEB l1bc1
l1bb1:
	MOVB &0x1,%r5
	SUBB3 &0x1,$0x2000861,%r0
	MOVB %r0,%r7
	BRB l1bc5
l1bc1:
	CLRB %r5
	CLRB %r7
l1bc5:
	CLRB $0x2000860
	#NOP
	CLRH %r4
	BRB l1be8
l1bd0:
	MOVH {uhalf}%r4,{uword}%r0
	MOVH {uhalf}%r4,{uword}%r1
# l10ec lookup table?
	.byte	0x87, 0x81, 0xec, 0x10, 0x00, 0x00, 0x80, 0x74, 0x0a, 0x00, 0x02	# MOVB 0x10ec(%r1),0x2000a74(%r0)
	NOP
	INCH %r4
l1be8:
	MOVH {uhalf}%r4,{uword}%r0
	CMPW &0x8,%r0
	BLUB l1bd0
	CLRH %r4
	BRB l1c17
l1bf6:
	MOVB %r7,{uword}%r0
	PUSHW %r0
	CALL -4(%sp),$0x732c
	TSTW %r0
	BEB l1c0a
	BRB l1c21
l1c0a:
	PUSHW &0x64
	CALL -4(%sp),*$0x528 # DUART Delay
	INCH %r4
l1c17:
	MOVH {uhalf}%r4,{uword}%r0
	CMPW &0x3c,%r0
	BLUB l1bf6
l1c21:
	MOVB %r7,{uword}%r0
	PUSHW %r0
## XXX Call to 6e28
	CALL -4(%sp),$0x6e28
	TSTW %r0
	BNEB l1c6a
## Here we seem to be setting 0x2 in r0
	ORW3 &0x2,$0x2000a7c,%r0
	MOVB %r7,{uword}%r1
	LLSW3 &0x17,%r1,%r1
	ORW2 %r1,%r0
	PUSHW %r0
	CALL -4(%sp),$0x61c0
	MOVB &0x1,$0x44013
	#NOP
	MOVW &0xfeedbeef,*$0x48c
	#NOP
	JMP $0x1e37
l1c6a:
	.byte	0xeb, 0x6f, 0x54, 0x47, 0x40	# MULB3 &0x54,%r7,%r0
	CMPW &0xca5e600d,0x2000a84(%r0)
	BEB l1c82
	JMP $0x1da0
l1c82:
	ADDB3 &0x1,%r7,%r0
	ORB2 %r0,$0x2000860
	#NOP
	ANDB2 &0xf0,$0x2000a75
	#NOP
	.byte	0xeb, 0x6f, 0x54, 0x47, 0x40	# MULB3 &0x54,%r7,%r0
	LRSW3 &0x8,0x2000aa4(%r0),%r0
	ORB2 %r0,$0x2000a75
	#NOP
	.byte	0xeb, 0x6f, 0x54, 0x47, 0x40	# MULB3 &0x54,%r7,%r0
	MOVB 0x2000aa7(%r0),$0x2000a76
	#NOP
	.byte	0xeb, 0x6f, 0x54, 0x47, 0x40	# MULB3 &0x54,%r7,%r0
	SUBB3 &0x1,0x2000a9f(%r0),%r0
	MOVB %r0,$0x2000a77
	#NOP
	.byte	0xeb, 0x6f, 0x54, 0x47, 0x40	# MULB3 &0x54,%r7,%r0
	SUBB3 &0x1,0x2000aa3(%r0),%r0
	MOVB %r0,$0x2000a78
	#NOP
	.byte	0xeb, 0x6f, 0x54, 0x47, 0x40	# MULB3 &0x54,%r7,%r0
	LRSW3 &0x9,0x2000a98(%r0),%r0
	MOVB %r0,$0x2000a7a
	#NOP
	.byte	0xeb, 0x6f, 0x54, 0x47, 0x40	# MULB3 &0x54,%r7,%r0
	LRSW3 &0x1,0x2000a98(%r0),%r0
	MOVB %r0,$0x2000a7b
	#NOP
	MOVB %r7,{uword}%r0
	PUSHW %r0
	CALL -4(%sp),$0x732c
	TSTW %r0
	BNEB l1d57
	TSTB %r5
	BEB l1d57
	MOVB %r7,{uword}%r0
	LLSW3 &0x17,%r0,%r0
	ORW2 &0x40002,%r0
	PUSHW %r0
	CALL -4(%sp),$0x61c0
	MOVB &0x1,$0x44013
	#NOP
	MOVW &0xfeedbeef,*$0x48c
	#NOP
	BRB l1d9a
l1d57:
	TSTB %r5
	BEB l1d9a
	MOVB %r7,{uword}%r0
	PUSHW %r0
	CALL -4(%sp),$0x78d4
	TSTW %r0
	BNEB l1d9a
	MOVB %r7,{uword}%r0
	LLSW3 &0x17,%r0,%r0
	ORW2 &0x50002,%r0
	PUSHW %r0
	CALL -4(%sp),$0x61c0
	MOVB &0x1,$0x44013
	#NOP
	MOVW &0xfeedbeef,*$0x48c
	#NOP
l1d9a:
	JMP $0x1e37
	CMPW &0xfeedbeef,$0x2000878
	BNEB l1e06
	MOVW &0x3d,$0x2000864
	#NOP
	PUSHW &0x2000864
	PUSHW &0x4300a
	PUSHW &0x2
	CALL -12(%sp),$0x52a0
	CALL (%sp),$0x3b90
	MOVB &0x1,$0x2000861
	#NOP
	PUSHW &0x2000861
	PUSHW &0x4300c
	PUSHW &0x1
	CALL -12(%sp),$0x52a0
	MOVW &0xadebac1e,$0x2000864
	#NOP
	ORW2 &0x10,$0x200085c
	#NOP
	BRB l1e37
l1e06:
	TSTB %r5
	BEB l1e37
	MOVB %r7,{uword}%r0
	LLSW3 &0x17,%r0,%r0
	ORW2 &0x20002,%r0
	PUSHW %r0
	CALL -4(%sp),$0x61c0
	MOVB &0x1,$0x44013
	#NOP
	MOVW &0xfeedbeef,*$0x48c
	#NOP
l1e37:
	XORB3 &0x1,%r7,%r0
	MOVB %r0,%r6
	PUSHW &0x4303a
	PUSHW &0x2000861
	PUSHW &0x1
	CALL -12(%sp),$0x5224
	TSTW %r0
	BNEB l1e75
	CLRB $0x2000861
	#NOP
	PUSHW &0x2000861
	PUSHW &0x4303a
	PUSHW &0x1
	CALL -12(%sp),$0x52a0
l1e75:
	CMPB &0x1,$0x2000861
	BNEB l1e81
	MOVH &0x3b,%r4
l1e81:
	PUSHW &0x64
	CALL -4(%sp),*$0x528 # DUART Delay
	MOVB %r6,{uword}%r0
	PUSHW %r0
	CALL -4(%sp),$0x7380
	TSTW %r0
	BEB l1ea0
	BRB l1eac
l1ea0:
	INCH %r4
	MOVH {uhalf}%r4,{uword}%r0
	CMPW &0x3c,%r0
	BLUB l1e81
l1eac:
	MOVH {uhalf}%r4,{uword}%r0
	CMPW &0x3c,%r0
	BLUB l1eda
	MOVB &0x1,$0x2000861
	#NOP
	PUSHW &0x2000861
	PUSHW &0x4303a
	PUSHW &0x1
	CALL -12(%sp),$0x52a0
	JMP $0x20a9
l1eda:
	MOVB %r6,{uword}%r0
	PUSHW %r0
	CALL -4(%sp),$0x6e28
	TSTW %r0
	BNEB l1f23
	ORW3 &0x2,$0x2000a7c,%r0
	MOVB %r6,{uword}%r1
	LLSW3 &0x17,%r1,%r1
	ORW2 %r1,%r0
	PUSHW %r0
	CALL -4(%sp),$0x61c0
	MOVB &0x1,$0x44013
	#NOP
	MOVW &0xfeedbeef,*$0x48c
	#NOP
	JMP $0x20a9
l1f23:
	.byte	0xeb, 0x6f, 0x54, 0x46, 0x40	# MULB3 &0x54,%r6,%r0
	CMPW &0xca5e600d,0x2000a84(%r0)
	BEB l1f68
	MOVB %r6,{uword}%r0
	LLSW3 &0x17,%r0,%r0
	ORW2 &0x20002,%r0
	PUSHW %r0
	CALL -4(%sp),$0x61c0
	MOVB &0x1,$0x44013
	#NOP
	MOVW &0xfeedbeef,*$0x48c
	#NOP
	JMP $0x20a9
l1f68:
	ADDB3 &0x1,%r6,%r0
	ORB2 %r0,$0x2000860
	#NOP
	CLRW %r3
	.byte	0xeb, 0x6f, 0x54, 0x46, 0x40	# MULB3 &0x54,%r6,%r0
	.byte	0xeb, 0x6f, 0x54, 0x47, 0x41	# MULB3 &0x54,%r7,%r0
	CMPW 0x2000aa4(%r1),0x2000aa4(%r0)
	BLEUB l1fc0
	ANDB2 &0xf0,$0x2000a75
	#NOP
	.byte	0xeb, 0x6f, 0x54, 0x46, 0x40	# MULB3 &0x54,%r6,%r0
	LRSW3 &0x8,0x2000aa4(%r0),%r0
	ORB2 %r0,$0x2000a75
	#NOP
	.byte	0xeb, 0x6f, 0x54, 0x46, 0x40	# MULB3 &0x54,%r6,%r0
	MOVB 0x2000aa7(%r0),$0x2000a76
	#NOP
	MOVW &0x1,%r3
l1fc0:
	.byte	0xeb, 0x6f, 0x54, 0x46, 0x40	# MULB3 &0x54,%r6,%r0
	.byte	0xeb, 0x6f, 0x54, 0x47, 0x41	# MULB3 &0x54,%r7,%r0
	CMPW 0x2000a9c(%r1),0x2000a9c(%r0)
	BLEUB l1fef
	.byte	0xeb, 0x6f, 0x54, 0x46, 0x40	# MULB3 &0x54,%r6,%r0
	SUBB3 &0x1,0x2000a9f(%r0),%r0
	MOVB %r0,$0x2000a77
	#NOP
	MOVW &0x1,%r3
l1fef:
	.byte	0xeb, 0x6f, 0x54, 0x46, 0x40	# MULB3 &0x54,%r6,%r0
	.byte	0xeb, 0x6f, 0x54, 0x47, 0x41	# MULB3 &0x54,%r7,%r0
	CMPW 0x2000aa0(%r1),0x2000aa0(%r0)
	BLEUB l201e
	.byte	0xeb, 0x6f, 0x54, 0x46, 0x40	# MULB3 &0x54,%r6,%r0
	SUBB3 &0x1,0x2000aa3(%r0),%r0
	MOVB %r0,$0x2000a78
	#NOP
	MOVW &0x1,%r3
l201e:
	.byte	0xeb, 0x6f, 0x54, 0x46, 0x40	# MULB3 &0x54,%r6,%r0
	.byte	0xeb, 0x6f, 0x54, 0x47, 0x41	# MULB3 &0x54,%r7,%r0
	CMPW 0x2000a98(%r1),0x2000a98(%r0)
	BLEUB l2062
	.byte	0xeb, 0x6f, 0x54, 0x46, 0x40	# MULB3 &0x54,%r6,%r0
	LRSW3 &0x9,0x2000a98(%r0),%r0
	MOVB %r0,$0x2000a7a
	#NOP
	.byte	0xeb, 0x6f, 0x54, 0x46, 0x40	# MULB3 &0x54,%r6,%r0
	LRSW3 &0x1,0x2000a98(%r0),%r0
	MOVB %r0,$0x2000a7b
	#NOP
	MOVW &0x1,%r3
l2062:
	TSTW %r3
	BEB l20a9
	MOVB %r6,{uword}%r0
	PUSHW %r0
	CALL -4(%sp),$0x732c
	TSTW %r0
	BNEB l20a9
	TSTB %r5
	BEB l20a9
	MOVB %r6,{uword}%r0
	LLSW3 &0x17,%r0,%r0
	ORW2 &0x40002,%r0
	PUSHW %r0
	CALL -4(%sp),$0x61c0
	MOVB &0x1,$0x44013
	#NOP
	MOVW &0xfeedbeef,*$0x48c
	#NOP
l20a9:
	CALL (%sp),$0x5de0
	CMPB &0x2,$0x2000860
	BLEB l20c9
	MOVB $0x2000860,{uhalf}%r0
	SUBH2 &0x1,%r0
	MOVH %r0,%r4
	BRB l20d4
l20c9:
	MOVB $0x2000860,{uhalf}%r0
	MOVH %r0,%r4
l20d4:
	ADDW3 &0x4,$0x490,%r0
	MOVH {uhalf}%r4,{uword}%r1
	INCW %r1
	INSFW &0x3,&0x0,%r1,(%r0)
	#NOP
	ADDW3 &0x8,$0x490,%r0
	MOVW *$0x4e8,(%r0)
	#NOP
	ADDW3 &0x4,$0x490,%r0
	EXTFW &0x3,&0x0,(%r0),%r0
	MULW2 &0xc,%r0
	ADDW2 %r0,*$0x4e8
	#NOP
	ADDW3 &0x8,$0x490,%r0
	MOVH &0x1,*0(%r0)
	#NOP
	ADDW3 &0x8,$0x490,%r0
	ADDW3 &0x2,(%r0),%r0
	PUSHW %r0
	.byte	0xa0, 0x4f, 0xd1, 0x05, 0x00, 0x00	# PUSHW &0x5d1
	CALL -8(%sp),$0x7fb0
	BITB $0x2000860,&0x1
	BEB l2164
	CMPW &0xca5e600d,$0x2000a84
	BNEB l2164
	ADDW3 &0x8,$0x490,%r0
	MOVW (%r0),%r0
	MOVH $0x2000a82,12(%r0)
	#NOP
l2164:
	BITB $0x2000860,&0x2
	BEB l218e
	CMPW &0xca5e600d,$0x2000ad8
	BNEB l218e
	ADDW3 &0x8,$0x490,%r0
	MOVW (%r0),%r0
	MOVH $0x2000ad6,24(%r0)
	#NOP
l218e:
	JMP $0x65f0
	MOVAW (%fp),%sp
	POPW %r8
	POPW %r7
	POPW %r6
	POPW %r5
	POPW %r4
	POPW %r3
	POPW %fp
	RET
	NOP
	NOP

	SAVE %r5
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
## Jump point from 0x191d
	.byte	0x84, 0x4f, 0x28, 0x0b, 0x00, 0x02, 0x48	# MOVW &0x2000b28,%r8
	.byte	0x84, 0x4f, 0xe4, 0x05, 0x00, 0x00, 0x47	#MOVW &0x5e4,%r7
	CLRW %r5
	BRB l21d3
l21c3:
	MOVW %r8,%r0
	INCW %r8
	MOVW %r7,%r1
	INCW %r7
	MOVB (%r1),(%r0)
	#NOP
	INCW %r5
l21d3:
	CMPW &0x44,%r5
	BLUB l21c3

### Stick initial PSW 0x81e180 into PCB at 0x2000b78
	.byte	0x84, 0x4f, 0x80, 0xe1, 0x81, 0x00, 0x7f, 0x78, 0x0b, 0x00, 0x02	# MOVW &0x81e180,$0x2000b78
	NOP
### Stick PC 0x41f8 into PCB at 0x2000b78
	.byte	0x84, 0x4f, 0xf8, 0x41, 0x00, 0x00, 0x7f, 0x7c, 0x0b, 0x00, 0x02	# MOVW &0x41f8,$0x2000b7c
	NOP
	.byte	0x84, 0x4f, 0xe8, 0x0e, 0x00, 0x02, 0x7f, 0x80, 0x0b, 0x00, 0x02	# MOVW &0x2000ee8,$0x2000b80
	NOP
	.byte	0x84, 0x4f, 0xe8, 0x0e, 0x00, 0x02, 0x7f, 0x90, 0x0b, 0x00, 0x02	# MOVW &0x2000ee8,$0x2000b90
	NOP
	.byte	0x84, 0x4f, 0xe8, 0x10, 0x00, 0x02, 0x7f, 0x94, 0x0b, 0x00, 0x02	# MOVW &0x20010e8,$0x2000b94
	NOP
	CLRW $0x2000bc4
	#NOP
	CLRW %r5

### GOTO 2258
	BRB l2258

### Each time through this loop, we're incrementing the PCBP by 50, to
### point at the next PCBP.
###    Loop 0: r5 = 0
###    Loop 1: r5 = 1
###    Loop 2: r5 = 2, etc...
###
### %r0 accumulates the new PCBP, which we stuff into R6.

l2220:
	.byte	0xe8, 0x6f, 0x50, 0x45, 0x40	# MULW3 &0x50,%r5,%r0
	ADDW2 &0x2000bc8,%r0
	MOVW %r0,%r6
	MOVW &0x81e180,(%r6)
	#NOP
	MOVW &0x20010e8,8(%r6)
	#NOP
	MOVW &0x20010e8,24(%r6)
	#NOP
	MOVW &0x20011e8,28(%r6)
	#NOP
	CLRW 76(%r6)
	#NOP
	INCW %r5

### If R5 < 9, GOTO 2220
l2258:
	CMPW &0x9,%r5
	BLB l2220

### After the loop, PCBPs look like this:
###
###     PSW = 0x81e180
###     PC = Undefined (filled out below)
###     Stack Pointer = 0x20010e8
###     Stack Lower Bound = 0x200010e8
###     Stack Upper Bound = 0x200011e8
###


### Now, fill the Interrupt PCB Program Counters
###
### Each interrupt vector in the ROM interrupt vectors table (located at
### 0x090 through 0x108) points to a PCB in RAM, consisting of
### at least a PSW/PC/SP "initial context". This set of MOVs appears
### to fill the PCB PC's
###

### PCBP = 0x2000bc8. Handler = 0x40a0
	.byte	0x84, 0x4f, 0xa0, 0x40, 0x00, 0x00, 0x7f, 0xcc, 0x0b, 0x00, 0x02	# MOVW &0x40a0,$0x2000bcc
	NOP

### PCBP = 0x2000c18. Handler = 0x40c6
	.byte	0x84, 0x4f, 0xc6, 0x40, 0x00, 0x00, 0x7f, 0x1c, 0x0c, 0x00, 0x02	# MOVW &0x40c6,$0x2000c1c
	NOP

### PCBP = 0x2000c68. Handler = 0x40ec
	.byte	0x84, 0x4f, 0xec, 0x40, 0x00, 0x00, 0x7f, 0x6c, 0x0c, 0x00, 0x02	# MOVW &0x40ec,$0x2000c6c
	NOP

### PCBP = 0x2000cb8. Handler = 0x4112
	.byte	0x84, 0x4f, 0x12, 0x41, 0x00, 0x00, 0x7f, 0xbc, 0x0c, 0x00, 0x02	# MOVW &0x4112,$0x2000cbc
	NOP

### PCBP = 0x2000d08. Handler = 0x4138
	.byte	0x84, 0x4f, 0x38, 0x41, 0x00, 0x00, 0x7f, 0x0c, 0x0d, 0x00, 0x02	# MOVW &0x4138,$0x2000d0c
	NOP

### PCBP = 0x2000d58. Handler = 0x415e
	.byte	0x84, 0x4f, 0x5e, 0x41, 0x00, 0x00, 0x7f, 0x5c, 0x0d, 0x00, 0x02	# MOVW &0x415e,$0x2000d5c
	NOP

### PCBP = 0x2000da8. Handler = 0x4184
	.byte	0x84, 0x4f, 0x84, 0x41, 0x00, 0x00, 0x7f, 0xac, 0x0d, 0x00, 0x02	# MOVW &0x4184,$0x2000dac
	NOP

### PCBP = 0x2000df8. Handler = 0x41aa
### (n.b.: This PCBP doesn't seem to appear in the vector table. Mysterious!)
	.byte	0x84, 0x4f, 0xaa, 0x41, 0x00, 0x00, 0x7f, 0xfc, 0x0d, 0x00, 0x02	# MOVW &0x41aa,$0x2000dfc
	NOP

### PCBP = 0x2000e48. Handler = 0x41d0
	.byte	0x84, 0x4f, 0xd0, 0x41, 0x00, 0x00, 0x7f, 0x4c, 0x0e, 0x00, 0x02	# MOVW &0x41d0,$0x2000e4c
	NOP

### PCBP = 0x2000e90. PSW = 0x81e180.
### (n.b.: This PCBP doesn't seem to appear in the vector table, either.)
	.byte	0x84, 0x4f, 0x80, 0xe1, 0x81, 0x00, 0x7f, 0x98, 0x0e, 0x00, 0x02	# MOVW &0x81e180,$0x2000e98
	NOP


	.byte	0x84, 0x4f, 0x8e, 0x42, 0x00, 0x00, 0x7f, 0x9c, 0x0e, 0x00, 0x02	# MOVW &0x428e,$0x2000e9c
	NOP
	.byte	0x84, 0x4f, 0xe8, 0x0e, 0x00, 0x02, 0x7f, 0xa0, 0x0e, 0x00, 0x02	# MOVW &0x2000ee8,$0x2000ea0
	NOP
	.byte	0x84, 0x4f, 0xe8, 0x0e, 0x00, 0x02, 0x7f, 0xb0, 0x0e, 0x00, 0x02	# MOVW &0x2000ee8,$0x2000eb0
	NOP
	.byte	0x84, 0x4f, 0xe8, 0x10, 0x00, 0x02, 0x7f, 0xb4, 0x0e, 0x00, 0x02	# MOVW &0x20010e8,$0x2000eb4
	NOP
	CLRW $0x2000ee4
	#NOP
	MOVAW $0x2000b28,%pcbp
	JMP $0x2331
	MOVAW -8(%fp),%sp
	POPW %r8
	POPW %r7
	POPW %r6
	POPW %r5
	POPW %fp
	RET


## Who jumps here?
	SAVE %fp
	.byte	0x9c, 0x4f, 0x08, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x8,%sp

## Jumped to from $0x2313
	MOVW &0x49000,$0x20011e8
	#NOP
	CALL (%sp),$0x3b90
	CALL (%sp),0x37c(%pc)
	MOVB %r0,(%fp)
	#NOP
	.byte	0x2b, 0x59	# TSTB (%fp) # as adding NOP
	BNEB l2359
## If the contents of the address pointed to by %fp are == 0,
## jump to a failure point.
	.byte	0x24, 0x7f, 0x3e, 0x19, 0x00, 0x00	# JMP $0x193e # as adding NOP
	BRB l2364
l2359:
	CMPB &0x2,(%fp)

	BNEB l2364
	JMP $0x12d5

## Set the fatal "EXECUTION HALTED" bit in 2000085C
l2364:
	ORW2 &0x80000000,$0x200085c
	#NOP
	CALL (%sp),$0x5de0
	CALL (%sp),$0x297c
	MOVW %r0,*$0x4e4
	#NOP
	MOVW &0x2001514,*$0x4e8
	#NOP
	ADDW2 &0x20,*$0x4e8
	#NOP
	MOVB &0x0,{uword}%r0
	INSFW &0x3,&0xc,%r0,*$0x490
	#NOP
	MOVB &0x1,{uword}%r0
	INSFW &0xf,&0x10,%r0,*$0x490
	#NOP
	ADDW3 &0x4,$0x490,%r0
	MOVB &0x1,{uword}%r1
	INSFW &0x0,&0x5,%r1,(%r0)
	#NOP
	ADDW3 &0x4,$0x490,%r0
	MOVB &0x1,{uword}%r1
	INSFW &0x0,&0x6,%r1,(%r0)
	#NOP
	ADDW3 &0xc,$0x490,%r0
	PUSHW %r0
	PUSHW &l628	# "SBD"
	CALL -8(%sp),$0x7fb0
	ADDW3 &0x4,$0x490,%r0
	MOVB &0x1,{uword}%r1
	INSFW &0x0,&0x7,%r1,(%r0)
	#NOP
	ADDW3 &0x4,$0x490,%r0
	MOVB &0x1,{uword}%r1
	INSFW &0x0,&0x9,%r1,(%r0)
	#NOP
	.byte	0x84, 0x4f, 0xa4, 0x65, 0x00, 0x00, 0xef, 0x98, 0x04, 0x00, 0x00	# MOVW &0x65a4,*$0x498
	NOP
	.byte	0x84, 0x4f, 0xa4, 0x65, 0x00, 0x00, 0xef, 0x0c, 0x05, 0x00, 0x00	# MOVW &0x65a4,*$0x50c
	NOP
	CALL (%sp),$0x5f72
	MOVB &0x1,$0x4401f
	#NOP
	MOVB &0x1,*$0x4e0
	#NOP
	CLRB $0x20011f1
	#NOP
	.byte	0x84, 0x4f, 0xe0, 0x25, 0x00, 0x00, 0xef, 0x98, 0x04, 0x00, 0x00	# MOVW &0x25e0,*$0x498
	NOP
	.byte	0x84, 0x4f, 0xe0, 0x25, 0x00, 0x00, 0xef, 0x0c, 0x05, 0x00, 0x00	# MOVW &0x25e0,*$0x50c
	NOP
	CALL (%sp),*$0x4c0
	JMP $0x253a
l2471:
	MOVB $0x20011f1,{uword}%r0
	LLSW3 &0x15,%r0,%r0
	CLRB 5(%r0)
	#NOP
	PUSHW &0x14
	CALL -4(%sp),*$0x528 # DUART Delay
	MOVB *$0x4e0,{uword}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	MOVB $0x20011f1,{uword}%r1
	LLSW3 &0x15,%r1,%r1
	MOVB 1(%r1),{uword}%r2
	INSFW &0xf,&0x10,%r2,(%r0)
	#NOP
	ADDW2 &0x20,*$0x4e8
	#NOP
	MOVB *$0x4e0,%r0
	INCB *$0x4e0
	#NOP
	MOVB %r0,{uword}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	MOVB $0x20011f1,{uword}%r1
	INSFW &0x3,&0xc,%r1,(%r0)
	#NOP
	MOVB $0x20011f1,{uword}%r0
	LLSW3 &0x15,%r0,%r0
	MOVB (%r0),{uhalf}%r0
	MOVH %r0,2(%fp)
	#NOP
	DECB *$0x4e0
	#NOP
	MOVB *$0x4e0,{uword}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	MOVW %r0,4(%fp)
	#NOP
	EXTFW &0xf,&0x10,*4(%fp),%r0
	MOVH {uhalf}2(%fp),{uword}%r1
	LLSW3 &0x8,%r1,%r1
	ORW2 %r1,%r0
	INSFW &0xf,&0x10,%r0,*4(%fp)
	#NOP
	INCB *$0x4e0
	#NOP
	INCB $0x20011f1
	#NOP
	CMPB &0xc,$0x20011f1
	BLEH l2471
	.byte	0x84, 0x4f, 0xa4, 0x65, 0x00, 0x00, 0xef, 0x98, 0x04, 0x00, 0x00	# MOVW &0x65a4,*$0x498
	NOP
	.byte	0x84, 0x4f, 0xa4, 0x65, 0x00, 0x00, 0xef, 0x0c, 0x05, 0x00, 0x00	# MOVW &0x65a4,*$0x50c
	NOP
	ADDW3 &0x2,$0x4a4,%r0
	.byte	0x2b, 0x50	# TSTB (%r0) # as adds NOP
	BEB l2595
	CALL (%sp),$0x5f72
	CALL (%sp),$0x6378
	CMPW &0x1,%r0
	BNEB l2595
	ORW2 &0x80000000,$0x200085c
	#NOP
	CALL (%sp),$0x5de0
l2595:
	CMPW &0xfeedbeef,$0x2000864
	BEB l25cc
	CMPW &0x8badf00d,$0x2000864
	BEB l25cc
	CMPW &0xadebac1e,$0x2000864
	BEB l25cc
	CALL (%sp),0x80(%pc)
	TSTW %r0
	BNEB l25cc
	CALL (%sp),$0x5de0
l25cc:
	CALL (%sp),$0x5f72
	JMP $0x1a01
	MOVAW -24(%fp),%sp
	POPW %fp
	RET

################################################################################
## Routine that sets the "Self-config failure" flag in 0x200085C
##
l25e0:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	.byte	0x86, 0xe2, 0x7f, 0x02, 0x40, 0x04, 0x00, 0xe0, 0x40	# MOVH {uhalf}$0x44002,{uword}%r0
	BITW %r0,&0x8000
	BEB l2605
	MOVB &0x1,$0x44027
	#NOP
	BRB l2635
l2605:
	MOVW &0xfeedbeef,*$0x48c
	#NOP
	CALL (%sp),$0x5f72
	MOVB &0x1,$0x4401f
	#NOP
## This appears to set a flag meaning "Self-config failure" in the
## failure flags.
	ORW2 &0x1,$0x200085c
	#NOP
	CALL (%sp),$0x5de0
	JMP $0x65f0
l2635:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET


	SAVE %r7
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	MOVW &0x2004000,%r8
	MOVW &0x2040000,%r7
	BRB l268e
l2655:
	MOVB &0xff,(%r8)
	#NOP
	CMPB &0xff,(%r8)
	BEB l2664
	BRB l2693
l2664:
	MOVB &0xaa,(%r8)
	#NOP
	CMPB &0xaa,(%r8)
	BEB l2673
	BRB l2693
l2673:
	MOVB &0x55,(%r8)
	#NOP
	CMPB &0x55,(%r8)
	BEB l2680
	BRB l2693
l2680:
	CLRB (%r8)
	#NOP
	MOVW %r8,%r0
	INCW %r8
	.byte	0x2b, 0x50	# TSTB (%r0) # as adds NOP
	BEB l268e
	BRB l2693
l268e:
	CMPW %r7,%r8
	BLUB l2655
l2693:
	CMPW %r7,%r8
	BGEUB l26b0
	ORW2 &0x8,$0x200085c
	#NOP
	MOVW &0xfeedbeef,$0x2000864
	#NOP
	CLRW %r0
	BRB l26b5
l26b0:
	MOVW &0x1,%r0
	BRB l26b5
l26b5:
	MOVAW -16(%fp),%sp
	POPW %r8
	POPW %r7
	POPW %fp
	RET

################################################################################
## These look like UART tests, specifically testing the Tx/Rx buffer
##
	SAVE %fp
	.byte	0x9c, 0x4f, 0x04, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x4,%sp

## Set up the UART for our test. These three commands are as follows:
## 0x20 = Reset Receiver (Disable receiver, flush FIFO)
## 0x30 = Start Break (Forces TxDA output low)
## 0x10 = Reset MR pointer. Causes channel A MR pointer to point to
##        channel 1.

	MOVB &0x20,$0x49002
	#NOP
	MOVB &0x30,$0x49002
	#NOP
	MOVB &0x10,$0x49002
	#NOP

## Now set bit 4 of the MRA (no parity)
	MOVB $0x49000,{uhalf}%r0
	MOVH %r0,(%fp)
	#NOP
	ORB2 &0x80,$0x49000
	#NOP

## Now reset chanel a break change interrupt.
	MOVB &0x5,$0x49002
	#NOP

## Run the UART delay clock for 14 clock cycles
	PUSHW &0x14
	CALL -4(%sp),*$0x528 # DUART Delay

## Write 0x55 into the UART's buffer.
	MOVB &0x55,$0x49003
	#NOP

## Run the UART delay clock for 14 clock cycles
	PUSHW &0x14
	CALL -4(%sp),*$0x528 # DUART Delay

## Check to see if UART status bit RxRDY is set. If it is, go to next
## check. If not, return.
	BITB $0x49001,&0x1
	BNEB l272d
	CLRW %r0
	JMP $0x2973

## Check if 0x55 is in the UART's buffer. If it is, go to next check.
## If not, return.
l272d:
	CMPB &0x55,$0x49003
	BEB l273f
	CLRW %r0
	JMP $0x2973

## Check to see if UART status bit RxRDY is set. If it is, go to next
## check. If not, return.
l273f:
	BITB $0x49001,&0x1
	BEB l2750
	CLRW %r0

## Write 0xAA to the TX buffer
	JMP $0x2973

l2750:
	MOVB &0xaa,$0x49003
	#NOP

## Call UART delay for 14 clock cycles
	PUSHW &0x14
	CALL -4(%sp),*$0x528 # DUART Delay

## Check to see if RxRDY is set again
	BITB $0x49001,&0x1
	BNEB l2775
	CLRW %r0
	JMP $0x2973
l2775:
	CMPB &0xaa,$0x49003
	BEB l2788
	CLRW %r0
	JMP $0x2973
l2788:
	MOVB &0x20,$0x49002
	#NOP
	MOVB &0x30,$0x49002
	#NOP
	MOVB &0x10,$0x49002
	#NOP
	MOVB $0x49000,{uhalf}%r0
	MOVH %r0,(%fp)
	#NOP
	ANDB2 &0x7f,$0x49000
	#NOP
	MOVB &0x5,$0x49002
	#NOP
	PUSHW &0x14
	CALL -4(%sp),*$0x528 # DUART Delay
	MOVB &0x20,$0x4900a
	#NOP
	MOVB &0x30,$0x4900a
	#NOP
	MOVB &0x10,$0x4900a
	#NOP
	MOVB $0x49008,{uhalf}%r0
	MOVH %r0,(%fp)
	#NOP
	ORB2 &0x80,$0x49008
	#NOP
	MOVB &0x5,$0x4900a
	#NOP
	PUSHW &0x14
	CALL -4(%sp),*$0x528 # DUART Delay
	MOVB &0x55,$0x4900b
	#NOP

	PUSHW &0x14
	CALL -4(%sp),*$0x528 # DUART Delay
	BITB $0x49009,&0x1
	BNEB l282b
	CLRW %r0
	JMP $0x2973

l282b:
	CMPB &0x55,$0x4900b
	BEB l283d
	CLRW %r0
	JMP $0x2973

l283d:
	BITB $0x49009,&0x1
	BEB l284e
	CLRW %r0
	JMP $0x2973

l284e:
	MOVB &0xaa,$0x4900b
	#NOP
	PUSHW &0x14
	CALL -4(%sp),*$0x528 # DUART Delay
	BITB $0x49009,&0x1
	BNEB l2873
	CLRW %r0
	JMP $0x2973
l2873:
	CMPB &0xaa,$0x4900b
	BEB l2886
	CLRW %r0
	JMP $0x2973
l2886:
	MOVB &0x20,$0x4900a
	#NOP
	MOVB &0x30,$0x4900a
	#NOP
	MOVB &0x10,$0x4900a
	#NOP
	MOVB $0x49008,{uword}%r0
	LLSW3 &0x8,%r0,%r0
	MOVH {uhalf}%r0,{uword}%r0
	MOVB $0x49008,{uword}%r1
	MOVW &0xff7f,%r2
	MOVH {uhalf}%r2,{uword}%r2
	ANDW2 %r2,%r1
	MOVH {uhalf}%r1,{uword}%r1
	ORW2 %r1,%r0
	MOVH %r0,(%fp)
	#NOP
	MOVB &0x10,$0x49002
	#NOP
	MOVB &0x10,$0x4900a
	#NOP
	MOVB $0x49000,$0x49008
	#NOP
	MOVB $0x49000,$0x49008
	#NOP
	MOVB &0x5,$0x4900a
	#NOP
	PUSHW &0x14
	CALL -4(%sp),*$0x528 # DUART Delay
	MOVB &0x20,$0x49003
	#NOP
	PUSHW &0x14
	CALL -4(%sp),*$0x528 # DUART Delay
	BITB $0x49009,&0x1
	BEB l2935
	CMPB &0x20,$0x4900b
	BNEB l2935
	MOVW &0x2,%r0
	BRB l2973
l2935:
	MOVB &0x20,$0x4900a
	#NOP
	MOVB &0x30,$0x4900a
	#NOP
	MOVB &0x10,$0x4900a
	#NOP
	MOVH {uhalf}(%fp),{uword}%r0
	LRSW3 &0x8,%r0,%r0
	MOVB %r0,$0x49008
	#NOP
	MOVB 1(%fp),$0x49008
	#NOP
	MOVB &0x5,$0x4900a
	#NOP
	MOVW &0x1,%r0
	BRB l2973

l2973:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP

################################################################################
## Unknown procedure
##
	SAVE %r5
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	.byte	0x84, 0x4f, 0xc4, 0x2a, 0x00, 0x00, 0x7f, 0xf4, 0x11, 0x00, 0x02	# MOVW &0x2ac4,$0x20011f4
	NOP
	.byte	0x84, 0x4f, 0xdc, 0x2a, 0x00, 0x00, 0x7f, 0xf8, 0x11, 0x00, 0x02	# MOVW &0x2adc,$0x20011f8
	NOP
	CLRB *$0x4c4
	#NOP
	CLRB $0x20011f2
	#NOP
	CLRW %r6
	BITB $0x4c003,&0x1
	BEB l29c2
	MOVW &0x100000,%r8
	MOVW %r8,%r0
	BRB l29cc
l29c2:
	MOVW &0x40000,%r8
	MOVW %r8,%r0
l29cc:
	BITB $0x4c003,&0x2
	BEB l29d9
	LLSW3 &0x1,%r8,%r8
l29d9:
	CALL (%sp),*$0x4c0
	.byte	0x2b, 0x7f, 0xf2, 0x11, 0x00, 0x02	# TSTB $0x20011f2 # as adds NOP
	BEB l29ee
	JMP $0x2a97
l29ee:
	CMPW &0x3b02f1d0,$0x200086c
	BNEB l2a02
	MOVW 0x2000000(%r8),%r7
l2a02:
	MOVW &0xfeedbeef,0x2000000(%r8)
	#NOP
	CMPW &0xfeedbeef,0x2000000(%r8)
	BNEB l2a1e
	MOVW &0x1,%r6
l2a1e:
	MOVW %r7,0x2000000(%r8)
	#NOP
	TSTW %r6
	BEB l2a97
	.byte	0x3c, 0x4f, 0x00, 0x00, 0x20, 0x00, 0x48	# CMPW &0x200000,%r8
	BNEB l2a97
	.byte	0xe8, 0x03, 0x48, 0x40	# MULW3 &0x3,%r8,%r0
	DIVW2 &0x4,%r0
	#NOP
	MOVW %r0,%r8
	LLSW3 &0x1,%r8,%r0
	MOVW %r0,%r5
	CLRB $0x20011f2
	#NOP
	CALL (%sp),*$0x4c0
	.byte	0x2b, 0x7f, 0xf2, 0x11, 0x00, 0x02	# TSTB $0x20011f2
	BNEB l2a97
	CMPW &0x3b02f1d0,$0x200086c
	BNEB l2a6f
	MOVW 0x2000000(%r5),%r7
l2a6f:
	MOVW &0xfeedbeef,0x2000000(%r5)
	#NOP
	CMPW &0xfeedbeef,0x2000000(%r5)
	BNEB l2a8f
	MOVW &0x200000,%r8
l2a8f:
	MOVW %r7,0x2000000(%r5)
	#NOP
l2a97:
	.byte	0x84, 0x4f, 0xa4, 0x65, 0x00, 0x00, 0x7f, 0xf4, 0x11, 0x00, 0x02	# MOVW &0x65a4,$0x20011f4
	NOP
	.byte	0x84, 0x4f, 0x04, 0x65, 0x00, 0x00, 0x7f, 0xf8, 0x11, 0x00, 0x02	# MOVW &0x6504,$0x20011f8
	NOP
	LLSW3 %r6,%r8,%r0
	BRB l2ab5
l2ab5:
	MOVAW -8(%fp),%sp
	POPW %r8
	POPW %r7
	POPW %r6
	POPW %r5
	POPW %fp
	RET


l2ac4:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	MOVB &0x1,$0x20011f2
	#NOP
	MOVAW -24(%fp),%sp
	POPW %fp
	RET


l2adc:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	MOVW &0x81e100,12(%pcbp)
	#NOP
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP
	NOP

################################################################################
## Exception Return Point Routine (excret)
##
l2af8:
	MOVW -8(%sp),$0x20011fc
	#NOP
	RET
	NOP
	NOP

################################################################################
## Unknown Routine
##
l2b04:
	SAVE %fp
	.byte	0x9c, 0x4f, 0xb8, 0x01, 0x00, 0x00, 0x4c	# ADDW2 &0x1b8,%sp
l2b0d:
	PUSHW &0x4300d
	PUSHAW (%fp)
	PUSHW &0x2d
	CALL -12(%sp),$0x5224

## printf ("\nEnter name of program to execute [ %s ]: ")
	PUSHW &l62c
	PUSHAW (%fp)
	CALL -8(%sp),printf

	PUSHW &0x0
	CALL -4(%sp),*$0x540
	ADDW3 &0x2,$0x4a0,%r0
	PUSHW %r0
	CALL -4(%sp),$0x4360
	CMPW &-1,%r0
	BNEB l2b6e
	PUSHW &0x1
	CALL -4(%sp),*$0x540

## printf ("\n")
	PUSHW &l657
	CALL -4(%sp),printf
	JMP $0x3aab
l2b6e:
	PUSHW &0x1
	CALL -4(%sp),*$0x540
	ADDW3 &0x2,$0x4a0,%r0
	PUSHW %r0
	PUSHW &l659
	CALL -8(%sp),$0x7f68
	TSTW %r0
	BEB l2b9a
	JMP $0x2c6b


l2b9a:
## printf ("\nenter old password: ")
	PUSHW &l660
	CALL -4(%sp),printf

	PUSHAW 80(%fp)
	CALL -4(%sp),0xf09(%pc)
	TSTW %r0
	BNEB l2bba
	CALL (%sp),0xf59(%pc)
l2bba:
	PUSHW &0x43000
	PUSHAW 90(%fp)
	PUSHW &0x9
	CALL -12(%sp),$0x5224
	PUSHAW 80(%fp)
	PUSHAW 90(%fp)
	CALL -8(%sp),$0x7f68
	TSTW %r0
	BEB l2be4
	CALL (%sp),0xf2f(%pc)

l2be4:
## printf ("\nenter new password: ")
	PUSHW &l676
	CALL -4(%sp),printf

	PUSHAW (%fp)
	CALL -4(%sp),0xec0(%pc)
	TSTW %r0
	BNEB l2c03
	CALL (%sp),0xf10(%pc)

l2c03:
## printf ("\nconfirmation: ")
	PUSHW &l68c
	CALL -4(%sp),printf

	PUSHAW 80(%fp)
	CALL -4(%sp),0xea0(%pc)
	TSTW %r0
	BNEB l2c23
	CALL (%sp),0xef0(%pc)
l2c23:
	PUSHAW 80(%fp)
	PUSHAW (%fp)
	CALL -8(%sp),$0x7f68
	TSTW %r0
	BEB l2c39
	CALL (%sp),0xeda(%pc)

l2c39:
## printf ("\n")
	PUSHW &l69c
	CALL -4(%sp),printf

	PUSHAW (%fp)
	PUSHW &0x43000
	PUSHAW (%fp)
	CALL -4(%sp),$0x7f98
	INCW %r0
	PUSHW %r0
	CALL -12(%sp),$0x52a0
	JMP $0x3aa8
	ADDW3 &0x2,$0x4a0,%r0
	PUSHW %r0
	PUSHW &l69e	# "newkey"
	CALL -8(%sp),$0x7f68
	TSTW %r0
	BEB l2c8d
	JMP $0x2d52

l2c8d:
## printf ("\nCreating a floppy key to enable clearing of saved NVRAM information.\n\n")
	PUSHW &l6a5
	CALL -4(%sp),printf

	CLRB (%fp)
	#NOP
	BRB l2cc4

l2ca0:
## printf ("Insert a formatted floppy, then type 'go' (q to quit): ")
	PUSHW &l6ef
	CALL -4(%sp),printf

	PUSHAW (%fp)
	CALL -4(%sp),$0x4360
	CMPB &0x71,(%fp)
	BNEB l2cc4
	JMP $0x3aab
l2cc4:
	PUSHAW (%fp)
	PUSHW &l6ec	# "go"
	CALL -8(%sp),$0x7f68
	TSTW %r0
	BNEB l2ca0
	ADDW3 &0x3,$0x508,%r0
	MOVB (%r0),90(%fp)
	#NOP
	ADDW3 &0x7,$0x508,%r0
	MOVB (%r0),91(%fp)
	#NOP
	ADDW3 &0xb,$0x508,%r0
	MOVB (%r0),92(%fp)
	#NOP
	ADDW3 &0xf,$0x508,%r0
	MOVB (%r0),93(%fp)
	#NOP
	PUSHW &0x0
	PUSHAW 90(%fp)
	PUSHW &0x1
	PUSHW &0x3
	CALL -16(%sp),$0x7b2c
	TSTW %r0
	BNEB l2d3e
	ORW2 &0x20,$0x200085c
	#NOP
	CALL (%sp),$0x5de0
	PUSHW &0xfeedbeef
	CALL -4(%sp),$0x6322

l2d3e:
## printf ("\nCreation of floppy key complete\n\n")
	PUSHW &l727	
	CALL -4(%sp),printf

	JMP $0x3aa8
	ADDW3 &0x2,$0x4a0,%r0
	PUSHW %r0
	PUSHW &l74a	# "sysdump"
	CALL -8(%sp),$0x7f68
	TSTW %r0
	BNEB l2d89
	CALL (%sp),$0x2004000
	PUSHW &0xfeedbeef
	CALL -4(%sp),$0x6322
	JMP $0x3aa8
l2d89:
	ADDW3 &0x2,$0x4a0,%r0
	PUSHW %r0
	PUSHW &l752	# "version"
	CALL -8(%sp),$0x7f68
	TSTW %r0
	BEB l2dab
	.byte	0x24, 0x7f, 0x38, 0x2e, 0x00, 0x00	# JMP l2e38

l2dab:
## printf ("\nCreated: %s\n", "05/31/85")
	PUSHW &l75a
	PUSHW &l1158	# "05/31/85"
	CALL -8(%sp),printf

## printf ("Issue: %08lx")
	PUSHW &l768
	PUSHW $0x7ff0
	CALL -8(%sp),printf

## printf ("Release: %s\nLoad: %s\n", "1.2.1", "PF3")
	PUSHW &l776
	PUSHW &l1168	# "1.2.1"
	PUSHW &l1164	# "PF3"
	CALL -12(%sp),printf

## printf ("Serial Number: %08lx\n\n")
	PUSHW &l78c	# "Serial Number: %08lx\n\n"

	MOVB $0x7ff3,{uword}%r0
	LLSW3 &0x8,%r0,%r0
	MOVB $0x7ff7,{uword}%r1
	ORW2 %r1,%r0
	LLSW3 &0x8,%r0,%r0
	MOVB $0x7ffb,{uword}%r1
	ORW2 %r1,%r0
	LLSW3 &0x8,%r0,%r0
	MOVB $0x7fff,{uword}%r1
	ORW2 %r1,%r0
	PUSHW %r0

	CALL -8(%sp),printf




	JMP $0x3aa8
l2e38:
	ADDW3 &0x2,$0x4a0,%r0
	PUSHW %r0
	PUSHW &l7a3	# "q"
	CALL -8(%sp),$0x7f68
	TSTW %r0
	BNEB l2e5a
	JMP $0x3aab
l2e5a:
	ADDW3 &0x2,$0x4a0,%r0
	PUSHW %r0
	PUSHW &l7a5	# "edt"
	CALL -8(%sp),$0x7f68
	TSTW %r0
	BNEB l2e83
	CALL (%sp),$0x4e14
	JMP $0x3aa8
l2e83:
	ADDW3 &0x2,$0x4a0,%r0
	PUSHW %r0
	PUSHW &l7a9	# ""error info"
	CALL -8(%sp),$0x7f68
	TSTW %r0
	BNEB l2eac
	CALL (%sp),$0x5fe6
	JMP $0x3aa8
l2eac:
	ADDW3 &0x2,$0x4a0,%r0
	PUSHW %r0
	PUSHW &l7b4	# "baud"
	CALL -8(%sp),$0x7f68
	TSTW %r0
	BNEB l2ed5
	CALL (%sp),$0x3fcc
	JMP $0x3aa8
l2ed5:
	ADDW3 &0x2,$0x4a0,%r0
	PUSHW %r0
	PUSHW &l7b9	# "?"
	CALL -8(%sp),$0x7f68
	TSTW %r0
	BNEB l2f21

## printf "\nEnter an executable or system file, a directory name,\n"
	PUSHW &l7bb
	CALL -4(%sp),printf

## printf ("or one of the possible firmware program names:\n\n"
	PUSHW &l7f3
	CALL -4(%sp),printf

## printf ("baud    edt    newkey    passwd    sysdump    version    q(uit)\n\n")
	PUSHW &l824
	CALL -4(%sp),printf

	JMP $0x3aa8
l2f21:
	ADDW3 &0x2,$0x4a0,%r0
	.byte	0x2b, 0x50	# TSTB (%r0) # as adds NOP
	BNEB l2f41
	ADDW3 &0x2,$0x4a0,%r0
	PUSHW %r0
	PUSHAW (%fp)
	CALL -8(%sp),$0x7fb0
l2f41:
	CLRH 0xb4(%fp)
	#NOP
	BRB l2fa4
l2f48:
	MOVAW 0xb8(%fp),%r0
	MOVH 0xb4(%fp),{word}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	CLRH (%r0)
	#NOP
	MOVAW 0xb8(%fp),%r0
	MOVH 0xb4(%fp),{word}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	CLRH 2(%r0)
	#NOP
	MOVAW 0xb8(%fp),%r0
	MOVH 0xb4(%fp),{word}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	CLRH 4(%r0)
	#NOP
	MOVAW 0xb8(%fp),%r0
	MOVH 0xb4(%fp),{word}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	CLRB 6(%r0)
	#NOP
	INCH 0xb4(%fp)
	#NOP
l2fa4:
	CMPH &0x10,0xb4(%fp)
	BLB l2f48
	CLRB 0xac(%fp)
	#NOP
	MOVAW 0xb8(%fp),%r0
	MOVB 0xac(%fp),{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	ADDW2 &0x6,%r0
	PUSHW %r0
	ADDW3 &0x8,$0x490,%r0
	ADDW3 &0x2,(%r0),%r0
	PUSHW %r0
	CALL -8(%sp),$0x7fb0
	MOVAW 0xb8(%fp),%r0
	MOVB 0xac(%fp),{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	MOVH &0x1,2(%r0)
	#NOP
	MOVAW 0xb8(%fp),%r0
	MOVB 0xac(%fp),%r1
	INCB 0xac(%fp)
	#NOP
	MOVB %r1,{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	CLRH (%r0)
	#NOP
	MOVB $0x2000860,{uword}%r0
	JMP $0x31b5
l301f:
	MOVAW 0xb8(%fp),%r0
	MOVB 0xac(%fp),{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	ADDW2 &0x6,%r0
	PUSHW %r0
	ADDW3 &0x8,$0x490,%r0
	ADDW3 &0xe,(%r0),%r0
	PUSHW %r0
	CALL -8(%sp),$0x7fb0
	MOVAW 0xb8(%fp),%r0
	MOVB 0xac(%fp),{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	MOVH &0x1,2(%r0)
	#NOP
	MOVAW 0xb8(%fp),%r0
	MOVB 0xac(%fp),%r1
	INCB 0xac(%fp)
	#NOP
	MOVB %r1,{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	MOVH &0x1,(%r0)
	#NOP
	JMP $0x31c7
l3087:
	MOVAW 0xb8(%fp),%r0
	MOVB 0xac(%fp),{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	ADDW2 &0x6,%r0
	PUSHW %r0
	ADDW3 &0x8,$0x490,%r0
	ADDW3 &0x1a,(%r0),%r0
	PUSHW %r0
	CALL -8(%sp),$0x7fb0
	MOVAW 0xb8(%fp),%r0
	MOVB 0xac(%fp),{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	MOVH &0x1,2(%r0)
	#NOP
	MOVAW 0xb8(%fp),%r0
	MOVB 0xac(%fp),%r1
	INCB 0xac(%fp)
	#NOP
	MOVB %r1,{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	MOVH &0x2,(%r0)
	#NOP
	JMP $0x31c7
l30ef:
	MOVAW 0xb8(%fp),%r0
	MOVB 0xac(%fp),{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	ADDW2 &0x6,%r0
	PUSHW %r0
	ADDW3 &0x8,$0x490,%r0
	ADDW3 &0xe,(%r0),%r0
	PUSHW %r0
	CALL -8(%sp),$0x7fb0
	MOVAW 0xb8(%fp),%r0
	MOVB 0xac(%fp),{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	MOVH &0x1,2(%r0)
	#NOP
	MOVAW 0xb8(%fp),%r0
	MOVB 0xac(%fp),%r1
	INCB 0xac(%fp)
	#NOP
	MOVB %r1,{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	MOVH &0x1,(%r0)
	#NOP
	MOVAW 0xb8(%fp),%r0
	MOVB 0xac(%fp),{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	ADDW2 &0x6,%r0
	PUSHW %r0
	ADDW3 &0x8,$0x490,%r0
	ADDW3 &0x1a,(%r0),%r0
	PUSHW %r0
	CALL -8(%sp),$0x7fb0
	MOVAW 0xb8(%fp),%r0
	MOVB 0xac(%fp),{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	MOVH &0x1,2(%r0)
	#NOP
	MOVAW 0xb8(%fp),%r0
	MOVB 0xac(%fp),%r1
	INCB 0xac(%fp)
	#NOP
	MOVB %r1,{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	MOVH &0x2,(%r0)
	#NOP
	BRB l31c7
	CMPW %r0,&0x1
	BEH l301f
	CMPW %r0,&0x2
	BEH l3087
	CMPW %r0,&0x3
	BEH l30ef
l31c7:
	MOVH &0x1,0xb4(%fp)
	#NOP
	JMP $0x3339
l31d3:
	MOVH 0xb4(%fp),{word}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	EXTFW &0x0,&0x7,4(%r0),%r0
	CMPW &0x0,%r0
	BNEB l31f5
	JMP $0x3293
l31f5:
	MOVAW 0xb8(%fp),%r0
	MOVB 0xac(%fp),{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	ADDW2 &0x6,%r0
	PUSHW %r0
	MOVH 0xb4(%fp),{word}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	ADDW2 &0xc,%r0
	PUSHW %r0
	CALL -8(%sp),$0x7fb0
	MOVAW 0xb8(%fp),%r0
	MOVB 0xac(%fp),{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	CLRH 2(%r0)
	#NOP
	MOVAW 0xb8(%fp),%r0
	MOVB 0xac(%fp),{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	MOVH 0xb4(%fp),{word}%r1
	LLSW3 &0x5,%r1,%r1
	ADDW2 $0x490,%r1
	EXTFW &0x3,&0xc,(%r1),%r1
	MOVH %r1,4(%r0)
	#NOP
	MOVAW 0xb8(%fp),%r0
	MOVB 0xac(%fp),%r1
	INCB 0xac(%fp)
	#NOP
	MOVB %r1,{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	MOVH 0xb4(%fp),(%r0)
	#NOP
	JMP $0x3334
	MOVH 0xb4(%fp),{word}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	.byte	0x2b, 0xc0, 0x0c	# TSTB 12(%r0)
	BEB l32d1
	MOVH 0xb4(%fp),{word}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	ADDW2 &0xc,%r0
	PUSHW %r0
	.byte	0xa0, 0x4f, 0x66, 0x08, 0x00, 0x00	# PUSHW &l866	# "*VOID*"
	CALL -8(%sp),$0x7f68
	TSTW %r0
	BNEB l3334
l32d1:
	MOVAW 0xb8(%fp),%r0
	MOVB 0xac(%fp),{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	CLRH 2(%r0)
	#NOP
	MOVAW 0xb8(%fp),%r0
	MOVB 0xac(%fp),{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	MOVH 0xb4(%fp),{word}%r1
	LLSW3 &0x5,%r1,%r1
	ADDW2 $0x490,%r1
	EXTFW &0x3,&0xc,(%r1),%r1
	MOVH %r1,4(%r0)
	#NOP
	MOVAW 0xb8(%fp),%r0
	MOVB 0xac(%fp),%r1
	INCB 0xac(%fp)
	#NOP
	MOVB %r1,{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	MOVH 0xb4(%fp),(%r0)
	#NOP
l3334:
	INCH 0xb4(%fp)
	#NOP
	MOVH 0xb4(%fp),{word}%r0
	MOVB *$0x4e0,{uword}%r1
	CMPW %r1,%r0
	BLH l31d3

## printf ("\tPossible load devices are:\n\n")
	PUSHW &l86d
	CALL -4(%sp),printf

## printf ("Option Number    Slot     Name\n")
	PUSHW &l88b
	CALL -4(%sp),printf

## printf ("------------------------------\n")
	PUSHW &l8ab
	CALL -4(%sp),printf

	CLRH 0xb4(%fp)
	#NOP
	JMP $0x3413

l3382:

## printf ("%2d         %2d")
	PUSHW &l8d4
	MOVH 0xb4(%fp),{word}%r0
	PUSHW %r0
	MOVAW 0xb8(%fp),%r0
	MOVH 0xb4(%fp),{word}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	MOVH {uhalf}4(%r0),{uword}%r0
	PUSHW %r0
	CALL -12(%sp),printf

	MOVAW 0xb8(%fp),%r0
	MOVH 0xb4(%fp),{word}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	ADDW2 &0x6,%r0
	PUSHW %r0
	PUSHW &l8ea	# "*VOID*"
	CALL -8(%sp),$0x7f68
	TSTW %r0
	BEB l3400


## printf ("     %10s\n")
	PUSHW &l8f1

	MOVAW 0xb8(%fp),%r0
	MOVH 0xb4(%fp),{word}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	ADDW2 &0x6,%r0
	PUSHW %r0

	CALL -8(%sp),printf


l3400:
## printf ("\n")
	PUSHW &l8fb
	CALL -4(%sp),printf

	INCH 0xb4(%fp)
	#NOP
	MOVH 0xb4(%fp),{word}%r0
	MOVB 0xac(%fp),{uword}%r1
	CMPW %r1,%r0
	BLUH l3382
	PUSHW &0x4300c
	ADDW3 &0x1,$0x4a0,%r0
	PUSHW %r0
	PUSHW &0x1
	CALL -12(%sp),$0x5224
	CLRB 0xaa(%fp)
	#NOP
	CLRH 0xb4(%fp)
	#NOP
	JMP $0x34d5
l344f:
	MOVAW 0xb8(%fp),%r0
	MOVH 0xb4(%fp),{word}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	MOVH {uhalf}2(%r0),{uword}%r0
	BEB l349b
	ADDW3 &0x1,$0x4a0,%r0
	MOVB (%r0),{uword}%r0
	MOVAW 0xb8(%fp),%r1
	MOVH 0xb4(%fp),{word}%r2
	LLSW3 &0x4,%r2,%r2
	ADDW2 %r2,%r1
	MOVH {uhalf}(%r1),{uword}%r1
	CMPW %r1,%r0
	BNEB l3499
	MOVB &0x1,0xaa(%fp)
	#NOP
	BRB l34e7
l3499:
	BRB l34d0
l349b:
	MOVAW 0xb8(%fp),%r0
	MOVH 0xb4(%fp),{word}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	MOVH {uhalf}4(%r0),{uword}%r0
	ADDW3 &0x1,$0x4a0,%r1
	MOVB (%r1),{uword}%r1
	LRSW3 &0x4,%r1,%r1
	CMPW %r1,%r0
	BNEB l34d0
	MOVB &0x1,0xaa(%fp)
	#NOP
	BRB l34e7
l34d0:
	INCH 0xb4(%fp)
	#NOP
	MOVH 0xb4(%fp),{word}%r0
	MOVB 0xac(%fp),{uword}%r1
	CMPW %r1,%r0
	BLUH l344f
l34e7:
	.byte	0x2b, 0xa9, 0xaa, 0x00	# TSTB 0xaa(%fp)
	BNEB l34f4
	CLRB 0xaf(%fp)
	#NOP
	BRB l34fc
l34f4:
	MOVB 0xb5(%fp),0xaf(%fp)
	#NOP
l34fc:

## printf ("\nEnter Load Device Option Number ")
	PUSHW &l8fd
	CALL -4(%sp),printf

## printf ("[%d")
	PUSHW &l91f

	MOVB 0xaf(%fp),{uword}%r0
	PUSHW %r0

	CALL -8(%sp),printf


	MOVAW 0xb8(%fp),%r0
	MOVB 0xaf(%fp),{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	ADDW2 &0x6,%r0
	PUSHW %r0
	PUSHW &l923	# "*VOID*
	CALL -8(%sp),$0x7f68
	TSTW %r0
	BEB l356e

# printf (" (%s)")
	PUSHW &l92a

	MOVAW 0xb8(%fp),%r0
	MOVB 0xaf(%fp),{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	ADDW2 &0x6,%r0
	PUSHW %r0

	CALL -8(%sp),printf


l356e:

## printf ("]: ")
	PUSHW &l930
	CALL -4(%sp),printf

	PUSHW &0x0
	CALL -4(%sp),*$0x540
	PUSHAW 90(%fp)
	CALL -4(%sp),$0x4360
	CMPW &-1,%r0
	BNEB l35b4
	PUSHW &0x1
	CALL -4(%sp),*$0x540

## printf ("\n");
	PUSHW &l934
	CALL -4(%sp),printf

	JMP $0x3aab
l35b4:
	PUSHW &0x1
	CALL -4(%sp),*$0x540
	.byte	0x83, 0xa9, 0xaa, 0x00	# CLRB 0xaa(%fp) # as adds NOP
	NOP
	.byte	0x2b, 0xc9, 0x5a	# TSTB 90(%fp)
	BEB l3625
	CLRH 0xb4(%fp)
	#NOP
	BRB l35f0
l35cf:
	PUSHAW 90(%fp)
	CALL -4(%sp),0x568(%pc)
	MOVH 0xb4(%fp),{word}%r1
	CMPW %r0,%r1
	BNEB l35eb
	MOVB &0x1,0xaa(%fp)
	#NOP
	BRB l3601
l35eb:
	INCH 0xb4(%fp)
	#NOP
l35f0:
	MOVH 0xb4(%fp),{word}%r0
	MOVB 0xac(%fp),{uword}%r1
	CMPW %r1,%r0
	BLUB l35cf
l3601:
	.byte	0x2b, 0xa9, 0xaa, 0x00	# TSTB 0xaa(%fp) # as adds NOP
	BNEB l361b

## printf ("\n%s is not a valid option number.\n")
	PUSHW &l936

	PUSHAW 90(%fp)

	CALL -8(%sp),printf


	BRH l34fc
l361b:
	MOVB 0xb5(%fp),0xae(%fp)
	#NOP
	BRB l362d
l3625:
	MOVB 0xaf(%fp),0xae(%fp)
	#NOP
l362d:
	MOVAW 0xb8(%fp),%r0
	MOVB 0xae(%fp),{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	MOVH {uhalf}2(%r0),{uword}%r0
	BEB l366c
	ADDW3 &0x1,$0x4a0,%r0
	MOVAW 0xb8(%fp),%r1
	MOVB 0xae(%fp),{uword}%r2
	LLSW3 &0x4,%r2,%r2
	ADDW2 %r2,%r1
	MOVB 1(%r1),(%r0)
	#NOP
	JMP $0x3a78
l366c:
	CMPB 0xaf(%fp),0xae(%fp)
	BNEB l3689
	ADDW3 &0x1,$0x4a0,%r0
	ANDB3 &0xf,(%r0),%r0
	MOVB %r0,0xad(%fp)
	#NOP
	BRB l368e
l3689:
	CLRB 0xad(%fp)
	#NOP
l368e:
	ADDW3 &0x1,$0x4a0,%r0
	MOVAW 0xb8(%fp),%r1
	MOVB 0xae(%fp),{uword}%r2
	LLSW3 &0x4,%r2,%r2
	ADDW2 %r2,%r1
	MOVH {uhalf}4(%r1),{uword}%r1
	LLSW3 &0x4,%r1,%r1
	MOVB %r1,(%r0)
	#NOP
	MOVAW 0xb8(%fp),%r0
	MOVB 0xae(%fp),{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	MOVH (%r0),0xb4(%fp)
	#NOP
	CLRH 0xb6(%fp)
	#NOP
	BRB l3731
l36d5:
	MOVAW 0xb8(%fp),%r0
	MOVH 0xb6(%fp),{word}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	CLRH (%r0)
	#NOP
	MOVAW 0xb8(%fp),%r0
	MOVH 0xb6(%fp),{word}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	CLRH 2(%r0)
	#NOP
	MOVAW 0xb8(%fp),%r0
	MOVH 0xb6(%fp),{word}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	CLRH 4(%r0)
	#NOP
	MOVAW 0xb8(%fp),%r0
	MOVH 0xb6(%fp),{word}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	CLRB 6(%r0)
	#NOP
	INCH 0xb6(%fp)
	#NOP
l3731:
	CMPH &0x10,0xb6(%fp)
	BLB l36d5
	MOVB &0x1,0xab(%fp)
	#NOP
	MOVH 0xb4(%fp),{word}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	EXTFW &0x3,&0x0,4(%r0),%r0
	MOVB %r0,0xac(%fp)
	#NOP
	.byte	0x2b, 0xa9, 0xac, 0x00	# TSTB 0xac(%fp) # as adds NOP
	BNEB l376c
	MOVB &0xf,0xac(%fp)
	#NOP
	CLRB 0xab(%fp)
	#NOP
l376c:
	CLRH 0xb6(%fp)
	#NOP
	BRB l37d1
l3773:
	MOVAW 0xb8(%fp),%r0
	MOVH 0xb6(%fp),{word}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	ADDW2 &0x6,%r0
	PUSHW %r0
	MOVH 0xb4(%fp),{word}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	.byte	0xea, 0x0c, 0xa9, 0xb6, 0x00, 0x41  	# MULH3 &0xc,0xb6(%fp),%r1
	ADDW3 %r1,8(%r0),%r0
	ADDW2 &0x2,%r0
	PUSHW %r0
	CALL -8(%sp),$0x7fb0
	MOVAW 0xb8(%fp),%r0
	MOVH 0xb6(%fp),{word}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	MOVH 0xb6(%fp),4(%r0)
	#NOP
	INCH 0xb6(%fp)
	#NOP
l37d1:
	MOVH 0xb6(%fp),{word}%r0
	MOVB 0xac(%fp),{uword}%r1
	CMPW %r1,%r0
	BLUB l3773


## printf ("Possible subdevices are:\n\n")
	PUSHW &l959
	CALL -4(%sp),printf

## printf ("Option Number   Subdevice    Name\n")
	PUSHW &l974
	CALL -4(%sp),printf

# printf ("----------------------------\n")
	PUSHW &l997
	CALL -4(%sp),printf
	CLRH 0xb6(%fp)
	#NOP
	JMP $0x38ae
l3817:

## printf ("      %2d         %2d")
	PUSHW &l9c5

	MOVH 0xb6(%fp),{word}%r0
	PUSHW %r0

	MOVAW 0xb8(%fp),%r0
	MOVH 0xb6(%fp),{word}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	MOVH {uhalf}4(%r0),{uword}%r0
	PUSHW %r0

	CALL -12(%sp),printf


	MOVAW 0xb8(%fp),%r0
	MOVH 0xb6(%fp),{word}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	ADDW2 &0x6,%r0
	PUSHW %r0
	PUSHW &l9dc	# "*VOID*"
	CALL -8(%sp),$0x7f68
	TSTW %r0
	BEB l389b
	.byte	0x2b, 0xa9, 0xab, 0x00	# TSTB 0xab(%fp)
	BEB l389b

## printf ("         %10s")
	PUSHW &l9e3

	MOVAW 0xb8(%fp),%r0
	MOVH 0xb6(%fp),{word}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	ADDW2 &0x6,%r0
	PUSHW %r0

	CALL -8(%sp),printf

l389b:

## printf ("\n")
	PUSHW &l9f1

	CALL -4(%sp),printf


	INCH 0xb6(%fp)
	#NOP
	MOVH 0xb6(%fp),{word}%r0
	MOVB 0xac(%fp),{uword}%r1
	CMPW %r1,%r0
	BLUH l3817
	CLRB 0xaa(%fp)
	#NOP
	CLRH 0xb6(%fp)
	#NOP
	BRB l38fc
l38cc:
	MOVAW 0xb8(%fp),%r0
	MOVH 0xb6(%fp),{word}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	MOVH {uhalf}4(%r0),{uword}%r0
	MOVB 0xad(%fp),{uword}%r1
	CMPW %r1,%r0
	BNEB l38f7
	MOVB &0x1,0xaa(%fp)
	#NOP
	BRB l390d
l38f7:
	INCH 0xb6(%fp)
	#NOP
l38fc:
	MOVH 0xb6(%fp),{word}%r0
	MOVB 0xac(%fp),{uword}%r1
	CMPW %r1,%r0
	BLUB l38cc
l390d:
	.byte	0x2b, 0xa9, 0xaa, 0x00	# TSTB 0xaa(%fp)
	BNEB l391a
	CLRB 0xaf(%fp)
	#NOP
	BRB l3922
l391a:
	MOVB 0xb7(%fp),0xaf(%fp)
	#NOP
l3922:

## printf ("Enter Subdevice Option Number ")
	PUSHW &l9f3
	CALL -4(%sp),printf

## printf ("[%d")
	PUSHW &la13

	MOVB 0xaf(%fp),{uword}%r0
	PUSHW %r0

	CALL -8(%sp),printf


	MOVAW 0xb8(%fp),%r0
	MOVB 0xaf(%fp),{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	ADDW2 &0x6,%r0
	PUSHW %r0
	PUSHW &la17	# "*VOID*"
	CALL -8(%sp),$0x7f68
	TSTW %r0
	BEB l399a
	.byte	0x2b, 0xa9, 0xab, 0x00	# TSTB 0xab(%fp) # as adds NOP
	BEB l399a
	PUSHW &la1e	# "(%s)"
	MOVAW 0xb8(%fp),%r0
	MOVB 0xaf(%fp),{uword}%r1
	LLSW3 &0x4,%r1,%r1
	ADDW2 %r1,%r0
	ADDW2 &0x6,%r0
	PUSHW %r0
l3992:
	CALL -8(%sp),printf
l399a:

## printf ("]:")
	PUSHW &la23
	CALL -4(%sp),printf

	PUSHW &0x0
	CALL -4(%sp),*$0x540
	PUSHAW 90(%fp)
	CALL -4(%sp),$0x4360
	CMPW &-1,%r0
	BNEB l39e0
	PUSHW &0x1
	CALL -4(%sp),*$0x540

## printf ("\n")
	PUSHW &la27
	CALL -4(%sp),printf

	JMP $0x3aab
l39e0:
	PUSHW &0x1
	CALL -4(%sp),*$0x540
	CLRB 0xaa(%fp)
	#NOP
	.byte	0x2b, 0xc9, 0x5a	# TSTB 90(%fp)
	BEB l3a51
	CLRH 0xb6(%fp)
	#NOP
	BRB l3a1c
l39fb:
	PUSHAW 90(%fp)
	CALL -4(%sp),0x13c(%pc)
	MOVH 0xb6(%fp),{word}%r1
	CMPW %r0,%r1
	BNEB l3a17
	MOVB &0x1,0xaa(%fp)
	#NOP
	BRB l3a2d
l3a17:
	INCH 0xb6(%fp)
	#NOP
l3a1c:
	MOVH 0xb6(%fp),{word}%r0
	MOVB 0xac(%fp),{uword}%r1
	CMPW %r1,%r0
	BLUB l39fb
l3a2d:
	.byte	0x2b, 0xa9, 0xaa, 0x00	# TSTB 0xaa(%fp)
	BNEB l3a47

## printf ("\n%s is not a valid option number\n")
	PUSHW &la29
	PUSHAW 90(%fp)
	CALL -8(%sp),printf
	BRH l3922
l3a47:
	MOVB 0xb7(%fp),0xae(%fp)
	#NOP
	BRB l3a59
l3a51:
	MOVB 0xaf(%fp),0xae(%fp)
	#NOP
l3a59:
	ADDW3 &0x1,$0x4a0,%r0
	MOVAW 0xb8(%fp),%r1
	MOVB 0xae(%fp),{uword}%r2
	LLSW3 &0x4,%r2,%r2
	ADDW2 %r2,%r1
	ORB2 5(%r1),(%r0)
	#NOP
	MOVB &0x1,*$0x4a0
	#NOP
	CALL (%sp),$0x6970
	TSTW %r0
	BNEB l3aa8
## Sets the "Boot Failure" flag in 0x200085c
	ORW2 &0x4,$0x200085c
	#NOP
	CALL (%sp),$0x5de0
	PUSHW &0xfeedbeef
	CALL -4(%sp),$0x6322
l3aa8:
	BRH l2b0d
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP


################################################################################
## Unknown Routine - maybe get input of some kind? It calls 0x4484,
## which checks to see if a character is available as input.

	SAVE %fp
	.byte	0x9c, 0x4f, 0x04, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x4,%sp
	CLRH (%fp)
	#NOP
	BRB l3af7
l3ac2:
	BRB l3ac4
l3ac4:
	CALL (%sp),$0x4484
	MOVB %r0,*0(%ap)
	#NOP
	TSTB %r0
	BEB l3ac4
	CMPB &0xd,*0(%ap)
	BEB l3ae0
	CMPB &0xa,*0(%ap)
	BNEB l3af1
l3ae0:
	.byte	0x2a, 0x59	# TSTH (%fp) # as adds NOP
	BNEB l3ae8
	CLRW %r0
	BRB l3b05
l3ae8:
	CLRB *0(%ap)
	#NOP
	MOVW &0x1,%r0
	BRB l3b05
l3af1:
	INCW (%ap)
	#NOP
	INCH (%fp)
	#NOP
l3af7:
	CMPH &0x8,(%fp)
	BLB l3ac2
	CLRB *0(%ap)
	#NOP
	MOVW &0x1,%r0
	BRB l3b05
l3b05:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP


l3b0e:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp

## printf ("\nSORRY!\n")
	PUSHW &la4c
	CALL -4(%sp),printf
	PUSHW &0xadebac1e
	CALL -4(%sp),$0x6322
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	SAVE %fp
	.byte	0x9c, 0x4f, 0x08, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x8,%sp
	CLRH 4(%fp)
	#NOP
	MOVH 4(%fp),2(%fp)
	#NOP
	BRB l3b73
l3b4c:
	CMPB &0x30,(%fp)
	BLB l3b63
	CMPB &0x39,(%fp)
	BGB l3b63
	MOVB (%fp),{uhalf}%r0
	SUBH2 &0x30,%r0
	MOVH %r0,4(%fp)
	#NOP
	BRB l3b68
l3b63:
	MOVW &-1,%r0
	BRB l3b87
l3b68:
	.byte	0xea, 0x0a, 0x62, 0x40	# MULH3 &0xa,2(%fp),%r0
	ADDH2 4(%fp),%r0
	.byte	0x86, 0x40, 0x62	# MOVH %r0,2(%fp)
	NOP
l3b73:
	.byte	0x84, 0x5a, 0x40	# MOVW (%ap),%r0
	INCW (%ap)
	#NOP
	MOVB (%r0),(%fp)
	#NOP
	.byte	0x2b, 0x59	# TSTB (%fp)
	BNEB l3b4c
	MOVH 2(%fp),{word}%r0
	BRB l3b87
l3b87:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP

################################################################################
## Unknown Procedure
##

l3b90:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x04, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x4,%sp
	ADDW3 &0x4,$0x4a4,%r0
	CLRB (%r0)
	#NOP
	PUSHW &0x43009
	ADDW3 &0x3,$0x4a4,%r0
	PUSHW %r0
	PUSHW &0x1
## Call 'rnvram'
	CALL -12(%sp),$0x5224
	CMPW &0x1,%r0
	BNEB l3c12
	ADDW3 &0x2,$0x4a4,%r0
	ADDW3 &0x3,$0x4a4,%r1
	ANDB3 &0xf0,(%r1),%r1
	LRSW3 &0x4,%r1,%r1
	MOVB %r1,(%r0)
	#NOP
	ADDW3 &0x3,$0x4a4,%r0
	ANDB2 &0xf,(%r0)
	#NOP
	CMPW &0x8000,$0x508
	BLEB l3c10
	ADDW3 &0x3,$0x4a4,%r0
	CLRB (%r0)
	#NOP
	ADDW3 &0x2,$0x4a4,%r0
	CLRB (%r0)
	#NOP
l3c10:
	BRB l3c28
l3c12:
	ADDW3 &0x2,$0x4a4,%r0
	CLRB (%r0)
	#NOP
	ADDW3 &0x3,$0x4a4,%r0
	CLRB (%r0)
	#NOP
l3c28:
	PUSHW &0x43080
	PUSHAW (%fp)
	PUSHW &0x2
	CALL -12(%sp),$0x5224
	TSTW %r0
	BEB l3c45
	MOVH {uhalf}(%fp),{uword}%r0
	BNEB l3c5d
l3c45:
	MOVH &0x4bd,(%fp)
	#NOP
	PUSHAW (%fp)
	PUSHW &0x43080
	PUSHW &0x2
	CALL -12(%sp),$0x52a0
l3c5d:
	MOVH (%fp),*$0x4a4
	#NOP
	ADDW3 &0x2,$0x4a4,%r0
	.byte	0x2b, 0x50	# TSTB (%r0) # as adds NOP
	BEB l3c77
	MOVH &0x4bd,(%fp)
	#NOP
l3c77:
	MOVH {uhalf}(%fp),{uword}%r0
	PUSHW %r0
	PUSHW &0x49000
	CALL -8(%sp),$0x3e84
	ADDW3 &0x2,$0x4a4,%r0
	.byte	0x2b, 0x50	# TSTB (%r0) # as adds NOP
	BNEB l3caf
	ADDW3 &0x3,$0x4a4,%r0
	CMPB &0x1,(%r0)
	BNEB l3caf
	MOVH *$0x4a4,(%fp)
	#NOP
	BRB l3ce2
l3caf:
	PUSHW &0x4300a
	PUSHAW (%fp)
	PUSHW &0x2
	CALL -12(%sp),$0x5224
	TSTW %r0
	BEB l3ccc
	MOVH {uhalf}(%fp),{uword}%r0
	BNEB l3ce2
l3ccc:
	MOVH &0x3d,(%fp)
	#NOP
	PUSHAW (%fp)
	PUSHW &0x4300a
	PUSHW &0x2
	CALL -12(%sp),$0x52a0
l3ce2:
	MOVH {uhalf}(%fp),{uword}%r0
	PUSHW %r0
	PUSHW &0x49008
	CALL -8(%sp),$0x3e84
	ADDW3 &0x2,$0x4a4,%r0
	.byte	0x2b, 0x50	# TSTB (%r0) # as adds NOP
	BNEB l3d6c
	ADDW3 &0x3,$0x4a4,%r0
	.byte	0x2b, 0x50	# TSTB (%r0) # as adds NOP
	BNEB l3d1b
	MCOMB $0x4900d,%r0
	BITW %r0,&0x1
	BNEB l3d34
l3d1b:
	ADDW3 &0x3,$0x4a4,%r0
	CMPB &0x1,(%r0)
	BNEB l3d6c
	MCOMB $0x4900d,%r0
	BITW %r0,&0x2
	BEB l3d6c
l3d34:
	ADDW3 &0x4,$0x4a4,%r0
	MOVB &0x1,(%r0)
	#NOP
	ADDW3 &0x3,$0x4a4,%r0
	.byte	0x2b, 0x50	# TSTB (%r0) # as adds NOP
	BEB l3d5d
	MOVW &0x49008,%r0
	MOVW %r0,*$0x4fc
	#NOP
	BRB l3d6c
l3d5d:
	MOVW &0x49000,%r0
	MOVW %r0,*$0x4fc
	#NOP
l3d6c:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP

################################################################################
## 'setbaud' - Routine to set baud rate. This is a full process,
## ending with a "RETPS". It makes me wonder if this is a full-on
## exception handler? If so, who calls it? It doesn't appear in any
## interrupt vector tables.

	SAVE %r8
	.byte	0x9c, 0x4f, 0x04, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x4,%sp
	MOVH &0x1,%r8
	BRB l3da3
l3d82:
	CMPH &0x10,%r8
	BLUB l3da1

## printf (# "Unsupported Baud Rate: %d\n")
	PUSHW &lad8

	MOVH 2(%ap),{word}%r0
	PUSHW %r0

	CALL -8(%sp),printf


	.byte	0x24, 0x7f, 0x7a, 0x3e, 0x00, 0x00	# JMP l3e7a
l3da1:
	INCH %r8
l3da3:
	MOVH %r8,{word}%r0
	LLSW3 &0x3,%r0,%r0
	.byte	0x3e, 0x72, 0x80, 0x58, 0x0a, 0x00, 0x00	# CMPH 2(%ap),0xa58(%r0)
	BNEB l3d82
	CMPW &0x49008,4(%ap)
	BNEB l3dec
	MOVH %r8,{word}%r0
	LLSW3 &0x3,%r0,%r0
	.byte	0x87, 0x80, 0x5a, 0x0a, 0x00, 0x00, 0xe2, 0x40	# MOVB 0xa5a(%r0),{uhalf}%r0
	ORH2 &0x30,%r0
	MOVH %r0,(%fp)
	#NOP
	PUSHAW (%fp)
	PUSHW &0x4300a
	PUSHW &0x2
	CALL -12(%sp),$0x52a0
	JMP $0x3e6b
l3dec:
	PUSHW &0x43080
	PUSHAW (%fp)
	PUSHW &0x2
	CALL -12(%sp),$0x5224
	MOVH {uhalf}(%fp),{uword}%r0
	BEB l3e3b
	MOVH {uhalf}(%fp),{uword}%r0
	MOVW &0xfff0,%r1
	MOVH {uhalf}%r1,{uword}%r1
	ANDW2 %r1,%r0
	MOVH %r0,(%fp)
	#NOP
	MOVH {uhalf}(%fp),{uword}%r0
	MOVH %r8,{word}%r1
	LLSW3 &0x3,%r1,%r1
	.byte	0x87, 0x81, 0x5a, 0x0a, 0x00, 0x00, 0xe0, 0x41	# MOVB 0xa5a(%r1),{uword}%r1
	ORW2 %r1,%r0
	MOVH %r0,(%fp)
	#NOP
	BRB l3e59
l3e3b:
	MOVH %r8,{word}%r0
	LLSW3 &0x3,%r0,%r0
	.byte	0x87, 0x80, 0x5a, 0x0a, 0x00, 0x00, 0xe2, 0x40	# MOVB 0xa5a(%r0),{uhalf}%r0
	ORH2 &0x430,%r0
	ORH2 &0x80,%r0
	MOVH %r0,(%fp)
	#NOP
l3e59:
	PUSHAW (%fp)
	PUSHW &0x43080
	PUSHW &0x2
	CALL -12(%sp),$0x52a0
	MOVH {uhalf}(%fp),{uword}%r0
	PUSHW %r0
	PUSHW 4(%ap)
	.byte	0x2c, 0xcc, 0xf8, 0xaf, 0x10, 0x00	# CALL -8(%sp),0x10(%pc)
l3e7a:
	MOVAW -20(%fp),%sp
	POPW %r8
	POPW %fp
	RET
	NOP
	SAVE %r7
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	MOVH &0x1,%r8
	BRB l3ea7
l3e92:
	MOVH {uhalf}%r8,{uword}%r0
	CMPW &0x10,%r0
	BLUB l3ea5
	MOVH &0xd,%r8
	MOVH &0x30,2(%ap)
	#NOP
	BRB l3ec5
l3ea5:
	INCH %r8
l3ea7:
	MOVH {uhalf}%r8,{uword}%r0
	LLSW3 &0x3,%r0,%r0
	.byte	0x87, 0x80, 0x5a, 0x0a, 0x00, 0x00, 0xe0, 0x40	# MOVB 0xa5a(%r0),{uword}%r0
	MOVH {uhalf}2(%ap),{uword}%r1
	ANDW2 &0xf,%r1
	CMPW %r1,%r0
	BNEB l3e92
l3ec5:
	ADDW3 &0x2,4(%ap),%r0
	MOVB &0x1a,(%r0)
	#NOP
	ADDW3 &0x2,4(%ap),%r0
	MOVB &0x20,(%r0)
	#NOP
	ADDW3 &0x2,4(%ap),%r0
	MOVB &0x30,(%r0)
	#NOP
	ADDW3 &0x2,4(%ap),%r0
	MOVB &0x40,(%r0)
	#NOP
	ADDW3 &0x2,4(%ap),%r0
	MOVB &0x70,(%r0)
	#NOP
	MOVH {uhalf}2(%ap),{uword}%r0
	BITW %r0,&0x100
	BEB l3f13
	MOVH {uhalf}2(%ap),{uword}%r0
	BITW %r0,&0x200
	BEB l3f0c
	MOVW &0x4,%r0
	BRB l3f0e
l3f0c:
	CLRW %r0
l3f0e:
	ORW2 &0x0,%r0
	BRB l3f16
l3f13:
	MOVW &0x10,%r0
l3f16:
	ORB2 &0x0,%r0
	MOVB %r0,%r7
	MOVH {uhalf}2(%ap),{uword}%r0
	ANDW2 &0x30,%r0
	BRB l3f37
l3f26:
	BRB l3f48
l3f28:
	ORB2 &0x1,%r7
	BRB l3f48
l3f2d:
	ORB2 &0x2,%r7
	BRB l3f48
l3f32:
	ORB2 &0x3,%r7
	BRB l3f48
l3f37:
	CMPW %r0,&0x0
	BEB l3f26
	CMPW %r0,&0x10
	BEB l3f28
	CMPW %r0,&0x20
	BEB l3f2d
	BRB l3f32
l3f48:
	MOVB %r7,*4(%ap)
	#NOP
	MOVH {uhalf}2(%ap),{uword}%r0
	BITW %r0,&0x40
	BEB l3f5d
	MOVW &0xf,%r0
	BRB l3f60
l3f5d:
	MOVW &0x7,%r0
l3f60:
	ORB2 &0x0,%r0
	MOVB %r0,*4(%ap)
	#NOP
	ADDW3 &0x1,4(%ap),%r0
	MOVH {uhalf}%r8,{uword}%r1
	LLSW3 &0x3,%r1,%r1
	.byte	0x87, 0x81, 0x5b, 0x0a, 0x00, 0x00, 0x50	# MOVB 0xa5b(%r1),(%r0)
	NOP
	MOVH {uhalf}%r8,{uword}%r0
	LLSW3 &0x3,%r0,%r0
	.byte	0x87, 0x80, 0x5c, 0x0a, 0x00, 0x00, 0x7f, 0x54, 0x12, 0x00, 0x02	# MOVB 0xa5c(%r0),$0x2001254
	NOP
	ADDW3 &0x4,4(%ap),%r0
	MOVB $0x2001254,(%r0)
	#NOP
	ADDW3 &0x2,4(%ap),%r0
	MOVB &0x15,(%r0)
	#NOP
	MOVB &0x3,$0x4900e
	#NOP
	PUSHW &0x1
	CALL -4(%sp),*$0x528 # DUART Delay
	ADDW3 &0x3,4(%ap),%r0
	MOVB &0x20,(%r0)
	#NOP
	MOVAW -16(%fp),%sp
	POPW %r8
	POPW %r7
	POPW %fp
	RET
	NOP
	SAVE %fp
	.byte	0x9c, 0x4f, 0x54, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x54,%sp
	PUSHW &0x43080
	PUSHAW (%fp)
	PUSHW &0x2
	CALL -12(%sp),$0x5224

## printf ("Enter new rate [%d]: ")
	PUSHW &laf3

	MOVH {uhalf}(%fp),{uword}%r0
	ANDW2 &0xf,%r0
	LLSW3 &0x3,%r0,%r0
	.byte	0x86, 0x80, 0x58, 0x0a, 0x00, 0x00, 0xe4, 0x40	# MOVH 0xa58(%r0),{word}%r0
	PUSHW %r0

	CALL -8(%sp),printf


	PUSHAW 2(%fp)
	.byte	0x2c, 0xcc, 0xfc, 0xef, 0xb4, 0x04, 0x00, 0x00	# CALL -4(%sp),*$0x4b4
	.byte	0x2b, 0x62	# TSTB 2(%fp) # as adds NOP
	BEB l4053
	PUSHAW 2(%fp)
	PUSHW &lb09	# "%d"
	PUSHAW (%fp)
	CALL -12(%sp),$0x4ae4

## printf (# "Change baud rate to %d\n")
	PUSHW &lb0c

	MOVH {uhalf}(%fp),{uword}%r0
	PUSHW %r0

	CALL -8(%sp),printf


	MOVH {uhalf}(%fp),{uword}%r0
	PUSHW %r0
	PUSHW &0x49000
	.byte	0x2c, 0xcc, 0xf8, 0xaf, 0x27, 0xfd	# CALL -8(%sp),0xfd27(%pc)
l4053:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
l406c:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x04, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x4,%sp
	MOVB $0x42013,(%fp)
	#NOP
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	.byte	0x28, 0x5d	# TSTW (%pcbp)
	NOP
	NOP
	NOP
	NOP
	SAVE %fp
	MOVW (%ap),%r2
	MOVW 4(%ap),%r1
	MOVW 8(%ap),%r0
	MOVBLW
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP


################################################################################
## Main interrupt handler during ROM startup. This is pointed at by
## the PCBP at 0x2000bc8 during at least part of ROM startup.
##
## The clever part of this is the call to 0x64ec, which will then call
## whatever function is currently registered at 0x494.
##
	MOVW -4(%isp),%r0
	MOVW (%r0),$0x2001258
	#NOP
	MOVW 4(%r0),$0x200125c
	#NOP
	MOVB &0x0,$0x2001260
	#NOP
## Call the code that calls the registered handler
	CALL (%sp),$0x64ec
	RETPS


## Interrupt handler 40c6
	MOVW -4(%isp),%r0
	MOVW (%r0),$0x2001258
	#NOP
	MOVW 4(%r0),$0x200125c
	#NOP
	MOVB &0x8,$0x2001260
	#NOP
	CALL (%sp),$0x64ec
	RETPS

## Interrupt handler 40ec
	MOVW -4(%isp),%r0
	MOVW (%r0),$0x2001258
	#NOP
	MOVW 4(%r0),$0x200125c
	#NOP
	MOVB &0x9,$0x2001260
	#NOP
	CALL (%sp),$0x64ec
	RETPS

##
	MOVW -4(%isp),%r0
	MOVW (%r0),$0x2001258
	#NOP
	MOVW 4(%r0),$0x200125c
	#NOP
	MOVB &0xa,$0x2001260
	#NOP
	CALL (%sp),$0x64ec
	RETPS

	MOVW -4(%isp),%r0
	MOVW (%r0),$0x2001258
	#NOP
	MOVW 4(%r0),$0x200125c
	#NOP
	MOVB &0xb,$0x2001260
	#NOP
	CALL (%sp),$0x64ec
	RETPS

	MOVW -4(%isp),%r0
	MOVW (%r0),$0x2001258
	#NOP
	MOVW 4(%r0),$0x200125c
	#NOP
	MOVB &0xc,$0x2001260
	#NOP
	CALL (%sp),$0x64ec
	RETPS

	MOVW -4(%isp),%r0
	MOVW (%r0),$0x2001258
	#NOP
	MOVW 4(%r0),$0x200125c
	#NOP
	MOVB &0xd,$0x2001260
	#NOP
	CALL (%sp),$0x64ec
	RETPS
	MOVW -4(%isp),%r0
	MOVW (%r0),$0x2001258
	#NOP
	MOVW 4(%r0),$0x200125c
	#NOP
	MOVB &0xe,$0x2001260
	#NOP
	CALL (%sp),$0x64ec
	RETPS
	MOVW -4(%isp),%r0
	MOVW (%r0),$0x2001258
	#NOP
	MOVW 4(%r0),$0x200125c
	#NOP
	MOVB &0xf,$0x2001260
	#NOP
	CALL (%sp),$0x64ec
	RETPS
	NOP
	NOP
	MOVW -4(%isp),%r0
	MOVW (%r0),$0x2001258
	#NOP
	MOVW 4(%r0),$0x200125c
	#NOP
	MOVW 28(%r0),$0x2001264
	#NOP
	CALL (%sp),$0x6550
	RETPS

################################################################################
## 'demon' - Routine to enter demon without init
##
## This appears to be an interrupt handler, but what?
## It calls 0x6550, which is currently an unknown procedure.

	MOVW -4(%sp),$0x2001258
	#NOP
	MOVW -8(%sp),$0x200125c
	#NOP
	MOVW %r0,$0x2001264
	#NOP
## Load the PSW with 81E100
	.byte	0x84, 0x4f, 0x00, 0xe1, 0x81, 0x00, 0x4b	# MOVW &0x81e100,%psw # as adds NOP
## Call unknown procedure at 0x6550
	.byte	0x2c, 0x5c, 0x7f, 0x50, 0x65, 0x00, 0x00	# CALL (%sp),$0x6550
	MOVW $0x20011fc,-8(%sp)
	#NOP
	.byte	0x84, 0x7f, 0x58, 0x12, 0x00, 0x02, 0x4b	# MOVW $0x2001258,%psw # as adds NOP
	RETG

################################################################################
## Unknown Interrupt Handler
##

	MOVW %r0,$0x2001264
	#NOP
	MOVW -4(%sp),$0x2001258
	#NOP
	MOVW -8(%sp),$0x200125c
	#NOP
	MOVAW $0x2000e98,%r0
	CALLPS
	MOVW $0x20011fc,-8(%sp)
	#NOP
	.byte	0x84, 0x7f, 0x58, 0x12, 0x00, 0x02, 0x4b	# MOVW $0x2001258,%psw # as adds NOP
	RETG


	.byte	0x84, 0x4f, 0x00, 0xe1, 0x81, 0x00, 0x4b	# MOVW &0x81e100,%psw # as adds NOP
	CALL (%sp),$0x6550
	RETPS
	NOP
	NOP
	SAVE %fp
	.byte	0x9c, 0x4f, 0x04, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x4,%sp
	ADDW3 &0x2,$0x4a4,%r0
	.byte	0x2b, 0x50	# TSTB (%r0) # as adds #NOP
	BEB l42c8
	ADDW3 &0x4,$0x4a4,%r0
	CMPB &0x1,(%r0)
	BNEB l42c8
	JMP $0x4348
l42c8:
	BRB l42d1
l42ca:
	CALL (%sp),$0x62de
l42d1:
	ADDW3 &0x1,(%ap),%r0
	BITB (%r0),&0x1
	BEB l42ca
	CMPW $0x20011e8,(%ap)
	BNEB l433a
	.byte	0x2b, 0x7f, 0x68, 0x08, 0x00, 0x02	# TSTB $0x2000868 # as adds NOP
	BNEB l433a
	ADDW3 &0x1,(%ap),%r0
	BITB (%r0),&0x80
	BEB l433a
	ADDW3 &0x2,(%ap),%r0
	MOVB &0x40,(%r0)
	#NOP
	ADDW3 &0x2,(%ap),%r0
	MOVB &0x50,(%r0)
	#NOP
	ADDW3 &0x3,(%ap),%r0
	MOVB (%r0),(%fp)
	#NOP
	BRB l432c
l4312:
	ADDW3 &0x2,(%ap),%r0
	MOVB &0x40,(%r0)
	#NOP
	ADDW3 &0x2,(%ap),%r0
	MOVB &0x50,(%r0)
	#NOP
	ADDW3 &0x3,(%ap),%r0
	MOVB (%r0),(%fp)
	#NOP
l432c:
	ADDW3 &0x1,(%ap),%r0
	BITB (%r0),&0x1
	BNEB l4312
	MOVW &-1,%r0
	BRB l4358
l433a:
	ADDW3 &0x3,(%ap),%r0
	MOVB (%r0),(%fp)
	#NOP
	MOVB (%fp),{uword}%r0
	BRB l4358
	PUSHW &0x0
	CALL -4(%sp),$0x56f8
	MOVH %r0,{word}%r0
	BRB l4358
l4358:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP

################################################################################
## 'gets' Routine
##

l4360:
	SAVE %r7
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	.byte	0x2b, 0xef, 0xc4, 0x04, 0x00, 0x00	# TSTB *$0x4c4
	BNEB l4380
	CALL (%sp),$0x62de
	CLRW %r0
	.byte	0x24, 0x7f, 0x78, 0x44, 0x00, 0x00	# JMP l4478
l4380:
	MOVW (%ap),%r8
l4383:
	JMP $0x4455
l4389:
	PUSHW $0x20011e8
	CALL -4(%sp),$0x42a0
	MOVW %r0,%r7
	BGEB l43a5
	MOVW &-1,%r0
	.byte	0x24, 0x7f, 0x78, 0x44, 0x00, 0x00	# JMP l4478
l43a5:
	ANDW3 &0xff,%r7,{ubyte}%r0
	MOVB %r0,*0(%ap)
	#NOP
	CMPB &0xa,*0(%ap)
	BEB l43bd
	CMPB &0xd,*0(%ap)
	BNEB l43e7
l43bd:
	CLRB *0(%ap)
	#NOP
	PUSHW &0xa
	PUSHW $0x20011e8
	CALL -8(%sp),$0x48b8
	TSTW %r0
	BGEB l43de
	MOVW &-1,%r0
	.byte	0x24, 0x7f, 0x78, 0x44, 0x00, 0x00	# JMP l4478
l43de:
	MOVW &0x1,%r0
	.byte	0x24, 0x7f, 0x78, 0x44, 0x00, 0x00	# JMP l4478
l43e7:
	MOVB *0(%ap),{uword}%r0
	PUSHW %r0
	PUSHW $0x20011e8
	CALL -8(%sp),$0x48b8
	TSTW %r0
	BGEB l4405
	MOVW &-1,%r0
	BRB l4478
l4405:
	CMPB &0x8,*0(%ap)
	BNEB l442c
	CMPW %r8,(%ap)
	BEB l442a

## printf (" \b")
	PUSHW &lb24
	CALL -4(%sp),printf

	TSTW %r0
	BGEB l4427
	MOVW &-1,%r0
	BRB l4478
l4427:
	DECW (%ap)
	#NOP
l442a:
	BRB l4455
l442c:
	CMPB &0x40,*0(%ap)
	BNEB l4452
	MOVW %r8,(%ap)
	#NOP
	PUSHW &0xa
	PUSHW $0x20011e8
	CALL -8(%sp),$0x48b8
	TSTW %r0
	BGEB l4450
	MOVW &-1,%r0
	BRB l4478
l4450:
	BRB l4455
l4452:
	INCW (%ap)
	#NOP
l4455:
	SUBW3 %r8,(%ap),%r0
	CMPW &0x50,%r0
	BLH l4389

## printf ("\nmax input of %d characters, re-enter entire line\n")
	PUSHW &lb27
	PUSHW &0x50
	CALL -8(%sp),printf

	MOVW %r8,(%ap)
	#NOP
	BRH l4383
l4478:
	MOVAW -16(%fp),%sp
	POPW %r8
	POPW %r7
	POPW %fp
	RET
	NOP
 
#############################################################################
## 'getstat' - Routine to check console for character present
##

	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp

## Call soft-power inhibit/timer function.
	CALL (%sp),$0x62de
	ADDW3 &0x2,$0x4a4,%r0
	.byte	0x2b, 0x50	# TSTB (%r0) # as adds #NOP
	BEB l44ad
	ADDW3 &0x4,$0x4a4,%r0
	CMPB &0x1,(%r0)
	BEB l44cc
 
## R0 = 0x49001 (UART port A status)
l44ad:
	ADDW3 &0x1,$0x20011e8,%r0
## If BIT 1 (RxRDY) is set, jump to 44C8
	BITB (%r0),&0x1
	BEB l44c8

## If not, grab the data in 49003
## R0 = 0x49004 (UART port A data)
	ADDW3 &0x3,$0x20011e8,%r0
	MOVB (%r0),{uword}%r0
	BRB l44dc

l44c8:
	CLRW %r0
	BRB l44dc
l44cc:
	PUSHW &0x1

	CALL -4(%sp),$0x56f8
	MOVB %r0,{uword}%r0
	BRB l44dc
l44dc:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP

################################################################################
## 'printf' Routine
##

#l44e4:
printf:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x38, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x38,%sp
	.byte	0x2b, 0xef, 0xc4, 0x04, 0x00, 0x00	# TSTB *$0x4c4 # as adds NOP
	BNEB l4504
	CALL (%sp),$0x62de
	CLRW %r0
	JMP $0x48ae
l4504:
	ADDW3 &0x2,$0x20011e8,%r0
	MOVB &0x15,(%r0)
	#NOP
	CLRW 40(%fp)
	#NOP
	MOVAW 4(%ap),(%fp)
	#NOP
	JMP $0x4888
l451e:
	CMPB &0x25,*0(%ap)
	BEB l452a
	JMP $0x4867
l452a:
	MOVW &0x20,8(%fp)
	#NOP
	CLRW 4(%fp)
	#NOP
	CLRW 24(%fp)
	#NOP
	CLRW 28(%fp)
	#NOP
	INCW (%ap)
	#NOP
	CMPB &0x2d,*0(%ap)
	BNEB l4549
	MOVW &0x1,4(%fp)
	#NOP
	INCW (%ap)
	#NOP
l4549:
	CMPB &0x30,*0(%ap)
	BNEB l455a
	.byte	0x28, 0x64	# TSTW 4(%fp) # as adds NOP
	BNEB l4557
	MOVW &0x30,8(%fp)
	#NOP
l4557:
	INCW (%ap)
l455a:
	#NOP
	BRB l4571
l455c:
	.byte	0xe8, 0x0a, 0xc9, 0x1c, 0x40	# MULW3 &0xa,28(%fp),%r0
	SUBB3 &0x30,*0(%ap),%r1
	ADDW2 %r1,%r0
	MOVW %r0,28(%fp)
	#NOP
	INCW (%ap)
	#NOP
l4571:
	CMPB &0x30,*0(%ap)
	BLB l457d
	CMPB &0x39,*0(%ap)
	BLEB l455c
l457d:
	CMPB &0x6c,*0(%ap)
	BEB l458b
	CMPB &0x68,*0(%ap)
	BNEB l458e
l458b:
	INCW (%ap)
	#NOP
l458e:
	MOVB *0(%ap),{uword}%r0
	JMP $0x4812
l4599:
	ADDW3 &0x3,(%fp),%r0
	MOVB (%r0),16(%fp)
	#NOP
	ADDW2 &0x4,(%fp)
	#NOP
	.byte	0x2b, 0xc9, 0x10 	# TSTB 16(%fp) # as adds NOP
	BEB l45c9
	MOVB 16(%fp),{uword}%r0
	PUSHW %r0
	PUSHW $0x20011e8
	CALL -8(%sp),$0x48b8
	TSTW %r0
	BGEB l45c9
	MOVW &0x1,40(%fp)
	#NOP
l45c9:
	JMP $0x4865
l45cf:
	MOVW *0(%fp),20(%fp)
	#NOP
	ADDW2 &0x4,(%fp)
	#NOP
	.byte	0x28, 0xc9, 0x14	# TSTW 20(%fp) # as adds NOP
	BNEB l45e7
	MOVW &lb70,20(%fp) # lb70: "(null pointer)"
	#NOP
l45e7:
	CLRW 12(%fp)
	#NOP
	BRB l4614
l45ec:
	INCW 12(%fp)
	#NOP
	MOVW 20(%fp),%r0
	INCW 20(%fp)
	#NOP
	MOVB (%r0),{uword}%r0
	PUSHW %r0
	PUSHW $0x20011e8
	CALL -8(%sp),$0x48b8
	TSTW %r0
	BGEB l4614
	MOVW &0x1,40(%fp)
	#NOP
l4614:
	.byte	0x2b, 0xd9, 0x14	# TSTB *20(%fp) # as adds NOP
	BNEB l45ec
	BRB l4634
l461b:
	PUSHW &0x20
	PUSHW $0x20011e8
	CALL -8(%sp),$0x48b8
	TSTW %r0
	BGEB l4634
	MOVW &0x1,40(%fp)
	#NOP
l4634:
	MOVW 12(%fp),%r0
	INCW 12(%fp)
	#NOP
	CMPW 28(%fp),%r0
	BLB l461b
	JMP $0x4865
l4646:
	MOVW &0x10,36(%fp)
	#NOP
	BRB l465e
l464d:
	MOVW &0x1,24(%fp)
	#NOP
l4652:
	MOVW &0xa,36(%fp)
	#NOP
	BRB l465e
l4659:
	MOVW &0x8,36(%fp)
	#NOP
l465e:
	MOVW *0(%fp),32(%fp)
	#NOP
	ADDW2 &0x4,(%fp)
	#NOP
	.byte	0x28, 0xc9, 0x20	# TSTW 32(%fp) # as adds NOP
	BNEB l4680
	MOVW &0x1,12(%fp)
	#NOP
	MOVB $0xb5c,44(%fp)  # l5bc: "0123456789abcdef"
	#NOP
	CLRW 24(%fp)
	#NOP
	BRB l46f2
l4680:
	CMPW &0x1,24(%fp)
	BNEB l469b
	LRSW3 &0x1f,32(%fp),%r0
	BEB l469b
	MCOMW 32(%fp),%r0
	ADDW2 &0x1,%r0
	MOVW %r0,32(%fp)
	#NOP
	BRB l469f
l469b:
	CLRW 24(%fp)
	#NOP
l469f:
	CLRW 12(%fp)
	#NOP
	BRB l46c4
l46a4:
	MOVAW 44(%fp),%r0
	ADDW2 12(%fp),%r0
	.byte	0xe4, 0xe0, 0xc9, 0x24, 0xc9, 0x20, 0x41	# MODW3 {uword}36(%fp),32(%fp),%r1
## cac: binary to hex conversion
	MOVB lb5c(%r1),(%r0)
	#NOP
	DIVW2 {uword}36(%fp),32(%fp)
	#NOP
	INCW 12(%fp)
	#NOP
l46c4:
	.byte	0x28, 0xc9, 0x20	# TSTW 32(%fp) # as adds NOP
	BEB l46ce
	CMPW &0xc,12(%fp)
	BLB l46a4
l46ce:
	CMPW &0xc,12(%fp)
	BLB l46f2
	PUSHW &0x3f
	PUSHW $0x20011e8
	CALL -8(%sp),$0x48b8
	TSTW %r0
	BGEB l46ec
	MOVW &0x1,40(%fp)
	#NOP
l46ec:
	JMP $0x4865
l46f2:
	.byte	0x28, 0x64	# TSTW 4(%fp) # as adds NOP
	BNEB l476c
	CMPW &0x1,24(%fp)
	BNEB l471e
	DECW 28(%fp)
	#NOP
	CMPW &0x30,8(%fp)
	BNEB l471e
	PUSHW &0x2d
	PUSHW $0x20011e8
	CALL -8(%sp),$0x48b8
	TSTW %r0
	BGEB l471e
	MOVW &0x1,40(%fp)
	#NOP
l471e:
	BRB l4739
l4720:
	PUSHW 8(%fp)
	PUSHW $0x20011e8
	CALL -8(%sp),$0x48b8
	TSTW %r0
	BGEB l4739
	MOVW &0x1,40(%fp)
	#NOP
l4739:
	MOVW 28(%fp),%r0
	DECW 28(%fp)
	#NOP
	CMPW 12(%fp),%r0
	BGB l4720
	CMPW &0x1,24(%fp)
	BNEB l476a
	CMPW &0x20,8(%fp)
	BNEB l476a
	PUSHW &0x2d
	PUSHW $0x20011e8
	CALL -8(%sp),$0x48b8
	TSTW %r0
	BGEB l476a
	MOVW &0x1,40(%fp)
	#NOP
l476a:
	BRB l4794
l476c:
	CMPW &0x1,24(%fp)
	BNEB l478f
	DECW 28(%fp)
	#NOP
	PUSHW &0x2d
	PUSHW $0x20011e8
	CALL -8(%sp),$0x48b8
	TSTW %r0
	BGEB l478f
	MOVW &0x1,40(%fp)
	#NOP
l478f:
	SUBW2 12(%fp),28(%fp)
	#NOP
l4794:
	BRB l47ba
l4796:
	MOVAW 44(%fp),%r0
	ADDW2 12(%fp),%r0
	MOVB (%r0),{uword}%r0
	PUSHW %r0
	PUSHW $0x20011e8
	CALL -8(%sp),$0x48b8
	TSTW %r0
	BGEB l47ba
	MOVW &0x1,40(%fp)
	#NOP
l47ba:
	DECW 12(%fp)
	#NOP
	BGEB l4796
	CMPW &0x1,4(%fp)
	BNEB l47f0
	BRB l47df
l47c6:
	PUSHW 8(%fp)
	PUSHW $0x20011e8
	CALL -8(%sp),$0x48b8
	TSTW %r0
	BGEB l47df
	MOVW &0x1,40(%fp)
	#NOP
l47df:
	MOVW 28(%fp),%r0
	DECW 28(%fp)
	#NOP
	ADDW3 &0x1,12(%fp),%r1
	CMPW %r1,%r0
	BGB l47c6
l47f0:
	BRB l4865
l47f2:
	MOVB *0(%ap),{uword}%r0
	PUSHW %r0
	PUSHW $0x20011e8
	CALL -8(%sp),$0x48b8
	TSTW %r0
	BGEB l4810
	MOVW &0x1,40(%fp)
	#NOP
l4810:
	BRB l4865
	CMPW &0x6f,%r0
	BEH l4659
	BGB l4848
	CMPW &0x63,%r0
	BEH l4599
	BGB l483f
	CMPW &0x4f,%r0
	BEH l4659
	BGB l4836
	CMPW &0x44,%r0
	BEH 0x464d
	BRB l47f2
l4836:
	CMPW &0x58,%r0
	BEH l4646
	BRB l47f2
l483f:
	CMPW &0x64,%r0
	BEH l464d
	BRB l47f2
l4848:
	CMPW &0x75,%r0
	BEH l4652
	BGB l485a
	CMPW &0x73,%r0
	BEH l45cf
	BRB l47f2
l485a:
	CMPW &0x78,%r0
	BEH l4646
	BRB l47f2
	BRB l47f2  # .byte	0
l4865:
	BRB l4885
	MOVB *0(%ap),{uword}%r0
	PUSHW %r0
	PUSHW $0x20011e8
	CALL -8(%sp),$0x48b8
	TSTW %r0
	BGEB l4885
	MOVW &0x1,40(%fp)
	#NOP
l4885:
	INCW (%ap)
	#NOP
	.byte	0x2b, 0xda, 0x00	# TSTB *0(%ap) # as adds NOP
	BNEH l451e
	CMPW &0x1,40(%fp)
	BNEB l48a9
	PUSHW &0xa
	PUSHW $0x20011e8
	CALL -8(%sp),$0x48b8
	MOVW &-1,%r0
	BRB l48ae
l48a9:
	MOVW &0x1,%r0
	BRB l48ae
l48ae:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP
	NOP
 
 
###############################################################################
## Unknown routine, but used by 'printf'
##
l48b8:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x04, 0x00, 0x00, 0x00, 0x4c # ADDW2 &0x4,%sp
	CALL (%sp),$0x62de
	ADDW3 &0x2,$0x4a4,%r0
	.byte	0x2b, 0x50	# TSTB (%r0) # as adds #NOP
	BEB l48e7
	ADDW3 &0x4,$0x4a4,%r0
	CMPB &0x1,(%r0)
	BNEB l48e7
	JMP $0x4a63
l48e7:
	MOVB 3(%ap),{uhalf}%r0
	MOVH %r0,2(%fp)
	#NOP
	CMPW $0x20011e8,4(%ap)
	BEB l48fe
	.byte	0x24, 0x7f, 0xf0, 0x49, 0x00, 0x00	# JMP l49f0
l48fe:
	.byte	0x2b, 0x7f, 0x68, 0x08, 0x00, 0x02	# TSTB $0x2000868 # as adds NOP
	BEB l490c
	.byte	0x24, 0x7f, 0xf0, 0x49, 0x00, 0x00	# JMP l49f0
l490c:
	ADDW3 &0x1,4(%ap),%r0
	BITB (%r0),&0x1
	BNEB l491b
	.byte	0x24, 0x7f, 0xf0, 0x49, 0x00, 0x00	# JMP l49f0
l491b:
	ADDW3 &0x1,4(%ap),%r0
	BITB (%r0),&0x80
	BEB l4973
	ADDW3 &0x2,4(%ap),%r0
	MOVB &0x40,(%r0)
	#NOP
	ADDW3 &0x2,4(%ap),%r0
	MOVB &0x50,(%r0)
	#NOP
	ADDW3 &0x3,4(%ap),%r0
	MOVB (%r0),{uhalf}%r0
	MOVH %r0,(%fp)
	#NOP
	BRB l4964
l4946:
	ADDW3 &0x2,4(%ap),%r0
	MOVB &0x40,(%r0)
	#NOP
	ADDW3 &0x2,4(%ap),%r0
	MOVB &0x50,(%r0)
	#NOP
	ADDW3 &0x3,4(%ap),%r0
	MOVB (%r0),{uhalf}%r0
	MOVH %r0,(%fp)
	#NOP
l4964:
	ADDW3 &0x1,4(%ap),%r0
	BITB (%r0),&0x1
	BNEB l4946
	MOVH &-1,2(%fp)
	#NOP
	.byte	0x7b, 0x7f	#BRB l49f0  XXX out of range
l4973:
	ADDW3 &0x3,4(%ap),%r0
	CMPB &0x13,(%r0)
	BNEB l49f0
	BRB l4985
l497e:
	CALL (%sp),$0x62de
l4985:
	ADDW3 &0x1,4(%ap),%r0
	BITB (%r0),&0x1
	BEB l497e
	ADDW3 &0x1,4(%ap),%r0
	BITB (%r0),&0x80
	BEB l49e4
	ADDW3 &0x2,4(%ap),%r0
	MOVB &0x40,(%r0)
	#NOP
	ADDW3 &0x2,4(%ap),%r0
	MOVB &0x50,(%r0)
	#NOP
	ADDW3 &0x3,4(%ap),%r0
	MOVB (%r0),{uhalf}%r0
	MOVH %r0,(%fp)
	#NOP
	BRB l49d7
l49b9:
	ADDW3 &0x2,4(%ap),%r0
	MOVB &0x40,(%r0)
	#NOP
	ADDW3 &0x2,4(%ap),%r0
	MOVB &0x50,(%r0)
	#NOP
	ADDW3 &0x3,4(%ap),%r0
	MOVB (%r0),{uhalf}%r0
	MOVH %r0,(%fp)
	#NOP
l49d7:
	ADDW3 &0x1,4(%ap),%r0
	BITB (%r0),&0x1
	BNEB l49b9
	MOVH &-1,2(%fp)
	#NOP
l49e4:
	ADDW3 &0x3,4(%ap),%r0
	MOVB (%r0),{uhalf}%r0
	MOVH %r0,(%fp)
	#NOP
l49f0:
	BRB l49f9
l49f2:
	CALL (%sp),$0x62de
l49f9:
	ADDW3 &0x1,4(%ap),%r0
	BITB (%r0),&0x4

	BEB l49f2
	CMPW $0x20011e8,4(%ap)
	BNEB l4a34
	ADDW3 &0x3,4(%ap),%r0

## Write a single character out (R0 here contains address 49003)
	MOVB 3(%ap),(%r0)
	#NOP
	CMPB &0xa,3(%ap)
	BNEB l4a32
	BRB l4a21
l4a1a:
	CALL (%sp),$0x62de
l4a21:
	ADDW3 &0x1,4(%ap),%r0
	BITB (%r0),&0x4
	BEB l4a1a
	ADDW3 &0x3,4(%ap),%r0
	MOVB &0xd,(%r0)
	#NOP
l4a32:
	BRB l4a4b
l4a34:
	CMPB &0xa,3(%ap)
	BNEB l4a43
	ADDW3 &0x3,4(%ap),%r0
	MOVB &0xd,(%r0)
	#NOP
	BRB l4a4b
l4a43:
	ADDW3 &0x3,4(%ap),%r0
	MOVB 3(%ap),(%r0)
	#NOP
l4a4b:
	BRB l4a54
l4a4d:
	CALL (%sp),$0x62de
l4a54:
	ADDW3 &0x1,4(%ap),%r0
	BITB (%r0),&0x4
	BEB l4a4d
	MOVH 2(%fp),{word}%r0
	BRB l4adc
	MOVB 3(%ap),{uword}%r0
	PUSHW %r0
	CALL -4(%sp),$0x586a
	MOVH %r0,(%fp)
	#NOP
	CMPH &-1,(%fp)
	BNEB l4a80
	MOVH (%fp),{word}%r0
	BRB l4adc
l4a80:
	CMPH &0x13,(%fp)
	BNEB l4a9c
	BRB l4a8e
l4a87:
	CALL (%sp),$0x62de
l4a8e:
	PUSHW &0x1
	CALL -4(%sp),$0x56f8
	TSTW %r0
	BEB l4a87
l4a9c:
	CMPB &0xa,3(%ap)
	BNEB l4ad6
	PUSHW &0xd
	CALL -4(%sp),$0x586a
	MOVH %r0,(%fp)
	#NOP
	CMPH &-1,(%fp)
	BNEB l4aba
	MOVH (%fp),{word}%r0
	BRB l4adc
l4aba:
	CMPH &0x13,(%fp)
	BNEB l4ad6
	BRB l4ac8
l4ac1:
	CALL (%sp),$0x62de
l4ac8:
	PUSHW &0x1
	CALL -4(%sp),$0x56f8
	TSTW %r0
	BEB l4ac1
l4ad6:
	MOVH (%fp),{word}%r0
	BRB l4adc
l4adc:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET

##############################################################################
## 'sscanf' Routine
##
 
l4ae3:
	NOP
l4ae4:
	SAVE %r5
	.byte	0x9c, 0x4f, 0x1c, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x1c,%sp
	MOVAW 8(%ap),8(%fp)
	#NOP
	JMP $0x4cc4
l4af7:
	CLRW %r6
	BRB l4b08
l4afb:
	.byte	0x2b, 0xda, 0x04	# TSTB *4(%ap) # as adds NOP
	BNEB l4b05
	MOVW &0x1,%r6
	BRB l4b0e
l4b05:
	INCW 4(%ap)
	#NOP
l4b08:
	CMPB &0x25,*4(%ap)
	BNEB l4afb
l4b0e:
	TSTW %r6
	BEB l4b18
	JMP $0x4cca
l4b18:
	BRB l4b1d
l4b1a:
	INCW (%ap)
	#NOP
l4b1d:
	CMPB &0x20,*0(%ap)
	BNEB l4b28
	MOVW &0x1,%r0
	BRB l4b2a
l4b28:
	CLRW %r0
l4b2a:
	MOVW %r0,12(%fp)
	#NOP
	CMPB &0x9,*0(%ap)
	BNEB l4b39
	MOVW &0x1,%r0
	BRB l4b3b
l4b39:
	CLRW %r0
l4b3b:
	MOVW %r0,16(%fp)
	#NOP
	CMPB &0x2d,*0(%ap)
	BNEB l4b4b
	MOVW &0x1,%r0
	BRB l4b4d
l4b4b:
	CLRW %r0
l4b4d:
	MOVW %r0,20(%fp)
	#NOP
	CMPB &0x2c,*0(%ap)
	BNEB l4b5d
	MOVW &0x1,%r0
	BRB l4b5f
l4b5d:
	CLRW %r0
l4b5f:
	MOVW %r0,24(%fp)
	#NOP
	CMPB &0x3d,*0(%ap)
	BNEB l4b6f
	MOVW &0x1,%r0
	BRB l4b71
l4b6f:
	CLRW %r0
l4b71:
	ORW3 16(%fp),12(%fp),%r1
	ORW2 20(%fp),%r1
	ORW2 24(%fp),%r1
	ORW2 %r1,%r0
	BNEB l4b1a
	INCW 4(%ap)
	#NOP
	MOVB *4(%ap),{uword}%r0
	JMP $0x4c96
l4b91:
	MOVW (%ap),%r8
	PUSHAW (%ap)
	CALL -4(%sp),0x146(%pc)
	BRB l4bb0
l4b9e:
	MOVW *8(%fp),%r0
	#NOP
	MOVW %r8,%r1
	INCW %r8
	MOVB (%r1),(%r0)
	#NOP
	INCW *8(%fp)
	#NOP
l4bb0:
	CMPW (%ap),%r8
	BNEB l4b9e
	MOVW *8(%fp),%r0
	CLRB (%r0)
	#NOP
	.byte	0x24, 0x7f, 0xc0, 0x4c, 0x00, 0x00 # JMP l4cc0
l4bc2:
	MOVW *8(%fp),%r0
	MOVB *0(%ap),(%r0)
	#NOP
	INCW (%ap)
	#NOP
	.byte	0x24, 0x7f, 0xc0, 0x4c, 0x00, 0x00 # JMP l4cc0
l4bd4:
	MOVW &0x7,%r6
	BRB l4be5
l4bd9:
	MOVAW (%fp),%r0
	ADDW2 %r6,%r0
	MOVB &0x30,(%r0)
	#NOP
	DECW %r6
l4be5:
	TSTW %r6
	BGEB l4bd9
	MOVW (%ap),%r8
	MOVAW 7(%fp),%r7
	PUSHAW (%ap)
	CALL -4(%sp),0xeb(%pc)
	DECW (%ap)
	#NOP
l4bfa:
	MOVB *0(%ap),(%r7)
	#NOP
	CMPW %r8,(%ap)
	BNEB l4c06
	BRB l4c0d
l4c06:
	DECW %r7
	DECW (%ap)
	#NOP
	BRB l4bfa
l4c0d:
	CLRW %r5
	MOVAW (%fp),%r7
	MOVW &0x7,%r6
	BRB l4c32
l4c17:
	MOVB (%r7),{uword}%r0
	PUSHW %r0
	CALL -4(%sp),0x15f(%pc)
	LLSW3 &0x2,%r6,%r1
	LLSW3 %r1,%r0,%r0
	ORW2 %r0,%r5
	INCW %r7
	DECW %r6
l4c32:
	TSTW %r6
	BGEB l4c17
	PUSHAW (%ap)
	CALL -4(%sp),0xa4(%pc)
	CMPB &0x78,*4(%ap)
	BNEB l4c55
	.byte	0x84, 0xd9, 0x08, 0x40	# MOVW *8(%fp),%r0 # as adds NOP
	MOVW %r5,%r1
	MOVH %r1,%r1
	MOVH %r1,(%r0)
	#NOP
	BRB l4c5d
l4c55:
	MOVW *8(%fp),%r0
	MOVW %r5,(%r0)
	#NOP
l4c5d:
	BRB l4cc0
l4c5f:
	CMPB &0x64,*4(%ap)
	BNEB l4c7a
	PUSHW (%ap)
	CALL -4(%sp),$0x7ed0
	MOVW *8(%fp),%r1
	MOVH %r0,(%r1)
	#NOP
	BRB l4c8c
l4c7a:
	PUSHW (%ap)
	CALL -4(%sp),$0x7e38
	MOVW *8(%fp),%r1
	MOVW %r0,(%r1)
	#NOP
l4c8c:
	PUSHAW (%ap)
	.byte	0x2c, 0xcc, 0xfc, 0xaf, 0x4e, 0x00 	# CALL -4(%sp),0x4e(%pc)
l4c94:
	BRB l4cc0
	CMPW %r0,&0x44
	BEB l4c5f
	CMPW %r0,&0x58
	BEH l4bd4
	CMPW %r0,&0x63
	BEH l4bc2
	CMPW %r0,&0x64
	BEB l4c5f
	CMPW %r0,&0x73
	BEH l4b91
	CMPW %r0,&0x78
	BEH l4bd4
	BRB l4c94
l4cc0:
	ADDW2 &0x4,8(%fp)
	#NOP
	.byte	0x2b, 0xda, 0x04	# TSTB *4(%ap) # as adds NOP
	BNEH l4af7
	MOVAW -8(%fp),%sp
	POPW %r8
	POPW %r7
	POPW %r6
	POPW %r5
	POPW %fp
	RET
	NOP
	NOP
	NOP

################################################################################

l4cdc:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x14, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x14,%sp
	BRB l4ceb
l4ce7:
	INCW *0(%ap)
	#NOP
l4ceb:
	MOVW *0(%ap),%r0
	CMPB &0x20,(%r0)
	BEB l4cf9
	MOVW &0x1,%r0
	BRB l4cfb
l4cf9:
	CLRW %r0
l4cfb:
	MOVW %r0,(%fp)
	#NOP
	MOVW *0(%ap),%r0
	CMPB &0x9,(%r0)
	BEB l4d0d
	MOVW &0x1,%r0
	BRB l4d0f
l4d0d:
	CLRW %r0
l4d0f:
	MOVW %r0,4(%fp)
	#NOP
	MOVW *0(%ap),%r0
	CMPB &0x2d,(%r0)
	BEB l4d21
	MOVW &0x1,%r0
	BRB l4d23
l4d21:
	CLRW %r0
l4d23:
	MOVW %r0,8(%fp)
	#NOP
	MOVW *0(%ap),%r0
	CMPB &0x2c,(%r0)
	BEB l4d35
	MOVW &0x1,%r0
	BRB l4d37
l4d35:
	CLRW %r0
l4d37:
	MOVW %r0,12(%fp)
	#NOP
	MOVW *0(%ap),%r0
	.byte	0x2b, 0x50	# TSTB (%r0) # as adds #NOP
	BEB l4d48
	MOVW &0x1,%r0
	BRB l4d4a
l4d48:
	CLRW %r0
l4d4a:
	MOVW %r0,16(%fp)
	#NOP
	MOVW *0(%ap),%r0
	CMPB &0x3d,(%r0)
	BEB l4d5d
	MOVW &0x1,%r0
	BRB l4d5f
l4d5d:
	CLRW %r0
l4d5f:
	ANDW3 4(%fp),(%fp),%r1
	ANDW2 8(%fp),%r1
	ANDW2 12(%fp),%r1
	ANDW2 16(%fp),%r1
	BITW %r1,%r0
	BNEH l4ce7
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP

################################################################################
l4d7c:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x04, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x4,%sp
	CMPB &0x39,3(%ap)
	BGUB l4d8f
	MOVW &0x1,%r0
	BRB l4d91
l4d8f:
	CLRW %r0
l4d91:
	MOVW %r0,(%fp)
	#NOP
	CMPB &0x30,3(%ap)
	BLUB l4d9f
	MOVW &0x1,%r0
	BRB l4da1
l4d9f:
	CLRW %r0
l4da1:
	BITW %r0,(%fp)
	BEB l4db0
	SUBB3 &0x30,3(%ap),%r0
	MOVB %r0,{uword}%r0
	BRB l4dcb
l4db0:
	CMPB &0x61,3(%ap)
	BLUB l4dc1
	SUBB3 &0x57,3(%ap),%r0
	MOVB %r0,{uword}%r0
	BRB l4dcb
l4dc1:
	SUBB3 &0x37,3(%ap),%r0
	MOVB %r0,{uword}%r0
	BRB l4dcb
l4dcb:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP

################################################################################
## 'getedt' Routine
## 
 
l4dd4:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x08, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x8,%sp
	MOVB 7(%ap),{uword}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	MOVW %r0,4(%fp)
	#NOP
	CLRW (%fp)
	#NOP
	BRB l4e08
l4df5:
	MOVW (%ap),%r0
	INCW (%ap)
	#NOP
	MOVW 4(%fp),%r1
	INCW 4(%fp)
	#NOP
	MOVB (%r1),(%r0)
	#NOP
	INCW (%fp)
	#NOP
l4e08:
	CMPW &0x20,(%fp)
	BLUB l4df5
	MOVAW -24(%fp),%sp
	POPW %fp
	RET

################################################################################

l4e14:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x08, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x8,%sp
	PUSHW &0x0
	CALL -4(%sp),0x3b3(%pc)
	.byte	0xa0, 0x4f, 0x80, 0x0b, 0x00, 0x00	# PUSHW &0l80
	CALL -4(%sp),printf
	TSTW %r0
	BGEB l4e3d
	JMP $0x51c0
l4e3d:
	MOVW *$0x4e4,4(%fp)
	#NOP

## printf ("System Board memory size: ")
	PUSHW &lba1
	CALL -4(%sp),printf
	TSTW %r0
	BGEB l4e5d
	JMP $0x51c0
l4e5d:
	CMPW &0x100000,4(%fp)
	BLB l4e8a

## printf ("%d megabyte(s)")
	PUSHW &lbbc # lbbc: "%d megabyte(s)"

	LRSW3 &0x14,*$0x4e4,%r0
	PUSHW %r0

	CALL -8(%sp),printf



	TSTW %r0
	BGEB l4e88
	JMP $0x51c0
l4e88:
	BRB l4eac
l4e8a:

## printf ("%d kilobytes")
	PUSHW &lbcb

	LRSW3 &0xa,*$0x4e4,%r0
	PUSHW %r0

	CALL -8(%sp),printf


	TSTW %r0
	BGEB l4eac
	JMP $0x51c0
l4eac:
	CLRB (%fp)
	#NOP
	JMP $0x51a8
l4eb5:

## printf ("\n\n%02d - device name = %-9s, ")
	PUSHW &lbd8

	MOVB (%fp),{uword}%r0
	PUSHW %r0

	MOVB (%fp),{uword}%r0
	LLSW3 &0x5,%r0,%r0
	.byte	0x9c, 0x7f, 0x90, 0x04, 0x00, 0x00, 0x40	# ADDW2 $0x490,%r0
	ADDW2 &0xc,%r0
	PUSHW %r0

	CALL -12(%sp),printf


	TSTW %r0
	BGEB l4ee7
	JMP $0x51c0
l4ee7:

## printf ("occurrence = %2d, slot = %02d, ID code = 0x%02x\n")
	PUSHW &lbf6

	MOVB (%fp),{uword}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	EXTFW &0x3,&0x8,(%r0),%r0
	PUSHW %r0

	MOVB (%fp),{uword}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	EXTFW &0x3,&0xc,(%r0),%r0
	PUSHW %r0

	MOVB (%fp),{uword}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	EXTFW &0xf,&0x10,(%r0),%r0
	PUSHW %r0

	CALL -16(%sp),printf



	TSTW %r0
	BGEB l4f41
	JMP $0x51c0
l4f41:

## printf ("     boot device = %c, board width = %s, word width = %d byte(s),\n")
	PUSHW &lc27

	MOVB (%fp),{uword}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	EXTFW &0x0,&0x7,4(%r0),%r0
	CMPW &0x0,%r0
	BEB l4f67
	MOVW &0x79,%r0
	BRB l4f6b
l4f67:
	MOVW &0x6e,%r0
l4f6b:
	PUSHW %r0

	MOVB (%fp),{uword}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	EXTFW &0x0,&0x5,4(%r0),%r0
	CMPW &0x0,%r0
	BEB l4f90
	MOVW &lc6a,%r0	# "double"
	BRB l4f97
l4f90:
	MOVW &lc71,%r0	# "single"
l4f97:
	PUSHW %r0

	MOVB (%fp),{uword}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	EXTFW &0x0,&0x6,4(%r0),%r0
	ADDW2 &0x1,%r0
	PUSHW %r0

	CALL -16(%sp),printf



	TSTW %r0
	BGEB l4fc5
	JMP $0x51c0
l4fc5:

## printf ("     req Q size = 0x%02x, comp Q size = 0x%02x, ")
	PUSHW &lc78

	MOVB (%fp),{uword}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	EXTFW &0x7,&0x0,(%r0),%r0
	PUSHW %r0

	MOVB (%fp),{uword}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	EXTFW &0x7,&0x18,4(%r0),%r0
	PUSHW %r0

	CALL -12(%sp),printf



	TSTW %r0
	BGEB l500a
	JMP $0x51c0
l500a:

## printf ("console ability = %c")
	PUSHW &lca9
	MOVB (%fp),{uword}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	EXTFW &0x0,&0x9,4(%r0),%r0
	CMPW &0x0,%r0
	BEB l5030
	MOVW &0x79,%r0
	BRB l5034
l5030:
	MOVW &0x6e,%r0
l5034:
	PUSHW %r0
	CALL -8(%sp),printf
	TSTW %r0
	BGEB l5048
	JMP $0x51c0
l5048:
	MOVB (%fp),{uword}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	EXTFW &0x0,&0x9,4(%r0),%r0
	CMPW &0x0,%r0
	BEB l50a2
	PUSHW &lcbe	# ", pump file = %c"
	MOVB (%fp),{uword}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	EXTFW &0x0,&0x8,4(%r0),%r0
	CMPW &0x0,%r0
	BEB l5088
	MOVW &0x79,%r0
	BRB l508c
l5088:
	MOVW &0x6e,%r0
l508c:
	PUSHW %r0
	CALL -8(%sp),printf
	TSTW %r0
	BGEB l50a0
	JMP $0x51c0
l50a0:
	BRB l50ba
l50a2:

## printf ("               ")
	PUSHW &lccf
	CALL -4(%sp),printf
	TSTW %r0
	BGEB l50ba
	JMP $0x51c0
l50ba:
	CLRB 1(%fp)
	#NOP
	JMP $0x5154
l50c3:
	.byte	0x2b, 0x61	# TSTB 1(%fp) as adds NOP
	BNEB l50df

## printf ("\n     subdevice(s)")
	PUSHW &lcdf
	CALL -4(%sp),printf


	TSTW %r0
	BGEB l50df
	JMP $0x51c0
l50df:


## printf ("%s#%02d = %-9s, ID code = 0x%02x")
	PUSHW &lcf2

	MOVB 1(%fp),{uword}%r0
	MODW2 {uword}&0x2,%r0
	BNEB l50f8
	MOVW &ld13,%r0	# "\n     "
	BRB l50ff
l50f8:
	MOVW &ld1a,%r0	# ", "
l50ff:
	PUSHW %r0

	MOVB 1(%fp),{uword}%r0
	PUSHW %r0
	MOVB (%fp),{uword}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	.byte	0xeb, 0x0c, 0x61, 0x41	# MULB3 &0xc,1(%fp),%r1
	ADDW3 %r1,8(%r0),%r0
	ADDW2 &0x2,%r0
	PUSHW %r0

	MOVB (%fp),{uword}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	.byte	0xeb, 0x0c, 0x61, 0x41	# MULB3 &0xc,1(%fp),%r1
	ADDW3 %r1,8(%r0),%r0
	MOVH {uhalf}(%r0),{uword}%r0
	PUSHW %r0

	CALL -20(%sp),printf



	TSTW %r0
	BGEB l5151
	BRB l51c0
l5151:
	INCB 1(%fp)
	#NOP
	MOVB 1(%fp),{uword}%r0
	MOVB (%fp),{uword}%r1
	LLSW3 &0x5,%r1,%r1
	ADDW2 $0x490,%r1
	EXTFW &0x3,&0x0,4(%r1),%r1
	CMPW %r1,%r0
	BLUH l50c3
	MOVB (%fp),{uword}%r0
	SUBB3 &0x1,*$0x4e0,%r1
	CMPW %r1,%r0
	BGEUB l51a5

## printf ("\n\nPress any key to continue")
	PUSHW &ld1d
	CALL -4(%sp),printf

	TSTW %r0
	BGEB l5198
	BRB l51c0
l5198:
	BRB l519a
l519a:
	CALL (%sp),*$0x4c8
	TSTW %r0
	BEB l519a
l51a5:
	INCB (%fp)
	#NOP
	CMPB *$0x4e0,(%fp)
	BLUH l4eb5

## printf ("\nDONE\n")
	PUSHW &ld3a
	CALL -4(%sp),printf



l51c0:
	PUSHW &0x1
	.byte	0x2c, 0xcc, 0xfc, 0xaf, 0x10, 0x00	# CALL -4(%sp),0x10(%pc)
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP
	NOP

################################################################################
## 'brkinh' - Break Inhibit routine
##

l51d2:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x04, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x4,%sp
	MOVB 3(%ap),$0x2000868
	#NOP
	.byte	0x2b, 0x73	# TSTB 3(%ap) # as adds NOP
	BNEB l521c
	BRB l520f
l51e9:
	ADDW3 &0x2,$0x20011e8,%r0
	MOVB &0x40,(%r0)
	#NOP
	ADDW3 &0x2,$0x20011e8,%r0
	MOVB &0x50,(%r0)
	#NOP
	ADDW3 &0x3,$0x20011e8,%r0
	MOVB (%r0),(%fp)
	#NOP
l520f:
	ADDW3 &0x1,$0x20011e8,%r0
	BITB (%r0),&0x1
	BNEB l51e9
l521c:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP

################################################################################
## 'rnvram' - Routine to read NVRAM
##
##  (%ap) = NVRAM address to read from
## 4(%ap) = Address to write to
## 8(%ap) = Length
 
l5224:
	SAVE %r8
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	.byte	0xf8, 0x5f, 0x00, 0xf0, 0x5a, 0x40	# ANDW3 &0xf000,(%ap),%r0

	ANDW3 &0xfff,(%ap),%r1
	LLSW3 &0x3,%r1,%r1
	ADDW2 %r1,%r0
	MOVW %r0,%r8
	BRB l526d
l5245:
	MOVW %r8,%r0
	ADDW2 &0x4,%r8
	ANDB3 &0xf,3(%r0),%r0
	MOVB %r0,*4(%ap)
	#NOP
	MOVW 4(%ap),%r0
	INCW 4(%ap)
	#NOP
	MOVW %r8,%r1
	ADDW2 &0x4,%r8
	ANDW3 &0xf,(%r1),%r1
	LLSW3 &0x4,%r1,%r1
	ORB2 %r1,(%r0)
	#NOP
l526d:
	MOVH 10(%ap),%r0
	DECH 10(%ap)
	#NOP
	MOVH {uhalf}%r0,{uword}%r0
	BNEB l5245
	CLRW $0x2001270
	#NOP
	PUSHW $0x2001270
	BSBB l528b
	BRB l5294
l528b:
	PUSHW %ap
	SUBW3 &0xc,%sp,%ap
## Call "chknvram"
	BRH l5320
l5294:
	BRB l5296
l5296:
	MOVAW -20(%fp),%sp
	POPW %r8
	POPW %fp
	RET
	NOP
 
################################################################################
## 'wnvram' - Routine to write NVRAM
##
l52a0:
	SAVE %r8
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	.byte	0xf8, 0x5f, 0x00, 0xf0, 0x74, 0x40	# ANDW3 &0xf000,4(%ap),%r0
	ANDW3 &0xfff,4(%ap),%r1
	LLSW3 &0x3,%r1,%r1
	ADDW2 %r1,%r0
	MOVW %r0,%r8
	BRB l52ea
l52c1:
	MOVW %r8,%r0
	ADDW2 &0x4,%r8
	ANDB3 &0xf,*0(%ap),%r1
	MOVW %r1,(%r0)
	#NOP
	MOVW %r8,%r0
	ADDW2 &0x4,%r8
	MOVW (%ap),%r1
	INCW (%ap)
	#NOP
	ANDB3 &0xf0,(%r1),%r1
	LRSW3 &0x4,%r1,%r1
	MOVW %r1,(%r0)
	#NOP
l52ea:
	MOVH 10(%ap),%r0
	DECH 10(%ap)
	#NOP
	MOVH {uhalf}%r0,{uword}%r0
	BNEB l52c1
	MOVW &0x1,$0x2001270
	#NOP
	PUSHW $0x2001270
	BSBB l5309
	BRB l5312
l5309:
	PUSHW %ap
	SUBW3 &0xc,%sp,%ap
	BRH l5320
l5312:
	BRB l5314
l5314:
	MOVAW -20(%fp),%sp
	POPW %r8
	POPW %fp
	RET
	NOP
	NOP
	NOP

################################################################################ 
## 'chknvram' - Routine to check NVRAM
##
## This appears to be called only from 'rnvram' and 'wnvram'
##
 
l5320:
	SAVE %r7
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	CLRH %r8
	MOVW &0x43000,%r7
	BRB l5372
l5334:
	MOVH {uhalf}%r8,{uword}%r0
	MOVH {uhalf}2(%r7),{uword}%r1
	ANDH2 &0xf,%r1
	MOVH {uhalf}%r1,{uword}%r1
	ADDW2 %r1,%r0
	MOVH %r0,%r8
	MOVH {uhalf}%r8,{uword}%r0
	LLSW3 &0x1,%r0,%r0
	MOVH {uhalf}%r0,{uword}%r0
	MOVH {uhalf}%r8,{uword}%r1
	LRSW3 &0xf,%r1,%r1
	MOVH {uhalf}%r1,{uword}%r1
	ORW2 %r1,%r0
	MOVH %r0,%r8
	ADDW2 &0x4,%r7
l5372:
	CMPW &0x43800,%r7
	BLUB l5334
	MOVH {uhalf}%r8,{uword}%r0
	MCOMW %r0,%r0
	MOVH %r0,%r8
	CMPB &0x1,3(%ap)
	BNEB l53ca
	MOVH {uhalf}%r8,{uword}%r0
	ANDW2 &0xf,%r0
	MOVW %r0,(%r7)
	#NOP
	MOVH {uhalf}%r8,{uword}%r0
	LRSW3 &0x4,%r0,%r0
	ANDW2 &0xf,%r0
	MOVW %r0,4(%r7)
	#NOP
	MOVH {uhalf}%r8,{uword}%r0
	LRSW3 &0x8,%r0,%r0
	ANDW2 &0xf,%r0
	MOVW %r0,8(%r7)
	#NOP
	MOVH {uhalf}%r8,{uword}%r0
	LRSW3 &0xc,%r0,%r0
	ANDW2 &0xf,%r0
	MOVW %r0,12(%r7)
	#NOP
l53ca:
	MOVH {uhalf}%r8,{uword}%r0
	MOVH {uhalf}2(%r7),{uword}%r1
	ANDH2 &0xf,%r1
	MOVH {uhalf}%r1,{uword}%r1
	ANDW3 &0xf,4(%r7),%r2
	LLSW3 &0x4,%r2,%r2
	MOVH {uhalf}%r2,{uword}%r2
	ORW2 %r2,%r1
	MOVH {uhalf}%r1,{uword}%r1
	ANDW3 &0xf,8(%r7),%r2
	LLSW3 &0x8,%r2,%r2
	MOVH {uhalf}%r2,{uword}%r2
	ORW2 %r2,%r1
	MOVH {uhalf}%r1,{uword}%r1
	ANDW3 &0xf,12(%r7),%r2
	LLSW3 &0xc,%r2,%r2
	MOVH {uhalf}%r2,{uword}%r2
	ORW2 %r2,%r1
	MOVH {uhalf}%r1,{uword}%r1
	CMPW %r1,%r0
	BNEB l5429
	MOVW &0x1,%r0
	BRB l542d
l5429:
	CLRW %r0
	BRB l542d
l542d:
	MOVAW -16(%fp),%sp
	POPW %r8
	POPW %r7
	POPW %fp
	RET

################################################################################
## 'bzero' - Routine to zero memory
##

	MOVW (%ap),%r0
	MOVW 4(%ap),%r2
	ARSW3 &0x2,%r2,%r2
	CLRW (%r0)
	#NOP
	DECW %r2
	BLEB l544f
	MOVAW 4(%r0),%r1
	MOVBLW
l544f:
	RET

################################################################################
## 'setjmp' Routine
##

	MOVW (%ap),%r0
	#NOP
	TSTW %r0
	BNEB l545f
	MOVAW $0x2001274,%r0
l545f:
	MOVW %r3,(%r0)
	#NOP
	MOVW %r4,4(%r0)
	#NOP
	MOVW %r5,8(%r0)
	#NOP
	MOVW %r6,12(%r0)
	#NOP
	MOVW %r7,16(%r0)
	#NOP
	MOVW %r8,20(%r0)
	#NOP
	MOVW -4(%sp),24(%r0)
	#NOP
	MOVW -8(%sp),28(%r0)
	#NOP
	MOVW %ap,32(%r0)
	#NOP
	MOVW %fp,36(%r0)
	#NOP
	MOVW 12(%pcbp),40(%r0)
	#NOP
	MOVW 16(%pcbp),44(%r0)
	#NOP
	CLRW %r0
	RET

################################################################################
## 'longjmp' Routine
##

	MOVW (%ap),%r0
	#NOP
	TSTW %r0
	BNEB l54b0
	MOVAW $0x2001274,%r0
l54b0:
	MOVW (%r0),%r3
	MOVW 4(%r0),%r4
	MOVW 8(%r0),%r5
	MOVW 12(%r0),%r6
	MOVW 16(%r0),%r7
	MOVW 20(%r0),%r8
	MOVW 24(%r0),%ap
	MOVW 28(%r0),%r1
	MOVW 32(%r0),%sp
	MOVW 36(%r0),%fp
	MOVW 40(%r0),12(%pcbp)
	#NOP
	MOVW 44(%r0),16(%pcbp)
	#NOP
	CLRW %r0
	INCW %r0
	JMP (%r1)
	NOP
	NOP
	NOP

################################################################################
## Interrupt handler inserted by the UART delay routine
## at 0x552c.  If interrupted, put 1 into 20012a4
 
l54ec:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	MOVB &0x1,$0x20012a4
	#NOP
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
 
################################################################################
## 'hwcntr' - DUART Delay Routine
##

l5504:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	MOVH {uhalf}2(%ap),{uword}%r0
	PUSHW %r0
	.byte	0xa0, 0x5f, 0xff, 0x08	# PUSHW &0x8ff
	.byte	0x2c, 0xcc, 0xf8, 0xaf, 0x14, 0x00	# CALL -8(%sp),0x14(%pc)
	MOVH {uhalf}%r0,{uword}%r0
	BRB l5525
l5525:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET

################################################################################
## Run the UART counter for a specific delay, waiting for an interrupt.
##
## On interrupt, transfer control to the routine pointed at by the
## pointer held in 0x494 (i.e., 0x494 is a pointer-to-a-pointer)
##
 
l552c:
	SAVE %fp
## Increment stack pointer by 2 words.
	.byte	0x9c, 0x4f, 0x08, 0x00, 0x00, 0x00, 0x4c # ADDW2 &0x8,%sp
## Clear the byte at 0x20012a4
	CLRB $0x20012a4
	#NOP
## Move current interrupt handler to fp + 1 word
	MOVW *$0x494,4(%fp)
	#NOP
## Set interrupt handler to 0x54ec
	.byte	0x84, 0x4f, 0xec, 0x54, 0x00, 0x00, 0xef, 0x94, 0x04, 0x00, 0x00	# MOVW &0x54ec,*$0x494
	NOP

## 2001254
## R0 = (*0x2001254 | 0x30) (setting bits 5 & 6)
	ORB3 &0x30,$0x2001254,%r0

## Put a word into the auxiliary control register of the UART.
## Assuming this value is 0x30, that means we're asking the
## counter/timer to be a counter with an external source,
## divided by 16.
	MOVB %r0,$0x49004
	#NOP

##
	BRB l55c2
## Stop the UART timer (read from reg 15 = "Stop Counter"
l5562:
	MOVB $0x4900f,(%fp)
	#NOP

##
## The next block of code sets the UART counter value to 0x8ff
##

## Put the argument (0x8ff) into r0
	MOVH {uhalf}6(%ap),{uword}%r0
## Shift it right by 8 bits (get the high byte)
	LRSW3 &0x8,%r0,%r0
## Write it to the upper-value of the timer (it gets 0x8)
	MOVB %r0,$0x49006
	#NOP
## Mask the lower byte of the timer (0xff)
	ANDB3 &0xff,7(%ap),%r0
## Write it to the lower-value of the timer
	MOVB %r0,$0x49007
	#NOP
## Start the timer again (write to register 14 = "Start Counter")
	MOVB $0x4900e,(%fp)
	#NOP
## Go off to check the timer interrupt status
	BRB l55b9

## Jump point. Calls our mysterious timer / soft power inhibit routine 0x62de
l5593:
	CALL (%sp),$0x62de
## Set Z and N based on contents of 0x20012a4
	.byte	0x2b, 0x7f, 0xa4, 0x12, 0x00, 0x02	# TSTB $0x20012a4 # as adds NOP
## If 20012a4 == 0, jump to 0x55b9
	BEB l55b9
## On the other hand, if it's not 0, start the counter
	MOVB $0x4900f,(%fp)
	#NOP
## Write the new interrupt handler
	MOVW 4(%fp),*$0x494
	#NOP
## Store the argument into R0
	MOVH {uhalf}2(%ap),{uword}%r0
## Branch to 0x55e3 and return.
	BRB l55e3

## See if bit 3 ("Counter Ready") is set in the UART's interrupt
## status register.
l55b9:
	BITB $0x49005,&0x8

## If it isn't, jump back to 0x5593
	BEB l5593

## If it's not, it means the timer is expired....
l55c2:
	MOVH 2(%ap),%r0
	DECH 2(%ap)
	#NOP
## Check the value of R0.
	MOVH {uhalf}%r0,{uword}%r0
## If R0 != 0, jump back to 5562
	BNEB l5562
## On the other hand, if R0 == 0, we return.
	MOVB $0x4900f,(%fp)
	#NOP
	MOVW 4(%fp),*$0x494
	#NOP
	CLRW %r0
	BRB l55e3
l55e3:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP

################################################################################
## 'fw_sysgen' - Generic 'sysgen' routine
##
 
l55ec:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x08, 0x00, 0x00, 0x00, 0x4c # ADDW2 &0x8,%sp
	CLRB 4(%fp)
	#NOP
	MOVW *$0x494,$0x20012c8
	#NOP
	.byte	0x84, 0x4f, 0x00, 0x5d, 0x00, 0x00, 0xef, 0x94, 0x04, 0x00, 0x00	# MOVW &0x5d00,*$0x494
	NOP
	#NOP
	EXTFW &0x3,&0xd,%psw,$0x20012c4
	#NOP
	.byte	0xc8, 0x03, 0x0d, 0x0f, 0x4b	# INSFW &0x3,&0xd,&0xf,%psw # as adds NOP
	MOVW &0x20012b8,$0x2000000
	#NOP
	MOVW &0x20037f4,$0x20012b8
	#NOP
	MOVW &0x20037ec,$0x20012bc
	#NOP
	MOVB &0x2,$0x20012c0
	#NOP
	MOVB &0x2,$0x20012c1
	#NOP
	MOVB &0x1,$0x20012c3
	#NOP
	PUSHW &0x20037ec
	PUSHW &0x814
	CALL -8(%sp),*$0x518
	PUSHW &0x14
	CALL -4(%sp),*$0x528 # DUART Delay
	LLSW3 &0x15,(%ap),%r0
	MOVB 1(%r0),{uword}(%fp)
	#NOP
	PUSHW &0x14
	CALL -4(%sp),*$0x528 # DUART Delay
	LLSW3 &0x15,(%ap),%r0
	MOVB 3(%r0),{uword}(%fp)
	#NOP
	CLRW (%fp)
	#NOP
	BRB l56b7
l569b:
	CMPB &0x3,$0x20037ef
	BNEB l56aa
	MOVB &0x1,4(%fp)
	#NOP
	BRB l56bd
l56aa:
	PUSHW &0x1
	CALL -4(%sp),*$0x528 # DUART Delay
	INCW (%fp)
	#NOP
l56b7:
	CMPW &0x64,(%fp)
	BLUB l569b
l56bd:
	CMPW &0x64,(%fp)
	BLUB l56dc
	LLSW3 &0x15,(%ap),%r0
	MOVB &0x1,5(%r0)
	#NOP
	PUSHW &0x14
	CALL -4(%sp),*$0x528 # DUART Delay
	MOVB 4(%fp),{uword}%r0
	BRB l56ef
## Call 0x5D3E
l56dc:
	CALL (%sp),0x662(%pc)
	CMPW &0x1,%r0
	BEB l56e9
	CLRB 4(%fp)
	#NOP
l56e9:
	MOVB 4(%fp),{uword}%r0
	BRB l56ef
l56ef:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP

################################################################################

l56f8:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x04, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x4,%sp
	MOVW *$0x494,$0x20012c8
	#NOP
	.byte	0x84, 0x4f, 0x00, 0x5d, 0x00, 0x00, 0xef, 0x94, 0x04, 0x00, 0x00	# MOVW &0x5d00,*$0x494
	NOP
	#NOP
	EXTFW &0x3,&0xd,%psw,$0x20012c4
	#NOP
	.byte	0xc8, 0x03, 0x0d, 0x0f, 0x4b	# INSFW &0x3,&0xd,&0xf,%psw # as adds NOP
	MOVB &0x8,$0x20037f7
	#NOP
	CMPB &0x1,3(%ap)
	BNEB l574c
	ADDW3 &0x3,$0x4a4,%r0
	ORB3 &0x20,(%r0),%r0
	MOVB %r0,$0x20037f6
	#NOP
	BRB l5763
l574c:
	ADDW3 &0x3,$0x4a4,%r0
	MOVB (%r0),$0x20037f6
	#NOP
	MOVB $0x20037f6,%r0
l5763:
	MOVB $0x2000868,{uword}$0x20037f8
	#NOP
	MOVB &0xff,$0x20037ef
	#NOP
	ADDW3 &0x2,$0x4a4,%r0
	MOVB (%r0),{uword}%r0
	LLSW3 &0x15,%r0,%r0
	MOVB 1(%r0),{uhalf}%r0
	MOVH %r0,(%fp)
	#NOP
	CLRH (%fp)
	#NOP
	JMP $0x5856
l579c:
	PUSHW &0x1
	PUSHW &0xe6
	CALL -8(%sp),$0x552c
	CMPB &0xff,$0x20037ef
	BEB l581d
	.byte	0x2b, 0x7f, 0xef, 0x37, 0x00, 0x02	# TSTB $0x20037ef # as adds NOP
	BNEB l5807
	CALL (%sp),0x581(%pc)
	CMPW &0x1,%r0
	BEB l57dd
	MOVW &0xfeedbeef,*$0x48c
	#NOP
	MOVB &0x1,$0x4400b
	#NOP
l57db:
	BRB l57db
l57dd:
	MOVH {uhalf}$0x20037ec,{uword}%r0
	ANDH2 &0xff,%r0
	MOVH %r0,2(%fp)
	#NOP
	MOVH {uhalf}2(%fp),{uword}%r0
	CMPW &0xff,%r0
	BNEB l5800
	MOVW &-1,%r0
	BRB l5805
l5800:
	MOVH {uhalf}2(%fp),{uword}%r0
l5805:
	BRB l5862
l5807:
	MOVW &0xfeedbeef,*$0x48c
	#NOP
	MOVB &0x1,$0x4400b
	#NOP
l581b:
	BRB l581b
l581d:
	MOVH {uhalf}(%fp),{uword}%r0
	CMPW &0x64,%r0
	BLUB l5845
	CALL (%sp),$0x62de
	MOVW &0xfeedbeef,*$0x48c
	#NOP
	MOVB &0x1,$0x4400b
	#NOP
l5843:
	BRB l5843
l5845:
	CMPB &0x1,3(%ap)
	BNEB l584f
	INCH (%fp)
	#NOP
	BRB l5856
l584f:
	CALL (%sp),$0x62de
l5856:
	MOVH {uhalf}(%fp),{uword}%r0
	CMPW &0x64,%r0
	BLUH l579c
l5862:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP

################################################################################

l586a:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x04, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x4,%sp
	MOVW *$0x494,$0x20012c8
	#NOP
	.byte	0x84, 0x4f, 0x00, 0x5d, 0x00, 0x00, 0xef, 0x94, 0x04, 0x00, 0x00	# MOVW &0x5d00,*$0x494
	NOP
	#NOP
	EXTFW &0x3,&0xd,%psw,$0x20012c4
	#NOP
	.byte	0xc8, 0x03, 0x0d, 0x0f, 0x4b	# INSFW &0x3,&0xd,&0xf,%psw # as adds NOP
	MOVB &0x9,$0x20037f7
	#NOP
	ADDW3 &0x3,$0x4a4,%r0
	MOVB (%r0),$0x20037f6
	#NOP
	MOVB 3(%ap),{uhalf}%r0
	MOVH %r0,$0x20037f4
	#NOP
	MOVB &0xff,$0x20037ef
	#NOP
	MOVB $0x2000868,{uword}$0x20037f8
	#NOP
	ADDW3 &0x2,$0x4a4,%r0
	MOVB (%r0),{uword}%r0
	LLSW3 &0x15,%r0,%r0
	MOVB 1(%r0),{uhalf}%r0
	MOVH %r0,(%fp)
	#NOP
	CLRH (%fp)
	#NOP
	JMP $0x59b2
l58f8:
	PUSHW &0x1
	PUSHW &0xe6
	CALL -8(%sp),$0x552c
	CMPB &0xff,$0x20037ef
	BEB l5987
	.byte	0x2b, 0x7f, 0xef, 0x37, 0x00, 0x02	# TSTB $0x20037ef # as adds NOP
	BNEB l596a
	CALL (%sp),0x425(%pc)
	CMPW &0x1,%r0
	BEB l5940
	CALL (%sp),$0x62de
	MOVW &0xfeedbeef,*$0x48c
	#NOP
	MOVB &0x1,$0x4400b
	#NOP
l593e:
	BRB l593e
l5940:
	MOVH {uhalf}$0x20037ec,{uword}%r0
	ANDH2 &0xff,%r0
	MOVH %r0,2(%fp)
	#NOP
	MOVH {uhalf}2(%fp),{uword}%r0
	CMPW &0xff,%r0
	BNEB l5963
	MOVW &-1,%r0
	BRB l5968
l5963:
	MOVH {uhalf}2(%fp),{uword}%r0
l5968:
	BRB l59be
l596a:
	CALL (%sp),$0x62de
	MOVW &0xfeedbeef,*$0x48c
	#NOP
	MOVB &0x1,$0x4400b
	#NOP
l5985:
	BRB l5985
l5987:
	MOVH {uhalf}(%fp),{uword}%r0
	CMPW &0x64,%r0
	BLUB l59af
	CALL (%sp),$0x62de
	MOVW &0xfeedbeef,*$0x48c
	#NOP
	MOVB &0x1,$0x4400b
	#NOP
l59ad:
	BRB l59ad
l59af:
	INCH (%fp)
	#NOP
	MOVH {uhalf}(%fp),{uword}%r0
	CMPW &0x64,%r0
	BLUH l58f8
l59be:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP

################################################################################

l59c6:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x10, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x10,%sp
	CLRB 4(%fp)
	#NOP
	MOVW *$0x494,$0x20012c8
	#NOP
	.byte	0x84, 0x4f, 0x00, 0x5d, 0x00, 0x00, 0xef, 0x94, 0x04, 0x00, 0x00	# MOVW &0x5d00,*$0x494
	NOP
	#NOP
	EXTFW &0x3,&0xd,%psw,$0x20012c4
	#NOP
	.byte	0xc8, 0x03, 0x0d, 0x0f, 0x4b	# INSFW &0x3,&0xd,&0xf,%psw # as adds NOP
	MOVB &0x7,$0x20037f7
	#NOP
	MOVB 7(%ap),$0x20037f6
	#NOP
	MOVB &0xff,$0x20037ef
	#NOP
	MOVAW 8(%fp),$0x20037f8
	#NOP
	MOVH *$0x4a4,8(%fp)
	#NOP
	CLRB 12(%fp)
	#NOP
	MOVB 3(%ap),{uword}%r0
	LLSW3 &0x15,%r0,%r0
	MOVB 1(%r0),{uword}(%fp)
	#NOP
	CLRW (%fp)
	#NOP
	BRB l5a95
l5a3a:
	PUSHW &0x1
	CALL -4(%sp),*$0x528 # DUART Delay
	.byte	0x2b, 0x7f, 0xef, 0x37, 0x00, 0x02	# TSTB $0x20037ef # as adds NOP
	BNEB l5a72
	MOVB &0x1,4(%fp)
	#NOP
	ADDW3 &0x3,$0x4a4,%r0
	MOVB 11(%fp),(%r0)
	#NOP
	ADDW3 &0x4,$0x4a4,%r0
	MOVB &0x1,(%r0)
	#NOP
	MOVH 8(%fp),*$0x4a4
	#NOP
	BRB l5a9b
l5a72:
	CMPW &0x64,(%fp)
	BLUB l5a92
	CLRB 4(%fp)
	#NOP
	MOVB 3(%ap),{uword}%r0
	LLSW3 &0x15,%r0,%r0
	MOVB &0x1,5(%r0)
	#NOP
	PUSHW &0x14
	CALL -4(%sp),*$0x528 # DUART Delay
l5a92:
	INCW (%fp)
	#NOP
l5a95:
	CMPW &0x64,(%fp)
	BLUB l5a3a
l5a9b:
	CALL (%sp),0x2a3(%pc)
	CMPW &0x1,%r0
	BEB l5abf
	CLRB 4(%fp)
	#NOP
	MOVB 3(%ap),{uword}%r0
	LLSW3 &0x15,%r0,%r0
	MOVB &0x1,5(%r0)
	#NOP
	PUSHW &0x14
	CALL -4(%sp),*$0x528 # DUART Delay
l5abf:
	MOVB 4(%fp),{uword}%r0
	BRB l5ac5
l5ac5:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP

################################################################################

l5ace:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x08, 0x00, 0x00, 0x00, 0x4c # ADDW2 &0x8,%sp
	MOVB 3(%ap),{uword}%r0
	LLSW3 &0x15,%r0,%r0
	MOVB &0x1,5(%r0)
	#NOP
	PUSHW &0x14
	CALL -4(%sp),*$0x528 # DUART Delay
	MOVB 3(%ap),{uword}%r0
	PUSHW %r0
	.byte	0x2c, 0xcc, 0xfc, 0xaf, 0xf8, 0xfa	# CALL -4(%sp),0xfaf8(%pc)
	TSTW %r0
	BNEB l5b06
	CLRW %r0
	JMP $0x5ba3
l5b06:
	MOVW *$0x494,$0x20012c8
	#NOP
	.byte	0x84, 0x4f, 0x00, 0x5d, 0x00, 0x00, 0xef, 0x94, 0x04, 0x00, 0x00	# MOVW &0x5d00,*$0x494
	NOP
	#NOP
	EXTFW &0x3,&0xd,%psw,$0x20012c4
	#NOP
	.byte	0xc8,0x03,0x0d,0x0f,0x4b	# INSFW &0x3,&0xd,&0xf,%psw # as adds NOP
	MOVB &0xa,$0x20037f7
	#NOP
	MOVB 7(%ap),$0x20037f6
	#NOP
	MOVB &0xff,$0x20037ef
	#NOP
	MOVB 3(%ap),{uword}%r0
	LLSW3 &0x15,%r0,%r0
	MOVB 1(%r0),{uword}4(%fp)
	#NOP
	CLRW 4(%fp)
	#NOP
	BRB l5b8a
l5b5b:
	PUSHW &0x1
	CALL -4(%sp),*$0x528 # DUART Delay
	CMPB &0xff,$0x20037ef
	BEB l5b87
	.byte	0x2b, 0x7f, 0xef, 0x37, 0x00, 0x02	# TSTB $0x20037ef # as adds NOP
	BNEB l5b82
	MOVW $0x20037f0,(%fp)
	#NOP
	BRB l5b91
l5b82:
	CLRW (%fp)
	#NOP
	BRB l5b91
l5b87:
	INCW 4(%fp)
	#NOP
l5b8a:
	CMPW &0x7530,4(%fp)
	BLB l5b5b
l5b91:
	CALL (%sp),0x1ad(%pc)
	TSTW %r0
	BEB l5b9f
	MOVW (%fp),%r0
	BRB l5ba3
l5b9f:
	CLRW %r0
	BRB l5ba3
l5ba3:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET

################################################################################
## 'ioblk_acs' Routine
##
 
l5baa:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x08, 0x00, 0x00, 0x00, 0x4c # ADDW2 &0x8,%sp
	#NOP
	EXTFW &0x3,&0xd,%psw,$0x20012c4
	#NOP
	.byte	0xc8, 0x03, 0x0d, 0x0f, 0x4b	# INSFW &0x3,&0xd,&0xf,%psw # as adds NOP
	MOVW *$0x494,$0x20012c8
	#NOP
	.byte	0x84, 0x4f, 0x00, 0x5d, 0x00, 0x00, 0xef, 0x94, 0x04, 0x00, 0x00	# MOVW &0x5d00,*$0x494
	NOP
	CLRB (%fp)
	#NOP
	MOVW 4(%ap),$0x20012b0
	#NOP
	MOVW 8(%ap),$0x20012b4
	#NOP
	CMPB &0x1,15(%ap)
	BNEB l5bfe
	MOVB &0xc,$0x20037f7
	#NOP
	BRB l5c2b
l5bfe:
	.byte	0x2b, 0xca, 0x0f	# TSTB 15(%ap) # as adds NOP
	BNEB l5c0d
	MOVB &0xb,$0x20037f7
	#NOP
	BRB l5c2b
l5c0d:
	MOVW $0x20012c8,*$0x494
	#NOP
	.byte	0xc8, 0x03, 0x0d, 0x7f, 0xc4, 0x12, 0x00, 0x02, 0x4b	# INSFW &0x3,&0xd,$0x20012c4,%psw # as adds NOP
	MOVW &0x0,%r0
	JMP $0x5cf9
l5c2b:
	ANDB3 &0xf0,3(%ap),%r0
	LRSW3 &0x4,%r0,%r0
	MOVB %r0,2(%fp)
	#NOP
	.byte	0x2b, 0x62	# TSTB 2(%fp) # as adds NOP
	BNEB l5c45
	CLRW %r0
	.byte	0x24, 0x7f, 0xf9, 0x5c, 0x00, 0x00	# JMP $0x5cf9
l5c45:
	ANDB3 &0xf,3(%ap),%r0
	MOVB %r0,1(%fp)
	#NOP
	MOVB 1(%fp),$0x20037f6
	#NOP
	MOVW &0x20012b0,$0x20037f8
	#NOP
	MOVB &0xff,$0x20037ef
	#NOP
	MOVB 2(%fp),{uword}%r0
	LLSW3 &0x15,%r0,%r0
	MOVB 1(%r0),{uword}4(%fp)
	#NOP
	CLRW 4(%fp)
	#NOP
	BRB l5ca9
l5c7e:
	PUSHW &0x1
	CALL -4(%sp),*$0x528 # DUART Delay
	CMPB &0xff,$0x20037ef
	BEB l5ca6
	.byte	0x2b, 0x7f, 0xef, 0x37, 0x00, 0x02	# TSTB $0x20037ef # as adds NOP
	BNEB l5ca1
	MOVB &0x1,(%fp)
	#NOP
	BRB l5cb0
l5ca1:
	CLRB (%fp)
	#NOP
	BRB l5cb0
l5ca6:
	INCW 4(%fp)
	#NOP
l5ca9:
	CMPW &0x2328,4(%fp)
	BLB l5c7e
l5cb0:
	CALL (%sp),0x8e(%pc)
	TSTW %r0
	BEB l5cbd
	.byte	0x2b, 0x59	# TSTB (%fp) # as adds NOP
	BNEB l5cf4
l5cbd:

## printf ("PERIPHERAL I/O %s ERROR AT BLOCK %d, SUBDEVICE %d, SLOT %d\n")
	PUSHW &ld44

## read/write?
	.byte	0x2b, 0xca, 0x0f	# TSTB 15(%ap) # as adds NOP
	BNEB l5cd1
	MOVW &ld80,%r0	# "READ"
	BRB l5cd8
l5cd1:
	MOVW &ld85,%r0	# "WRITE"
l5cd8:
	PUSHW %r0

## block #
	PUSHW 4(%ap)

## subdevice #
	MOVB 1(%fp),{uword}%r0
	PUSHW %r0

## slot #
	MOVB 2(%fp),{uword}%r0
	PUSHW %r0

	CALL -20(%sp),printf


	CLRW %r0
	BRB l5cf9
l5cf4:
	MOVW &0x1,%r0
	BRB l5cf9
l5cf9:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET

################################################################################
## Unknown Routine
##

l5d00:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	.byte	0xc8, 0x03, 0x0d, 0x0f, 0x4b	# INSFW &0x3,&0xd,&0xf,%psw # as adds NOP
	CALL (%sp),$0x62de
	MOVH {uhalf}$0x44002,{uword}%r0
	BITW %r0,&0x7e
	BEB l5d2e
	MOVH &0x1,$0x20012ce
	#NOP
	BRB l5d35
l5d2e:
	CLRH $0x20012cc
	#NOP
l5d35:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP

################################################################################
## Routine that appears to print error messages during sysgen.
## Called by: 0x56DC (fw_sysgen)

l5d3e:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x04, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x4,%sp
	MOVH &0x1,$0x20012cc
	#NOP
	CLRW (%fp)
	#NOP
	CLRH $0x20012ce
	#NOP
l5d59:
	.byte	0xc8, 0x03, 0x0d, 0x00, 0x4b	# INSFW &0x3,&0xd,&0x0,%psw # as adds NOP
	NOP
	NOP
	NOP
	NOP
	.byte	0xc8, 0x03, 0x0d, 0x0f, 0x4b	# INSFW &0x3,&0xd,&0xf,%psw # as adds NOP
	MOVH {uhalf}$0x20012cc,{uword}%r0
	BNEB l5d8c
	MOVW $0x20012c8,*$0x494
	#NOP
	.byte	0xc8, 0x03, 0x0d, 0x7f, 0xc4, 0x12, 0x00, 0x02, 0x4b	# INSFW &0x3,&0xd,$0x20012c4,%psw # as adds NOP
	MOVW &0x1,%r0
	BRB l5dd7
l5d8c:
	CMPW &0xff,(%fp)
	BLEB l5dad
	MOVW $0x20012c8,*$0x494
	#NOP
	.byte	0xc8, 0x03, 0x0d, 0x7f, 0xc4, 0x12, 0x00, 0x02, 0x4b	# INSFW &0x3,&0xd,$0x20012c4,%psw # as adds NOP
	MOVW &0x0,%r0
	BRB l5dd7
l5dad:
	MOVH {uhalf}$0x20012ce,{uword}%r0
	BEB l5dd2
	MOVW $0x20012c8,*$0x494
	#NOP
	.byte	0xc8, 0x03, 0x0d, 0x7f, 0xc4, 0x12, 0x00, 0x02, 0x4b	# INSFW &0x3,&0xd,$0x20012c4,%psw # as adds NOP
	MOVW &0x0,%r0
	BRB l5dd7
l5dd2:
	INCW (%fp)
	#NOP
	.byte	0x7b, 0x84	# BRB l5d59 XXX out of range
l5dd7:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP


################################################################################
## Unknown Routine
##

l5de0:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	CALL (%sp),0x189(%pc)
	MOVB &0x1,*$0x4c4
	#NOP
	BITW $0x200085c,&0x20000000
	BEB l5e25

## printf ("\nFW ERROR 1-%s\n")
	PUSHW &ld8c

	PUSHW &ldc0	# "01: NVRAM SANITY FAILURE"

	CALL -8(%sp),printf


## printf ("               DEFAULT VALUES ASSUMED\n               IF REPEATED, CHECK THE BATTERY\n")
	PUSHW &ldd9
	CALL -4(%sp),printf


l5e25:
	BITW $0x200085c,&0x40000000
	BEB l5e40

## printf ("\nFW WARNING: NVRAM DEFAULT VALUES ASSUMED\n\n")
	PUSHW &le2e
	CALL -4(%sp),printf
l5e40:
	BITW $0x200085c,&0x2
	BEB l5e5d

## printf ("\nFW ERROR 1-%s\n")
	PUSHW &ld8c

	PUSHW &le5a	# "02: DISK SANITY FAILURE"
	CALL -8(%sp),printf

l5e5d:
	BITW $0x200085c,&0x1
	BEB l5e7a

## printf ("\nFW ERROR 1-%s\n")
	PUSHW &ld8c
	PUSHW &le72	# "05: SELF-CONFIGURATION FAILURE"
	CALL -8(%sp),printf

l5e7a:
	BITW $0x200085c,&0x4
	BEB l5e97

## printf ("\nFW ERROR 1-%s\n")
	PUSHW &ld8c
	PUSHW &le91	# "06: BOOT FAILURE"
	CALL -8(%sp),printf


l5e97:
	BITW $0x200085c,&0x20
	BEB l5eb4

## printf ("\nFW ERROR 1-%s\n", "07: FLOPPY KEY CREATE FAILURE")
	PUSHW &ld8c
	PUSHW &lea2	# "07: FLOPPY KEY CREATE FAILURE"
	CALL -8(%sp),printf

l5eb4:
	BITW $0x200085c,&0x8
	BEB l5ed1

## printf ("\nFW ERROR 1-%s\n", "08: MEMORY TEST FAILURE")
	PUSHW &ld8c
	PUSHW &lec0	# "08: MEMORY TEST FAILURE"
	CALL -8(%sp),printf
l5ed1:
	BITW $0x200085c,&0x10
	BEB l5eee

## printf ("\nFW ERROR 1-%s\n", "09: DISK FORMAT NOT COMPATIBLE WITH SYSTEM")
	PUSHW &ld8c
	PUSHW &led8	# "09: DISK FORMAT NOT COMPATIBLE WITH SYSTEM"
	CALL -8(%sp),printf

l5eee:
	.byte	0x28, 0x7f, 0x5c, 0x08, 0x00, 0x02	# TSTW $0x200085c # as adds NOP
	BEB l5f17
	CMPW &0x1000000,$0x200085c # as adds NOP
	BGEUB l5f17

## printf ("%s", "               EXECUTION HALTED\n")
	PUSHW &lf03	# "%s"
	PUSHW &ld9c	# "               EXECUTION HALTED\n"
	CALL -8(%sp),printf

l5f17:
	CMPW &0x80000000,$0x200085c
	BNEB l5f4b
	CMPW &0xfeedbeef,$0x2000864
	BEB l5f4b

## printf ("\n\nSELF-CHECK\n")
	PUSHW &lf06
	CALL -4(%sp),printf

	ANDW2 &0x7fffffff,$0x200085c
	#NOP
l5f4b:
	ADDW3 &0x4,$0x4a4,%r0
	CMPB &0x1,(%r0)
	BNEB l5f5f
	CLRW $0x200085c
	#NOP
l5f5f:
	PUSHW &0x1
	CALL -4(%sp),*$0x528 # DUART Delay
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP

################################################################################
## Unknown Routine
##

l5f72:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x04, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x4,%sp
	MOVB &0x1,$0x44003
	#NOP
	MOVB &0x1,$0x44007
	#NOP
	MOVB &0x1,$0x4400f
	#NOP
	MOVB &0x1,$0x4403f
	#NOP
	MOVB &0x1,$0x44037
	#NOP
	MOVB &0x1,$0x4800d
	#NOP
	MOVB $0x49011,(%fp)
	#NOP
	MOVB $0x4d000,(%fp)
	#NOP
	MOVB &0x56,$0x4200f
	#NOP
	MOVB $0x42013,(%fp)
	#NOP
	MOVB &0x1,$0x44027
	#NOP
	MOVB &0x1,$0x4402f
	#NOP
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP
	NOP

################################################################################
## Unknown Routine
##

l5fe6:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x10, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x10,%sp
	PUSHW &0x431ec
	PUSHAW (%fp)
	PUSHW &0x4
	CALL -12(%sp),$0x5224
	CMPW &0x600dbeef,(%fp)
	BEB l6010
	.byte	0x24, 0x7f, 0x4e, 0x61, 0x00, 0x00	# JMP $0x614e
l6010:
	PUSHW &0x431f0
	PUSHAW (%fp)
	PUSHW &0x4
	CALL -12(%sp),$0x5224
	.byte	0x28, 0x59	# TSTW (%fp) # as adds NOP
	BNEB l603a

## printf ("\nNONE\n\n")
	PUSHW &lf14
	CALL -4(%sp),printf

	.byte	0x24, 0x7f, 0xb9, 0x61, 0x00, 0x00	# JMP $0x61b9
l603a:
	BITW (%fp),&0x40
	BNEB l604d
	BITW (%fp),&0x80
	BNEB l604d
	.byte	0x24, 0x7f, 0xd0, 0x60, 0x00, 0x00	# JMP $0x60d0
l604d:
	PUSHW &0x431f4
	PUSHAW 8(%fp)
	PUSHW &0x4
	CALL -12(%sp),$0x5224
	PUSHW &0x431f8
	PUSHAW 4(%fp)
	PUSHW &0x4
	CALL -12(%sp),$0x5224
	PUSHW &0x431fc
	PUSHAW 12(%fp)
	PUSHW &0x4
	CALL -12(%sp),$0x5224
	BITW (%fp),&0x40
	BEB l60a7

## printf ("\nEXCEPTION, PC = 0x%08x, PSW = 0x%08x, CSR = 0x%04x\n\n")
	PUSHW &lf1c
## PC
	PUSHW 4(%fp)
## PSW
	PUSHW 8(%fp)
## CSR
	ANDW3 &0xffff,12(%fp),%r0
	PUSHW %r0

	CALL -16(%sp),printf



	BRB l60ce
l60a7:

## printf ("\nINTERRUPT, PC = 0x%08x, PSW = 0x%08x, CSR = 0x%04x, LVL = %d\n\n")
	PUSHW &lf52
# PC
	PUSHW 4(%fp)
# PSW
	PUSHW 8(%fp)
# CSR
	ANDW3 &0xffff,12(%fp),%r0
	PUSHW %r0
# LVL
	LRSW3 &0x10,12(%fp),%r0
	ANDW2 &0xff,%r0
	PUSHW %r0

	CALL -20(%sp),printf



l60ce:
	BRB l614c
	BITW (%fp),&0x2
	BEB l614c

## printf ("\nSANITY ON DISK %d, ERROR %d\n")
	PUSHW &lf92

# disk #
	LRSW3 &0x17,(%fp),%r0
	ANDW2 &0x1,%r0
	PUSHW %r0
# error #
	LRSW3 &0x10,(%fp),%r0
	ANDW2 &0x7f,%r0
	PUSHW %r0

	CALL -12(%sp),printf



	PUSHW &0x431fc
	PUSHAW 12(%fp)
	PUSHW &0x4
	CALL -12(%sp),$0x5224
	.byte	0x28, 0x6c	# TSTW 12(%fp) # as adds NOP
	BEB l613e

## printf ("COMMAND = 0x%02x, UNIT STATUS = 0x%02x, ERROR STATUS = 0x%02x, STATUS = 0x%02x")
	PUSHW &lfb0
# command
	LRSW3 &0x18,12(%fp),%r0
	PUSHW %r0
# unit status
	LRSW3 &0x10,12(%fp),%r0
	ANDW2 &0xff,%r0
	PUSHW %r0
# error status
	LRSW3 &0x8,12(%fp),%r0
	ANDW2 &0xff,%r0
	PUSHW %r0
#status
	ANDW3 &0xff,12(%fp),%r0
	PUSHW %r0

	CALL -20(%sp),printf



l613e:

## printf ("\n\n")
	PUSHW &lfff
	CALL -4(%sp),printf

l614c:
	BRB l615c

## printf ("\n\nNONE\n\n")
	PUSHW &l1002
	CALL -4(%sp),printf

l615c:
	CLRW (%fp)
	#NOP
	PUSHAW (%fp)
	PUSHW &0x431f0
	PUSHW &0x4
	CALL -12(%sp),$0x52a0
	PUSHAW (%fp)
	PUSHW &0x431f4
	PUSHW &0x4
	CALL -12(%sp),$0x52a0
	PUSHAW (%fp)
	PUSHW &0x431f8
	PUSHW &0x4
	CALL -12(%sp),$0x52a0
	PUSHAW (%fp)
	PUSHW &0x431fc
	PUSHW &0x4
	CALL -12(%sp),$0x52a0
	PUSHAW (%fp)
	PUSHW &0x431ec
	PUSHW &0x4
	CALL -12(%sp),$0x52a0
	MOVAW -24(%fp),%sp
	POPW %fp
	RET

################################################################################
## Unknown Routine
##

## We're called with the flag for "DISK SANITY FAILURE" (0x10000) already
## set in %ap. Seems to get set at 0x6e93
##

l61c0:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x0c, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0xc,%sp
	PUSHW &0x431ec
	PUSHAW 4(%fp)
	PUSHW &0x4
	CALL -12(%sp),$0x5224
	CMPW &0x600dbeef,4(%fp)
	BNEB l61f8
	PUSHW &0x431f0
	PUSHAW (%fp)
	PUSHW &0x4
	CALL -12(%sp),$0x5224
	BRB l6200
l61f8:
	MOVW $0x200085c,(%fp)
	#NOP
l6200:
	CLRW 4(%fp)
	#NOP
	PUSHAW 4(%fp)
	PUSHW &0x431ec
	PUSHW &0x4
	CALL -12(%sp),$0x52a0
	ORW2 (%ap),(%fp)
	#NOP
	MOVW (%fp),$0x200085c
	#NOP
	PUSHAW (%fp)
	PUSHW &0x431f0
	PUSHW &0x4
	CALL -12(%sp),$0x52a0
	BITW (%ap),&0x40
	BNEB l6240
	BITW (%ap),&0x80
	BEB l62a1
l6240:
	PUSHW &0x2001258
	PUSHW &0x431f4
	PUSHW &0x4
	CALL -12(%sp),$0x52a0
	PUSHW &0x200125c
	PUSHW &0x431f8
	PUSHW &0x4
	CALL -12(%sp),$0x52a0
	MOVH {uhalf}$0x44002,{uword}8(%fp)
	#NOP
	BITW (%ap),&0x80
	BEB l628d
	MOVB $0x2001260,{uword}%r0
	LLSW3 &0x10,%r0,%r0
	ORW2 %r0,8(%fp)
	#NOP
l628d:
	PUSHAW 8(%fp)
	PUSHW &0x431fc
	PUSHW &0x4
	CALL -12(%sp),$0x52a0
	BRB l62bc
l62a1:
	BITW (%ap),&0x2
	BEB l62bc
	PUSHW &0x20012d4
	PUSHW &0x431fc
	PUSHW &0x4
	CALL -12(%sp),$0x52a0
l62bc:
	MOVW &0x600dbeef,4(%fp)
	#NOP
	PUSHAW 4(%fp)
	PUSHW &0x431ec
	PUSHW &0x4
	CALL -12(%sp),$0x52a0
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP


################################################################################
## Unknown Routine -- checks interval timer and soft power inhibit.
##
 
l62de:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
 
## Check soft power inhibit (*510 = 020012d0)
	CMPB &0x1,*$0x510
	BEB l6319
 
## Check programmable interval timer (8253)
	CMPB &0x64,$0x42003
## Interval timer is OK, skip terminal condition and return.
	BEB l6319
 
## Clear some state and enter a terminal condition
	CLRW *$0x48c
	#NOP
	CLRW *$0x514
	#NOP
	CLRB $0x4900d
	#NOP
	MOVB &0x4,$0x4900e
	#NOP
## Terminal condition - infinite loop
l6317:
	BRB l6317

## Return
l6319:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP

################################################################################
## Terminal Halt. Enter an infinite loop on 0x633F.
##
 
l6322:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	CALL (%sp),-77(%pc)
	MOVW (%ap),*$0x48c
	#NOP
	MOVB &0x1,$0x4400b
	#NOP
l633f:
	BRB l633f
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP

################################################################################
## Terminal Halt. Enter an infinite loop on 0x6363.
##

l634a:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	MOVW &0xfeedbeef,*$0x48c
	#NOP
	.byte	0x2c, 0x5c, 0xaf, 0x81, 0xfa	# CALL (%sp),0xfa81(%pc)
	MOVB &0x1,$0x4400b
	#NOP
l636c:
	BRB l636c
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP
	NOP

################################################################################

l6378:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x04, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x4,%sp
	ADDW3 &0x2,$0x4a4,%r0
	.byte	0x2b, 0x50	# TSTB (%r0) # as adds NOP
	BNEB l6396
	MOVW &0x1,%r0
	.byte	0x24, 0x7f, 0xe5, 0x64, 0x00, 0x00	# JMP $0x64e5
l6396:
	MOVH &0x1,(%fp)
	#NOP
	BRB l63c7
l639c:
	MOVH {uhalf}(%fp),{uword}%r0
	LLSW3 &0x5,%r0,%r0
	ADDW2 $0x490,%r0
	EXTFW &0x3,&0xc,(%r0),%r0
	ADDW3 &0x2,$0x4a4,%r1
	MOVB (%r1),{uword}%r1
	CMPW %r1,%r0
	BNEB l63c4
	BRB l63d9
l63c4:
	INCH (%fp)
	#NOP
l63c7:
	MOVH {uhalf}(%fp),{uword}%r0
	MOVB *$0x4e0,{uword}%r1
	CMPW %r1,%r0
	BLUB l639c
l63d9:
	MOVH {uhalf}(%fp),{uword}%r0
	MOVB *$0x4e0,{uword}%r1
	CMPW %r1,%r0
	BLUB l6413
	ADDW3 &0x2,$0x4a4,%r0
	CLRB (%r0)
	#NOP
	ADDW3 &0x3,$0x4a4,%r0
	CLRB (%r0)
	#NOP
	MOVH &0x4bd,*$0x4a4
	#NOP
	CLRW %r0
	.byte	0x24, 0x7f, 0xe5, 0x64, 0x00, 0x00	# JMP $0x64e5
l6413:
	ADDW3 &0x2,$0x4a4,%r0
	MOVB (%r0),{uword}%r0
	LLSW3 &0x15,%r0,%r0
	MOVB &0x1,5(%r0)
	#NOP
	PUSHW &0x14
	CALL -4(%sp),*$0x528 # DUART Delay
	ADDW3 &0x2,$0x4a4,%r0
	MOVB (%r0),{uword}%r0
	PUSHW %r0
	CALL -4(%sp),$0x55ec
	CMPW &0x1,%r0
	BEB l6453
	.byte	0x24, 0x7f, 0xe1, 0x64, 0x00, 0x00	# JMP $0x64e1
l6453:
	ADDW3 &0x2,$0x4a4,%r0
	MOVB (%r0),{uword}%r0
	PUSHW %r0
	ADDW3 &0x3,$0x4a4,%r0
	MOVB (%r0),{uword}%r0
	PUSHW %r0
	CALL -8(%sp),$0x59c6
	CMPW &0x1,%r0
	BNEB l64e1
	ADDW3 &0x4,$0x4a4,%r0
	MOVB &0x1,(%r0)
	#NOP
	MOVH *$0x4a4,(%fp)
	#NOP
	PUSHAW (%fp)
	PUSHW &0x43080
	PUSHW &0x2
	CALL -12(%sp),$0x52a0
	ADDW3 &0x2,$0x4a4,%r0
	MOVB (%r0),{uword}%r0
	LLSW3 &0x4,%r0,%r0
	ANDB2 &0xf0,%r0
	ADDW3 &0x3,$0x4a4,%r1
	ANDB3 &0xf,(%r1),%r1
	ORB2 %r1,%r0
	MOVB %r0,2(%fp)
	#NOP
	PUSHAW 2(%fp)
	PUSHW &0x43009
	PUSHW &0x1
	CALL -12(%sp),$0x52a0
	MOVW &0x1,%r0
	BRB l64e5
l64e1:
	CLRW %r0
	BRB l64e5
l64e5:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET

################################################################################

l64ec:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	CALL (%sp),*$0x20011f8
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP

################################################################################

l6504:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	PUSHW &0x80
	CALL -4(%sp),$0x61c0

## printf ("\nFW ERROR 1-%s\n")
	PUSHW &ld8c

## printf ("04: UNEXPECTED INTERRUPT\n")
	PUSHW &l100c
	CALL -8(%sp),printf


# ; Print the string "EXECUTION HALTED"
	PUSHW &ld9c	# "               EXECUTION HALTED\n"
	CALL -4(%sp),printf
	PUSHW &0xfeedbeef
	CALL -4(%sp),$0x6322
	MOVAW -24(%fp),%sp
	POPW %fp
	RET

################################################################################
## Unknown procedure. Currently of interest becuase it is called by
## the only 100% confirmed interrupt handler, "demon", at 0x421f.
##

l6550:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	ANDW3 &0x3,$0x2001258,%r0
	CMPW &0x3,%r0
	BNEB l6595
	ANDW3 &0x78,$0x2001258,%r0
	CMPW &0x70,%r0
	BEB l6583
	ANDW3 &0x78,$0x2001258,%r0
	CMPW &0x8,%r0
	BNEB l658c
l6583:
	CALL (%sp),*$0x20012d8
	BRB l6593
l658c:
	CALL (%sp),*$0x20011f4
l6593:
	BRB l659c
l6595:
	CALL (%sp),*$0x20011f4
l659c:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP

################################################################################
## Unknown Exception Handler
##

l65a4:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	PUSHW &0x40
	CALL -4(%sp),$0x61c0

## printf ("\nFW ERROR 1-%s\n", "03: UNEXPECTED FAULT\n")
	PUSHW &ld8c
	PUSHW &l1028	# "03: UNEXPECTED FAULT\n"
	CALL -8(%sp),printf


## Print the string "EXECUTION HALTED"
	PUSHW &ld9c	# "               EXECUTION HALTED\n"
	CALL -4(%sp),printf
	PUSHW &0xfeedbeef
	CALL -4(%sp),$0x6322
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP

################################################################################
##
##

l65f0:
	SAVE %r8
	.byte	0x9c, 0x4f, 0x74, 0x00, 0x00, 0x00, 0x4c 	# ADDW2 &0x74,%sp
	MOVB &0x1,*$0x4c4
	#NOP
	.byte	0x84, 0x4f, 0x04, 0x65, 0x00, 0x00, 0x7f, 0xf8, 0x11, 0x00, 0x02	# MOVW &0x6504,$0x20011f8
	NOP
	.byte	0x84, 0x4f, 0xa4, 0x65, 0x00, 0x00, 0x7f, 0xf4, 0x11, 0x00, 0x02	# MOVW &0x65a4,$0x20011f4
	NOP
	MOVW $0x20011f4,$0x20012d8
	#NOP
	CMPW &0xfeedbeef,$0x2000864
	BEB l6639
	.byte	0x84, 0x4f, 0x00, 0x00, 0x80, 0x00, 0x4b	# MOVW &0x800000,%psw # as adds NOP
l6639:
	MOVW $0x2000864,%r8
	CMPW &0xfeedbeef,$0x2000864
	BEB l6660
	CMPW &0xadebac1e,$0x2000864
	BEB l6660
	.byte	0x24, 0x7f, 0x38, 0x68, 0x00, 0x00	# JMP $0x6838
l6660:
	MOVW &0x3b02f1d0,$0x2000864
	#NOP
	PUSHW &0x43000
	PUSHAW 100(%fp)
	PUSHW &0x9
## Call 'rnvram'
	CALL -12(%sp),$0x5224
	.byte	0x2b, 0xc9, 0x64	# TSTB 100(%fp) # as adds NOP
	BNEB l66a8
	PUSHAW 100(%fp)
## This is the pointer to the default password, 'mcp'
	PUSHW &l1040	# "mcp"
	CALL -8(%sp),$0x7fb0
	PUSHAW 100(%fp)
	PUSHW &0x43000
	PUSHW &0x9
	CALL -12(%sp),$0x52a0
## Jumped back to this point from 0x6835
l66a8:
	CMPW &0x8badf00d,%r8
	BNEB l66b7
	.byte	0x24, 0x7f, 0x3c, 0x67, 0x00, 0x00	# JMP $0x673c
l66b7:
	CMPW &0xfeedbeef,%r8
	.byte	0x7f, 0x7e	# BEB l673c XXX out of range
	ADDW3 &0x4,$0x4a4,%r0
	.byte	0x2b, 0x50	# TSTB (%r0) # as adds NOP
	BNEB l673c
	PUSHW &0x4300c
	PUSHAW 110(%fp)
	PUSHW &0x1
	CALL -12(%sp),$0x5224
	TSTW %r0
	BNEB l6709
	MOVB &0x1,110(%fp)
	#NOP
	PUSHAW 110(%fp)
	PUSHW &0x4300c
	PUSHW &0x1
	CALL -12(%sp),$0x52a0
	ADDW3 &0x1,$0x4a0,%r0
	MOVB &0x1,(%r0)
	#NOP
	BRB l6716
l6709:
	ADDW3 &0x1,$0x4a0,%r0
	MOVB 110(%fp),(%r0)
	#NOP
l6716:
	CLRB *$0x4a0
	#NOP
	ADDW3 &0x2,$0x4a0,%r0
	PUSHW %r0
	PUSHW &l1044	# "/filledt"
	CALL -8(%sp),$0x7fb0
	CALL (%sp),$0x6970
l673c:
	BRB l6793
l673e:
	ADDW3 &0x2,$0x4a4,%r0
	CLRB (%r0)
	#NOP
	ADDW3 &0x3,$0x4a4,%r0
	CLRB (%r0)
	#NOP
	MOVB &0x1,$0x44013
	#NOP
	CLRW 112(%fp)
	#NOP
	BRB l6766
l6762:
	INCW 112(%fp)
	#NOP
l6766:
	CMPW &0xc350,112(%fp)
	BLB l6762
	MOVB &0x1,$0x44017
	#NOP
	CLRW 112(%fp)
	#NOP
	BRB l6782
l677e:
	INCW 112(%fp)
	#NOP
l6782:
	CMPW &0x249f0,112(%fp)
	BLB l677e
	CALL (%sp),$0x62de
l6793:
	ADDW3 &0x4,$0x4a4,%r0
	CMPB &0x1,(%r0)
	BEB l67af
	MCOMB $0x4900d,%r0
	ANDW2 &0x1,%r0
	CMPW &0x1,%r0
	BNEB l673e
l67af:
	CALL (%sp),$0x5de0
	CMPW &0xfeedbeef,%r8
	BNEB l67d7
	MOVB &0x1,$0x44013
	#NOP

## printf ("\nSYSTEM FAILURE: CONSULT YOUR SYSTEM ADMINISTRATION UTILITIES GUIDE\n\n")
	PUSHW &l104d
	CALL -4(%sp),printf


	BRB l67ed
l67d7:
	MOVB &0x1,$0x44017
	#NOP

## printf ("\nFIRMWARE MODE\n\n")
	PUSHW &l1093
	CALL -4(%sp),printf

## Call 3ab4 XXX
l67ed:
	PUSHAW (%fp)
	CALL -4(%sp),$0x3ab4
	PUSHAW (%fp)
	PUSHAW 100(%fp)
	CALL -8(%sp),$0x7f68
	TSTW %r0
	BNEB l6835
	MOVW &0xfeedbeef,$0x2000864
	#NOP
	CALL (%sp),$0x2b04
	MOVW $0x2000864,%r8
	PUSHW &0x43000
	PUSHAW 100(%fp)
	PUSHW &0x9
	CALL -12(%sp),$0x5224
## Jump back to 0x66A8
l6835:
	BRH l66a8
	PUSHW &0x4300c
	PUSHAW 110(%fp)
	PUSHW &0x1
	CALL -12(%sp),$0x5224
	TSTW %r0
	BNEB l6875
	MOVB &0x1,110(%fp)
	#NOP
	PUSHAW 110(%fp)
	PUSHW &0x4300c
	PUSHW &0x1
	CALL -12(%sp),$0x52a0
	ADDW3 &0x1,$0x4a0,%r0
	MOVB &0x1,(%r0)
	#NOP
	BRB l6882
l6875:
	ADDW3 &0x1,$0x4a0,%r0
	MOVB 110(%fp),(%r0)
	#NOP
l6882:
	CLRB *$0x4a0
	#NOP
	CMPW &0x8badf00d,%r8
	BEB l68e6
	ADDW3 &0x2,$0x4a0,%r0
	PUSHW %r0
	PUSHW &l10a4	# "/filledt"
	CALL -8(%sp),$0x7fb0
	CALL (%sp),$0x6970
	TSTW %r0
	BNEB l68bc
	CALL (%sp),$0x634a
l68bc:
	ADDW3 &0x2,$0x4a0,%r0
	PUSHW %r0
	PUSHW &l10ad	# "/dgmon"
	CALL -8(%sp),$0x7fb0
	CALL (%sp),$0x6970
	TSTW %r0
	BNEB l68e6
	CALL (%sp),$0x634a
l68e6:
	CMPW &0xfeedbeef,$0x2000864
	BEB l68fb
	MOVB &0x1,$0x44017
	#NOP
l68fb:
	PUSHW &0x4300d
	ADDW3 &0x2,$0x4a0,%r0
	PUSHW %r0
	PUSHW &0x2d
	CALL -12(%sp),$0x5224
	TSTW %r0
	BNEB l694b
	ADDW3 &0x2,$0x4a0,%r0
	PUSHW %r0
	PUSHW &l10b4	# "/unix"
	CALL -8(%sp),$0x7fb0
	ADDW3 &0x2,$0x4a0,%r0
	PUSHW %r0
	PUSHW &0x4300d
	PUSHW &0x2d
	CALL -12(%sp),$0x52a0
l694b:
	MOVB &0x2,*$0x4a0
	#NOP
	CALL (%sp),$0x6970
	CALL (%sp),$0x634a
	BRH l6639
	MOVAW -20(%fp),%sp
	POPW %r8
	POPW %fp
	RET
	NOP
	NOP
	NOP


################################################################################
## Unknown Routine
##

l6970:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x10, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x10,%sp
	CMPB &0x1,*$0x4a0
	BNEB l698f
	CMPW &0xfff0,$0x508
	BEB l69b3
l698f:
	.byte	0x84, 0x4f, 0x52, 0x6c, 0x00, 0x00, 0x7f, 0xf8, 0x11, 0x00, 0x02	# MOVW &0x6c52,$0x20011f8
	NOP
	.byte	0x84, 0x4f, 0x9e, 0x6c, 0x00, 0x00, 0x7f, 0xd8, 0x12, 0x00, 0x02	# MOVW &0x6c9e,$0x20012d8
	NOP
	MOVW $0x20012d8,$0x20011f4
	#NOP
l69b3:
	CMPW &0x3b02f1d0,$0x200086c
	BEB l6a13
	MOVW &0x3b02f1d0,$0x200086c
	#NOP
	MOVW *$0x4e4,(%fp)
	#NOP
	ADDW3 &0x2000000,*$0x4e4,%r0
	SUBW2 *$0x4e8,%r0
	LRSW3 &0x2,%r0,%r0
	MOVW %r0,(%fp)
	#NOP
	MOVW *$0x4e8,%r0
	CLRW (%r0)
	#NOP
	PUSHW (%fp)
	ADDW3 &0x4,*$0x4e8,%r0
	PUSHW %r0
	PUSHW *$0x4e8
	CALL -12(%sp),$0x4084
l6a13:
	CLRB $0x4900d
	#NOP
	MOVB &0x8,$0x4900f
	#NOP
	CALL (%sp),$0x5f72
	PUSHW &0x0
	CALL -4(%sp),*$0x540
	.byte	0x2b, 0xef, 0xa0, 0x04, 0x00, 0x00	# TSTB *$0x4a0 # as adds NOP
	BEB l6a48
	CMPW &0x8000,$0x508
	BGEB l6a56
l6a48:
	MOVW &0xfeedbeef,*$0x48c
	#NOP
	BRB l6a62
l6a56:
	MOVW &0xa11c0ded,*$0x48c
	#NOP
l6a62:
	MOVW &0x2004000,4(%fp)
	#NOP
	ADDW3 &0x1,$0x4a0,%r0
	MOVB (%r0),{uword}%r0
	LRSW3 &0x4,%r0,%r0
	MOVB %r0,9(%fp)
	#NOP
	ADDW3 &0x1,$0x4a0,%r0
	CMPB &0x1,(%r0)
	BNEB l6ad3
	MOVB &0x1,$0x4401f
	#NOP
	PUSHW &0x0
	CALL -4(%sp),$0x732c
	TSTW %r0
	BNEB l6aa9
	CLRW %r0
	.byte	0x24, 0x7f, 0x4b, 0x6c, 0x00, 0x00	# JMP $0x6c4b
l6aa9:
	PUSHW &0x0
	PUSHW $0x2000aa8
	PUSHW &0x2004000
	PUSHW &0x0
	CALL -16(%sp),$0x7698
	TSTW %r0
	BNEB l6acd
	CLRW %r0
	.byte	0x24, 0x7f, 0x4b, 0x6c, 0x00, 0x00	# JMP $0x6c4b
l6acd:
	.byte	0x24, 0x7f, 0x99, 0x6b, 0x00, 0x00	# JMP $0x6b99
l6ad3:
	ADDW3 &0x1,$0x4a0,%r0
	CMPB &0x2,(%r0)
	BNEB l6b24
	MOVB &0x1,$0x4401f
	#NOP
	PUSHW &0x1
	CALL -4(%sp),$0x732c
	TSTW %r0
	BNEB l6afe
	CLRW %r0
	.byte	0x24, 0x7f, 0x4b, 0x6c, 0x00, 0x00	# JMP $0x6c4b
l6afe:
	PUSHW &0x1
	PUSHW $0x2000afc
	PUSHW &0x2004000
	PUSHW &0x0
	CALL -16(%sp),$0x7698
	TSTW %r0
	BNEB l6b22
	CLRW %r0
	.byte	0x24, 0x7f, 0x4b, 0x6c, 0x00, 0x00	# JMP $0x6c4b
l6b22:
	BRB l6b99
l6b24:
	ADDW3 &0x1,$0x4a0,%r0
	.byte	0x2b, 0x50	# TSTB (%r0) # as adds #NOP
	BNEB l6b59
	PUSHW &0x0
	PUSHW &0x2004000
	PUSHW &0x0
	PUSHW &0x0
	CALL -16(%sp),$0x7b2c
	TSTW %r0
	BNEB l6b57
	CALL (%sp),$0x7a34
	CLRW %r0
	.byte	0x24, 0x7f, 0x4b, 0x6c, 0x00, 0x00	# JMP $0x6c4b
l6b57:
	BRB l6b99
l6b59:
	ADDW3 &0x1,$0x4a0,%r0
	ANDB3 &0xf,(%r0),%r0
	MOVB %r0,8(%fp)
	#NOP
	MOVB 9(%fp),{uword}%r0
	PUSHW %r0
	MOVB 8(%fp),{uword}%r0
	PUSHW %r0
	CALL -8(%sp),$0x5ace
	MOVW %r0,4(%fp)
	#NOP
	.byte	0x28, 0x64	# TSTW 4(%fp) # as adds NOP
	BNEB l6b99
	MOVB 9(%fp),{uword}%r0
	LLSW3 &0x15,%r0,%r0
	CLRB 5(%r0)
	#NOP
	CLRW %r0
	.byte	0x24, 0x7f, 0x4b, 0x6c, 0x00, 0x00	# JMP $0x6c4b
l6b99:
	PUSHW &0x0
	CALL -4(%sp),*$0x51c
	TSTW %r0
	BEB l6bec
	PUSHW &0x1
	CALL -4(%sp),*$0x540
	ADDW3 &0x1,$0x4a0,%r0
	.byte	0x2b, 0x50	# TSTB (%r0) # as adds NOP
	BNEB l6bc6
	CALL (%sp),$0x7a34
	BRB l6bd6
l6bc6:
	.byte	0x2b, 0x69	# TSTB 9(%fp) # as adds NOP
	BEB l6bd6
	MOVB 9(%fp),{uword}%r0
	LLSW3 &0x15,%r0,%r0
	CLRB 5(%r0)
	#NOP
l6bd6:
	CMPW &0xfeedbeef,$0x2000864
	BNEB l6be7
	CLRW %r0
	BRB l6bea
l6be7:
	MOVW &0x1,%r0
l6bea:
	BRB l6c4b
l6bec:
	ADDW3 &0x4,4(%fp),%r0
	CMPW (%r0),*4(%fp)
	BNEB l6c14
	ADDW3 &0x4,4(%fp),%r0
	ADDW3 &0x8,4(%fp),%r1
	CMPW (%r1),(%r0)
	BNEB l6c14
	ADDW3 &0x8,4(%fp),%r0
	ADDW3 &0xc,4(%fp),%r1
	CMPW (%r1),(%r0)
	BNEB l6c14
	CLRW %r0
	BRB l6c4b
l6c14:
	CALL (%sp),*4(%fp)
	ADDW3 &0x1,$0x4a0,%r0
	.byte	0x2b, 0x50	# TSTB (%r0) # as adds #NOP
	BNEB l6c2b
	CALL (%sp),$0x7a34
l6c2b:
	PUSHW &0x1
	CALL -4(%sp),*$0x540
	CMPW &0xfeedbeef,$0x2000864
	BNEB l6c46
	CLRW %r0
	BRB l6c49
l6c46:
	MOVW &0x1,%r0
l6c49:
	BRB l6c4b
l6c4b:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET


################################################################################

l6c52:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp

## 0x4b0 ("\nFW ERROR 1-%s\n", "04: UNEXPECTED INTERRUPT")
	PUSHW &ld8c
	PUSHW &l10bc	# "04: UNEXPECTED INTERRUPT"
	CALL -8(%sp),*$0x4b0

## 0x4b0 ("               EXECUTION HALTED\n")
	PUSHW &ld9c	# "               EXECUTION HALTED\n"
	CALL -4(%sp),*$0x4b0

	PUSHW &0x80
	CALL -4(%sp),$0x61c0
	PUSHW &0xfeedbeef
	CALL -4(%sp),$0x6322
	MOVAW -24(%fp),%sp
	POPW %fp
	RET

################################################################################

l6c9e:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp

## 0x4b0 ("\nFW ERROR 1-%s\n", "03: UNEXPECTED FAULT")
	PUSHW &ld8c
	PUSHW &l10d5
	CALL -8(%sp),*$0x4b0

## 0x4b0 ("               EXECUTION HALTED\n")
	PUSHW &ld9c	# "               EXECUTION HALTED\n"
	CALL -4(%sp),*$0x4b0

	PUSHW &0x40
	CALL -4(%sp),$0x61c0
	PUSHW &0xfeedbeef
	CALL -4(%sp),$0x6322
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP
	NOP

################################################################################

l6cec:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	.byte	0xec, 0x4f, 0x00, 0x00, 0x01, 0x00, 0x5a, 0x40	# DIVW3 &0x10000,(%ap),%r0
	MOVH {uhalf}10(%ap),{uword}%r1
	ADDW2 (%ap),%r1
	SUBW2 &0x1,%r1
	DIVW2 {uword}&0x10000,%r1
	CMPW %r1,%r0
	BGEUB l6d1d
	CLRW %r0
	.byte	0x24, 0x7f, 0x1f, 0x6e, 0x00, 0x00	# JMP $0x6e1f
l6d1d:
	CLRB $0x4800d
	#NOP
	CLRB $0x48008
	#NOP
	CLRB $0x4800c
	#NOP
	BITB 7(%ap),&0x1
	BEB l6d6a
	MOVB 3(%ap),$0x48002
	#NOP
	MOVB 2(%ap),$0x48002
	#NOP
	BITB 7(%ap),&0x8
	BEB l6d5c
	ORB3 &0x80,1(%ap),%r0
	MOVB %r0,$0x4e003
	#NOP
	BRB l6d68
l6d5c:
	ORB3 &0x0,1(%ap),%r0
	MOVB %r0,$0x4e003
	#NOP
l6d68:
	BRB l6d9b
l6d6a:
	MOVB 3(%ap),$0x48000
	#NOP
	MOVB 2(%ap),$0x48000
	#NOP
	BITB 7(%ap),&0x8
	BEB l6d8f
	ORB3 &0x80,1(%ap),%r0
	MOVB %r0,$0x45003
	#NOP
	BRB l6d9b
l6d8f:
	ORB3 &0x0,1(%ap),%r0
	MOVB %r0,$0x45003
	#NOP
l6d9b:
	CLRB $0x4800c
	#NOP
	BITB 7(%ap),&0x1
	BEB l6dd3
	SUBB3 &0x1,11(%ap),%r0
	ANDB2 &0xff,%r0
	MOVB %r0,$0x48003
	#NOP
	MOVH {uhalf}10(%ap),{uword}%r0
	SUBW2 &0x1,%r0
	LRSW3 &0x8,%r0,%r0
	ANDB2 &0xff,%r0
	MOVB %r0,$0x48003
	#NOP
	BRB l6dfd
l6dd3:
	SUBB3 &0x1,11(%ap),%r0
	ANDB2 &0xff,%r0
	MOVB %r0,$0x48001
	#NOP
	MOVH {uhalf}10(%ap),{uword}%r0
	SUBW2 &0x1,%r0
	LRSW3 &0x8,%r0,%r0
	ANDB2 &0xff,%r0
	MOVB %r0,$0x48001
	#NOP
l6dfd:
	MOVB 7(%ap),$0x4800b
	#NOP
	ANDB3 &0x3,7(%ap),%r0
	ADDB2 &0x1,%r0
	MCOMB %r0,%r0
	ANDB2 &0xf,%r0
	MOVB %r0,$0x4800f
	#NOP
	MOVW &0x1,%r0
	BRB l6e1f
l6e1f:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP

################################################################################

l6c28:
	SAVE %r4
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	CLRB $0x20014f0
	#NOP
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x40	# MULB3 &0x54,3(%ap),%r0
	MOVW &0x200,0x2000aa4(%r0)
	#NOP
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x40	# MULB3 &0x54,3(%ap),%r0
	MOVW &0x12,0x2000aa0(%r0)
	#NOP
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x40	# MULB3 &0x54,3(%ap),%r0
	MOVW &0x4,0x2000a9c(%r0)
	#NOP
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x40	# MULB3 &0x54,3(%ap),%r0
	MOVW &0x132,0x2000a98(%r0)
	#NOP
	CLRW $0x2000a7c
	#NOP
	MOVB 3(%ap),{uword}%r0
	PUSHW %r0
	PUSHW &0x0
	PUSHW &0x2000874
	PUSHW &0x0
## Access the hard drive.
	CALL -16(%sp),$0x7698
## If %r0
	TSTW %r0
	BNEB l6ea7
	MOVW &0x10000,$0x2000a7c
	#NOP
	CLRW %r0
	.byte	0x24, 0x7f, 0xec, 0x70, 0x00, 0x00	# JMP $0x70ec
l6ea7:
	CMPW &0xca5e600d,$0x2000878
	BEB l6ec8
	MOVW &0x20000,$0x2000a7c
	#NOP
	CLRW %r0
	.byte	0x24, 0x7f, 0xec, 0x70, 0x00, 0x00	# JMP $0x70ec
l6ec8:
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x40	# MULB3 &0x54,3(%ap),%r0
	ADDW2 &0x2000a80,%r0
	MOVW %r0,%r8
	MOVW &0x2000874,%r7
	CLRH %r6
	BRB l6ef2
l6ee2:
	MOVW %r8,%r0
	INCW %r8
	MOVW %r7,%r1
	INCW %r7
	MOVB (%r1),(%r0)
	#NOP
	INCH %r6
l6ef2:
	MOVH {uhalf}%r6,{uword}%r0
	CMPW &0x54,%r0
	BLUB l6ee2
	MOVB 3(%ap),{uword}%r0
	LLSW3 &0x1,%r0,%r0
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x41	# MULB3 &0x54,3(%ap),%r1
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x42	# MULB3 &0x54,3(%ap),%r2
	.byte	0xec, 0xe0, 0x82, 0xa4, 0x0a, 0x00, 0x02, 0x81, 0xc0, 0x0a, 0x00, 0x02, 0x41  # DIVW3 {uword}0x2000aa4(%r2),0x2000ac0(%r1),%r1
	MOVH %r1,0x20014e8(%r0)
	#NOP
	CLRH %r6
	BRB l6f44
l6f28:
	MOVB 3(%ap),{uword}%r0
	LLSW3 &0x8,%r0,%r0
	ADDW2 &0x20012e8,%r0
	MOVH {uhalf}%r6,{uword}%r1
	ADDW2 %r1,%r0
	CLRB (%r0)
	#NOP
	INCH %r6
l6f44:
	MOVH {uhalf}%r6,{uword}%r0
	CMPW &0x100,%r0
	BLUB l6f28
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x40	# MULB3 &0x54,3(%ap),%r0
	.byte	0xec, 0xe0, 0x08, 0x80, 0xa4, 0x0a, 0x00, 0x02, 0x40	# DIVW3 {uword}&0x8,0x2000aa4(%r0),%r0
	MOVH %r0,%r4
	MOVB &0xff,$0x2000871
	#NOP
	MOVB 3(%ap),{uword}%r0
	LLSW3 &0x1,%r0,%r0
	CLRH 0x20014ec(%r0)
	#NOP
	.byte	0x24, 0x7f, 0x8b, 0x70, 0x00, 0x00	# JMP $0x708b
l6f80:
	MOVB 3(%ap),{uword}%r0
	PUSHW %r0
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x40	# MULB3 &0x54,3(%ap),%r0
	MOVB 3(%ap),{uword}%r1
	LLSW3 &0x1,%r1,%r1
	MOVH {uhalf}0x20014ec(%r1),{uword}%r1
	ADDW3 %r1,0x2000abc(%r0),%r0
	PUSHW %r0
	PUSHW &0x2000874
	PUSHW &0x0
	CALL -16(%sp),$0x7698
	TSTW %r0
	BNEB l6fe2
	MOVB 3(%ap),{uword}%r0
	LLSW3 &0x1,%r0,%r0
	MOVH {uhalf}0x20014ec(%r0),{uword}%r0
	ADDW2 &0x6,%r0
	LLSW3 &0x10,%r0,%r0
	MOVW %r0,$0x2000a7c
	#NOP
	CLRW %r0
	.byte	0x24, 0x7f, 0xec, 0x70, 0x00, 0x00	# JMP $0x70ec
l6fe2:
	CLRH %r5
	BRB l705b
l6fe6:
	MOVH {uhalf}%r5,{uword}%r0
	LLSW3 &0x3,%r0,%r0
	CMPB &0xff,0x2000874(%r0)
	BNEB l6ffc
	BRB l706b
l6ffc:
	MOVH {uhalf}%r5,{uword}%r0
	LLSW3 &0x3,%r0,%r0
	MOVB 0x2000874(%r0),{uword}%r0
	LLSW3 &0x8,%r0,%r0
	MOVH {uhalf}%r0,{uword}%r0
	MOVH {uhalf}%r5,{uword}%r1
	LLSW3 &0x3,%r1,%r1
	MOVB 0x2000875(%r1),{uword}%r1
	ADDW2 %r1,%r0
	MOVH %r0,%r6
	MOVB 3(%ap),{uword}%r0
	LLSW3 &0x8,%r0,%r0
	ADDW2 &0x20012e8,%r0
	MOVH {uhalf}%r6,{uword}%r1
	DIVW2 {uword}&0x8,%r1
	ADDW2 %r1,%r0
	MOVH {uhalf}%r6,{uword}%r1
	MODW2 {uword}&0x8,%r1
	LLSW3 %r1,&0x1,%r1
	ORB2 %r1,(%r0)
	#NOP
	INCH %r5
l705b:
	MOVH {uhalf}%r5,{uword}%r0
	MOVH {uhalf}%r4,{uword}%r1
	CMPW %r1,%r0
	BLUH l6fe6
l706b:
	MOVH {uhalf}%r5,{uword}%r0
	MOVH {uhalf}%r4,{uword}%r1
	CMPW %r1,%r0
	BGEUB l707c
	BRB l70b3
l707c:
	MOVB 3(%ap),{uword}%r0
	LLSW3 &0x1,%r0,%r0
	INCH 0x20014ec(%r0)
	#NOP
	MOVB 3(%ap),{uword}%r0
	LLSW3 &0x1,%r0,%r0
	MOVH {uhalf}0x20014ec(%r0),{uword}%r0
	MOVB 3(%ap),{uword}%r1
	LLSW3 &0x1,%r1,%r1
	MOVH {uhalf}0x20014e8(%r1),{uword}%r1
	CMPW %r1,%r0
	BLUH l6f80
l70b3:
	MOVB 3(%ap),{uword}%r0
	LLSW3 &0x1,%r0,%r0
	MOVB 3(%ap),{uword}%r1
	LLSW3 &0x1,%r1,%r1
	MOVH {uhalf}0x20014e8(%r1),{uword}%r1
	SUBH2 &0x1,%r1
	MOVH %r1,0x20014ec(%r0)
	#NOP
	MOVB 3(%ap),$0x2000871
	#NOP
	MOVB &0x1,$0x20014f0
	#NOP
	MOVW &0x1,%r0
	BRB l70ec
l70ec:
	MOVAW -4(%fp),%sp
	POPW %r8
	POPW %r7
	POPW %r6
	POPW %r5
	POPW %r4
	POPW %fp
	RET
	NOP
	NOP
	NOP

################################################################################

l7100:
	SAVE %r8
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	.byte	0x2b, 0x7f, 0xf0, 0x14, 0x00, 0x02	# TSTB $0x20014f0 # as adds NOP
	BNEB l711a
	MOVW &0x1,%r0
	.byte	0x24, 0x7f, 0x22, 0x73, 0x00, 0x00	# JMP $0x7322
l711a:
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x40	# MULB3 &0x54,3(%ap),%r0
	CMPW &0xca5e600d,0x2000a84(%r0)
	BEB l7134
	CLRW %r0
	.byte	0x24, 0x7f, 0x22, 0x73, 0x00, 0x00	# JMP $0x7322
l7134:
	MOVB *4(%ap),{uword}%r0
	LLSW3 &0x8,%r0,%r0
	ADDW3 &0x1,4(%ap),%r1
	MOVB (%r1),{uhalf}%r1
	ADDH2 %r1,%r0
	MOVH %r0,%r8
	MOVB 3(%ap),{uword}%r0
	LLSW3 &0x8,%r0,%r0
	ADDW2 &0x20012e8,%r0
	MOVH %r8,{word}%r1
	DIVW2 &0x8,%r1
	ADDW2 %r1,%r0
	MOVB (%r0),{uword}%r0
	MOVH %r8,{word}%r1
	MODW2 &0x8,%r1
	LLSW3 %r1,&0x1,%r1
	BITW %r0,%r1
	BNEB l7181
	MOVW &0x1,%r0
	.byte	0x24, 0x7f, 0x22, 0x73, 0x00, 0x00	# JMP $0x7322
l7181:
	CMPB 3(%ap),$0x2000871
	BEB l71ce
	MOVB 3(%ap),{uword}%r0
	PUSHW %r0
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x40	# MULB3 &0x54,3(%ap),%r0
	PUSHW 0x2000abc(%r0)
	PUSHW &0x2000874
	PUSHW &0x0
	CALL -16(%sp),$0x7698
	TSTW %r0
	BNEB l71b7
	CLRW %r0
	.byte	0x24, 0x7f, 0x22, 0x73, 0x00, 0x00	# JMP $0x7322
l71b7:
	MOVB 3(%ap),{uword}%r0
	LLSW3 &0x1,%r0,%r0
	CLRH 0x20014ec(%r0)
	#NOP
	MOVB 3(%ap),$0x2000871
	#NOP
l71ce:
	CMPW *4(%ap),$0x2000874
	BGUB l71de
	.byte	0x24, 0x7f, 0x70, 0x72, 0x00, 0x00	# JMP $0x7270
l71de:
	BRB l724d
l71e0:
	MOVB 3(%ap),{uword}%r0
	LLSW3 &0x1,%r0,%r0
	MOVH {uhalf}0x20014ec(%r0),{uword}%r0
	BNEB l71fc
	MOVW &0x1,%r0
	.byte	0x24, 0x7f, 0x22, 0x73, 0x00, 0x00	# JMP $0x7322
l71fc:
	MOVB 3(%ap),{uword}%r0
	LLSW3 &0x1,%r0,%r0
	DECH 0x20014ec(%r0)
	#NOP
	MOVB 3(%ap),{uword}%r0
	PUSHW %r0
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x40	# MULB3 &0x54,3(%ap),%r0
	MOVB 3(%ap),{uword}%r1
	LLSW3 &0x1,%r1,%r1
	MOVH {uhalf}0x20014ec(%r1),{uword}%r1
	ADDW3 %r1,0x2000abc(%r0),%r0
	PUSHW %r0
	PUSHW &0x2000874
	PUSHW &0x0
	CALL -16(%sp),$0x7698
	TSTW %r0
	BNEB l724d
	CLRW %r0
	.byte	0x24, 0x7f, 0x22, 0x73, 0x00, 0x00	# JMP $0x7322
l724d:
	CMPW *4(%ap),$0x2000874
	BGUB l71e0
	PUSHW 4(%ap)
	PUSHW &0x2000874
	CALL -8(%sp),$0x7dd6
	MOVW &0x1,%r0
	.byte	0x24, 0x7f, 0x22, 0x73, 0x00, 0x00	# JMP $0x7322
	PUSHW 4(%ap)
	PUSHW &0x2000874
	CALL -8(%sp),$0x7dd6
	TSTW %r0
	BEB l728d
	MOVW &0x1,%r0
	.byte	0x24, 0x7f, 0x22, 0x73, 0x00, 0x00	# JMP $0x7322
l728d:
	BRB l72f5
l728f:
	MOVB 3(%ap),{uword}%r0
	PUSHW %r0
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x40	# MULB3 &0x54,3(%ap),%r0
	MOVB 3(%ap),{uword}%r1
	LLSW3 &0x1,%r1,%r1
	MOVH {uhalf}0x20014ec(%r1),{uword}%r1
	ADDW3 %r1,0x2000abc(%r0),%r0
	PUSHW %r0
	PUSHW &0x2000874
	PUSHW &0x0
	CALL -16(%sp),$0x7698
	TSTW %r0
	BNEB l72cd
	CLRW %r0
	BRB l7322
l72cd:
	PUSHW 4(%ap)
	PUSHW &0x2000874
	CALL -8(%sp),$0x7dd6
	TSTW %r0
	BEB l72e6
	MOVW &0x1,%r0
	BRB l7322
l72e6:
	MOVB 3(%ap),{uword}%r0
	LLSW3 &0x1,%r0,%r0
	INCH 0x20014ec(%r0)
	#NOP
l72f5:
	MOVB 3(%ap),{uword}%r0
	LLSW3 &0x1,%r0,%r0
	MOVH {uhalf}0x20014ec(%r0),{uword}%r0
	MOVB 3(%ap),{uword}%r1
	LLSW3 &0x1,%r1,%r1
	MOVH {uhalf}0x20014e8(%r1),{uword}%r1
	CMPW %r1,%r0
	BLUH l728f
	MOVW &0x1,%r0
	BRB l7322
l7322:
	MOVAW -20(%fp),%sp
	POPW %r8
	POPW %fp
	RET
	NOP

################################################################################
## Unknown Procedure
##

l732c:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	MOVB &0x1,$0x4a001
	#NOP
	PUSHW &0x1
	CALL -4(%sp),*$0x528 # DUART Delay
	PUSHW &0x20
	PUSHW &0x2000a74
	PUSHW &0x8
	CALL -12(%sp),0x83(%pc)
	TSTW %r0
	BEB l7374
	MOVB 3(%ap),{uword}%r0
	PUSHW %r0
	.byte	0x2c, 0xcc, 0xfc, 0xaf, 0x1f, 0x00	# CALL -4(%sp),0x1f(%pc)
	TSTW %r0
	BEB l7370
	MOVW &0x1,%r0
	BRB l7378
l7370:
	CLRW %r0
	BRB l7378
l7374:
	CLRW %r0
	BRB l7378
l7378:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP

################################################################################
## Unknown Procedure
##

l7380:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	MOVB 3(%ap),{uword}%r0
	PUSHW %r0
	CALL -4(%sp),0x2a1(%pc)
	TSTW %r0
	BNEB l739d
	CLRW %r0
	BRB l73cc
l739d:
	ORB3 &0x58,3(%ap),%r0
	PUSHW %r0
	PUSHW &0x0
	PUSHW &0x0
	.byte	0x2c, 0xcc, 0xf4, 0xaf, 0x2c, 0x00 # CALL -12(%sp),0x2c(%pc)
	ORB3 &0x58,3(%ap),%r0
	PUSHW %r0
	PUSHW &0x0
	PUSHW &0x0
	.byte	0x2c, 0xcc, 0xf4, 0xaf, 0x1b, 0x00 # CALL -12(%sp),0x1b(%pc)
	TSTW %r0
	BEB l73c8
	MOVW &0x1,%r0
	BRB l73cc
l73c8:
	CLRW %r0
	BRB l73cc
l73cc:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP

################################################################################
## Unknown Procedure, but something to do with accessing the hard disk.
##

l73d4:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x08, 0x00, 0x00, 0x00, 0x4c # ADDW2 &0x8,%sp
	NOP

## Save the current PSW into 20014FC
	.byte	0x84, 0x4b, 0x7f, 0xfc, 0x14, 0x00, 0x02	# MOVW %psw,$0x20014fc
	NOP
	NOP
	.byte 0xb0, 0x4f, 0x00, 0xe1, 0x01, 0x00, 0x4b	# ORW2 &0x1e100,%psw # as adds NOP

## Read the disk controller status.
	MOVB $0x4a001,{uword}%r0
	MOVW %r0,$0x20012d4
	#NOP

## If the controller available, GOTO 742D
	BITW %r0,&0x80
	BEB l742d

## If the controller is busy, move the argument into R0
	MOVB 3(%ap),{uword}%r0

## Shift it left 24 (0x18) bits (so it occupies the top byte)
	LLSW3 &0x18,%r0,%r0
	ORW2 %r0,$0x20012d4
	#NOP

##
	MOVB &0x8,$0x4a001
	#NOP
	.byte	0x84, 0x7f, 0xfc, 0x14, 0x00, 0x02, 0x4b	# MOVW $0x20014fc,%psw # as adds NOP
	MOVW &0x0,%r0
	.byte	0x24, 0x7f, 0x26, 0x76, 0x00, 0x00	# JMP $0x7626


## Send a CLEAR BUFFER
l742d:
	MOVB &0x2,$0x4a001
	#NOP
## Send a CLEAR CE BITS
	MOVB &0x8,$0x4a001
	#NOP
## GOTO 0x7450
	BRB l7450


l743f:
	MOVW 4(%ap),%r0
	INCW 4(%ap)
	#NOP

## Write to data buffer
## (e.g., write 00 then 48
	MOVB (%r0),$0x4a000
	#NOP
	DECB 11(%ap)
	#NOP

##
l7450:
	.byte	0x2b, 0x7b	# TSTB 11(%ap) # as adds NOP
	BNEB l743f

## Disk Command
	MOVB 3(%ap),$0x4a001
	#NOP
	CLRH (%fp)
	#NOP
	BRB l746e
l7461:
	PUSHW &0x1
	CALL -4(%sp),*$0x528 # DUART Delay
	INCH (%fp)
	#NOP
l746e:
	MOVH {uhalf}(%fp),{uword}%r0
	CMPW &0xc8,%r0
	BGEUB l7485
	BITB $0x4a001,&0x80
	BNEB l7461
l7485:
	MOVB $0x4a001,{uword}%r0
	MOVW %r0,$0x20012d4
	#NOP
## Is the controller busy? If so jump to 74c4
	BITW %r0,&0x80
	BEB l74c4
## It's not, so...
	MOVB 3(%ap),{uword}%r0
	LLSW3 &0x18,%r0,%r0
	ORW2 %r0,$0x20012d4
	#NOP
	MOVB &0x8,$0x4a001
	#NOP
	.byte	0x84, 0x7f, 0xfc, 0x14, 0x00, 0x02, 0x4b	# MOVW $0x20014fc,%psw # as adds NOP
	MOVW &0x0,%r0
## Just return.
	.byte	0x24, 0x7f, 0x26, 0x76, 0x00, 0x00	# JMP $0x7626

## Are any of the top bits set in our argument?
l74c4:
	BITB 3(%ap),&0xf0
	BEB l74f3
	CLRH (%fp)
	#NOP
	BRB l74dd
l74d0:
	PUSHW &0x1
	CALL -4(%sp),*$0x528 # DUART Delay
	INCH (%fp)
	#NOP
l74dd:
	MOVH {uhalf}(%fp),{uword}%r0
	CMPW &0x5,%r0
	BGEUB l74f1
	BITB $0x4a001,&0x60
	BEB l74d0
l74f1:
	BRB l7512
l74f3:
	CLRW $0x20012d4
	#NOP
	MOVB &0x8,$0x4a001
	#NOP
	.byte	0x84, 0x7f, 0xfc, 0x14, 0x00, 0x02, 0x4b	# MOVW $0x20014fc,%psw
	MOVW &0x1,%r0
	.byte	0x24, 0x7f, 0x26, 0x76, 0x00, 0x00	# JMP $0x7626
l7512:
	MOVB $0x4a001,{uword}%r0
	MOVW %r0,$0x20012d4
	#NOP

## Check for CE flags
	ANDW2 &0x60,%r0
	CMPW &0x40,%r0
## If CEH/CEL != 0x40, go to 7532
	BNEB l7532

## GOTO 0x75b7
	.byte	0x24, 0x7f, 0xb7, 0x75, 0x00, 0x00	# JMP $0x75b7
l7532:
	MOVB 3(%ap),{uword}%r0
	LLSW3 &0x18,%r0,%r0
	MOVB $0x4a000,{uword}%r1
	LLSW3 &0x8,%r1,%r1
	ORW2 %r1,%r0
	ORW2 %r0,$0x20012d4
	#NOP
	BITW $0x20012d4,&0x2000
	BEB l756b
	BITB 3(%ap),&0xb0
	BEB l756b
	MOVB &0x1,$0x2001500
	#NOP
l756b:
	BITW $0x20012d4,&0x8
	BEB l75a3
	MOVW $0x20012d4,4(%fp)
	#NOP
	ANDB3 &0x1,3(%ap),%r0
	PUSHW %r0
	.byte	0x2c, 0xcc, 0xfc, 0xaf, 0xaa, 0xfd	# CALL -4(%sp),0xfdaa(%pc)
	TSTW %r0
	BEB l759b
	ANDB3 &0x1,3(%ap),%r0
	XORW2 &0x1,%r0
	PUSHW %r0
	.byte	0x2c, 0xcc, 0xfc, 0xaf, 0xeb, 0xfd	# CALL -4(%sp),0xfdeb(%pc)
l759b:
	MOVW 4(%fp),$0x20012d4
	#NOP
l75a3:
	MOVB &0x8,$0x4a001
	#NOP
	.byte	0x84, 0x7f, 0xfc, 0x14, 0x00, 0x02, 0x4b	# MOVW $0x20014fc,%psw # as adds NOP
	MOVW &0x0,%r0
	BRB l7626


	BITW $0x20012d4,&0x8
	BEB l760b
	MOVB 3(%ap),{uword}%r0
	LLSW3 &0x18,%r0,%r0
	ORW2 %r0,$0x20012d4
	#NOP
	MOVW $0x20012d4,4(%fp)
	#NOP
	ANDB3 &0x1,3(%ap),%r0
	PUSHW %r0
	.byte	0x2c, 0xcc, 0xfc, 0xaf, 0x4e, 0xfd	# CALL -4(%sp),0xfd4e(%pc)
	TSTW %r0
	BEB l75f7
	ANDB3 &0x1,3(%ap),%r0
	XORW2 &0x1,%r0
	PUSHW %r0
	.byte	0x2c, 0xcc, 0xfc, 0xaf, 0x8f, 0xfd	# CALL -4(%sp),0xfd8f(%pc)
l75f7:
	MOVW 4(%fp),$0x20012d4
	#NOP
	.byte	0x84, 0x7f, 0xfc, 0x14, 0x00, 0x02, 0x4b	# MOVW $0x20014fc,%psw
	MOVW &0x0,%r0
	BRB l7626
l760b:
	MOVB &0x8,$0x4a001
	#NOP
	CLRW $0x20012d4
	#NOP
	.byte	0x84, 0x7f, 0xfc, 0x14, 0x00, 0x02, 0x4b	# MOVW $0x20014fc,%psw # as adds NOP

## Why are we flagging R0?
	MOVW &0x1,%r0
	BRB l7626

l7626:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP
	NOP

################################################################################
##  Unknown Procedure
##

l7630:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	ORB3 &0x30,3(%ap),%r0
	PUSHW %r0
	PUSHW &0x0
	PUSHW &0x0
	.byte	0x2c, 0xcc, 0xf4, 0xaf, 0x91, 0xfd	# CALL -12(%sp),0xfd91(%pc)
	TSTW %r0
	BNEB l7651
	CLRW %r0
	BRB l768f
l7651:
	MOVB $0x4a000,{uword}%r0
	MOVW %r0,$0x20012d4
	#NOP
	BITW %r0,&0x2
	BEB l7672
	CLRW $0x20012d4
	#NOP
	MOVW &0x1,%r0
	BRB l768f
l7672:
	LLSW3 &0x10,$0x20012d4,$0x20012d4
	#NOP
	ORW2 &0x30000000,$0x20012d4
	#NOP
	CLRW %r0
	BRB l768f
l768f:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP

################################################################################
## 'hd_acs' - Routine to access hard disk
##

## Here, argument 1 seems to get some kind of failure code if we can't
## access the hard drive -- I'm trying to figure out what that is.

l7698:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x14, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x14,%sp
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x40	# MULB3 &0x54,3(%ap),%r0
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x41	# MULB3 &0x54,3(%ap),%r1
	.byte	0xe8, 0x81, 0xa0, 0x0a, 0x00, 0x02, 0x80, 0x9c, 0x0a, 0x00, 0x02, 0x40 # MULW3 0x2000aa0(%r1),0x2000a9c(%r0),%r0
	.byte	0xec, 0xe0, 0x40, 0x74, 0x40	# DIVW3 {uword}%r0,4(%ap),%r0
	MOVW %r0,4(%fp)
	#NOP
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x41	# MULB3 &0x54,3(%ap),%r1
	CMPW 0x2000a98(%r1),%r0
	BLUB l76d6
	CLRW %r0
	.byte	0x24, 0x7f, 0x79, 0x78, 0x00, 0x00	# JMP $0x7879
l76d6:
	LRSW3 &0x8,4(%fp),%r0
	ANDB2 &0xff,%r0
	MOVB %r0,12(%fp)
	#NOP
	ANDB3 &0xff,7(%fp),%r0
	MOVB %r0,13(%fp)
	#NOP
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x40	# MULB3 &0x54,3(%ap),%r0
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x41	# MULB3 &0x54,3(%ap),%r1
	.byte	0xe8, 0x81, 0xa0, 0x0a, 0x00, 0x02, 0x80, 0x9c, 0x0a, 0x00, 0x02, 0x40	# MULW3 0x2000aa0(%r1),0x2000a9c(%r0),%r0
	.byte	0xe4, 0xe0, 0x40, 0x74, 0x40	# MODW3 {uword}%r0,4(%ap),%r0
	MOVW %r0,(%fp)
	#NOP
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x40	# MULB3 &0x54,3(%ap),%r0
	.byte	0xec, 0xe0, 0x80, 0xa0, 0x0a, 0x00, 0x02, 0x59, 0x40	# DIVW3 {uword}0x2000aa0(%r0),(%fp),%r0
	MOVB %r0,14(%fp)
	#NOP
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x40	# MULB3 &0x54,3(%ap),%r0
	.byte	0xe4, 0xe0, 0x80, 0xa0, 0x0a, 0x00, 0x02, 0x59, 0x40	# MODW3 {uword}0x2000aa0(%r0),(%fp),%r0
	MOVB %r0,15(%fp)
	#NOP
	MOVB 3(%ap),{uword}%r0
	PUSHW %r0
	PUSHAW 12(%fp)
## Call 0x7100
	CALL -8(%sp),$0x7100
	TSTW %r0
	BNEB l774d
	CLRW %r0
	.byte	0x24, 0x7f, 0x79, 0x78, 0x00, 0x00	# JMP $0x7879
l774d:
	CMPB &0x7,14(%fp)
	BLEUB l775d
	ADDB3 &0x2,3(%ap),%r0
	MOVB %r0,17(%fp)
	#NOP
	BRB l7762
l775d:
	MOVB 3(%ap),17(%fp)
	#NOP
l7762:
	CLRH 8(%fp)
	#NOP
	.byte	0x24, 0x7f, 0x43, 0x78, 0x00, 0x00	# JMP $0x7843
l776b:
	MOVH {uhalf}8(%fp),{uword}%r0
	BEB l7780
	MOVB 3(%ap),{uword}%r0
	PUSHW %r0
## Call 0x7380
	CALL -4(%sp),$0x7380
l7780:
	MOVB 3(%ap),{uword}%r0
	PUSHW %r0
	PUSHAW 12(%fp)
## Call 0x7880
	CALL -8(%sp),0xf8(%pc)
	TSTW %r0
	BNEB l7798
	.byte	0x24, 0x7f, 0x40, 0x78, 0x00, 0x00	# JMP $0x7840
l7798:
	MOVB 14(%fp),$0x20014f4
	#NOP
	MCOMB 12(%fp),%r0
	MOVB %r0,$0x20014f5
	#NOP
	MOVB 13(%fp),$0x20014f6
	#NOP
	MOVB 14(%fp),$0x20014f7
	#NOP
	MOVB 15(%fp),$0x20014f8
	#NOP
	MOVB &0x1,$0x20014f9
	#NOP
	.byte	0x2b, 0xca, 0x0f	# TSTB 15(%ap) # as adds NOP
	BNEB l77d6
	MOVW &0x4,%r0
	BRB l77d9
l77d6:
	MOVW &0x8,%r0
l77d9:
	ORB2 &0x0,%r0
	MOVB %r0,16(%fp)
	#NOP
	PUSHW 8(%ap)
	MOVB 16(%fp),{uword}%r0
	PUSHW %r0
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x40	# MULB3 &0x54,3(%ap),%r0
	PUSHW 0x2000aa4(%r0)
## Call 0x6cec
	CALL -12(%sp),$0x6cec
	TSTW %r0
	BNEB l7805
	CLRW %r0
	BRB l7879
l7805:
	CLRB $0x2001500
	#NOP
	.byte	0x2b, 0xca, 0x0f	# TSTB 15(%ap) # as adds NOP
	BNEB l7818
	MOVW &0xb0,%r0
	BRB l781d
l7818:
	MOVW &0xf0,%r0
l781d:
	MOVB 17(%fp),{uword}%r1
	ORW2 %r1,%r0
	PUSHW %r0
	PUSHW &0x20014f4
	PUSHW &0x6
	CALL -12(%sp),$0x73d4
	TSTW %r0
	BEB l7840
	MOVW &0x1,%r0
	BRB l7879
l7840:
	INCH 8(%fp)
	#NOP
	MOVH {uhalf}8(%fp),{uword}%r0
	CMPW &0x10,%r0
	BLUH l776b
	.byte	0x2b, 0x7f, 0x00, 0x15, 0x00, 0x02	# TSTB $0x2001500 # as adds NOP
	BEB l7875
	PUSHW &l10f4	# "id%d CRC error at disk address %08x (%d retries)\n"
	MOVB 3(%ap),{uword}%r0
	PUSHW %r0
	PUSHW 12(%fp)
	PUSHW &0x10
	CALL -16(%sp),*$0x4b0
	CLRB $0x2001500
	#NOP
l7875:
	CLRW %r0
	BRB l7879
l7879:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET

################################################################################
## Unknown Procedure

l7880:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	MOVB 3(%ap),{uword}%r0
	PUSHW %r0
	CALL -4(%sp),$0x7630
	TSTW %r0
	BNEB l789f
	CLRW %r0
	BRB l78cd
l789f:
	MOVB *4(%ap),$0x20014f4
	#NOP
	ADDW3 &0x1,4(%ap),%r0
	MOVB (%r0),$0x20014f5
	#NOP
	ORB3 &0x68,3(%ap),%r0
	PUSHW %r0
	PUSHW &0x20014f4
	PUSHW &0x2
	CALL -12(%sp),$0x73d4
	BRB l78cd
l78cd:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET

################################################################################
## Unknown Procedure

l78d4:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x0c, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0xc,%sp
	MOVW &0x2000874,8(%fp)
	#NOP
	MOVB &0xff,$0x2000871
	#NOP
	MOVB 3(%ap),{uword}%r0
	PUSHW %r0
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x40	# MULB3 &0x54,3(%ap),%r0
	SUBW3 &0x1,0x2000a98(%r0),%r0
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x41	# MULB3 &0x54,3(%ap),%r1
	MULW2 0x2000a9c(%r1),%r0
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x41	# MULB3 &0x54,3(%ap),%r1
	MULW2 0x2000aa0(%r1),%r0
	PUSHW %r0
	PUSHW 8(%fp)
	PUSHW &0x0
	CALL -16(%sp),$0x7698
	TSTW %r0
	BNEB l7930
	CLRW %r0
	BRB l7982
l7930:
	CLRW (%fp)
	#NOP
	BRB l796b
l7935:
	CLRW 4(%fp)
	#NOP
	BRB l7961
l793a:
	.byte	0xe4, 0x02, 0x59, 0x40	# MODW3 &0x2,(%fp),%r0
	BEB l7948
	SUBW3 4(%fp),&0xff,%r0
	BRB l794b
l7948:
	MOVW 4(%fp),%r0
l794b:
	MOVW 8(%fp),%r1
	INCW 8(%fp)
	#NOP
	MOVB (%r1),{uword}%r1
	CMPW %r0,%r1
	BEB l795e
	CLRW %r0
	BRB l7982
l795e:
	INCW 4(%fp)
	#NOP
l7961:
	CMPW &0x100,4(%fp)
	BLB l793a
	INCW (%fp)
	#NOP
l796b:
	.byte	0xeb, 0x6f, 0x54, 0x73, 0x40	# MULB3 &0x54,3(%ap),%r0
	LRSW3 &0x8,0x2000aa4(%r0),%r0
	CMPW %r0,(%fp)
	BLUB l7935
	MOVW &0x1,%r0
	BRB l7982
l7982:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP
	NOP


################################################################################

l798c:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x04, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x4,%sp
	MOVB &0x10,$0x4900e
	#NOP
	MOVB &0x20,$0x4900e
	#NOP
	MOVH {uhalf}$0x44002,{uword}%r0
	ANDW2 &0x400,%r0
	CMPW &0x400,%r0
	BEB l79ce
	MOVB &0x1,$0x4401b
	#NOP
	PUSHW &0x12c
	CALL -4(%sp),*$0x528 # DUART Delay
l79ce:
	PUSHW &0xc8
	CALL -4(%sp),*$0x528 # DUART Delay
	MOVB &0xd0,$0x4d000
	#NOP
	PUSHW &0x1
	CALL -4(%sp),*$0x528 # DUART Delay
	BITB $0x4d000,&0x80
	BEB l7a02
	.byte	0x2c, 0x5c, 0xaf, 0x3b, 0x00	# CALL (%sp),0x3b(%pc)
	CLRW %r0
	BRB l7a2d
l7a02:
	CMPB &0x1,3(%ap)
	BNEB l7a0c
	MOVW &0x4,%r0
	BRB l7a0e
l7a0c:
	CLRW %r0
l7a0e:
	ORW2 &0x8,%r0
	PUSHW %r0
	PUSHW &0x10
	.byte	0x2c, 0xcc, 0xf8, 0xaf, 0x47, 0x00	# CALL -8(%sp),0x47(%pc)
	TSTW %r0
	BEB l7a24
	MOVW &0x1,%r0
	BRB l7a2d
l7a24:
	.byte	0x2c, 0x5c, 0xaf, 0x10, 0x00	# CALL (%sp),0x10(%pc)
	CLRW %r0
	BRB l7a2d
l7a2d:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET

################################################################################

l7a34:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	MOVB &0x1,$0x4401f
	#NOP
	MOVB &0x10,$0x4900f
	#NOP
	MOVB &0x20,$0x4900f
	#NOP
	MOVAW -24(%fp),%sp
	POPW %fp
	RET

################################################################################

l7a5c:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x04, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x4,%sp
	BITB $0x4d000,&0x1
	BEB l7a76
	CLRW %r0
	.byte	0x24, 0x7f, 0x24, 0x7b, 0x00, 0x00	# JMP $0x7b24
l7a76:
	NOP
	.byte	0x84, 0x4b, 0x7f, 0xfc, 0x14, 0x00, 0x02	# MOVW %psw,$0x20014fc
	NOP
	NOP
	.byte	0xb0, 0x4f, 0x00, 0xe1, 0x01, 0x00, 0x4b	# ORW2 &0x1e100,%psw # as adds NOP
	MOVB 3(%ap),$0x4d000
	#NOP
	PUSHW &0x1
	PUSHW &0xe6
	CALL -8(%sp),$0x552c
	CLRW (%fp)
	#NOP
	BRB l7ac1
l7aa2:
	CMPW &0x64,(%fp)
	BLEB l7ab4
	.byte	0x84, 0x7f, 0xfc, 0x14, 0x00, 0x02, 0x4b	# MOVW $0x20014fc,%psw # as adds NOP
	MOVW &0x0,%r0
	BRB l7b24
l7ab4:
	PUSHW &0x1
	CALL -4(%sp),*$0x528 # DUART Delay
	INCW (%fp)
	#NOP
l7ac1:
	BITB $0x4d000,&0x1
	BNEB l7aa2
	ANDB3 &0xa0,3(%ap),%r0
	CMPW &0xa0,%r0
	BEB l7ae4
	ANDB3 &0xf0,3(%ap),%r0
	CMPW &0xf0,%r0
	BNEB l7af2
l7ae4:
	PUSHW &0x1
	PUSHW &0xe6
	CALL -8(%sp),$0x552c
l7af2:
	BITB $0x4d000,7(%ap)
	BEB l7b18
	BITB $0x4d000,&0x8
	BEB l7b0c
	MOVB &0x1,$0x2001500
	#NOP
l7b0c:
	.byte	0x84, 0x7f, 0xfc, 0x14, 0x00, 0x02, 0x4b	# MOVW $0x20014fc,%psw # as adds NOP
	MOVW &0x0,%r0
	BRB l7b24
l7b18:
	#MOVW $0x20014fc,%psw
	.byte	0x84, 0x7f, 0xfc, 0x14, 0x00, 0x02, 0x4b	# MOVW $0x20014fc,%psw # as adds NOP
	MOVW &0x1,%r0
	BRB l7b24
l7b24:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP

################################################################################
## 'fd_acs' - Routine to access floppy disk
##

l7b2c:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x0c, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0xc,%sp
	.byte	0xec, 0xe0, 0x12, 0x5a, 0x40	# DIVW3 {uword}&0x12,(%ap),%r0
	CMPW &0x50,%r0
	BLUB l7b48
	CLRW %r0
	.byte	0x24, 0x7f, 0x94, 0x7d, 0x00, 0x00	# JMP $0x7d94
l7b48:
	.byte	0x2b, 0xca, 0x0f	# TSTB 15(%ap) # as adds NOP
	BEB l7b53
	CMPB &0x3,15(%ap)
	BNEB l7bca
l7b53:
	PUSHW &0x1
	CALL -4(%sp),$0x798c
	TSTW %r0
	BNEB l7b69
	CLRW %r0
	.byte	0x24, 0x7f, 0x94, 0x7d, 0x00, 0x00	# JMP $0x7d94
l7b69:
	MOVB &0xff,$0x2000871
	#NOP
	CLRB $0x2000870
	#NOP
	PUSHW &0x58e
	PUSHW &0x2000874
	PUSHW &0x0
	PUSHW &0x1
	CALL -16(%sp),-92(%pc)
	TSTW %r0
	BNEB l7b99
	CLRW %r0
	.byte	0x24, 0x7f, 0x94, 0x7d, 0x00, 0x00	# JMP $0x7d94
l7b99:
	CMPW &0xca5e600d,$0x2000878
	BNEB l7bbc
	MOVH $0x20008b2,$0x2001502
	#NOP
	MOVB &0x1,$0x2000870
	#NOP
	BRB l7bca
l7bbc:
	CLRH $0x2001502
	#NOP
	CLRB $0x2000870
	#NOP
l7bca:
	CLRB 8(%fp)
	#NOP
	.byte	0xec, 0xe0, 0x12, 0x5a, 0x40	# DIVW3 {uword}&0x12,(%ap),%r0
	MOVB %r0,9(%fp)
	#NOP
	.byte	0xe4, 0xe0, 0x12, 0x5a, 0x40	# MODW3 {uword}&0x12,(%ap),%r0
	DIVW2 {uword}&0x9,%r0
	MOVB %r0,10(%fp)
	#NOP
	.byte	0xe4, 0xe0, 0x09, 0x5a, 0x40	# MODW3 {uword}&0x9,(%ap),%r0
	MOVB %r0,11(%fp)
	#NOP
	.byte	0x2b, 0x7f, 0x70, 0x08, 0x00, 0x02	# TSTB $0x2000870 # as adds NOP
	BEB l7c52
	CMPB &0x2,$0x2000871
	BEB l7c44
	MOVB &0xff,$0x2000871
	#NOP
	CLRB $0x2000870
	#NOP
	MOVH $0x2001502,{word}%r0
	PUSHW %r0
	PUSHW &0x2000874
	PUSHW &0x0
	PUSHW &0x1
	.byte	0x2c, 0xcc, 0xf0, 0xaf, 0x0a, 0xff	# CALL -16(%sp),0xff0a(%pc)
	TSTW %r0
	BNEB l7c34
	CLRW %r0
	.byte	0x24, 0x7f, 0x94, 0x7d, 0x00, 0x00	# JMP $0x7d94
l7c34:
	MOVB &0x2,$0x2000871
	#NOP
	MOVB &0x1,$0x2000870
	#NOP
l7c44:
	PUSHAW 8(%fp)
	PUSHW &0x2000874
	CALL -8(%sp),0x18a(%pc)
l7c52:
	MOVB &0x9c,6(%fp)
	#NOP
	CMPB &0x1,11(%ap)
	BNEB l7c6f
	MOVB &0x49,4(%fp)
	#NOP
	MOVB &0xa0,5(%fp)
	#NOP
	ORB2 &0x40,6(%fp)
	#NOP
	BRB l7c7a
l7c6f:
	MOVB &0x45,4(%fp)
	#NOP
	MOVB &0x80,5(%fp)
	#NOP
l7c7a:
	MOVB 10(%fp),{uword}%r0
	LLSW3 &0x1,%r0,%r0
	ORB2 &0x8,%r0
	ORB2 %r0,5(%fp)
	#NOP
	CLRH 2(%fp)
	#NOP
	CLRH (%fp)
	#NOP
	JMP $0x7d30
l7c95:
	MOVB 9(%fp),{uword}%r0
	PUSHW %r0
	CALL -4(%sp),0x101(%pc)
	TSTW %r0
	BNEB l7cbd
	PUSHW &0x1
	CALL -4(%sp),$0x798c
	TSTW %r0
	BNEB l7cbb
	CLRW %r0
	.byte	0x24, 0x7f, 0x94, 0x7d, 0x00, 0x00	# JMP $0x7d94
l7cbb:
	BRB l7d2d
l7cbd:
	ADDB3 &0x1,11(%fp),%r0
	MOVB %r0,$0x4d002
	#NOP
	PUSHW 4(%ap)
	MOVB 4(%fp),{uword}%r0
	PUSHW %r0
	PUSHW &0x200
	CALL -12(%sp),$0x6cec
	TSTW %r0
	BNEB l7ce9
	CLRW %r0
	.byte	0x24, 0x7f, 0x94, 0x7d, 0x00, 0x00	# JMP $0x7d94
l7ce9:
	CLRB $0x2001500
	#NOP
	MOVB 5(%fp),{uword}%r0
	PUSHW %r0
	MOVB 6(%fp),{uword}%r0
	PUSHW %r0
	CALL -8(%sp),$0x7a5c
	TSTW %r0
	BEB l7d0e
	MOVH &0x1,2(%fp)
	#NOP
	BRB l7d36
l7d0e:
	BITB $0x4d000,&0x80
	BEB l7d1b
	BRB l7d36
l7d1b:
	PUSHW &0x1
	CALL -4(%sp),$0x798c
	TSTW %r0
	BNEB l7d2d
	CLRW %r0
	BRB l7d94
l7d2d:
	INCH (%fp)
	#NOP
	CMPH &0x10,(%fp)
	BLH l7c95
l7d36:
	.byte	0x2b, 0x7f, 0x00, 0x15, 0x00, 0x02	# TSTB $0x2001500
	BEB l7d57
	PUSHW &l1128	# "if CRC error at disk address %08x (%d retries)\n"
	PUSHW 8(%fp)
	PUSHW &0x10
	CALL -12(%sp),*$0x4b0
	CLRB $0x2001500
	#NOP
l7d57:
	.byte	0x2a, 0x62	# TSTH 2(%fp) # as adds NOP
	BEB l7d67
	CMPB &0x2,15(%ap)
	BEB l7d67
	CMPB &0x3,15(%ap)
	BNEB l7d8e
l7d67:
	.byte	0x2b, 0x7f, 0x70, 0x08, 0x00, 0x02	# TSTB $0x2000870
	BEB l7d87
	CLRB $0x2000870
	#NOP
	CLRH $0x2001502
	#NOP
	MOVB &0xff,$0x2000871
	#NOP
l7d87:
	CALL (%sp),$0x7a34
l7d8e:
	MOVH 2(%fp),{word}%r0
	BRB l7d94
l7d94:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP


################################################################################

l7d9c:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x00, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x0,%sp
	CMPB 3(%ap),$0x4d001
	BNEB l7db3
	MOVW &0x1,%r0
	BRB l7dce
l7db3:
	MOVB 3(%ap),$0x4d003
	#NOP
	PUSHW &0x1c
	PUSHW &0x10
	CALL -8(%sp),$0x7a5c
	MOVH {uhalf}%r0,{uword}%r0
	BRB l7dce
l7dce:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP

################################################################################

l7dd6:
	SAVE %fp
	.byte	0x9c, 0x4f, 0x04, 0x00, 0x00, 0x00, 0x4c	# ADDW2 &0x4,%sp
	CLRH (%fp)
	#NOP
	BRB l7e24
l7de4:
	MOVH (%fp),{word}%r0
	LLSW3 &0x3,%r0,%r0
	ADDW2 4(%ap),%r0
	CMPW *0(%ap),(%r0)
	BNEB l7e0b
	MOVH (%fp),{word}%r0
	LLSW3 &0x3,%r0,%r0
	ADDW2 4(%ap),%r0
	MOVW 4(%r0),*0(%ap)
	#NOP
	MOVW &0x1,%r0
	BRB l7e2e
l7e0b:
	MOVH (%fp),{word}%r0
	LLSW3 &0x3,%r0,%r0
	ADDW2 4(%ap),%r0
	CMPW *0(%ap),(%r0)
	BLEUB l7e21
	MOVW &0x1,%r0
	BRB l7e2e
l7e21:
	INCH (%fp)
	#NOP
l7e24:
	CMPH &0x40,(%fp)
	BLB l7de4
	CLRW %r0
	BRB l7e2e
l7e2e:
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP
	NOP

################################################################################

l73e8:
	SAVE %r7
	MOVW (%ap),%r1
	MOVW &0x0,%r7
	MOVB (%r1),{uword}%r8
	.byte	0x3b, 0x88, 0x71, 0x11, 0x00, 0x00, 0x04	# BITB 0x1171(%r8),&0x4
	BNEB l7e91
	BRB l7e60
	MOVAW -16(%fp),%sp
	POPW %r8
	POPW %r7
	POPW %fp
	RET
l7e5a:
	INCW %r1
	MOVB (%r1),{uword}%r8
l7e60:
	.byte	0x3b, 0x88, 0x71, 0x11, 0x00, 0x00, 0x08	# BITB 0x1171(%r8),&0x8
	BNEB l7e5a
	CMPW %r8,&0x2b
	BEB l7e75
	CMPW %r8,&0x2d
	BNEB l7e7b
	INCW %r7
l7e75:
	INCW %r1
	MOVB (%r1),{uword}%r8
l7e7b:
	.byte	0x3b, 0x88, 0x71, 0x11, 0x00, 0x00, 0x04	# BITB 0x1171(%r8),&0x4
	BNEB l7e91
	CLRW %r0
	MOVAW -16(%fp),%sp
	POPW %r8
	POPW %r7
	POPW %fp
	RET
l7e91:
	SUBW3 %r8,&0x30,%r2
	BRB l7ea1
l7e97:
	MULW2 &0xa,%r2
	SUBW3 %r8,&0x30,%r0
	ADDW2 %r0,%r2
l7ea1:
	INCW %r1
	MOVB (%r1),{uword}%r8
	.byte	0x3b, 0x88, 0x71, 0x11, 0x00, 0x00, 0x04	# BITB 0x1171(%r8),&0x4
	BNEB l7e97
	TSTW %r7
	BEB l7ec2
	MOVW %r2,%r0
	MOVAW -16(%fp),%sp
	POPW %r8
	POPW %r7
	POPW %fp
	RET
l7ec2:
	MNEGW %r2,%r0
	MOVAW -16(%fp),%sp
	POPW %r8
	POPW %r7
	POPW %fp
	RET

################################################################################

l7ed0:
	SAVE %r7
	MOVW (%ap),%r1
	MOVW &0x0,%r7
	MOVB (%r1),{uword}%r8
	.byte	0x3b, 0x88, 0x71, 0x11, 0x00, 0x00, 0x04	# BITB 0x1171(%r8),&0x4
	BNEB l7f29
	BRB l7ef8
	MOVAW -16(%fp),%sp
	POPW %r8
	POPW %r7
	POPW %fp
	RET
l7ef2:
	INCW %r1
	MOVB (%r1),{uword}%r8
l7ef8:
	.byte	0x3b, 0x88, 0x71, 0x11, 0x00, 0x00, 0x08	# BITB 0x1171(%r8),&0x8
	BNEB l7ef2
	CMPW %r8,&0x2b
	BEB l7f0d
	CMPW %r8,&0x2d
	BNEB l7f13
	INCW %r7
l7f0d:
	INCW %r1
	MOVB (%r1),{uword}%r8
l7f13:
	.byte	0x3b, 0x88, 0x71, 0x11, 0x00, 0x00, 0x04	# BITB 0x1171(%r8),&0x4
	BNEB l7f29
	CLRW %r0
	MOVAW -16(%fp),%sp
	POPW %r8
	POPW %r7
	POPW %fp
	RET
l7f29:
	SUBW3 %r8,&0x30,%r2
	BRB l7f39
l7f2f:
	MULW2 &0xa,%r2
	SUBW3 %r8,&0x30,%r0
	ADDW2 %r0,%r2
l7f39:
	INCW %r1
	MOVB (%r1),{uword}%r8
	.byte	0x3b, 0x88, 0x71, 0x11, 0x00, 0x00, 0x04	# BITB 0x1171(%r8),&0x4
	BNEB l7f2f
	TSTW %r7
	BEB l7f5a
	MOVW %r2,%r0
	MOVAW -16(%fp),%sp
	POPW %r8
	POPW %r7
	POPW %fp
	RET
l7f5a:
	MNEGW %r2,%r0
	MOVAW -16(%fp),%sp
	POPW %r8
	POPW %r7
	POPW %fp
	RET

################################################################################
## 'strcmp' Routine
##

l7f68:
	SAVE %fp
	MOVW (%ap),%r0
	MOVW 4(%ap),%r1
	CMPW %r1,%r0
	BNEB l7f7b
	BRB l7f85
l7f77:
	INCW %r0
	INCW %r1
l7f7b:
	CMPB (%r1),(%r0)
	BNEB l7f85
	CMPB (%r0),&0x0
	BNEB l7f77
l7f85:
	SUBB3 (%r1),(%r0),%r0
	MOVB {sbyte}%r0,{word}%r0
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP
	NOP
	NOP

################################################################################

l7f98:
	SAVE %fp
	MOVW (%ap),%r0
	BRB l7fa1
l7f9f:
	INCW %r0
l7fa1:
	.byte	0x2b, 0x50	# TSTB (%r0) # as adds #NOP
	BNEB l7f9f
	SUBW2 (%ap),%r0
	MOVAW -24(%fp),%sp
	POPW %fp
	RET
	NOP


################################################################################
## Unknown routine.
##

l7fb0:
	SAVE %fp
	MOVW (%ap),%r1
	MOVW 4(%ap),%r0
	STRCPY
	MOVW (%ap),%r0
	MOVAW -24(%fp),%sp
	POPW %fp
	RET

## Filling bytes

	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x25
	.byte	0x72

## Serial Number Structure

# 00007ff0: 22 22 22 22
# 00007ff4: 03 02 01 30
# 00007ff8: 03 02 01 0e
# 00007ffc: 03 02 01 0b
	.byte	0x22, 0x22, 0x22, 0x22
	.byte	0x03, 0x02, 0x01, 0x30
	.byte	0x03, 0x02, 0x01, 0x0e
	.byte	0x03, 0x02, 0x01, 0x0b

