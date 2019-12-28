
;; Set up Stack, Frame, Argument, and Interrupt stack pointers
00001310: 04 7f 44 04 00 02 4c                           MOVAW $0x2000444,%sp
00001317: 04 7f 44 04 00 02 49                           MOVAW $0x2000444,%fp
0000131e: 04 7f 44 04 00 02 4a                           MOVAW $0x2000444,%ap
00001325: 04 7f 44 0c 00 02 4e                           MOVAW $0x2000c44,%isp

;; Immediately jump to 133d
0000132c: 24 7f 3d 13 00 00                              JMP $0x133d
00001332: 70                                             NOP 
00001333: 70                                             NOP 


00001334: 10 43                                          SAVE %r3
00001336: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp


;; Clear the CSR
0000133d: 80 7f 04 40 04 00                              CLRW $0x44004

;; Set up the System Interval timers
00001343: 87 38 7f 0f 10 04 00                           MOVB &0x38,$0x4100f
0000134a: 87 6f 74 7f 0f 10 04 00                        MOVB &0x74,$0x4100f
00001352: 87 5f b4 00 7f 0f 10 04 00                     MOVB &0xb4,$0x4100f
0000135b: 87 5f f4 00 7f 0b 10 04 00                     MOVB &0xf4,$0x4100b
00001364: 87 01 7f 0b 10 04 00                           MOVB &0x1,$0x4100b

;; Inhibit the UBUS Timer
0000136b: 80 7f 24 40 04 00                              CLRW $0x44024

;; Clear the Floppy Control Status Register
00001371: 83 7f 03 00 04 00                              CLRB $0x40003

;; Turn on the FAILURE (status) LED
00001377: 84 01 7f 40 40 04 00                           MOVW &0x1,$0x44040

;; Is memory location 0x20003A0 == 0xA11C0DED?
0000137e: 3c 4f ed 0d 1c a1 7f a0 03 00 02               CMPW &0xa11c0ded,$0x20003a0

;; If it is, go to 0x13B2
00001389: 7f 29                                          BEB &0x29 <0x13b2>

;; Is memory location 0x20003A0 == 0x5DA6B205?
0000138b: 3c 4f 05 b2 a6 5d 7f a0 03 00 02               CMPW &0x5da6b205,$0x20003a0

;; If it is, go to 0x13B2
00001396: 7f 1c                                          BEB &0x1c <0x13b2>

;; Is memory location 0x20003A0 == 0x8BADF00D?
00001398: 3c 4f 0d f0 ad 8b 7f a0 03 00 02               CMPW &0x8badf00d,$0x20003a0

;; If it is, go to 0x13B2
000013a3: 7f 0f                                          BEB &0xf <0x13b2>

;; Is memory location 0x20003A0 == 0xDEDICA7E?
000013a5: 3c 4f 7e ca d1 de 7f a0 03 00 02               CMPW &0xded1ca7e,$0x20003a0

;; If it is NOT, branch to 0x13B8
000013b0: 77 08                                          BNEB &0x8 <0x13b8>

;; Jump to failure routine.
000013b2: 24 7f a1 19 00 00                              JMP $0x19a1


;; ... Come here from above if nothing is in 0x20003A0.
000013b8: 80 7f 50 40 04 00                              CLRW $0x44050
000013be: 70                                             NOP 

;; 
000013bf: 84 4b 40                                       MOVW %psw,%r0
000013c2: b8 4f ff ff c3 ff 40                           ANDW2 &0xffc3ffff,%r0
000013c9: 84 40 4b                                       MOVW %r0,%psw
000013cc: 70                                             NOP 
000013cd: 77 05                                          BNEB &0x5 <0x13d2>
000013cf: 7a 3b 05                                       BRH &0x53b <0x190a>
000013d2: 47 05                                          BGB &0x5 <0x13d7>
000013d4: 7a 36 05                                       BRH &0x536 <0x190a>
000013d7: 43 05                                          BGEB &0x5 <0x13dc>
000013d9: 7a 31 05                                       BRH &0x531 <0x190a>
000013dc: 57 05                                          BGUB &0x5 <0x13e1>
000013de: 7a 2c 05                                       BRH &0x52c <0x190a>
000013e1: 53 05                                          BGEUB &0x5 <0x13e6>
000013e3: 7a 27 05                                       BRH &0x527 <0x190a>
000013e6: 53 05                                          BGEUB &0x5 <0x13eb>
000013e8: 7a 22 05                                       BRH &0x522 <0x190a>
000013eb: 63 05                                          BVCB &0x5 <0x13f0>
000013ed: 7a 1d 05                                       BRH &0x51d <0x190a>
000013f0: 70                                             NOP 
000013f1: 84 4b 40                                       MOVW %psw,%r0
000013f4: b0 4f 00 00 3c 00 40                           ORW2 &0x3c0000,%r0
000013fb: 84 40 4b                                       MOVW %r0,%psw
000013fe: 70                                             NOP 
000013ff: 7f 05                                          BEB &0x5 <0x1404>
00001401: 7a 09 05                                       BRH &0x509 <0x190a>
00001404: 4f 05                                          BLEB &0x5 <0x1409>
00001406: 7a 04 05                                       BRH &0x504 <0x190a>
00001409: 43 05                                          BGEB &0x5 <0x140e>
0000140b: 7a ff 04                                       BRH &0x4ff <0x190a>
0000140e: 5f 05                                          BLEUB &0x5 <0x1413>
00001410: 7a fa 04                                       BRH &0x4fa <0x190a>
00001413: 5b 05                                          BLUB &0x5 <0x1418>
00001415: 7a f5 04                                       BRH &0x4f5 <0x190a>
00001418: 5b 05                                          BLUB &0x5 <0x141d>
0000141a: 7a f0 04                                       BRH &0x4f0 <0x190a>
0000141d: 6b 05                                          BVSB &0x5 <0x1422>
0000141f: 7a eb 04                                       BRH &0x4eb <0x190a>
00001422: 70                                             NOP 
00001423: 84 4b 40                                       MOVW %psw,%r0
00001426: b8 4f ff ff c3 ff 40                           ANDW2 &0xffc3ffff,%r0
0000142d: b0 4f 00 00 10 00 40                           ORW2 &0x100000,%r0
00001434: 84 40 4b                                       MOVW %r0,%psw
00001437: 70                                             NOP 
00001438: 43 05                                          BGEB &0x5 <0x143d>
0000143a: 7a d0 04                                       BRH &0x4d0 <0x190a>
0000143d: 70                                             NOP 
0000143e: 84 4b 40                                       MOVW %psw,%r0
00001441: b8 4f ff ff c3 ff 40                           ANDW2 &0xffc3ffff,%r0
00001448: b0 4f 00 00 04 00 40                           ORW2 &0x40000,%r0
0000144f: 84 40 4b                                       MOVW %r0,%psw
00001452: 70                                             NOP 
00001453: 5e 06 00                                       BLEUH &0x6 <0x1459>
00001456: 7a b4 04                                       BRH &0x4b4 <0x190a>
00001459: 70                                             NOP 
0000145a: 84 4b 40                                       MOVW %psw,%r0
0000145d: b8 4f ff ff c3 ff 40                           ANDW2 &0xffc3ffff,%r0
00001464: b0 4f 00 00 20 00 40                           ORW2 &0x200000,%r0
0000146b: 84 40 4b                                       MOVW %r0,%psw
0000146e: 70                                             NOP 
0000146f: 4b 05                                          BLB &0x5 <0x1474>
00001471: 7a 99 04                                       BRH &0x499 <0x190a>
00001474: 84 ff 40                                       MOVW &-1,%r0
00001477: 84 40 41                                       MOVW %r0,%r1
0000147a: 84 41 42                                       MOVW %r1,%r2
0000147d: 84 42 43                                       MOVW %r2,%r3
00001480: 84 43 44                                       MOVW %r3,%r4
00001483: 84 44 45                                       MOVW %r4,%r5
00001486: 84 45 46                                       MOVW %r5,%r6
00001489: 84 46 47                                       MOVW %r6,%r7
0000148c: 84 47 48                                       MOVW %r7,%r8
0000148f: 3c 40 48                                       CMPW %r0,%r8
00001492: 76 78 04                                       BNEH &0x478 <0x190a>
00001495: d0 01 40 40                                    LLSW3 &0x1,%r0,%r0
00001499: 43 04                                          BGEB &0x4 <0x149d>
0000149b: 7b dc                                          BRB &0xdc <0x1477>
0000149d: 84 fe 40                                       MOVW &-2,%r0
000014a0: 88 40 41                                       MCOMW %r0,%r1
000014a3: 88 41 42                                       MCOMW %r1,%r2
000014a6: 88 42 43                                       MCOMW %r2,%r3
000014a9: 88 43 44                                       MCOMW %r3,%r4
000014ac: 88 44 45                                       MCOMW %r4,%r5
000014af: 88 45 46                                       MCOMW %r5,%r6
000014b2: 88 46 47                                       MCOMW %r6,%r7
000014b5: 88 47 48                                       MCOMW %r7,%r8
000014b8: 88 40 48                                       MCOMW %r0,%r8
000014bb: 88 41 47                                       MCOMW %r1,%r7
000014be: 88 42 46                                       MCOMW %r2,%r6
000014c1: 88 43 45                                       MCOMW %r3,%r5
000014c4: 88 48 41                                       MCOMW %r8,%r1
000014c7: 88 47 42                                       MCOMW %r7,%r2
000014ca: 88 46 43                                       MCOMW %r6,%r3
000014cd: 88 44 40                                       MCOMW %r4,%r0
000014d0: 88 41 44                                       MCOMW %r1,%r4
000014d3: 3c 40 48                                       CMPW %r0,%r8
000014d6: 76 34 04                                       BNEH &0x434 <0x190a>
000014d9: d0 01 40 40                                    LLSW3 &0x1,%r0,%r0
000014dd: 4b 07                                          BLB &0x7 <0x14e4>
000014df: 88 40 40                                       MCOMW %r0,%r0
000014e2: 7b be                                          BRB &0xbe <0x14a0>
000014e4: 84 49 41                                       MOVW %fp,%r1
000014e7: 84 4a 42                                       MOVW %ap,%r2
000014ea: 84 4c 43                                       MOVW %sp,%r3
000014ed: 84 4d 44                                       MOVW %pcbp,%r4
000014f0: 84 4e 45                                       MOVW %isp,%r5
000014f3: 84 ff 40                                       MOVW &-1,%r0
000014f6: 84 40 49                                       MOVW %r0,%fp
000014f9: 84 49 4a                                       MOVW %fp,%ap
000014fc: 84 4a 4c                                       MOVW %ap,%sp
000014ff: 84 4c 4d                                       MOVW %sp,%pcbp
00001502: 84 4d 4e                                       MOVW %pcbp,%isp
00001505: 3c 49 4e                                       CMPW %fp,%isp
00001508: 76 4c 00                                       BNEH &0x4c <0x1554>
0000150b: d0 01 40 40                                    LLSW3 &0x1,%r0,%r0
0000150f: 43 04                                          BGEB &0x4 <0x1513>
00001511: 7b e5                                          BRB &0xe5 <0x14f6>
00001513: 84 01 40                                       MOVW &0x1,%r0
00001516: 88 40 49                                       MCOMW %r0,%fp
00001519: 88 49 4a                                       MCOMW %fp,%ap
0000151c: 88 4a 4c                                       MCOMW %ap,%sp
0000151f: 88 4c 4d                                       MCOMW %sp,%pcbp
00001522: 88 4d 4e                                       MCOMW %pcbp,%isp
00001525: 88 49 4e                                       MCOMW %fp,%isp
00001528: 88 4a 4d                                       MCOMW %ap,%pcbp
0000152b: 88 4c 49                                       MCOMW %sp,%fp
0000152e: 88 4e 4a                                       MCOMW %isp,%ap
00001531: 88 4d 4c                                       MCOMW %pcbp,%sp
00001534: 3c 49 4e                                       CMPW %fp,%isp
00001537: 76 1d 00                                       BNEH &0x1d <0x1554>
0000153a: d0 01 40 40                                    LLSW3 &0x1,%r0,%r0
0000153e: 4b 04                                          BLB &0x4 <0x1542>
00001540: 7b d6                                          BRB &0xd6 <0x1516>
00001542: 84 41 49                                       MOVW %r1,%fp
00001545: 84 42 4a                                       MOVW %r2,%ap
00001548: 84 43 4c                                       MOVW %r3,%sp
0000154b: 84 44 4d                                       MOVW %r4,%pcbp
0000154e: 84 45 4e                                       MOVW %r5,%isp
00001551: 7a 15 00                                       BRH &0x15 <0x1566>
00001554: 84 41 49                                       MOVW %r1,%fp
00001557: 84 42 4a                                       MOVW %r2,%ap
0000155a: 84 43 4c                                       MOVW %r3,%sp
0000155d: 84 44 4d                                       MOVW %r4,%pcbp
00001560: 84 45 4e                                       MOVW %r5,%isp
00001563: 7a a7 03                                       BRH &0x3a7 <0x190a>
00001566: 82 48                                          CLRH %r8
00001568: 84 4f ee ff 01 00 45                           MOVW &0x1ffee,%r5
0000156f: 80 47                                          CLRW %r7
00001571: 7b 47                                          BRB &0x47 <0x15b8>
00001573: 84 5f ff 00 40                                 MOVW &0xff,%r0
00001578: 86 e2 40 e0 40                                 MOVH {uhalf}%r0,{uword}%r0
0000157d: 87 57 e0 41                                    MOVB (%r7),{uword}%r1
00001581: b8 41 40                                       ANDW2 %r1,%r0
00001584: 86 e2 40 e0 40                                 MOVH {uhalf}%r0,{uword}%r0
00001589: 86 e2 48 e0 41                                 MOVH {uhalf}%r8,{uword}%r1
0000158e: 9c 41 40                                       ADDW2 %r1,%r0
00001591: 86 40 48                                       MOVH %r0,%r8
00001594: 86 e2 48 e0 40                                 MOVH {uhalf}%r8,{uword}%r0
00001599: d4 0f 40 40                                    LRSW3 &0xf,%r0,%r0
0000159d: 86 e2 40 e0 40                                 MOVH {uhalf}%r0,{uword}%r0
000015a2: 86 e2 48 e0 41                                 MOVH {uhalf}%r8,{uword}%r1
000015a7: d0 01 41 41                                    LLSW3 &0x1,%r1,%r1
000015ab: 86 e2 41 e0 41                                 MOVH {uhalf}%r1,{uword}%r1
000015b0: b0 41 40                                       ORW2 %r1,%r0
000015b3: 86 40 48                                       MOVH %r0,%r8
000015b6: 90 47                                          INCW %r7
000015b8: 3c 45 47                                       CMPW %r5,%r7
000015bb: 5b b8                                          BLUB &0xb8 <0x1573>
000015bd: 86 e2 48 e0 40                                 MOVH {uhalf}%r8,{uword}%r0
000015c2: 88 40 40                                       MCOMW %r0,%r0
000015c5: 86 40 48                                       MOVH %r0,%r8
000015c8: 86 e2 48 e0 40                                 MOVH {uhalf}%r8,{uword}%r0
000015cd: 87 57 e0 41                                    MOVB (%r7),{uword}%r1
000015d1: 87 c7 01 e0 42                                 MOVB 1(%r7),{uword}%r2
000015d6: d0 08 42 42                                    LLSW3 &0x8,%r2,%r2
000015da: b0 42 41                                       ORW2 %r2,%r1
000015dd: 3c 41 40                                       CMPW %r1,%r0
000015e0: 7f 05                                          BEB &0x5 <0x15e5>
000015e2: 7a 31 03                                       BRH &0x331 <0x1913>
000015e5: 84 7f a0 03 00 02 45                           MOVW $0x20003a0,%r5
000015ec: 84 7f 98 0c 00 02 43                           MOVW $0x2000c98,%r3
000015f3: 84 01 7f 38 40 04 00                           MOVW &0x1,$0x44038
000015fa: 84 4f 00 00 00 02 47                           MOVW &0x2000000,%r7
00001601: 84 4f b4 12 00 02 46                           MOVW &0x20012b4,%r6
00001608: 7b 4b                                          BRB &0x4b <0x1653>
0000160a: 84 ff 57                                       MOVW &-1,(%r7)
0000160d: 3c ff 57                                       CMPW &-1,(%r7)
00001610: 7f 08                                          BEB &0x8 <0x1618>
00001612: 24 7f 1c 19 00 00                              JMP $0x191c
00001618: 84 4f aa aa aa aa 57                           MOVW &0xaaaaaaaa,(%r7)
0000161f: 3c 4f aa aa aa aa 57                           CMPW &0xaaaaaaaa,(%r7)
00001626: 7f 08                                          BEB &0x8 <0x162e>
00001628: 24 7f 1c 19 00 00                              JMP $0x191c
0000162e: 84 4f 55 55 55 55 57                           MOVW &0x55555555,(%r7)
00001635: 3c 4f 55 55 55 55 57                           CMPW &0x55555555,(%r7)
0000163c: 7f 08                                          BEB &0x8 <0x1644>
0000163e: 24 7f 1c 19 00 00                              JMP $0x191c
00001644: 80 57                                          CLRW (%r7)
00001646: 28 57                                          TSTW (%r7)
00001648: 7f 08                                          BEB &0x8 <0x1650>
0000164a: 24 7f 1c 19 00 00                              JMP $0x191c
00001650: 9c 04 47                                       ADDW2 &0x4,%r7
00001653: 3c 46 47                                       CMPW %r6,%r7
00001656: 5b b4                                          BLUB &0xb4 <0x160a>
00001658: 3c 4f 00 40 00 02 47                           CMPW &0x2004000,%r7
0000165f: 4b 04                                          BLB &0x4 <0x1663>
00001661: 7b 28                                          BRB &0x28 <0x1689>
00001663: 3c 4f ef be ed fe 45                           CMPW &0xfeedbeef,%r5
0000166a: 7f 0b                                          BEB &0xb <0x1675>
0000166c: 3c 4f 1e ac eb ad 45                           CMPW &0xadebac1e,%r5
00001673: 77 0b                                          BNEB &0xb <0x167e>
00001675: 84 4f 00 30 00 02 47                           MOVW &0x2003000,%r7
0000167c: 7b 04                                          BRB &0x4 <0x1680>
0000167e: 80 43                                          CLRW %r3
00001680: 84 4f 00 40 00 02 46                           MOVW &0x2004000,%r6
00001687: 7b 81                                          BRB &0x81 <0x1608>
00001689: 84 45 7f a0 03 00 02                           MOVW %r5,$0x20003a0
00001690: 84 43 7f 98 0c 00 02                           MOVW %r3,$0x2000c98
00001697: 87 01 7f 9d 0c 00 02                           MOVB &0x1,$0x2000c9d
0000169e: 24 7f a1 19 00 00                              JMP $0x19a1
000016a4: 84 4f 72 6e 00 00 7f 28 04 00 02               MOVW &0x6e72,$0x2000428
000016af: 28 7f 40 04 00 02                              TSTW $0x2000440
000016b5: 77 09                                          BNEB &0x9 <0x16be>
000016b7: 2c 5c 7f 00 6a 00 00                           CALL (%sp),$0x6a00
000016be: 80 7f 40 04 00 02                              CLRW $0x2000440
000016c4: 80 7f 00 00 00 02                              CLRW $0x2000000
000016ca: 84 4f 32 30 6d 61 7f 00 00 00 03               MOVW &0x616d3032,$0x3000000
000016d5: 3c 4f 32 30 6d 61 7f 00 00 00 02               CMPW &0x616d3032,$0x2000000
000016e0: 77 0b                                          BNEB &0xb <0x16eb>
000016e2: 87 02 7f 94 0c 00 02                           MOVB &0x2,$0x2000c94
000016e9: 7b 09                                          BRB &0x9 <0x16f2>
000016eb: 87 04 7f 94 0c 00 02                           MOVB &0x4,$0x2000c94
000016f2: 80 7f 00 00 00 03                              CLRW $0x3000000
000016f8: 80 7f 60 40 04 00                              CLRW $0x44060
000016fe: 80 7f 5c 40 04 00                              CLRW $0x4405c
00001704: 83 7f 0d 90 04 00                              CLRB $0x4900d
0000170a: 87 08 7f 0f 90 04 00                           MOVB &0x8,$0x4900f
00001711: 80 7f 34 40 04 00                              CLRW $0x44034
00001717: 80 7f 28 40 04 00                              CLRW $0x44028
0000171d: 80 7f 6c 40 04 00                              CLRW $0x4406c
00001723: 80 7f 68 40 04 00                              CLRW $0x44068
00001729: 84 7f 00 ff 04 00 45                           MOVW $0x4ff00,%r5
00001730: 38 7f 60 40 04 00 04                           BITW $0x44060,&0x4
00001737: 7f 10                                          BEB &0x10 <0x1747>
00001739: 80 7f 68 40 04 00                              CLRW $0x44068
0000173f: 80 7f 6c 40 04 00                              CLRW $0x4406c
00001745: 7b 09                                          BRB &0x9 <0x174e>
00001747: 87 11 7f 94 0c 00 02                           MOVB &0x11,$0x2000c94
0000174e: 3c 4f ed 0d 1c a1 7f a0 03 00 02               CMPW &0xa11c0ded,$0x20003a0
00001759: 7f 2f                                          BEB &0x2f <0x1788>
0000175b: 3c 4f 05 b2 a6 5d 7f a0 03 00 02               CMPW &0x5da6b205,$0x20003a0
00001766: 7f 22                                          BEB &0x22 <0x1788>
00001768: 3c 4f 0d f0 ad 8b 7f a0 03 00 02               CMPW &0x8badf00d,$0x20003a0
00001773: 7f 15                                          BEB &0x15 <0x1788>
00001775: 3c 4f 7e ca d1 de 7f a0 03 00 02               CMPW &0xded1ca7e,$0x20003a0
00001780: 7f 08                                          BEB &0x8 <0x1788>
00001782: 24 7f 07 18 00 00                              JMP $0x1807
00001788: 84 4f 00 90 04 00 7f 18 04 00 02               MOVW &0x49000,$0x2000418
00001793: 2c 5c 7f 9c 33 00 00                           CALL (%sp),$0x339c
0000179a: a0 00                                          PUSHW &0x0
0000179c: 2c cc fc 7f a8 67 00 00                        CALL -4(%sp),$0x67a8
000017a4: 87 7f 00 a0 04 00 e0 45                        MOVB $0x4a000,{uword}%r5
000017ac: 2c 5c 7f 48 68 00 00                           CALL (%sp),$0x6848
000017b3: 87 01 7f 9d 0c 00 02                           MOVB &0x1,$0x2000c9d
000017ba: 2c 5c 7f 7e 53 00 00                           CALL (%sp),$0x537e
000017c1: 3c 4f ed 0d 1c a1 7f a0 03 00 02               CMPW &0xa11c0ded,$0x20003a0
000017cc: 77 0b                                          BNEB &0xb <0x17d7>
000017ce: 2c 5c ef ac 03 00 02                           CALL (%sp),*$0x20003ac
000017d5: 7b 32                                          BRB &0x32 <0x1807>
000017d7: 3c 4f 05 b2 a6 5d 7f a0 03 00 02               CMPW &0x5da6b205,$0x20003a0
000017e2: 77 1f                                          BNEB &0x1f <0x1801>
000017e4: 83 ef a0 04 00 00                              CLRB *$0x4a0
000017ea: 2c 5c 7f 00 40 00 02                           CALL (%sp),$0x2004000
000017f1: a0 4f ef be ed fe                              PUSHW &0xfeedbeef
000017f7: 2c cc fc 7f fe 58 00 00                        CALL -4(%sp),$0x58fe
000017ff: 7b 08                                          BRB &0x8 <0x1807>
00001801: 24 7f 7c 6a 00 00                              JMP $0x6a7c
00001807: 87 5f d0 00 7f 00 a0 04 00                     MOVB &0xd0,$0x4a000
00001810: a0 01                                          PUSHW &0x1
00001812: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
0000181a: a0 00                                          PUSHW &0x0
0000181c: a0 4f a0 0c 00 02                              PUSHW &0x2000ca0
00001822: a0 00                                          PUSHW &0x0
00001824: a0 03                                          PUSHW &0x3
00001826: 2c cc f0 7f 2c 65 00 00                        CALL -16(%sp),$0x652c
0000182e: 3c 01 40                                       CMPW &0x1,%r0
00001831: 77 53                                          BNEB &0x53 <0x1884>
00001833: 84 7f 08 05 00 00 40                           MOVW $0x508,%r0
0000183a: 3f c0 03 7f a0 0c 00 02                        CMPB 3(%r0),$0x2000ca0
00001842: 77 42                                          BNEB &0x42 <0x1884>
00001844: 84 7f 08 05 00 00 40                           MOVW $0x508,%r0
0000184b: 3f c0 07 7f a1 0c 00 02                        CMPB 7(%r0),$0x2000ca1
00001853: 77 31                                          BNEB &0x31 <0x1884>
00001855: 84 7f 08 05 00 00 40                           MOVW $0x508,%r0
0000185c: 3f c0 0b 7f a2 0c 00 02                        CMPB 11(%r0),$0x2000ca2
00001864: 77 20                                          BNEB &0x20 <0x1884>
00001866: 84 7f 08 05 00 00 40                           MOVW $0x508,%r0
0000186d: 3f c0 0f 7f a3 0c 00 02                        CMPB 15(%r0),$0x2000ca3
00001875: 77 0f                                          BNEB &0xf <0x1884>
00001877: b0 4f 00 00 00 40 7f 98 0c 00 02               ORW2 &0x40000000,$0x2000c98
00001882: 7b 1b                                          BRB &0x1b <0x189d>
00001884: a0 00                                          PUSHW &0x0
00001886: 2c cc fc 7f 8c 4a 00 00                        CALL -4(%sp),$0x4a8c
0000188e: 28 40                                          TSTW %r0
00001890: 77 0d                                          BNEB &0xd <0x189d>
00001892: b0 4f 00 00 00 20 7f 98 0c 00 02               ORW2 &0x20000000,$0x2000c98
0000189d: 38 7f 98 0c 00 02 4f 00 00 00 20               BITW $0x2000c98,&0x20000000
000018a8: 77 0f                                          BNEB &0xf <0x18b7>
000018aa: 38 7f 98 0c 00 02 4f 00 00 00 40               BITW $0x2000c98,&0x40000000
000018b5: 7f 39                                          BEB &0x39 <0x18ee>
000018b7: 84 4f 04 20 04 00 47                           MOVW &0x42004,%r7
000018be: 84 4f 04 24 04 00 45                           MOVW &0x42404,%r5
000018c5: 7b 07                                          BRB &0x7 <0x18cc>
000018c7: 80 57                                          CLRW (%r7)
000018c9: 9c 04 47                                       ADDW2 &0x4,%r7
000018cc: 3c 45 47                                       CMPW %r5,%r7
000018cf: 5b f8                                          BLUB &0xf8 <0x18c7>
000018d1: 87 10 7f 9c 0c 00 02                           MOVB &0x10,$0x2000c9c
000018d8: a0 4f 9c 0c 00 02                              PUSHW &0x2000c9c
000018de: a0 4f 0c 30 04 00                              PUSHW &0x4300c
000018e4: a0 01                                          PUSHW &0x1
000018e6: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
000018ee: a0 4f 94 0c 00 02                              PUSHW &0x2000c94
000018f4: a0 4f c4 30 04 00                              PUSHW &0x430c4
000018fa: a0 01                                          PUSHW &0x1
000018fc: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
00001904: 24 7f 39 1b 00 00                              JMP $0x1b39
0000190a: 84 02 44                                       MOVW &0x2,%r4
0000190d: 24 7f 28 19 00 00                              JMP $0x1928
00001913: 84 03 44                                       MOVW &0x3,%r4
00001916: 24 7f 28 19 00 00                              JMP $0x1928
0000191c: 84 04 44                                       MOVW &0x4,%r4
0000191f: 24 7f 28 19 00 00                              JMP $0x1928
00001925: 84 05 44                                       MOVW &0x5,%r4
00001928: 80 7f 40 40 04 00                              CLRW $0x44040
0000192e: 80 45                                          CLRW %r5
00001930: 7b 2f                                          BRB &0x2f <0x195f>
00001932: 80 43                                          CLRW %r3
00001934: 7b 04                                          BRB &0x4 <0x1938>
00001936: 90 43                                          INCW %r3
00001938: 3c 4f a0 86 01 00 43                           CMPW &0x186a0,%r3
0000193f: 5f f7                                          BLEUB &0xf7 <0x1936>
00001941: 84 01 7f 40 40 04 00                           MOVW &0x1,$0x44040
00001948: 80 43                                          CLRW %r3
0000194a: 7b 04                                          BRB &0x4 <0x194e>
0000194c: 90 43                                          INCW %r3
0000194e: 3c 4f a0 86 01 00 43                           CMPW &0x186a0,%r3
00001955: 5f f7                                          BLEUB &0xf7 <0x194c>
00001957: 80 7f 40 40 04 00                              CLRW $0x44040
0000195d: 90 45                                          INCW %r5
0000195f: 3c 44 45                                       CMPW %r4,%r5
00001962: 5b d0                                          BLUB &0xd0 <0x1932>
00001964: 38 7f 00 40 04 00 02                           BITW $0x44000,&0x2
0000196b: 7f 10                                          BEB &0x10 <0x197b>
0000196d: 80 ef 8c 04 00 00                              CLRW *$0x48c
00001973: 80 7f 44 40 04 00                              CLRW $0x44044
00001979: 7b 00                                          BRB &0x0 <0x1979>
0000197b: 80 43                                          CLRW %r3
0000197d: 7b 04                                          BRB &0x4 <0x1981>
0000197f: 90 43                                          INCW %r3
00001981: e8 4f a0 86 01 00 44 40                        MULW3 &0x186a0,%r4,%r0
00001989: 3c 40 43                                       CMPW %r0,%r3
0000198c: 5f f3                                          BLEUB &0xf3 <0x197f>
0000198e: 24 7f 2e 19 00 00                              JMP $0x192e
00001994: 18 43                                          RESTORE %r3
00001996: 08                                             RET 
00001997: 70                                             NOP 
00001998: 10 45                                          SAVE %r5
0000199a: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
000019a1: 84 4f a0 0e 00 02 48                           MOVW &0x2000ea0,%r8
000019a8: 84 4f 04 06 00 00 47                           MOVW &0x604,%r7
000019af: 80 45                                          CLRW %r5
000019b1: 7b 11                                          BRB &0x11 <0x19c2>
000019b3: 84 48 40                                       MOVW %r8,%r0
000019b6: 90 48                                          INCW %r8
000019b8: 84 47 41                                       MOVW %r7,%r1
000019bb: 90 47                                          INCW %r7
000019bd: 87 51 50                                       MOVB (%r1),(%r0)
000019c0: 90 45                                          INCW %r5
000019c2: 3c 6f 44 45                                    CMPW &0x44,%r5
000019c6: 5b ed                                          BLUB &0xed <0x19b3>
000019c8: 84 4f 80 e1 81 00 7f 80 00 00 02               MOVW &0x81e180,$0x2000080
000019d3: 84 4f 6c 37 00 00 7f 84 00 00 02               MOVW &0x376c,$0x2000084
000019de: 84 4f 40 0f 00 02 7f 88 00 00 02               MOVW &0x2000f40,$0x2000088
000019e9: 84 4f 40 0f 00 02 7f 98 00 00 02               MOVW &0x2000f40,$0x2000098
000019f4: 84 4f 40 10 00 02 7f 9c 00 00 02               MOVW &0x2001040,$0x200009c
000019ff: 80 7f cc 00 00 02                              CLRW $0x20000cc
00001a05: 84 4f 80 e1 81 00 7f 30 00 00 02               MOVW &0x81e180,$0x2000030
00001a10: 84 4f cc 38 00 00 7f 34 00 00 02               MOVW &0x38cc,$0x2000034
00001a1b: 84 4f 40 10 00 02 7f 38 00 00 02               MOVW &0x2001040,$0x2000038
00001a26: 84 4f 40 10 00 02 7f 48 00 00 02               MOVW &0x2001040,$0x2000048
00001a31: 84 4f 40 12 00 02 7f 4c 00 00 02               MOVW &0x2001240,$0x200004c
00001a3c: 80 7f 7c 00 00 02                              CLRW $0x200007c
00001a42: 80 45                                          CLRW %r5
00001a44: 7b 35                                          BRB &0x35 <0x1a79>
00001a46: e8 6f 50 45 40                                 MULW3 &0x50,%r5,%r0
00001a4b: 9c 4f d0 00 00 02 40                           ADDW2 &0x20000d0,%r0
00001a52: 84 40 46                                       MOVW %r0,%r6
00001a55: 84 4f 80 e1 81 00 56                           MOVW &0x81e180,(%r6)
00001a5c: 84 4f 40 0f 00 02 c6 08                        MOVW &0x2000f40,8(%r6)
00001a64: 84 4f 40 0f 00 02 c6 18                        MOVW &0x2000f40,24(%r6)
00001a6c: 84 4f 40 10 00 02 c6 1c                        MOVW &0x2001040,28(%r6)
00001a74: 80 c6 4c                                       CLRW 76(%r6)
00001a77: 90 45                                          INCW %r5
00001a79: 3c 09 45                                       CMPW &0x9,%r5
00001a7c: 4b ca                                          BLB &0xca <0x1a46>
00001a7e: 84 4f 8f 37 00 00 7f d4 00 00 02               MOVW &0x378f,$0x20000d4
00001a89: 84 4f b2 37 00 00 7f 24 01 00 02               MOVW &0x37b2,$0x2000124
00001a94: 84 4f d5 37 00 00 7f 74 01 00 02               MOVW &0x37d5,$0x2000174
00001a9f: 84 4f f8 37 00 00 7f c4 01 00 02               MOVW &0x37f8,$0x20001c4
00001aaa: 84 4f 1b 38 00 00 7f 14 02 00 02               MOVW &0x381b,$0x2000214
00001ab5: 84 4f 3e 38 00 00 7f 64 02 00 02               MOVW &0x383e,$0x2000264
00001ac0: 84 4f 61 38 00 00 7f b4 02 00 02               MOVW &0x3861,$0x20002b4
00001acb: 84 4f 84 38 00 00 7f 04 03 00 02               MOVW &0x3884,$0x2000304
00001ad6: 84 4f a7 38 00 00 7f 54 03 00 02               MOVW &0x38a7,$0x2000354
00001ae1: 84 4f 80 e1 81 00 7f f0 0e 00 02               MOVW &0x81e180,$0x2000ef0
00001aec: 84 4f 5a 39 00 00 7f f4 0e 00 02               MOVW &0x395a,$0x2000ef4
00001af7: 84 4f 40 10 00 02 7f f8 0e 00 02               MOVW &0x2001040,$0x2000ef8
00001b02: 84 4f 40 10 00 02 7f 08 0f 00 02               MOVW &0x2001040,$0x2000f08
00001b0d: 84 4f 40 12 00 02 7f 0c 0f 00 02               MOVW &0x2001240,$0x2000f0c
00001b18: 80 7f 3c 0f 00 02                              CLRW $0x2000f3c
00001b1e: 04 7f a0 0e 00 02 4d                           MOVAW $0x2000ea0,%pcbp
00001b25: 24 7f a4 16 00 00                              JMP $0x16a4
00001b2b: 18 45                                          RESTORE %r5
00001b2d: 08                                             RET 
00001b2e: 70                                             NOP 
00001b2f: 70                                             NOP 
00001b30: 10 47                                          SAVE %r7
00001b32: 9c 4f 08 00 00 00 4c                           ADDW2 &0x8,%sp
00001b39: 84 4f 00 90 04 00 7f 18 04 00 02               MOVW &0x49000,$0x2000418
00001b44: 2c 5c 7f 9c 33 00 00                           CALL (%sp),$0x339c
00001b4b: 2c 5c af 4f 06                                 CALL (%sp),0x64f(%pc)
00001b50: 86 40 7f 44 12 00 02                           MOVH %r0,$0x2001244
00001b57: 86 7f 44 12 00 02 e4 40                        MOVH $0x2001244,{word}%r0
00001b5f: 2a 40                                          TSTH %r0
00001b61: 77 0a                                          BNEB &0xa <0x1b6b>
00001b63: 24 7f 25 19 00 00                              JMP $0x1925
00001b69: 7b 11                                          BRB &0x11 <0x1b7a>
00001b6b: 3e 02 7f 44 12 00 02                           CMPH &0x2,$0x2001244
00001b72: 77 08                                          BNEB &0x8 <0x1b7a>
00001b74: 24 7f 3d 13 00 00                              JMP $0x133d
00001b7a: b0 4f 00 00 00 80 7f 98 0c 00 02               ORW2 &0x80000000,$0x2000c98
00001b85: 2c 5c 7f 44 52 00 00                           CALL (%sp),$0x5244
00001b8c: 2c 5c 7f 2c 24 00 00                           CALL (%sp),$0x242c
00001b93: 84 40 ef e4 04 00 00                           MOVW %r0,*$0x4e4
00001b9a: 84 7f 90 04 00 00 ef e8 04 00 00               MOVW $0x490,*$0x4e8
00001ba5: 83 ef e0 04 00 00                              CLRB *$0x4e0
00001bab: 9c 20 ef e8 04 00 00                           ADDW2 &0x20,*$0x4e8
00001bb2: 87 ef e0 04 00 00 e0 40                        MOVB *$0x4e0,{uword}%r0
00001bba: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00001bbe: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00001bc5: 87 00 e0 41                                    MOVB &0x0,{uword}%r1
00001bc9: c8 03 0c 41 50                                 INSFW &0x3,&0xc,%r1,(%r0)
00001bce: 87 ef e0 04 00 00 e0 40                        MOVB *$0x4e0,{uword}%r0
00001bd6: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00001bda: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00001be1: 86 01 50                                       MOVH &0x1,(%r0)
00001be4: 87 ef e0 04 00 00 e0 40                        MOVB *$0x4e0,{uword}%r0
00001bec: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00001bf0: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00001bf7: 87 00 e0 41                                    MOVB &0x0,{uword}%r1
00001bfb: c8 02 0b 41 c0 04                              INSFW &0x2,&0xb,%r1,4(%r0)
00001c01: 87 ef e0 04 00 00 e0 40                        MOVB *$0x4e0,{uword}%r0
00001c09: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00001c0d: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00001c14: 87 01 e0 41                                    MOVB &0x1,{uword}%r1
00001c18: c8 00 05 41 c0 04                              INSFW &0x0,&0x5,%r1,4(%r0)
00001c1e: 87 ef e0 04 00 00 e0 40                        MOVB *$0x4e0,{uword}%r0
00001c26: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00001c2a: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00001c31: 87 01 e0 41                                    MOVB &0x1,{uword}%r1
00001c35: c8 00 06 41 c0 04                              INSFW &0x0,&0x6,%r1,4(%r0)
00001c3b: 87 ef e0 04 00 00 e0 40                        MOVB *$0x4e0,{uword}%r0
00001c43: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00001c47: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00001c4e: 9c 0c 40                                       ADDW2 &0xc,%r0
00001c51: a0 40                                          PUSHW %r0
00001c53: a0 4f 48 06 00 00                              PUSHW &0x648
00001c59: 2c cc f8 7f 28 70 00 00                        CALL -8(%sp),$0x7028
00001c61: 87 ef e0 04 00 00 40                           MOVB *$0x4e0,%r0
00001c68: 93 ef e0 04 00 00                              INCB *$0x4e0
00001c6e: 87 40 e0 40                                    MOVB %r0,{uword}%r0
00001c72: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00001c76: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00001c7d: 87 01 e0 41                                    MOVB &0x1,{uword}%r1
00001c81: c8 00 07 41 c0 04                              INSFW &0x0,&0x7,%r1,4(%r0)
00001c87: 84 4f 98 6f 00 00 ef 98 04 00 00               MOVW &0x6f98,*$0x498
00001c92: 84 4f 98 6f 00 00 ef 0c 05 00 00               MOVW &0x6f98,*$0x50c
00001c9d: 2c 5c 7f 7e 53 00 00                           CALL (%sp),$0x537e
00001ca4: 84 4f ca 20 00 00 ef 98 04 00 00               MOVW &0x20ca,*$0x498
00001caf: 87 01 ef e0 04 00 00                           MOVB &0x1,*$0x4e0
00001cb6: 82 7f 44 12 00 02                              CLRH $0x2001244
00001cbc: 2c 5c ef c0 04 00 00                           CALL (%sp),*$0x4c0
00001cc3: 24 7f b5 1d 00 00                              JMP $0x1db5
00001cc9: fe 01 7f 44 12 00 02 40                        SUBH3 &0x1,$0x2001244,%r0
00001cd1: d0 15 40 40                                    LLSW3 &0x15,%r0,%r0
00001cd5: 83 80 05 00 20 00                              CLRB 0x200005(%r0)
00001cdb: a0 14                                          PUSHW &0x14
00001cdd: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
00001ce5: 87 ef e0 04 00 00 e0 40                        MOVB *$0x4e0,{uword}%r0
00001ced: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00001cf1: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00001cf8: fe 01 7f 44 12 00 02 41                        SUBH3 &0x1,$0x2001244,%r1
00001d00: d0 15 41 41                                    LLSW3 &0x15,%r1,%r1
00001d04: 87 81 01 00 20 00 e2 41                        MOVB 0x200001(%r1),{uhalf}%r1
00001d0c: 86 41 50                                       MOVH %r1,(%r0)
00001d0f: 9c 20 ef e8 04 00 00                           ADDW2 &0x20,*$0x4e8
00001d16: 87 ef e0 04 00 00 e0 40                        MOVB *$0x4e0,{uword}%r0
00001d1e: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00001d22: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00001d29: 87 00 e0 41                                    MOVB &0x0,{uword}%r1
00001d2d: c8 02 0b 41 c0 04                              INSFW &0x2,&0xb,%r1,4(%r0)
00001d33: 87 ef e0 04 00 00 40                           MOVB *$0x4e0,%r0
00001d3a: 93 ef e0 04 00 00                              INCB *$0x4e0
00001d40: 87 40 e0 40                                    MOVB %r0,{uword}%r0
00001d44: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00001d48: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00001d4f: 86 e2 7f 44 12 00 02 e0 41                     MOVH {uhalf}$0x2001244,{uword}%r1
00001d58: c8 03 0c 41 50                                 INSFW &0x3,&0xc,%r1,(%r0)
00001d5d: fe 01 7f 44 12 00 02 40                        SUBH3 &0x1,$0x2001244,%r0
00001d65: d0 15 40 40                                    LLSW3 &0x15,%r0,%r0
00001d69: 87 80 00 00 20 00 e2 40                        MOVB 0x200000(%r0),{uhalf}%r0
00001d71: 86 40 59                                       MOVH %r0,(%fp)
00001d74: 97 ef e0 04 00 00                              DECB *$0x4e0
00001d7a: 87 ef e0 04 00 00 e0 40                        MOVB *$0x4e0,{uword}%r0
00001d82: 87 40 e0 40                                    MOVB %r0,{uword}%r0
00001d86: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00001d8a: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00001d91: 84 40 64                                       MOVW %r0,4(%fp)
00001d94: 86 e2 59 e0 40                                 MOVH {uhalf}(%fp),{uword}%r0
00001d99: d0 08 40 40                                    LLSW3 &0x8,%r0,%r0
00001d9d: 86 e2 40 e0 40                                 MOVH {uhalf}%r0,{uword}%r0
00001da2: 86 e2 d9 04 e0 41                              MOVH {uhalf}*4(%fp),{uword}%r1
00001da8: b0 41 40                                       ORW2 %r1,%r0
00001dab: 86 40 d9 04                                    MOVH %r0,*4(%fp)
00001daf: 93 ef e0 04 00 00                              INCB *$0x4e0
00001db5: 92 7f 44 12 00 02                              INCH $0x2001244
00001dbb: 86 7f 44 12 00 02 e4 40                        MOVH $0x2001244,{word}%r0
00001dc3: 3e 0c 40                                       CMPH &0xc,%r0
00001dc6: 4e 03 ff                                       BLEH &0xff03 <0x1cc9>
00001dc9: 86 ff 7f 44 12 00 02                           MOVH &-1,$0x2001244
00001dd0: 2c 5c ef c0 04 00 00                           CALL (%sp),*$0x4c0
00001dd7: 24 7f 89 1e 00 00                              JMP $0x1e89
00001ddd: 86 7f 44 12 00 02 e4 40                        MOVH $0x2001244,{word}%r0
00001de5: d0 1a 40 40                                    LLSW3 &0x1a,%r0,%r0
00001de9: 87 80 03 40 01 06 e2 40                        MOVB 0x6014003(%r0),{uhalf}%r0
00001df1: 86 40 59                                       MOVH %r0,(%fp)
00001df4: 87 ef e0 04 00 00 e0 40                        MOVB *$0x4e0,{uword}%r0
00001dfc: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00001e00: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00001e07: 84 4f 00 ff 00 00 41                           MOVW &0xff00,%r1
00001e0e: 86 e2 41 e0 41                                 MOVH {uhalf}%r1,{uword}%r1
00001e13: 86 e2 59 e0 42                                 MOVH {uhalf}(%fp),{uword}%r2
00001e18: b0 42 41                                       ORW2 %r2,%r1
00001e1b: 86 41 50                                       MOVH %r1,(%r0)
00001e1e: 9c 20 ef e8 04 00 00                           ADDW2 &0x20,*$0x4e8
00001e25: 87 ef e0 04 00 00 e0 40                        MOVB *$0x4e0,{uword}%r0
00001e2d: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00001e31: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00001e38: 87 03 e0 41                                    MOVB &0x3,{uword}%r1
00001e3c: c8 02 0b 41 c0 04                              INSFW &0x2,&0xb,%r1,4(%r0)
00001e42: 87 ef e0 04 00 00 40                           MOVB *$0x4e0,%r0
00001e49: 93 ef e0 04 00 00                              INCB *$0x4e0
00001e4f: 87 40 e0 40                                    MOVB %r0,{uword}%r0
00001e53: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00001e57: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00001e5e: 86 e2 7f 44 12 00 02 e0 41                     MOVH {uhalf}$0x2001244,{uword}%r1
00001e67: c8 03 0c 41 50                                 INSFW &0x3,&0xc,%r1,(%r0)
00001e6c: 86 7f 44 12 00 02 e4 40                        MOVH $0x2001244,{word}%r0
00001e74: 93 80 40 12 00 02                              INCB 0x2001240(%r0)
00001e7a: fb 10 7f 94 0c 00 02 40                        ANDB3 &0x10,$0x2000c94,%r0
00001e82: 3c 10 40                                       CMPW &0x10,%r0
00001e85: 7f 04                                          BEB &0x4 <0x1e89>
00001e87: 7b 16                                          BRB &0x16 <0x1e9d>
00001e89: 92 7f 44 12 00 02                              INCH $0x2001244
00001e8f: 86 7f 44 12 00 02 e4 40                        MOVH $0x2001244,{word}%r0
00001e97: 3e 04 40                                       CMPH &0x4,%r0
00001e9a: 4e 43 ff                                       BLEH &0xff43 <0x1ddd>
00001e9d: fc 4f fc 59 00 00 4f 02 5a 00 00 47            SUBW3 &0x59fc,&0x5a02,%r7
00001ea9: 86 ff 7f 44 12 00 02                           MOVH &-1,$0x2001244
00001eb0: 84 4f 0e 21 00 00 ef 98 04 00 00               MOVW &0x210e,*$0x498
00001ebb: 2c 5c ef c0 04 00 00                           CALL (%sp),*$0x4c0
00001ec2: 92 7f 44 12 00 02                              INCH $0x2001244
00001ec8: 86 7f 44 12 00 02 e4 40                        MOVH $0x2001244,{word}%r0
00001ed0: 3e 5f 00 01 40                                 CMPH &0x100,%r0
00001ed5: 4b 08                                          BLB &0x8 <0x1edd>
00001ed7: 24 7f 6b 1f 00 00                              JMP $0x1f6b
00001edd: 04 7f fc 59 00 00 48                           MOVAW $0x59fc,%r8
00001ee4: 86 7f 44 12 00 02 e4 40                        MOVH $0x2001244,{word}%r0
00001eec: a8 47 40                                       MULW2 %r7,%r0
00001eef: 9c 40 48                                       ADDW2 %r0,%r8
00001ef2: 34 58                                          JSB (%r8)
00001ef4: 87 ef e0 04 00 00 e0 40                        MOVB *$0x4e0,{uword}%r0
00001efc: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00001f00: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00001f07: 84 4f 00 fd 00 00 41                           MOVW &0xfd00,%r1
00001f0e: 86 e2 41 e0 41                                 MOVH {uhalf}%r1,{uword}%r1
00001f13: 86 e2 7f 44 12 00 02 e0 42                     MOVH {uhalf}$0x2001244,{uword}%r2
00001f1c: b0 42 41                                       ORW2 %r2,%r1
00001f1f: 86 41 50                                       MOVH %r1,(%r0)
00001f22: 9c 20 ef e8 04 00 00                           ADDW2 &0x20,*$0x4e8
00001f29: 87 ef e0 04 00 00 e0 40                        MOVB *$0x4e0,{uword}%r0
00001f31: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00001f35: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00001f3c: 87 01 e0 41                                    MOVB &0x1,{uword}%r1
00001f40: c8 02 0b 41 c0 04                              INSFW &0x2,&0xb,%r1,4(%r0)
00001f46: 87 ef e0 04 00 00 40                           MOVB *$0x4e0,%r0
00001f4d: 93 ef e0 04 00 00                              INCB *$0x4e0
00001f53: 87 40 e0 40                                    MOVB %r0,{uword}%r0
00001f57: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00001f5b: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00001f62: 87 00 e0 41                                    MOVB &0x0,{uword}%r1
00001f66: c8 03 0c 41 50                                 INSFW &0x3,&0xc,%r1,(%r0)
00001f6b: 84 4f ca 20 00 00 ef 98 04 00 00               MOVW &0x20ca,*$0x498
00001f76: 86 ff 7f 44 12 00 02                           MOVH &-1,$0x2001244
00001f7d: 2c 5c ef c0 04 00 00                           CALL (%sp),*$0x4c0
00001f84: 24 7f 0d 20 00 00                              JMP $0x200d
00001f8a: 87 7f 00 00 c0 01 e2 40                        MOVB $0x1c00000,{uhalf}%r0
00001f92: 86 40 59                                       MOVH %r0,(%fp)
00001f95: 87 ef e0 04 00 00 e0 40                        MOVB *$0x4e0,{uword}%r0
00001f9d: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00001fa1: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00001fa8: 84 4f 00 fe 00 00 41                           MOVW &0xfe00,%r1
00001faf: 86 e2 41 e0 41                                 MOVH {uhalf}%r1,{uword}%r1
00001fb4: 86 e2 59 e0 42                                 MOVH {uhalf}(%fp),{uword}%r2
00001fb9: b0 42 41                                       ORW2 %r2,%r1
00001fbc: 86 41 50                                       MOVH %r1,(%r0)
00001fbf: 9c 20 ef e8 04 00 00                           ADDW2 &0x20,*$0x4e8
00001fc6: 87 ef e0 04 00 00 e0 40                        MOVB *$0x4e0,{uword}%r0
00001fce: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00001fd2: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00001fd9: 87 02 e0 41                                    MOVB &0x2,{uword}%r1
00001fdd: c8 02 0b 41 c0 04                              INSFW &0x2,&0xb,%r1,4(%r0)
00001fe3: 87 ef e0 04 00 00 40                           MOVB *$0x4e0,%r0
00001fea: 93 ef e0 04 00 00                              INCB *$0x4e0
00001ff0: 87 40 e0 40                                    MOVB %r0,{uword}%r0
00001ff4: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00001ff8: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00001fff: 86 e2 7f 44 12 00 02 e0 41                     MOVH {uhalf}$0x2001244,{uword}%r1
00002008: c8 03 0c 41 50                                 INSFW &0x3,&0xc,%r1,(%r0)
0000200d: 92 7f 44 12 00 02                              INCH $0x2001244
00002013: 86 7f 44 12 00 02 e4 40                        MOVH $0x2001244,{word}%r0
0000201b: 3e 01 40                                       CMPH &0x1,%r0
0000201e: 4a 6c ff                                       BLH &0xff6c <0x1f8a>
00002021: 2c 5c 7f 7e 53 00 00                           CALL (%sp),$0x537e
00002028: 84 4f 98 6f 00 00 ef 98 04 00 00               MOVW &0x6f98,*$0x498
00002033: 84 7f 90 04 00 00 40                           MOVW $0x490,%r0
0000203a: 87 01 e0 41                                    MOVB &0x1,{uword}%r1
0000203e: c8 03 00 41 c0 04                              INSFW &0x3,&0x0,%r1,4(%r0)
00002044: 84 7f 90 04 00 00 40                           MOVW $0x490,%r0
0000204b: 84 ef e8 04 00 00 c0 08                        MOVW *$0x4e8,8(%r0)
00002053: 9c 0c ef e8 04 00 00                           ADDW2 &0xc,*$0x4e8
0000205a: 84 7f 90 04 00 00 40                           MOVW $0x490,%r0
00002061: 86 01 d0 08                                    MOVH &0x1,*8(%r0)
00002065: 84 7f 90 04 00 00 40                           MOVW $0x490,%r0
0000206c: dc 02 c0 08 40                                 ADDW3 &0x2,8(%r0),%r0
00002071: a0 40                                          PUSHW %r0
00002073: a0 4f 4c 06 00 00                              PUSHW &0x64c
00002079: 2c cc f8 7f 28 70 00 00                        CALL -8(%sp),$0x7028
00002081: 3c 4f ef be ed fe 7f a0 03 00 02               CMPW &0xfeedbeef,$0x20003a0
0000208c: 7f 2c                                          BEB &0x2c <0x20b8>
0000208e: 3c 4f 0d f0 ad 8b 7f a0 03 00 02               CMPW &0x8badf00d,$0x20003a0
00002099: 7f 1f                                          BEB &0x1f <0x20b8>
0000209b: 3c 4f 1e ac eb ad 7f a0 03 00 02               CMPW &0xadebac1e,$0x20003a0
000020a6: 7f 12                                          BEB &0x12 <0x20b8>
000020a8: 2c 5c af 72 00                                 CALL (%sp),0x72(%pc)
000020ad: 28 40                                          TSTW %r0
000020af: 77 09                                          BNEB &0x9 <0x20b8>
000020b1: 2c 5c 7f 44 52 00 00                           CALL (%sp),$0x5244
000020b8: 2c 5c 7f 7e 53 00 00                           CALL (%sp),$0x537e
000020bf: 24 7f 7c 6a 00 00                              JMP $0x6a7c
000020c5: 18 47                                          RESTORE %r7
000020c7: 08                                             RET 
000020c8: 70                                             NOP 
000020c9: 70                                             NOP 
000020ca: 10 49                                          SAVE %fp
000020cc: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
000020d3: 38 7f 60 40 04 00 04                           BITW $0x44060,&0x4
000020da: 7f 0a                                          BEB &0xa <0x20e4>
000020dc: 80 7f 68 40 04 00                              CLRW $0x44068
000020e2: 7b 28                                          BRB &0x28 <0x210a>
000020e4: 84 4f ef be ed fe ef 8c 04 00 00               MOVW &0xfeedbeef,*$0x48c
000020ef: 2c 5c 7f 7e 53 00 00                           CALL (%sp),$0x537e
000020f6: b0 01 7f 98 0c 00 02                           ORW2 &0x1,$0x2000c98
000020fd: 2c 5c 7f 44 52 00 00                           CALL (%sp),$0x5244
00002104: 24 7f 7c 6a 00 00                              JMP $0x6a7c
0000210a: 18 49                                          RESTORE %fp
0000210c: 08                                             RET 
0000210d: 70                                             NOP 
0000210e: 10 49                                          SAVE %fp
00002110: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
00002117: 18 49                                          RESTORE %fp
00002119: 08                                             RET 
0000211a: 10 48                                          SAVE %r8
0000211c: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
00002123: 84 4f 00 40 00 02 48                           MOVW &0x2004000,%r8
0000212a: 7b 3e                                          BRB &0x3e <0x2168>
0000212c: 84 ff 58                                       MOVW &-1,(%r8)
0000212f: 3c ff 58                                       CMPW &-1,(%r8)
00002132: 7f 04                                          BEB &0x4 <0x2136>
00002134: 7b 3d                                          BRB &0x3d <0x2171>
00002136: 84 4f aa aa aa aa 58                           MOVW &0xaaaaaaaa,(%r8)
0000213d: 3c 4f aa aa aa aa 58                           CMPW &0xaaaaaaaa,(%r8)
00002144: 7f 04                                          BEB &0x4 <0x2148>
00002146: 7b 2b                                          BRB &0x2b <0x2171>
00002148: 84 4f 55 55 55 55 58                           MOVW &0x55555555,(%r8)
0000214f: 3c 4f 55 55 55 55 58                           CMPW &0x55555555,(%r8)
00002156: 7f 04                                          BEB &0x4 <0x215a>
00002158: 7b 19                                          BRB &0x19 <0x2171>
0000215a: 80 58                                          CLRW (%r8)
0000215c: 84 48 40                                       MOVW %r8,%r0
0000215f: 9c 04 48                                       ADDW2 &0x4,%r8
00002162: 28 50                                          TSTW (%r0)
00002164: 7f 04                                          BEB &0x4 <0x2168>
00002166: 7b 0b                                          BRB &0xb <0x2171>
00002168: 3c 4f 00 00 04 02 48                           CMPW &0x2040000,%r8
0000216f: 5b bd                                          BLUB &0xbd <0x212c>
00002171: 3c 4f 00 00 04 02 48                           CMPW &0x2040000,%r8
00002178: 53 18                                          BGEUB &0x18 <0x2190>
0000217a: b0 08 7f 98 0c 00 02                           ORW2 &0x8,$0x2000c98
00002181: 84 4f ef be ed fe 7f a0 03 00 02               MOVW &0xfeedbeef,$0x20003a0
0000218c: 80 40                                          CLRW %r0
0000218e: 7b 07                                          BRB &0x7 <0x2195>
00002190: 84 01 40                                       MOVW &0x1,%r0
00002193: 7b 02                                          BRB &0x2 <0x2195>
00002195: 18 48                                          RESTORE %r8
00002197: 08                                             RET 
00002198: 70                                             NOP 
00002199: 70                                             NOP 
0000219a: 10 49                                          SAVE %fp
0000219c: 9c 4f 04 00 00 00 4c                           ADDW2 &0x4,%sp
000021a3: 87 20 7f 02 90 04 00                           MOVB &0x20,$0x49002
000021aa: 87 30 7f 02 90 04 00                           MOVB &0x30,$0x49002
000021b1: 87 10 7f 02 90 04 00                           MOVB &0x10,$0x49002
000021b8: 87 7f 00 90 04 00 e2 40                        MOVB $0x49000,{uhalf}%r0
000021c0: 86 40 59                                       MOVH %r0,(%fp)
000021c3: b3 5f 80 00 7f 00 90 04 00                     ORB2 &0x80,$0x49000
000021cc: 87 05 7f 02 90 04 00                           MOVB &0x5,$0x49002
000021d3: a0 14                                          PUSHW &0x14
000021d5: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
000021dd: 87 6f 55 7f 03 90 04 00                        MOVB &0x55,$0x49003
000021e5: a0 14                                          PUSHW &0x14
000021e7: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
000021ef: 3b 7f 01 90 04 00 01                           BITB $0x49001,&0x1
000021f6: 77 0a                                          BNEB &0xa <0x2200>
000021f8: 80 40                                          CLRW %r0
000021fa: 24 7f 27 24 00 00                              JMP $0x2427
00002200: 3f 6f 55 7f 03 90 04 00                        CMPB &0x55,$0x49003
00002208: 7f 0a                                          BEB &0xa <0x2212>
0000220a: 80 40                                          CLRW %r0
0000220c: 24 7f 27 24 00 00                              JMP $0x2427
00002212: 3b 7f 01 90 04 00 01                           BITB $0x49001,&0x1
00002219: 7f 0a                                          BEB &0xa <0x2223>
0000221b: 80 40                                          CLRW %r0
0000221d: 24 7f 27 24 00 00                              JMP $0x2427
00002223: 87 5f aa 00 7f 03 90 04 00                     MOVB &0xaa,$0x49003
0000222c: a0 14                                          PUSHW &0x14
0000222e: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
00002236: 3b 7f 01 90 04 00 01                           BITB $0x49001,&0x1
0000223d: 77 0a                                          BNEB &0xa <0x2247>
0000223f: 80 40                                          CLRW %r0
00002241: 24 7f 27 24 00 00                              JMP $0x2427
00002247: 3f 5f aa 00 7f 03 90 04 00                     CMPB &0xaa,$0x49003
00002250: 7f 0a                                          BEB &0xa <0x225a>
00002252: 80 40                                          CLRW %r0
00002254: 24 7f 27 24 00 00                              JMP $0x2427
0000225a: 87 20 7f 02 90 04 00                           MOVB &0x20,$0x49002
00002261: 87 30 7f 02 90 04 00                           MOVB &0x30,$0x49002
00002268: 87 10 7f 02 90 04 00                           MOVB &0x10,$0x49002
0000226f: 87 7f 00 90 04 00 e2 40                        MOVB $0x49000,{uhalf}%r0
00002277: 86 40 59                                       MOVH %r0,(%fp)
0000227a: bb 6f 7f 7f 00 90 04 00                        ANDB2 &0x7f,$0x49000
00002282: 87 05 7f 02 90 04 00                           MOVB &0x5,$0x49002
00002289: a0 14                                          PUSHW &0x14
0000228b: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
00002293: 87 20 7f 0a 90 04 00                           MOVB &0x20,$0x4900a
0000229a: 87 30 7f 0a 90 04 00                           MOVB &0x30,$0x4900a
000022a1: 87 10 7f 0a 90 04 00                           MOVB &0x10,$0x4900a
000022a8: 87 7f 08 90 04 00 e2 40                        MOVB $0x49008,{uhalf}%r0
000022b0: 86 40 59                                       MOVH %r0,(%fp)
000022b3: b3 5f 80 00 7f 08 90 04 00                     ORB2 &0x80,$0x49008
000022bc: 87 05 7f 0a 90 04 00                           MOVB &0x5,$0x4900a
000022c3: a0 14                                          PUSHW &0x14
000022c5: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
000022cd: 87 6f 55 7f 0b 90 04 00                        MOVB &0x55,$0x4900b
000022d5: a0 14                                          PUSHW &0x14
000022d7: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
000022df: 3b 7f 09 90 04 00 01                           BITB $0x49009,&0x1
000022e6: 77 0a                                          BNEB &0xa <0x22f0>
000022e8: 80 40                                          CLRW %r0
000022ea: 24 7f 27 24 00 00                              JMP $0x2427
000022f0: 3f 6f 55 7f 0b 90 04 00                        CMPB &0x55,$0x4900b
000022f8: 7f 0a                                          BEB &0xa <0x2302>
000022fa: 80 40                                          CLRW %r0
000022fc: 24 7f 27 24 00 00                              JMP $0x2427
00002302: 3b 7f 09 90 04 00 01                           BITB $0x49009,&0x1
00002309: 7f 0a                                          BEB &0xa <0x2313>
0000230b: 80 40                                          CLRW %r0
0000230d: 24 7f 27 24 00 00                              JMP $0x2427
00002313: 87 5f aa 00 7f 0b 90 04 00                     MOVB &0xaa,$0x4900b
0000231c: a0 14                                          PUSHW &0x14
0000231e: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
00002326: 3b 7f 09 90 04 00 01                           BITB $0x49009,&0x1
0000232d: 77 0a                                          BNEB &0xa <0x2337>
0000232f: 80 40                                          CLRW %r0
00002331: 24 7f 27 24 00 00                              JMP $0x2427
00002337: 3f 5f aa 00 7f 0b 90 04 00                     CMPB &0xaa,$0x4900b
00002340: 7f 0a                                          BEB &0xa <0x234a>
00002342: 80 40                                          CLRW %r0
00002344: 24 7f 27 24 00 00                              JMP $0x2427
0000234a: 87 20 7f 0a 90 04 00                           MOVB &0x20,$0x4900a
00002351: 87 30 7f 0a 90 04 00                           MOVB &0x30,$0x4900a
00002358: 87 10 7f 0a 90 04 00                           MOVB &0x10,$0x4900a
0000235f: 84 4f 7f ff 00 00 40                           MOVW &0xff7f,%r0
00002366: 86 e2 40 e0 40                                 MOVH {uhalf}%r0,{uword}%r0
0000236b: 87 7f 08 90 04 00 e0 41                        MOVB $0x49008,{uword}%r1
00002373: b8 41 40                                       ANDW2 %r1,%r0
00002376: 86 e2 40 e0 40                                 MOVH {uhalf}%r0,{uword}%r0
0000237b: 87 7f 08 90 04 00 e0 41                        MOVB $0x49008,{uword}%r1
00002383: d0 08 41 41                                    LLSW3 &0x8,%r1,%r1
00002387: 86 e2 41 e0 41                                 MOVH {uhalf}%r1,{uword}%r1
0000238c: b0 41 40                                       ORW2 %r1,%r0
0000238f: 86 40 59                                       MOVH %r0,(%fp)
00002392: 87 10 7f 02 90 04 00                           MOVB &0x10,$0x49002
00002399: 87 10 7f 0a 90 04 00                           MOVB &0x10,$0x4900a
000023a0: 87 7f 00 90 04 00 7f 08 90 04 00               MOVB $0x49000,$0x49008
000023ab: 87 7f 00 90 04 00 7f 08 90 04 00               MOVB $0x49000,$0x49008
000023b6: 87 05 7f 0a 90 04 00                           MOVB &0x5,$0x4900a
000023bd: a0 14                                          PUSHW &0x14
000023bf: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
000023c7: 87 20 7f 03 90 04 00                           MOVB &0x20,$0x49003
000023ce: a0 14                                          PUSHW &0x14
000023d0: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
000023d8: 3b 7f 09 90 04 00 01                           BITB $0x49009,&0x1
000023df: 7f 10                                          BEB &0x10 <0x23ef>
000023e1: 3f 20 7f 0b 90 04 00                           CMPB &0x20,$0x4900b
000023e8: 77 07                                          BNEB &0x7 <0x23ef>
000023ea: 84 02 40                                       MOVW &0x2,%r0
000023ed: 7b 3a                                          BRB &0x3a <0x2427>
000023ef: 87 20 7f 0a 90 04 00                           MOVB &0x20,$0x4900a
000023f6: 87 30 7f 0a 90 04 00                           MOVB &0x30,$0x4900a
000023fd: 87 10 7f 0a 90 04 00                           MOVB &0x10,$0x4900a
00002404: 86 e2 59 e0 40                                 MOVH {uhalf}(%fp),{uword}%r0
00002409: d4 08 40 40                                    LRSW3 &0x8,%r0,%r0
0000240d: 87 40 7f 08 90 04 00                           MOVB %r0,$0x49008
00002414: 87 61 7f 08 90 04 00                           MOVB 1(%fp),$0x49008
0000241b: 87 05 7f 0a 90 04 00                           MOVB &0x5,$0x4900a
00002422: 84 01 40                                       MOVW &0x1,%r0
00002425: 7b 02                                          BRB &0x2 <0x2427>
00002427: 18 49                                          RESTORE %fp
00002429: 08                                             RET 
0000242a: 70                                             NOP 
0000242b: 70                                             NOP 
0000242c: 10 49                                          SAVE %fp
0000242e: 9c 4f 18 00 00 00 4c                           ADDW2 &0x18,%sp
00002435: 80 c9 14                                       CLRW 20(%fp)
00002438: 84 4f 00 00 20 00 59                           MOVW &0x200000,(%fp)
0000243f: 84 4f 00 00 80 00 64                           MOVW &0x800000,4(%fp)
00002446: 84 4f 00 00 40 00 68                           MOVW &0x400000,8(%fp)
0000244d: 84 4f 00 00 00 01 6c                           MOVW &0x1000000,12(%fp)
00002454: 80 c9 10                                       CLRW 16(%fp)
00002457: 7b 10                                          BRB &0x10 <0x2467>
00002459: d0 02 c9 10 40                                 LLSW3 &0x2,16(%fp),%r0
0000245e: 80 80 2c 04 00 02                              CLRW 0x200042c(%r0)
00002464: 90 c9 10                                       INCW 16(%fp)
00002467: 3c 04 c9 10                                    CMPW &0x4,16(%fp)
0000246b: 5b ee                                          BLUB &0xee <0x2459>
0000246d: 80 c9 10                                       CLRW 16(%fp)
00002470: 7b 4a                                          BRB &0x4a <0x24ba>
00002472: d0 02 c9 10 40                                 LLSW3 &0x2,16(%fp),%r0
00002477: cc 00 02 80 00 d0 04 00 40                     EXTFW &0x0,&0x2,0x4d000(%r0),%r0
00002480: 28 40                                          TSTW %r0
00002482: 7f 33                                          BEB &0x33 <0x24b5>
00002484: d0 02 c9 10 40                                 LLSW3 &0x2,16(%fp),%r0
00002489: 04 59 41                                       MOVAW (%fp),%r1
0000248c: d0 02 c9 10 42                                 LLSW3 &0x2,16(%fp),%r2
00002491: cc 01 00 82 00 d0 04 00 42                     EXTFW &0x1,&0x0,0x4d000(%r2),%r2
0000249a: d0 02 42 42                                    LLSW3 &0x2,%r2,%r2
0000249e: 9c 42 41                                       ADDW2 %r2,%r1
000024a1: 84 51 80 2c 04 00 02                           MOVW (%r1),0x200042c(%r0)
000024a8: 84 80 2c 04 00 02 40                           MOVW 0x200042c(%r0),%r0
000024af: 9c 40 c9 14                                    ADDW2 %r0,20(%fp)
000024b3: 7b 04                                          BRB &0x4 <0x24b7>
000024b5: 7b 0b                                          BRB &0xb <0x24c0>
000024b7: 90 c9 10                                       INCW 16(%fp)
000024ba: 3c 04 c9 10                                    CMPW &0x4,16(%fp)
000024be: 5b b4                                          BLUB &0xb4 <0x2472>
000024c0: 84 c9 14 40                                    MOVW 20(%fp),%r0
000024c4: 7b 02                                          BRB &0x2 <0x24c6>
000024c6: 18 49                                          RESTORE %fp
000024c8: 08                                             RET 
000024c9: 70                                             NOP 
000024ca: 70                                             NOP 
000024cb: 70                                             NOP 
000024cc: 84 cc f8 7f 48 12 00 02                        MOVW -8(%sp),$0x2001248
000024d4: 08                                             RET 
000024d5: 70                                             NOP 
000024d6: 70                                             NOP 
000024d7: 70                                             NOP 
000024d8: 10 43                                          SAVE %r3
000024da: 9c 4f c0 01 00 00 4c                           ADDW2 &0x1c0,%sp
000024e1: a0 4f 0d 30 04 00                              PUSHW &0x4300d
000024e7: 04 59 40                                       MOVAW (%fp),%r0
000024ea: a0 40                                          PUSHW %r0
000024ec: a0 2d                                          PUSHW &0x2d
000024ee: 2c cc f4 7f 2c 49 00 00                        CALL -12(%sp),$0x492c
000024f6: a0 4f 50 06 00 00                              PUSHW &0x650
000024fc: 04 59 40                                       MOVAW (%fp),%r0
000024ff: a0 40                                          PUSHW %r0
00002501: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
00002509: a0 00                                          PUSHW &0x0
0000250b: 2c cc fc ef 40 05 00 00                        CALL -4(%sp),*$0x540
00002513: dc 02 7f a0 04 00 00 40                        ADDW3 &0x2,$0x4a0,%r0
0000251b: a0 40                                          PUSHW %r0
0000251d: 2c cc fc 7f f0 39 00 00                        CALL -4(%sp),$0x39f0
00002525: 3c ff 40                                       CMPW &-1,%r0
00002528: 77 20                                          BNEB &0x20 <0x2548>
0000252a: a0 01                                          PUSHW &0x1
0000252c: 2c cc fc ef 40 05 00 00                        CALL -4(%sp),*$0x540
00002534: a0 4f 7b 06 00 00                              PUSHW &0x67b
0000253a: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00002542: 24 7f 16 33 00 00                              JMP $0x3316
00002548: a0 01                                          PUSHW &0x1
0000254a: 2c cc fc ef 40 05 00 00                        CALL -4(%sp),*$0x540
00002552: dc 02 7f a0 04 00 00 40                        ADDW3 &0x2,$0x4a0,%r0
0000255a: a0 40                                          PUSHW %r0
0000255c: a0 4f 7d 06 00 00                              PUSHW &0x67d
00002562: 2c cc f8 7f e8 6f 00 00                        CALL -8(%sp),$0x6fe8
0000256a: 28 40                                          TSTW %r0
0000256c: 7f 08                                          BEB &0x8 <0x2574>
0000256e: 24 7f 63 26 00 00                              JMP $0x2663
00002574: a0 4f 84 06 00 00                              PUSHW &0x684
0000257a: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00002582: 04 c9 50 40                                    MOVAW 80(%fp),%r0
00002586: a0 40                                          PUSHW %r0
00002588: 2c cc fc af 94 0d                              CALL -4(%sp),0xd94(%pc)
0000258e: 28 40                                          TSTW %r0
00002590: 77 07                                          BNEB &0x7 <0x2597>
00002592: 2c 5c af e0 0d                                 CALL (%sp),0xde0(%pc)
00002597: a0 4f 00 30 04 00                              PUSHW &0x43000
0000259d: 04 c9 5a 40                                    MOVAW 90(%fp),%r0
000025a1: a0 40                                          PUSHW %r0
000025a3: a0 09                                          PUSHW &0x9
000025a5: 2c cc f4 7f 2c 49 00 00                        CALL -12(%sp),$0x492c
000025ad: 04 c9 50 40                                    MOVAW 80(%fp),%r0
000025b1: a0 40                                          PUSHW %r0
000025b3: 04 c9 5a 40                                    MOVAW 90(%fp),%r0
000025b7: a0 40                                          PUSHW %r0
000025b9: 2c cc f8 7f e8 6f 00 00                        CALL -8(%sp),$0x6fe8
000025c1: 28 40                                          TSTW %r0
000025c3: 7f 07                                          BEB &0x7 <0x25ca>
000025c5: 2c 5c af ad 0d                                 CALL (%sp),0xdad(%pc)
000025ca: a0 4f 9a 06 00 00                              PUSHW &0x69a
000025d0: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
000025d8: 04 59 40                                       MOVAW (%fp),%r0
000025db: a0 40                                          PUSHW %r0
000025dd: 2c cc fc af 3f 0d                              CALL -4(%sp),0xd3f(%pc)
000025e3: 28 40                                          TSTW %r0
000025e5: 77 07                                          BNEB &0x7 <0x25ec>
000025e7: 2c 5c af 8b 0d                                 CALL (%sp),0xd8b(%pc)
000025ec: a0 4f b0 06 00 00                              PUSHW &0x6b0
000025f2: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
000025fa: 04 c9 50 40                                    MOVAW 80(%fp),%r0
000025fe: a0 40                                          PUSHW %r0
00002600: 2c cc fc af 1c 0d                              CALL -4(%sp),0xd1c(%pc)
00002606: 28 40                                          TSTW %r0
00002608: 77 07                                          BNEB &0x7 <0x260f>
0000260a: 2c 5c af 68 0d                                 CALL (%sp),0xd68(%pc)
0000260f: 04 c9 50 40                                    MOVAW 80(%fp),%r0
00002613: a0 40                                          PUSHW %r0
00002615: 04 59 40                                       MOVAW (%fp),%r0
00002618: a0 40                                          PUSHW %r0
0000261a: 2c cc f8 7f e8 6f 00 00                        CALL -8(%sp),$0x6fe8
00002622: 28 40                                          TSTW %r0
00002624: 7f 07                                          BEB &0x7 <0x262b>
00002626: 2c 5c af 4c 0d                                 CALL (%sp),0xd4c(%pc)
0000262b: a0 4f c0 06 00 00                              PUSHW &0x6c0
00002631: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00002639: 04 59 40                                       MOVAW (%fp),%r0
0000263c: a0 40                                          PUSHW %r0
0000263e: a0 4f 00 30 04 00                              PUSHW &0x43000
00002644: 04 59 40                                       MOVAW (%fp),%r0
00002647: a0 40                                          PUSHW %r0
00002649: 2c cc fc 7f 10 70 00 00                        CALL -4(%sp),$0x7010
00002651: 90 40                                          INCW %r0
00002653: a0 40                                          PUSHW %r0
00002655: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
0000265d: 24 7f 13 33 00 00                              JMP $0x3313
00002663: dc 02 7f a0 04 00 00 40                        ADDW3 &0x2,$0x4a0,%r0
0000266b: a0 40                                          PUSHW %r0
0000266d: a0 4f c2 06 00 00                              PUSHW &0x6c2
00002673: 2c cc f8 7f e8 6f 00 00                        CALL -8(%sp),$0x6fe8
0000267b: 28 40                                          TSTW %r0
0000267d: 7f 08                                          BEB &0x8 <0x2685>
0000267f: 24 7f 4d 27 00 00                              JMP $0x274d
00002685: a0 4f c9 06 00 00                              PUSHW &0x6c9
0000268b: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00002693: 83 59                                          CLRB (%fp)
00002695: 7b 29                                          BRB &0x29 <0x26be>
00002697: a0 4f 13 07 00 00                              PUSHW &0x713
0000269d: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
000026a5: 04 59 40                                       MOVAW (%fp),%r0
000026a8: a0 40                                          PUSHW %r0
000026aa: 2c cc fc 7f f0 39 00 00                        CALL -4(%sp),$0x39f0
000026b2: 3f 6f 71 59                                    CMPB &0x71,(%fp)
000026b6: 77 08                                          BNEB &0x8 <0x26be>
000026b8: 24 7f 16 33 00 00                              JMP $0x3316
000026be: 04 59 40                                       MOVAW (%fp),%r0
000026c1: a0 40                                          PUSHW %r0
000026c3: a0 4f 10 07 00 00                              PUSHW &0x710
000026c9: 2c cc f8 7f e8 6f 00 00                        CALL -8(%sp),$0x6fe8
000026d1: 28 40                                          TSTW %r0
000026d3: 77 c4                                          BNEB &0xc4 <0x2697>
000026d5: 84 7f 08 05 00 00 40                           MOVW $0x508,%r0
000026dc: 87 c0 03 c9 5a                                 MOVB 3(%r0),90(%fp)
000026e1: 84 7f 08 05 00 00 40                           MOVW $0x508,%r0
000026e8: 87 c0 07 c9 5b                                 MOVB 7(%r0),91(%fp)
000026ed: 84 7f 08 05 00 00 40                           MOVW $0x508,%r0
000026f4: 87 c0 0b c9 5c                                 MOVB 11(%r0),92(%fp)
000026f9: 84 7f 08 05 00 00 40                           MOVW $0x508,%r0
00002700: 87 c0 0f c9 5d                                 MOVB 15(%r0),93(%fp)
00002705: a0 00                                          PUSHW &0x0
00002707: 04 c9 5a 40                                    MOVAW 90(%fp),%r0
0000270b: a0 40                                          PUSHW %r0
0000270d: a0 01                                          PUSHW &0x1
0000270f: a0 03                                          PUSHW &0x3
00002711: 2c cc f0 7f 2c 65 00 00                        CALL -16(%sp),$0x652c
00002719: 28 40                                          TSTW %r0
0000271b: 77 1e                                          BNEB &0x1e <0x2739>
0000271d: b0 20 7f 98 0c 00 02                           ORW2 &0x20,$0x2000c98
00002724: 2c 5c 7f 44 52 00 00                           CALL (%sp),$0x5244
0000272b: a0 4f ef be ed fe                              PUSHW &0xfeedbeef
00002731: 2c cc fc 7f fe 58 00 00                        CALL -4(%sp),$0x58fe
00002739: a0 4f 4b 07 00 00                              PUSHW &0x74b
0000273f: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00002747: 24 7f 13 33 00 00                              JMP $0x3313
0000274d: dc 02 7f a0 04 00 00 40                        ADDW3 &0x2,$0x4a0,%r0
00002755: a0 40                                          PUSHW %r0
00002757: a0 4f 6e 07 00 00                              PUSHW &0x76e
0000275d: 2c cc f8 7f e8 6f 00 00                        CALL -8(%sp),$0x6fe8
00002765: 28 40                                          TSTW %r0
00002767: 77 24                                          BNEB &0x24 <0x278b>
00002769: 87 01 ef a0 04 00 00                           MOVB &0x1,*$0x4a0
00002770: 2c 5c 7f 00 40 00 02                           CALL (%sp),$0x2004000
00002777: a0 4f ef be ed fe                              PUSHW &0xfeedbeef
0000277d: 2c cc fc 7f fe 58 00 00                        CALL -4(%sp),$0x58fe
00002785: 24 7f 13 33 00 00                              JMP $0x3313
0000278b: dc 02 7f a0 04 00 00 40                        ADDW3 &0x2,$0x4a0,%r0
00002793: a0 40                                          PUSHW %r0
00002795: a0 4f 76 07 00 00                              PUSHW &0x776
0000279b: 2c cc f8 7f e8 6f 00 00                        CALL -8(%sp),$0x6fe8
000027a3: 28 40                                          TSTW %r0
000027a5: 7f 08                                          BEB &0x8 <0x27ad>
000027a7: 24 7f 3a 28 00 00                              JMP $0x283a
000027ad: a0 4f 7e 07 00 00                              PUSHW &0x77e
000027b3: a0 4f d8 12 00 00                              PUSHW &0x12d8
000027b9: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
000027c1: a0 4f 8c 07 00 00                              PUSHW &0x78c
000027c7: a0 7f f0 ff 01 00                              PUSHW $0x1fff0
000027cd: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
000027d5: a0 4f 9a 07 00 00                              PUSHW &0x79a
000027db: a0 4f ec 12 00 00                              PUSHW &0x12ec
000027e1: a0 4f e4 12 00 00                              PUSHW &0x12e4
000027e7: 2c cc f4 7f b4 3b 00 00                        CALL -12(%sp),$0x3bb4
000027ef: a0 4f b0 07 00 00                              PUSHW &0x7b0
000027f5: 87 7f f3 ff 01 00 e0 40                        MOVB $0x1fff3,{uword}%r0
000027fd: d0 08 40 40                                    LLSW3 &0x8,%r0,%r0
00002801: 87 7f f7 ff 01 00 e0 41                        MOVB $0x1fff7,{uword}%r1
00002809: b0 41 40                                       ORW2 %r1,%r0
0000280c: d0 08 40 40                                    LLSW3 &0x8,%r0,%r0
00002810: 87 7f fb ff 01 00 e0 41                        MOVB $0x1fffb,{uword}%r1
00002818: b0 41 40                                       ORW2 %r1,%r0
0000281b: d0 08 40 40                                    LLSW3 &0x8,%r0,%r0
0000281f: 87 7f ff ff 01 00 e0 41                        MOVB $0x1ffff,{uword}%r1
00002827: b0 41 40                                       ORW2 %r1,%r0
0000282a: a0 40                                          PUSHW %r0
0000282c: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
00002834: 24 7f 13 33 00 00                              JMP $0x3313
0000283a: dc 02 7f a0 04 00 00 40                        ADDW3 &0x2,$0x4a0,%r0
00002842: a0 40                                          PUSHW %r0
00002844: a0 4f c7 07 00 00                              PUSHW &0x7c7
0000284a: 2c cc f8 7f e8 6f 00 00                        CALL -8(%sp),$0x6fe8
00002852: 28 40                                          TSTW %r0
00002854: 77 08                                          BNEB &0x8 <0x285c>
00002856: 24 7f 16 33 00 00                              JMP $0x3316
0000285c: dc 02 7f a0 04 00 00 40                        ADDW3 &0x2,$0x4a0,%r0
00002864: a0 40                                          PUSHW %r0
00002866: a0 4f c9 07 00 00                              PUSHW &0x7c9
0000286c: 2c cc f8 7f e8 6f 00 00                        CALL -8(%sp),$0x6fe8
00002874: 28 40                                          TSTW %r0
00002876: 77 0f                                          BNEB &0xf <0x2885>
00002878: 2c 5c 7f 62 59 00 00                           CALL (%sp),$0x5962
0000287f: 24 7f 13 33 00 00                              JMP $0x3313
00002885: dc 02 7f a0 04 00 00 40                        ADDW3 &0x2,$0x4a0,%r0
0000288d: a0 40                                          PUSHW %r0
0000288f: a0 4f d1 07 00 00                              PUSHW &0x7d1
00002895: 2c cc f8 7f e8 6f 00 00                        CALL -8(%sp),$0x6fe8
0000289d: 28 40                                          TSTW %r0
0000289f: 77 0f                                          BNEB &0xf <0x28ae>
000028a1: 2c 5c 7f d0 44 00 00                           CALL (%sp),$0x44d0
000028a8: 24 7f 13 33 00 00                              JMP $0x3313
000028ae: dc 02 7f a0 04 00 00 40                        ADDW3 &0x2,$0x4a0,%r0
000028b6: a0 40                                          PUSHW %r0
000028b8: a0 4f d5 07 00 00                              PUSHW &0x7d5
000028be: 2c cc f8 7f e8 6f 00 00                        CALL -8(%sp),$0x6fe8
000028c6: 28 40                                          TSTW %r0
000028c8: 77 0f                                          BNEB &0xf <0x28d7>
000028ca: 2c 5c 7f 4a 54 00 00                           CALL (%sp),$0x544a
000028d1: 24 7f 13 33 00 00                              JMP $0x3313
000028d7: dc 02 7f a0 04 00 00 40                        ADDW3 &0x2,$0x4a0,%r0
000028df: a0 40                                          PUSHW %r0
000028e1: a0 4f df 07 00 00                              PUSHW &0x7df
000028e7: 2c cc f8 7f e8 6f 00 00                        CALL -8(%sp),$0x6fe8
000028ef: 28 40                                          TSTW %r0
000028f1: 77 0f                                          BNEB &0xf <0x2900>
000028f3: 2c 5c 7f a4 36 00 00                           CALL (%sp),$0x36a4
000028fa: 24 7f 13 33 00 00                              JMP $0x3313
00002900: dc 02 7f a0 04 00 00 40                        ADDW3 &0x2,$0x4a0,%r0
00002908: a0 40                                          PUSHW %r0
0000290a: a0 4f e4 07 00 00                              PUSHW &0x7e4
00002910: 2c cc f8 7f e8 6f 00 00                        CALL -8(%sp),$0x6fe8
00002918: 28 40                                          TSTW %r0
0000291a: 77 16                                          BNEB &0x16 <0x2930>
0000291c: a0 4f e6 07 00 00                              PUSHW &0x7e6
00002922: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
0000292a: 24 7f 13 33 00 00                              JMP $0x3313
00002930: 84 7f a0 04 00 00 40                           MOVW $0x4a0,%r0
00002937: 2b c0 02                                       TSTB 2(%r0)
0000293a: 77 19                                          BNEB &0x19 <0x2953>
0000293c: dc 02 7f a0 04 00 00 40                        ADDW3 &0x2,$0x4a0,%r0
00002944: a0 40                                          PUSHW %r0
00002946: 04 59 40                                       MOVAW (%fp),%r0
00002949: a0 40                                          PUSHW %r0
0000294b: 2c cc f8 7f 28 70 00 00                        CALL -8(%sp),$0x7028
00002953: 82 44                                          CLRH %r4
00002955: 7b 4f                                          BRB &0x4f <0x29a4>
00002957: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
0000295c: 86 44 e4 41                                    MOVH %r4,{word}%r1
00002960: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002964: 9c 41 40                                       ADDW2 %r1,%r0
00002967: 82 50                                          CLRH (%r0)
00002969: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
0000296e: 86 44 e4 41                                    MOVH %r4,{word}%r1
00002972: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002976: 9c 41 40                                       ADDW2 %r1,%r0
00002979: 82 c0 02                                       CLRH 2(%r0)
0000297c: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002981: 86 44 e4 41                                    MOVH %r4,{word}%r1
00002985: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002989: 9c 41 40                                       ADDW2 %r1,%r0
0000298c: 82 c0 04                                       CLRH 4(%r0)
0000298f: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002994: 86 44 e4 41                                    MOVH %r4,{word}%r1
00002998: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
0000299c: 9c 41 40                                       ADDW2 %r1,%r0
0000299f: 83 c0 06                                       CLRB 6(%r0)
000029a2: 92 44                                          INCH %r4
000029a4: 3e 11 44                                       CMPH &0x11,%r4
000029a7: 4b b0                                          BLB &0xb0 <0x2957>
000029a9: 83 48                                          CLRB %r8
000029ab: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
000029b0: 87 48 e0 41                                    MOVB %r8,{uword}%r1
000029b4: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
000029b8: 9c 41 40                                       ADDW2 %r1,%r0
000029bb: 9c 06 40                                       ADDW2 &0x6,%r0
000029be: a0 40                                          PUSHW %r0
000029c0: 84 7f 90 04 00 00 40                           MOVW $0x490,%r0
000029c7: dc 02 c0 08 40                                 ADDW3 &0x2,8(%r0),%r0
000029cc: a0 40                                          PUSHW %r0
000029ce: 2c cc f8 7f 28 70 00 00                        CALL -8(%sp),$0x7028
000029d6: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
000029db: 87 48 e0 41                                    MOVB %r8,{uword}%r1
000029df: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
000029e3: 9c 41 40                                       ADDW2 %r1,%r0
000029e6: 86 07 c0 02                                    MOVH &0x7,2(%r0)
000029ea: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
000029ef: 87 48 41                                       MOVB %r8,%r1
000029f2: 93 48                                          INCB %r8
000029f4: 87 41 e0 41                                    MOVB %r1,{uword}%r1
000029f8: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
000029fc: 9c 41 40                                       ADDW2 %r1,%r0
000029ff: 82 50                                          CLRH (%r0)
00002a01: 86 01 44                                       MOVH &0x1,%r4
00002a04: 24 7f 6e 2b 00 00                              JMP $0x2b6e
00002a0a: 86 44 e4 40                                    MOVH %r4,{word}%r0
00002a0e: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00002a12: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00002a19: cc 00 07 c0 04 40                              EXTFW &0x0,&0x7,4(%r0),%r0
00002a1f: 28 40                                          TSTW %r0
00002a21: 77 08                                          BNEB &0x8 <0x2a29>
00002a23: 24 7f c9 2a 00 00                              JMP $0x2ac9
00002a29: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002a2e: 87 48 e0 41                                    MOVB %r8,{uword}%r1
00002a32: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002a36: 9c 41 40                                       ADDW2 %r1,%r0
00002a39: 9c 06 40                                       ADDW2 &0x6,%r0
00002a3c: a0 40                                          PUSHW %r0
00002a3e: 86 44 e4 40                                    MOVH %r4,{word}%r0
00002a42: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00002a46: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00002a4d: 9c 0c 40                                       ADDW2 &0xc,%r0
00002a50: a0 40                                          PUSHW %r0
00002a52: 2c cc f8 7f 28 70 00 00                        CALL -8(%sp),$0x7028
00002a5a: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002a5f: 87 48 e0 41                                    MOVB %r8,{uword}%r1
00002a63: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002a67: 9c 41 40                                       ADDW2 %r1,%r0
00002a6a: 86 44 e4 41                                    MOVH %r4,{word}%r1
00002a6e: d0 05 41 41                                    LLSW3 &0x5,%r1,%r1
00002a72: 9c 7f 90 04 00 00 41                           ADDW2 $0x490,%r1
00002a79: cc 02 0b c1 04 41                              EXTFW &0x2,&0xb,4(%r1),%r1
00002a7f: 86 41 c0 02                                    MOVH %r1,2(%r0)
00002a83: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002a88: 87 48 e0 41                                    MOVB %r8,{uword}%r1
00002a8c: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002a90: 9c 41 40                                       ADDW2 %r1,%r0
00002a93: 86 44 e4 41                                    MOVH %r4,{word}%r1
00002a97: d0 05 41 41                                    LLSW3 &0x5,%r1,%r1
00002a9b: 9c 7f 90 04 00 00 41                           ADDW2 $0x490,%r1
00002aa2: cc 03 0c 51 41                                 EXTFW &0x3,&0xc,(%r1),%r1
00002aa7: 86 41 c0 04                                    MOVH %r1,4(%r0)
00002aab: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002ab0: 87 48 41                                       MOVB %r8,%r1
00002ab3: 93 48                                          INCB %r8
00002ab5: 87 41 e0 41                                    MOVB %r1,{uword}%r1
00002ab9: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002abd: 9c 41 40                                       ADDW2 %r1,%r0
00002ac0: 86 44 50                                       MOVH %r4,(%r0)
00002ac3: 24 7f 6c 2b 00 00                              JMP $0x2b6c
00002ac9: 86 44 e4 40                                    MOVH %r4,{word}%r0
00002acd: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00002ad1: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00002ad8: 2b c0 0c                                       TSTB 12(%r0)
00002adb: 7f 28                                          BEB &0x28 <0x2b03>
00002add: 86 44 e4 40                                    MOVH %r4,{word}%r0
00002ae1: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00002ae5: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00002aec: 9c 0c 40                                       ADDW2 &0xc,%r0
00002aef: a0 40                                          PUSHW %r0
00002af1: a0 4f 94 08 00 00                              PUSHW &0x894
00002af7: 2c cc f8 7f e8 6f 00 00                        CALL -8(%sp),$0x6fe8
00002aff: 28 40                                          TSTW %r0
00002b01: 77 6b                                          BNEB &0x6b <0x2b6c>
00002b03: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002b08: 87 48 e0 41                                    MOVB %r8,{uword}%r1
00002b0c: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002b10: 9c 41 40                                       ADDW2 %r1,%r0
00002b13: 86 44 e4 41                                    MOVH %r4,{word}%r1
00002b17: d0 05 41 41                                    LLSW3 &0x5,%r1,%r1
00002b1b: 9c 7f 90 04 00 00 41                           ADDW2 $0x490,%r1
00002b22: cc 02 0b c1 04 41                              EXTFW &0x2,&0xb,4(%r1),%r1
00002b28: 86 41 c0 02                                    MOVH %r1,2(%r0)
00002b2c: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002b31: 87 48 e0 41                                    MOVB %r8,{uword}%r1
00002b35: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002b39: 9c 41 40                                       ADDW2 %r1,%r0
00002b3c: 86 44 e4 41                                    MOVH %r4,{word}%r1
00002b40: d0 05 41 41                                    LLSW3 &0x5,%r1,%r1
00002b44: 9c 7f 90 04 00 00 41                           ADDW2 $0x490,%r1
00002b4b: cc 03 0c 51 41                                 EXTFW &0x3,&0xc,(%r1),%r1
00002b50: 86 41 c0 04                                    MOVH %r1,4(%r0)
00002b54: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002b59: 87 48 41                                       MOVB %r8,%r1
00002b5c: 93 48                                          INCB %r8
00002b5e: 87 41 e0 41                                    MOVB %r1,{uword}%r1
00002b62: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002b66: 9c 41 40                                       ADDW2 %r1,%r0
00002b69: 86 44 50                                       MOVH %r4,(%r0)
00002b6c: 92 44                                          INCH %r4
00002b6e: 86 44 e4 40                                    MOVH %r4,{word}%r0
00002b72: 87 ef e0 04 00 00 e0 41                        MOVB *$0x4e0,{uword}%r1
00002b7a: 3c 41 40                                       CMPW %r1,%r0
00002b7d: 4a 8d fe                                       BLH &0xfe8d <0x2a0a>
00002b80: a0 4f 9b 08 00 00                              PUSHW &0x89b
00002b86: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00002b8e: a0 4f b9 08 00 00                              PUSHW &0x8b9
00002b94: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00002b9c: a0 4f e6 08 00 00                              PUSHW &0x8e6
00002ba2: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00002baa: 82 44                                          CLRH %r4
00002bac: 24 7f a1 2c 00 00                              JMP $0x2ca1
00002bb2: a0 4f 13 09 00 00                              PUSHW &0x913
00002bb8: 86 44 e4 40                                    MOVH %r4,{word}%r0
00002bbc: a0 40                                          PUSHW %r0
00002bbe: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002bc3: 86 44 e4 41                                    MOVH %r4,{word}%r1
00002bc7: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002bcb: 9c 41 40                                       ADDW2 %r1,%r0
00002bce: 86 e2 c0 04 e0 40                              MOVH {uhalf}4(%r0),{uword}%r0
00002bd4: a0 40                                          PUSHW %r0
00002bd6: 2c cc f4 7f b4 3b 00 00                        CALL -12(%sp),$0x3bb4
00002bde: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002be3: 86 44 e4 41                                    MOVH %r4,{word}%r1
00002be7: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002beb: 9c 41 40                                       ADDW2 %r1,%r0
00002bee: 86 e2 c0 02 e0 40                              MOVH {uhalf}2(%r0),{uword}%r0
00002bf4: 7b 42                                          BRB &0x42 <0x2c36>
00002bf6: a0 4f 29 09 00 00                              PUSHW &0x929
00002bfc: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00002c04: 7b 43                                          BRB &0x43 <0x2c47>
00002c06: a0 4f 37 09 00 00                              PUSHW &0x937
00002c0c: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00002c14: 7b 33                                          BRB &0x33 <0x2c47>
00002c16: a0 4f 45 09 00 00                              PUSHW &0x945
00002c1c: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00002c24: 7b 23                                          BRB &0x23 <0x2c47>
00002c26: a0 4f 53 09 00 00                              PUSHW &0x953
00002c2c: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00002c34: 7b 13                                          BRB &0x13 <0x2c47>
00002c36: 3c 40 00                                       CMPW %r0,&0x0
00002c39: 7f bd                                          BEB &0xbd <0x2bf6>
00002c3b: 3c 40 03                                       CMPW %r0,&0x3
00002c3e: 7f c8                                          BEB &0xc8 <0x2c06>
00002c40: 3c 40 07                                       CMPW %r0,&0x7
00002c43: 7f d3                                          BEB &0xd3 <0x2c16>
00002c45: 7b e1                                          BRB &0xe1 <0x2c26>
00002c47: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002c4c: 86 44 e4 41                                    MOVH %r4,{word}%r1
00002c50: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002c54: 9c 41 40                                       ADDW2 %r1,%r0
00002c57: 9c 06 40                                       ADDW2 &0x6,%r0
00002c5a: a0 40                                          PUSHW %r0
00002c5c: a0 4f 61 09 00 00                              PUSHW &0x961
00002c62: 2c cc f8 7f e8 6f 00 00                        CALL -8(%sp),$0x6fe8
00002c6a: 28 40                                          TSTW %r0
00002c6c: 7f 25                                          BEB &0x25 <0x2c91>
00002c6e: a0 4f 68 09 00 00                              PUSHW &0x968
00002c74: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002c79: 86 44 e4 41                                    MOVH %r4,{word}%r1
00002c7d: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002c81: 9c 41 40                                       ADDW2 %r1,%r0
00002c84: 9c 06 40                                       ADDW2 &0x6,%r0
00002c87: a0 40                                          PUSHW %r0
00002c89: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
00002c91: a0 4f 72 09 00 00                              PUSHW &0x972
00002c97: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00002c9f: 92 44                                          INCH %r4
00002ca1: 86 44 e4 40                                    MOVH %r4,{word}%r0
00002ca5: 87 48 e0 41                                    MOVB %r8,{uword}%r1
00002ca9: 3c 41 40                                       CMPW %r1,%r0
00002cac: 5a 06 ff                                       BLUH &0xff06 <0x2bb2>
00002caf: a0 4f 0c 30 04 00                              PUSHW &0x4300c
00002cb5: dc 01 7f a0 04 00 00 40                        ADDW3 &0x1,$0x4a0,%r0
00002cbd: a0 40                                          PUSHW %r0
00002cbf: a0 01                                          PUSHW &0x1
00002cc1: 2c cc f4 7f 2c 49 00 00                        CALL -12(%sp),$0x492c
00002cc9: 83 a9 aa 00                                    CLRB 0xaa(%fp)
00002ccd: 82 44                                          CLRH %r4
00002ccf: 24 7f ba 2d 00 00                              JMP $0x2dba
00002cd5: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002cda: 86 44 e4 41                                    MOVH %r4,{word}%r1
00002cde: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002ce2: 9c 41 40                                       ADDW2 %r1,%r0
00002ce5: 86 e2 c0 02 e0 40                              MOVH {uhalf}2(%r0),{uword}%r0
00002ceb: 3c 07 40                                       CMPW &0x7,%r0
00002cee: 77 39                                          BNEB &0x39 <0x2d27>
00002cf0: 84 7f a0 04 00 00 40                           MOVW $0x4a0,%r0
00002cf7: 87 c0 01 e0 40                                 MOVB 1(%r0),{uword}%r0
00002cfc: 04 a9 ac 00 41                                 MOVAW 0xac(%fp),%r1
00002d01: 86 44 e4 42                                    MOVH %r4,{word}%r2
00002d05: d0 04 42 42                                    LLSW3 &0x4,%r2,%r2
00002d09: 9c 42 41                                       ADDW2 %r2,%r1
00002d0c: 86 e2 51 e0 41                                 MOVH {uhalf}(%r1),{uword}%r1
00002d11: 3c 41 40                                       CMPW %r1,%r0
00002d14: 77 0d                                          BNEB &0xd <0x2d21>
00002d16: 87 01 a9 aa 00                                 MOVB &0x1,0xaa(%fp)
00002d1b: 24 7f c8 2d 00 00                              JMP $0x2dc8
00002d21: 24 7f b8 2d 00 00                              JMP $0x2db8
00002d27: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002d2c: 86 44 e4 41                                    MOVH %r4,{word}%r1
00002d30: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002d34: 9c 41 40                                       ADDW2 %r1,%r0
00002d37: 86 e2 c0 02 e0 40                              MOVH {uhalf}2(%r0),{uword}%r0
00002d3d: 77 2d                                          BNEB &0x2d <0x2d6a>
00002d3f: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002d44: 86 44 e4 41                                    MOVH %r4,{word}%r1
00002d48: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002d4c: 9c 41 40                                       ADDW2 %r1,%r0
00002d4f: 86 e2 c0 04 e0 40                              MOVH {uhalf}4(%r0),{uword}%r0
00002d55: 84 7f a0 04 00 00 41                           MOVW $0x4a0,%r1
00002d5c: 87 c1 01 e0 41                                 MOVB 1(%r1),{uword}%r1
00002d61: d4 04 41 41                                    LRSW3 &0x4,%r1,%r1
00002d65: 3c 41 40                                       CMPW %r1,%r0
00002d68: 7f 49                                          BEB &0x49 <0x2db1>
00002d6a: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002d6f: 86 44 e4 41                                    MOVH %r4,{word}%r1
00002d73: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002d77: 9c 41 40                                       ADDW2 %r1,%r0
00002d7a: 86 e2 c0 02 e0 40                              MOVH {uhalf}2(%r0),{uword}%r0
00002d80: 3c 03 40                                       CMPW &0x3,%r0
00002d83: 77 35                                          BNEB &0x35 <0x2db8>
00002d85: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002d8a: 86 44 e4 41                                    MOVH %r4,{word}%r1
00002d8e: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002d92: 9c 41 40                                       ADDW2 %r1,%r0
00002d95: 86 e2 c0 04 e0 40                              MOVH {uhalf}4(%r0),{uword}%r0
00002d9b: b0 5f d0 00 40                                 ORW2 &0xd0,%r0
00002da0: 84 7f a0 04 00 00 41                           MOVW $0x4a0,%r1
00002da7: 87 c1 01 e0 41                                 MOVB 1(%r1),{uword}%r1
00002dac: 3c 41 40                                       CMPW %r1,%r0
00002daf: 77 09                                          BNEB &0x9 <0x2db8>
00002db1: 87 01 a9 aa 00                                 MOVB &0x1,0xaa(%fp)
00002db6: 7b 12                                          BRB &0x12 <0x2dc8>
00002db8: 92 44                                          INCH %r4
00002dba: 86 44 e4 40                                    MOVH %r4,{word}%r0
00002dbe: 87 48 e0 41                                    MOVB %r8,{uword}%r1
00002dc2: 3c 41 40                                       CMPW %r1,%r0
00002dc5: 5a 10 ff                                       BLUH &0xff10 <0x2cd5>
00002dc8: 2b a9 aa 00                                    TSTB 0xaa(%fp)
00002dcc: 77 06                                          BNEB &0x6 <0x2dd2>
00002dce: 83 45                                          CLRB %r5
00002dd0: 7b 0c                                          BRB &0xc <0x2ddc>
00002dd2: fa 5f ff 00 44 e3 40                           ANDH3 &0xff,%r4,{ubyte}%r0
00002dd9: 87 40 45                                       MOVB %r0,%r5
00002ddc: a0 4f 74 09 00 00                              PUSHW &0x974
00002de2: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00002dea: a0 4f 96 09 00 00                              PUSHW &0x996
00002df0: 87 45 e0 40                                    MOVB %r5,{uword}%r0
00002df4: a0 40                                          PUSHW %r0
00002df6: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
00002dfe: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002e03: 87 45 e0 41                                    MOVB %r5,{uword}%r1
00002e07: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002e0b: 9c 41 40                                       ADDW2 %r1,%r0
00002e0e: 9c 06 40                                       ADDW2 &0x6,%r0
00002e11: a0 40                                          PUSHW %r0
00002e13: a0 4f 9a 09 00 00                              PUSHW &0x99a
00002e19: 2c cc f8 7f e8 6f 00 00                        CALL -8(%sp),$0x6fe8
00002e21: 28 40                                          TSTW %r0
00002e23: 7f 25                                          BEB &0x25 <0x2e48>
00002e25: a0 4f a1 09 00 00                              PUSHW &0x9a1
00002e2b: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002e30: 87 45 e0 41                                    MOVB %r5,{uword}%r1
00002e34: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002e38: 9c 41 40                                       ADDW2 %r1,%r0
00002e3b: 9c 06 40                                       ADDW2 &0x6,%r0
00002e3e: a0 40                                          PUSHW %r0
00002e40: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
00002e48: a0 4f a7 09 00 00                              PUSHW &0x9a7
00002e4e: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00002e56: a0 00                                          PUSHW &0x0
00002e58: 2c cc fc ef 40 05 00 00                        CALL -4(%sp),*$0x540
00002e60: 04 c9 5a 40                                    MOVAW 90(%fp),%r0
00002e64: a0 40                                          PUSHW %r0
00002e66: 2c cc fc 7f f0 39 00 00                        CALL -4(%sp),$0x39f0
00002e6e: 3c ff 40                                       CMPW &-1,%r0
00002e71: 77 20                                          BNEB &0x20 <0x2e91>
00002e73: a0 01                                          PUSHW &0x1
00002e75: 2c cc fc ef 40 05 00 00                        CALL -4(%sp),*$0x540
00002e7d: a0 4f ab 09 00 00                              PUSHW &0x9ab
00002e83: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00002e8b: 24 7f 16 33 00 00                              JMP $0x3316
00002e91: a0 01                                          PUSHW &0x1
00002e93: 2c cc fc ef 40 05 00 00                        CALL -4(%sp),*$0x540
00002e9b: 2b c9 5a                                       TSTB 90(%fp)
00002e9e: 7f 4f                                          BEB &0x4f <0x2eed>
00002ea0: 04 c9 5a 40                                    MOVAW 90(%fp),%r0
00002ea4: a0 40                                          PUSHW %r0
00002ea6: a0 4f ad 09 00 00                              PUSHW &0x9ad
00002eac: 04 a9 bc 01 40                                 MOVAW 0x1bc(%fp),%r0
00002eb1: a0 40                                          PUSHW %r0
00002eb3: 2c cc f4 7f e0 40 00 00                        CALL -12(%sp),$0x40e0
00002ebb: 3c 01 40                                       CMPW &0x1,%r0
00002ebe: 77 11                                          BNEB &0x11 <0x2ecf>
00002ec0: 86 a9 bc 01 e4 40                              MOVH 0x1bc(%fp),{word}%r0
00002ec6: 87 48 e0 41                                    MOVB %r8,{uword}%r1
00002eca: 3c 41 40                                       CMPW %r1,%r0
00002ecd: 5b 19                                          BLUB &0x19 <0x2ee6>
00002ecf: a0 4f b0 09 00 00                              PUSHW &0x9b0
00002ed5: 04 c9 5a 40                                    MOVAW 90(%fp),%r0
00002ed9: a0 40                                          PUSHW %r0
00002edb: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
00002ee3: 7a f9 fe                                       BRH &0xfef9 <0x2ddc>
00002ee6: 87 a9 bd 01 46                                 MOVB 0x1bd(%fp),%r6
00002eeb: 7b 05                                          BRB &0x5 <0x2ef0>
00002eed: 87 45 46                                       MOVB %r5,%r6
00002ef0: 7b 02                                          BRB &0x2 <0x2ef2>
00002ef2: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002ef7: 87 46 e0 41                                    MOVB %r6,{uword}%r1
00002efb: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002eff: 9c 41 40                                       ADDW2 %r1,%r0
00002f02: 86 e2 c0 02 e0 40                              MOVH {uhalf}2(%r0),{uword}%r0
00002f08: 3c 07 40                                       CMPW &0x7,%r0
00002f0b: 77 12                                          BNEB &0x12 <0x2f1d>
00002f0d: 84 7f a0 04 00 00 40                           MOVW $0x4a0,%r0
00002f14: 83 c0 01                                       CLRB 1(%r0)
00002f17: 24 7f e5 32 00 00                              JMP $0x32e5
00002f1d: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002f22: 87 46 e0 41                                    MOVB %r6,{uword}%r1
00002f26: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002f2a: 9c 41 40                                       ADDW2 %r1,%r0
00002f2d: 86 e2 c0 02 e0 40                              MOVH {uhalf}2(%r0),{uword}%r0
00002f33: 7f 08                                          BEB &0x8 <0x2f3b>
00002f35: 24 7f c3 32 00 00                              JMP $0x32c3
00002f3b: 3f 45 46                                       CMPB %r5,%r6
00002f3e: 77 13                                          BNEB &0x13 <0x2f51>
00002f40: 84 7f a0 04 00 00 40                           MOVW $0x4a0,%r0
00002f47: fb 0f c0 01 40                                 ANDB3 &0xf,1(%r0),%r0
00002f4c: 87 40 47                                       MOVB %r0,%r7
00002f4f: 7b 04                                          BRB &0x4 <0x2f53>
00002f51: 83 47                                          CLRB %r7
00002f53: 84 7f a0 04 00 00 40                           MOVW $0x4a0,%r0
00002f5a: 04 a9 ac 00 41                                 MOVAW 0xac(%fp),%r1
00002f5f: 87 46 e0 42                                    MOVB %r6,{uword}%r2
00002f63: d0 04 42 42                                    LLSW3 &0x4,%r2,%r2
00002f67: 9c 42 41                                       ADDW2 %r2,%r1
00002f6a: 86 e2 c1 04 e0 41                              MOVH {uhalf}4(%r1),{uword}%r1
00002f70: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002f74: 87 41 c0 01                                    MOVB %r1,1(%r0)
00002f78: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002f7d: 87 46 e0 41                                    MOVB %r6,{uword}%r1
00002f81: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002f85: 9c 41 40                                       ADDW2 %r1,%r0
00002f88: 86 50 44                                       MOVH (%r0),%r4
00002f8b: 82 43                                          CLRH %r3
00002f8d: 7b 4f                                          BRB &0x4f <0x2fdc>
00002f8f: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002f94: 86 43 e4 41                                    MOVH %r3,{word}%r1
00002f98: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002f9c: 9c 41 40                                       ADDW2 %r1,%r0
00002f9f: 82 50                                          CLRH (%r0)
00002fa1: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002fa6: 86 43 e4 41                                    MOVH %r3,{word}%r1
00002faa: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002fae: 9c 41 40                                       ADDW2 %r1,%r0
00002fb1: 82 c0 02                                       CLRH 2(%r0)
00002fb4: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002fb9: 86 43 e4 41                                    MOVH %r3,{word}%r1
00002fbd: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002fc1: 9c 41 40                                       ADDW2 %r1,%r0
00002fc4: 82 c0 04                                       CLRH 4(%r0)
00002fc7: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00002fcc: 86 43 e4 41                                    MOVH %r3,{word}%r1
00002fd0: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00002fd4: 9c 41 40                                       ADDW2 %r1,%r0
00002fd7: 83 c0 06                                       CLRB 6(%r0)
00002fda: 92 43                                          INCH %r3
00002fdc: 3e 11 43                                       CMPH &0x11,%r3
00002fdf: 4b b0                                          BLB &0xb0 <0x2f8f>
00002fe1: 86 44 e4 40                                    MOVH %r4,{word}%r0
00002fe5: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00002fe9: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00002ff0: cc 03 00 c0 04 40                              EXTFW &0x3,&0x0,4(%r0),%r0
00002ff6: 87 40 48                                       MOVB %r0,%r8
00002ff9: 2b 48                                          TSTB %r8
00002ffb: 77 0b                                          BNEB &0xb <0x3006>
00002ffd: 87 0f 48                                       MOVB &0xf,%r8
00003000: 83 a9 ab 00                                    CLRB 0xab(%fp)
00003004: 7b 07                                          BRB &0x7 <0x300b>
00003006: 87 01 a9 ab 00                                 MOVB &0x1,0xab(%fp)
0000300b: 82 43                                          CLRH %r3
0000300d: 7b 52                                          BRB &0x52 <0x305f>
0000300f: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00003014: 86 43 e4 41                                    MOVH %r3,{word}%r1
00003018: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
0000301c: 9c 41 40                                       ADDW2 %r1,%r0
0000301f: 9c 06 40                                       ADDW2 &0x6,%r0
00003022: a0 40                                          PUSHW %r0
00003024: 86 44 e4 40                                    MOVH %r4,{word}%r0
00003028: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
0000302c: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00003033: ea 0c 43 41                                    MULH3 &0xc,%r3,%r1
00003037: dc 41 c0 08 40                                 ADDW3 %r1,8(%r0),%r0
0000303c: 9c 02 40                                       ADDW2 &0x2,%r0
0000303f: a0 40                                          PUSHW %r0
00003041: 2c cc f8 7f 28 70 00 00                        CALL -8(%sp),$0x7028
00003049: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
0000304e: 86 43 e4 41                                    MOVH %r3,{word}%r1
00003052: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
00003056: 9c 41 40                                       ADDW2 %r1,%r0
00003059: 86 43 c0 04                                    MOVH %r3,4(%r0)
0000305d: 92 43                                          INCH %r3
0000305f: 86 43 e4 40                                    MOVH %r3,{word}%r0
00003063: 87 48 e0 41                                    MOVB %r8,{uword}%r1
00003067: 3c 41 40                                       CMPW %r1,%r0
0000306a: 5b a5                                          BLUB &0xa5 <0x300f>
0000306c: a0 4f d3 09 00 00                              PUSHW &0x9d3
00003072: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
0000307a: a0 4f ee 09 00 00                              PUSHW &0x9ee
00003080: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00003088: a0 4f 11 0a 00 00                              PUSHW &0xa11
0000308e: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00003096: 82 43                                          CLRH %r3
00003098: 24 7f 2a 31 00 00                              JMP $0x312a
0000309e: a0 4f 3f 0a 00 00                              PUSHW &0xa3f
000030a4: 86 43 e4 40                                    MOVH %r3,{word}%r0
000030a8: a0 40                                          PUSHW %r0
000030aa: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
000030af: 86 43 e4 41                                    MOVH %r3,{word}%r1
000030b3: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
000030b7: 9c 41 40                                       ADDW2 %r1,%r0
000030ba: 86 e2 c0 04 e0 40                              MOVH {uhalf}4(%r0),{uword}%r0
000030c0: a0 40                                          PUSHW %r0
000030c2: 2c cc f4 7f b4 3b 00 00                        CALL -12(%sp),$0x3bb4
000030ca: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
000030cf: 86 43 e4 41                                    MOVH %r3,{word}%r1
000030d3: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
000030d7: 9c 41 40                                       ADDW2 %r1,%r0
000030da: 9c 06 40                                       ADDW2 &0x6,%r0
000030dd: a0 40                                          PUSHW %r0
000030df: a0 4f 56 0a 00 00                              PUSHW &0xa56
000030e5: 2c cc f8 7f e8 6f 00 00                        CALL -8(%sp),$0x6fe8
000030ed: 28 40                                          TSTW %r0
000030ef: 7f 2b                                          BEB &0x2b <0x311a>
000030f1: 2b a9 ab 00                                    TSTB 0xab(%fp)
000030f5: 7f 25                                          BEB &0x25 <0x311a>
000030f7: a0 4f 5d 0a 00 00                              PUSHW &0xa5d
000030fd: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00003102: 86 43 e4 41                                    MOVH %r3,{word}%r1
00003106: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
0000310a: 9c 41 40                                       ADDW2 %r1,%r0
0000310d: 9c 06 40                                       ADDW2 &0x6,%r0
00003110: a0 40                                          PUSHW %r0
00003112: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
0000311a: a0 4f 6b 0a 00 00                              PUSHW &0xa6b
00003120: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00003128: 92 43                                          INCH %r3
0000312a: 86 43 e4 40                                    MOVH %r3,{word}%r0
0000312e: 87 48 e0 41                                    MOVB %r8,{uword}%r1
00003132: 3c 41 40                                       CMPW %r1,%r0
00003135: 5a 69 ff                                       BLUH &0xff69 <0x309e>
00003138: 83 a9 aa 00                                    CLRB 0xaa(%fp)
0000313c: 82 43                                          CLRH %r3
0000313e: 7b 2a                                          BRB &0x2a <0x3168>
00003140: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
00003145: 86 43 e4 41                                    MOVH %r3,{word}%r1
00003149: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
0000314d: 9c 41 40                                       ADDW2 %r1,%r0
00003150: 86 e2 c0 04 e0 40                              MOVH {uhalf}4(%r0),{uword}%r0
00003156: 87 47 e0 41                                    MOVB %r7,{uword}%r1
0000315a: 3c 41 40                                       CMPW %r1,%r0
0000315d: 77 09                                          BNEB &0x9 <0x3166>
0000315f: 87 01 a9 aa 00                                 MOVB &0x1,0xaa(%fp)
00003164: 7b 11                                          BRB &0x11 <0x3175>
00003166: 92 43                                          INCH %r3
00003168: 86 43 e4 40                                    MOVH %r3,{word}%r0
0000316c: 87 48 e0 41                                    MOVB %r8,{uword}%r1
00003170: 3c 41 40                                       CMPW %r1,%r0
00003173: 5b cd                                          BLUB &0xcd <0x3140>
00003175: 2b a9 aa 00                                    TSTB 0xaa(%fp)
00003179: 77 06                                          BNEB &0x6 <0x317f>
0000317b: 83 45                                          CLRB %r5
0000317d: 7b 0c                                          BRB &0xc <0x3189>
0000317f: fa 5f ff 00 43 e3 40                           ANDH3 &0xff,%r3,{ubyte}%r0
00003186: 87 40 45                                       MOVB %r0,%r5
00003189: a0 4f 6d 0a 00 00                              PUSHW &0xa6d
0000318f: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00003197: a0 4f 8d 0a 00 00                              PUSHW &0xa8d
0000319d: 87 45 e0 40                                    MOVB %r5,{uword}%r0
000031a1: a0 40                                          PUSHW %r0
000031a3: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
000031ab: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
000031b0: 87 45 e0 41                                    MOVB %r5,{uword}%r1
000031b4: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
000031b8: 9c 41 40                                       ADDW2 %r1,%r0
000031bb: 9c 06 40                                       ADDW2 &0x6,%r0
000031be: a0 40                                          PUSHW %r0
000031c0: a0 4f 91 0a 00 00                              PUSHW &0xa91
000031c6: 2c cc f8 7f e8 6f 00 00                        CALL -8(%sp),$0x6fe8
000031ce: 28 40                                          TSTW %r0
000031d0: 7f 2b                                          BEB &0x2b <0x31fb>
000031d2: 2b a9 ab 00                                    TSTB 0xab(%fp)
000031d6: 7f 25                                          BEB &0x25 <0x31fb>
000031d8: a0 4f 98 0a 00 00                              PUSHW &0xa98
000031de: 04 a9 ac 00 40                                 MOVAW 0xac(%fp),%r0
000031e3: 87 45 e0 41                                    MOVB %r5,{uword}%r1
000031e7: d0 04 41 41                                    LLSW3 &0x4,%r1,%r1
000031eb: 9c 41 40                                       ADDW2 %r1,%r0
000031ee: 9c 06 40                                       ADDW2 &0x6,%r0
000031f1: a0 40                                          PUSHW %r0
000031f3: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
000031fb: a0 4f 9e 0a 00 00                              PUSHW &0xa9e
00003201: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00003209: a0 00                                          PUSHW &0x0
0000320b: 2c cc fc ef 40 05 00 00                        CALL -4(%sp),*$0x540
00003213: 04 c9 5a 40                                    MOVAW 90(%fp),%r0
00003217: a0 40                                          PUSHW %r0
00003219: 2c cc fc 7f f0 39 00 00                        CALL -4(%sp),$0x39f0
00003221: 3c ff 40                                       CMPW &-1,%r0
00003224: 77 20                                          BNEB &0x20 <0x3244>
00003226: a0 01                                          PUSHW &0x1
00003228: 2c cc fc ef 40 05 00 00                        CALL -4(%sp),*$0x540
00003230: a0 4f a2 0a 00 00                              PUSHW &0xaa2
00003236: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
0000323e: 24 7f 16 33 00 00                              JMP $0x3316
00003244: a0 01                                          PUSHW &0x1
00003246: 2c cc fc ef 40 05 00 00                        CALL -4(%sp),*$0x540
0000324e: 2b c9 5a                                       TSTB 90(%fp)
00003251: 7f 4f                                          BEB &0x4f <0x32a0>
00003253: 04 c9 5a 40                                    MOVAW 90(%fp),%r0
00003257: a0 40                                          PUSHW %r0
00003259: a0 4f a4 0a 00 00                              PUSHW &0xaa4
0000325f: 04 a9 bc 01 40                                 MOVAW 0x1bc(%fp),%r0
00003264: a0 40                                          PUSHW %r0
00003266: 2c cc f4 7f e0 40 00 00                        CALL -12(%sp),$0x40e0
0000326e: 3c 01 40                                       CMPW &0x1,%r0
00003271: 77 11                                          BNEB &0x11 <0x3282>
00003273: 86 a9 bc 01 e4 40                              MOVH 0x1bc(%fp),{word}%r0
00003279: 87 48 e0 41                                    MOVB %r8,{uword}%r1
0000327d: 3c 41 40                                       CMPW %r1,%r0
00003280: 5b 19                                          BLUB &0x19 <0x3299>
00003282: a0 4f a7 0a 00 00                              PUSHW &0xaa7
00003288: 04 c9 5a 40                                    MOVAW 90(%fp),%r0
0000328c: a0 40                                          PUSHW %r0
0000328e: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
00003296: 7a f3 fe                                       BRH &0xfef3 <0x3189>
00003299: 87 a9 bd 01 46                                 MOVB 0x1bd(%fp),%r6
0000329e: 7b 05                                          BRB &0x5 <0x32a3>
000032a0: 87 45 46                                       MOVB %r5,%r6
000032a3: 7b 02                                          BRB &0x2 <0x32a5>
000032a5: 84 7f a0 04 00 00 40                           MOVW $0x4a0,%r0
000032ac: 04 a9 ac 00 41                                 MOVAW 0xac(%fp),%r1
000032b1: 87 46 e0 42                                    MOVB %r6,{uword}%r2
000032b5: d0 04 42 42                                    LLSW3 &0x4,%r2,%r2
000032b9: 9c 42 41                                       ADDW2 %r2,%r1
000032bc: b3 c1 05 c0 01                                 ORB2 5(%r1),1(%r0)
000032c1: 7b 24                                          BRB &0x24 <0x32e5>
000032c3: 84 7f a0 04 00 00 40                           MOVW $0x4a0,%r0
000032ca: 04 a9 ac 00 41                                 MOVAW 0xac(%fp),%r1
000032cf: 87 46 e0 42                                    MOVB %r6,{uword}%r2
000032d3: d0 04 42 42                                    LLSW3 &0x4,%r2,%r2
000032d7: 9c 42 41                                       ADDW2 %r2,%r1
000032da: f3 5f d0 00 c1 05 41                           ORB3 &0xd0,5(%r1),%r1
000032e1: 87 41 c0 01                                    MOVB %r1,1(%r0)
000032e5: 87 01 ef a0 04 00 00                           MOVB &0x1,*$0x4a0
000032ec: 2c 5c 7f fc 5f 00 00                           CALL (%sp),$0x5ffc
000032f3: 28 40                                          TSTW %r0
000032f5: 77 1e                                          BNEB &0x1e <0x3313>
000032f7: b0 04 7f 98 0c 00 02                           ORW2 &0x4,$0x2000c98
000032fe: 2c 5c 7f 44 52 00 00                           CALL (%sp),$0x5244
00003305: a0 4f ef be ed fe                              PUSHW &0xfeedbeef
0000330b: 2c cc fc 7f fe 58 00 00                        CALL -4(%sp),$0x58fe
00003313: 7a ce f1                                       BRH &0xf1ce <0x24e1>
00003316: 18 43                                          RESTORE %r3
00003318: 08                                             RET 
00003319: 70                                             NOP 
0000331a: 70                                             NOP 
0000331b: 70                                             NOP 
0000331c: 10 49                                          SAVE %fp
0000331e: 9c 4f 04 00 00 00 4c                           ADDW2 &0x4,%sp
00003325: 82 59                                          CLRH (%fp)
00003327: 7b 38                                          BRB &0x38 <0x335f>
00003329: 7b 02                                          BRB &0x2 <0x332b>
0000332b: 2c 5c 7f 4c 3b 00 00                           CALL (%sp),$0x3b4c
00003332: 87 40 da 00                                    MOVB %r0,*0(%ap)
00003336: 87 da 00 e0 40                                 MOVB *0(%ap),{uword}%r0
0000333b: 2b 40                                          TSTB %r0
0000333d: 7f ee                                          BEB &0xee <0x332b>
0000333f: 3f 0d da 00                                    CMPB &0xd,*0(%ap)
00003343: 7f 08                                          BEB &0x8 <0x334b>
00003345: 3f 0a da 00                                    CMPB &0xa,*0(%ap)
00003349: 77 12                                          BNEB &0x12 <0x335b>
0000334b: 2a 59                                          TSTH (%fp)
0000334d: 77 06                                          BNEB &0x6 <0x3353>
0000334f: 80 40                                          CLRW %r0
00003351: 7b 1b                                          BRB &0x1b <0x336c>
00003353: 83 da 00                                       CLRB *0(%ap)
00003356: 84 01 40                                       MOVW &0x1,%r0
00003359: 7b 13                                          BRB &0x13 <0x336c>
0000335b: 90 5a                                          INCW (%ap)
0000335d: 92 59                                          INCH (%fp)
0000335f: 3e 08 59                                       CMPH &0x8,(%fp)
00003362: 4b c7                                          BLB &0xc7 <0x3329>
00003364: 83 da 00                                       CLRB *0(%ap)
00003367: 84 01 40                                       MOVW &0x1,%r0
0000336a: 7b 02                                          BRB &0x2 <0x336c>
0000336c: 18 49                                          RESTORE %fp
0000336e: 08                                             RET 
0000336f: 70                                             NOP 
00003370: 70                                             NOP 
00003371: 70                                             NOP 
00003372: 10 49                                          SAVE %fp
00003374: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
0000337b: a0 4f ca 0a 00 00                              PUSHW &0xaca
00003381: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00003389: a0 4f 1e ac eb ad                              PUSHW &0xadebac1e
0000338f: 2c cc fc 7f fe 58 00 00                        CALL -4(%sp),$0x58fe
00003397: 18 49                                          RESTORE %fp
00003399: 08                                             RET 
0000339a: 70                                             NOP 
0000339b: 70                                             NOP 
0000339c: 10 49                                          SAVE %fp
0000339e: 9c 4f 04 00 00 00 4c                           ADDW2 &0x4,%sp
000033a5: a0 4f 80 30 04 00                              PUSHW &0x43080
000033ab: 04 59 40                                       MOVAW (%fp),%r0
000033ae: a0 40                                          PUSHW %r0
000033b0: a0 02                                          PUSHW &0x2
000033b2: 2c cc f4 7f 2c 49 00 00                        CALL -12(%sp),$0x492c
000033ba: 28 40                                          TSTW %r0
000033bc: 7f 09                                          BEB &0x9 <0x33c5>
000033be: 86 e2 59 e0 40                                 MOVH {uhalf}(%fp),{uword}%r0
000033c3: 77 1c                                          BNEB &0x1c <0x33df>
000033c5: 86 5f bd 04 59                                 MOVH &0x4bd,(%fp)
000033ca: 04 59 40                                       MOVAW (%fp),%r0
000033cd: a0 40                                          PUSHW %r0
000033cf: a0 4f 80 30 04 00                              PUSHW &0x43080
000033d5: a0 02                                          PUSHW &0x2
000033d7: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
000033df: 86 e2 59 e0 40                                 MOVH {uhalf}(%fp),{uword}%r0
000033e4: a0 40                                          PUSHW %r0
000033e6: a0 4f 00 90 04 00                              PUSHW &0x49000
000033ec: 2c cc f8 7f 60 35 00 00                        CALL -8(%sp),$0x3560
000033f4: a0 4f 0a 30 04 00                              PUSHW &0x4300a
000033fa: 04 59 40                                       MOVAW (%fp),%r0
000033fd: a0 40                                          PUSHW %r0
000033ff: a0 02                                          PUSHW &0x2
00003401: 2c cc f4 7f 2c 49 00 00                        CALL -12(%sp),$0x492c
00003409: 28 40                                          TSTW %r0
0000340b: 7f 09                                          BEB &0x9 <0x3414>
0000340d: 86 e2 59 e0 40                                 MOVH {uhalf}(%fp),{uword}%r0
00003412: 77 1a                                          BNEB &0x1a <0x342c>
00003414: 86 3d 59                                       MOVH &0x3d,(%fp)
00003417: 04 59 40                                       MOVAW (%fp),%r0
0000341a: a0 40                                          PUSHW %r0
0000341c: a0 4f 0a 30 04 00                              PUSHW &0x4300a
00003422: a0 02                                          PUSHW &0x2
00003424: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
0000342c: 86 e2 59 e0 40                                 MOVH {uhalf}(%fp),{uword}%r0
00003431: a0 40                                          PUSHW %r0
00003433: a0 4f 08 90 04 00                              PUSHW &0x49008
00003439: 2c cc f8 7f 60 35 00 00                        CALL -8(%sp),$0x3560
00003441: 18 49                                          RESTORE %fp
00003443: 08                                             RET 
00003444: 10 48                                          SAVE %r8
00003446: 9c 4f 04 00 00 00 4c                           ADDW2 &0x4,%sp
0000344d: 86 01 48                                       MOVH &0x1,%r8
00003450: 7b 23                                          BRB &0x23 <0x3473>
00003452: 3e 10 48                                       CMPH &0x10,%r8
00003455: 5b 1c                                          BLUB &0x1c <0x3471>
00003457: a0 4f 54 0b 00 00                              PUSHW &0xb54
0000345d: 86 72 e4 40                                    MOVH 2(%ap),{word}%r0
00003461: a0 40                                          PUSHW %r0
00003463: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
0000346b: 24 7f 5a 35 00 00                              JMP $0x355a
00003471: 92 48                                          INCH %r8
00003473: 86 48 e4 40                                    MOVH %r8,{word}%r0
00003477: d0 03 40 40                                    LLSW3 &0x3,%r0,%r0
0000347b: 3e 72 80 d4 0a 00 00                           CMPH 2(%ap),0xad4(%r0)
00003482: 77 d0                                          BNEB &0xd0 <0x3452>
00003484: 3c 4f 08 90 04 00 74                           CMPW &0x49008,4(%ap)
0000348b: 77 3b                                          BNEB &0x3b <0x34c6>
0000348d: 84 30 40                                       MOVW &0x30,%r0
00003490: 86 e2 40 e0 40                                 MOVH {uhalf}%r0,{uword}%r0
00003495: 86 48 e4 41                                    MOVH %r8,{word}%r1
00003499: d0 03 41 41                                    LLSW3 &0x3,%r1,%r1
0000349d: 87 81 d6 0a 00 00 e0 41                        MOVB 0xad6(%r1),{uword}%r1
000034a5: b0 41 40                                       ORW2 %r1,%r0
000034a8: 86 40 59                                       MOVH %r0,(%fp)
000034ab: 04 59 40                                       MOVAW (%fp),%r0
000034ae: a0 40                                          PUSHW %r0
000034b0: a0 4f 0a 30 04 00                              PUSHW &0x4300a
000034b6: a0 02                                          PUSHW &0x2
000034b8: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
000034c0: 24 7f 4b 35 00 00                              JMP $0x354b
000034c6: a0 4f 80 30 04 00                              PUSHW &0x43080
000034cc: 04 59 40                                       MOVAW (%fp),%r0
000034cf: a0 40                                          PUSHW %r0
000034d1: a0 02                                          PUSHW &0x2
000034d3: 2c cc f4 7f 2c 49 00 00                        CALL -12(%sp),$0x492c
000034db: 86 e2 59 e0 40                                 MOVH {uhalf}(%fp),{uword}%r0
000034e0: 7f 36                                          BEB &0x36 <0x3516>
000034e2: 84 4f f0 ff 00 00 40                           MOVW &0xfff0,%r0
000034e9: 86 e2 40 e0 40                                 MOVH {uhalf}%r0,{uword}%r0
000034ee: 86 e2 59 e0 41                                 MOVH {uhalf}(%fp),{uword}%r1
000034f3: b8 41 40                                       ANDW2 %r1,%r0
000034f6: 86 40 59                                       MOVH %r0,(%fp)
000034f9: 86 48 e4 40                                    MOVH %r8,{word}%r0
000034fd: d0 03 40 40                                    LLSW3 &0x3,%r0,%r0
00003501: 87 80 d6 0a 00 00 e0 40                        MOVB 0xad6(%r0),{uword}%r0
00003509: 86 e2 59 e0 41                                 MOVH {uhalf}(%fp),{uword}%r1
0000350e: b0 41 40                                       ORW2 %r1,%r0
00003511: 86 40 59                                       MOVH %r0,(%fp)
00003514: 7b 22                                          BRB &0x22 <0x3536>
00003516: 84 5f b0 04 40                                 MOVW &0x4b0,%r0
0000351b: 86 e2 40 e0 40                                 MOVH {uhalf}%r0,{uword}%r0
00003520: 86 48 e4 41                                    MOVH %r8,{word}%r1
00003524: d0 03 41 41                                    LLSW3 &0x3,%r1,%r1
00003528: 87 81 d6 0a 00 00 e0 41                        MOVB 0xad6(%r1),{uword}%r1
00003530: b0 41 40                                       ORW2 %r1,%r0
00003533: 86 40 59                                       MOVH %r0,(%fp)
00003536: 04 59 40                                       MOVAW (%fp),%r0
00003539: a0 40                                          PUSHW %r0
0000353b: a0 4f 80 30 04 00                              PUSHW &0x43080
00003541: a0 02                                          PUSHW &0x2
00003543: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
0000354b: 86 e2 59 e0 40                                 MOVH {uhalf}(%fp),{uword}%r0
00003550: a0 40                                          PUSHW %r0
00003552: a0 74                                          PUSHW 4(%ap)
00003554: 2c cc f8 af 0c 00                              CALL -8(%sp),0xc(%pc)
0000355a: 18 48                                          RESTORE %r8
0000355c: 08                                             RET 
0000355d: 70                                             NOP 
0000355e: 70                                             NOP 
0000355f: 70                                             NOP 
00003560: 10 47                                          SAVE %r7
00003562: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
00003569: 86 01 48                                       MOVH &0x1,%r8
0000356c: 7b 27                                          BRB &0x27 <0x3593>
0000356e: 86 e2 48 e0 40                                 MOVH {uhalf}%r8,{uword}%r0
00003573: 3c 10 40                                       CMPW &0x10,%r0
00003576: 5b 0a                                          BLUB &0xa <0x3580>
00003578: 86 0d 48                                       MOVH &0xd,%r8
0000357b: 86 30 72                                       MOVH &0x30,2(%ap)
0000357e: 7b 33                                          BRB &0x33 <0x35b1>
00003580: 84 01 40                                       MOVW &0x1,%r0
00003583: 86 e2 40 e0 40                                 MOVH {uhalf}%r0,{uword}%r0
00003588: 86 e2 48 e0 41                                 MOVH {uhalf}%r8,{uword}%r1
0000358d: 9c 41 40                                       ADDW2 %r1,%r0
00003590: 86 40 48                                       MOVH %r0,%r8
00003593: 86 e2 48 e0 40                                 MOVH {uhalf}%r8,{uword}%r0
00003598: d0 03 40 40                                    LLSW3 &0x3,%r0,%r0
0000359c: 87 80 d6 0a 00 00 e0 40                        MOVB 0xad6(%r0),{uword}%r0
000035a4: 86 e2 72 e0 41                                 MOVH {uhalf}2(%ap),{uword}%r1
000035a9: b8 0f 41                                       ANDW2 &0xf,%r1
000035ac: 3c 41 40                                       CMPW %r1,%r0
000035af: 77 bf                                          BNEB &0xbf <0x356e>
000035b1: 84 74 40                                       MOVW 4(%ap),%r0
000035b4: 87 1a c0 02                                    MOVB &0x1a,2(%r0)
000035b8: 84 74 40                                       MOVW 4(%ap),%r0
000035bb: 87 20 c0 02                                    MOVB &0x20,2(%r0)
000035bf: 84 74 40                                       MOVW 4(%ap),%r0
000035c2: 87 30 c0 02                                    MOVB &0x30,2(%r0)
000035c6: 84 74 40                                       MOVW 4(%ap),%r0
000035c9: 87 6f 40 c0 02                                 MOVB &0x40,2(%r0)
000035ce: 84 74 40                                       MOVW 4(%ap),%r0
000035d1: 87 6f 70 c0 02                                 MOVB &0x70,2(%r0)
000035d6: 86 e2 72 e0 40                                 MOVH {uhalf}2(%ap),{uword}%r0
000035db: 38 40 5f 00 01                                 BITW %r0,&0x100
000035e0: 7f 1a                                          BEB &0x1a <0x35fa>
000035e2: 86 e2 72 e0 40                                 MOVH {uhalf}2(%ap),{uword}%r0
000035e7: 38 40 5f 00 02                                 BITW %r0,&0x200
000035ec: 7f 07                                          BEB &0x7 <0x35f3>
000035ee: 84 04 40                                       MOVW &0x4,%r0
000035f1: 7b 04                                          BRB &0x4 <0x35f5>
000035f3: 80 40                                          CLRW %r0
000035f5: b0 00 40                                       ORW2 &0x0,%r0
000035f8: 7b 05                                          BRB &0x5 <0x35fd>
000035fa: 84 10 40                                       MOVW &0x10,%r0
000035fd: b3 00 40                                       ORB2 &0x0,%r0
00003600: 87 40 47                                       MOVB %r0,%r7
00003603: 86 e2 72 e0 40                                 MOVH {uhalf}2(%ap),{uword}%r0
00003608: b8 30 40                                       ANDW2 &0x30,%r0
0000360b: 7b 13                                          BRB &0x13 <0x361e>
0000360d: 7b 22                                          BRB &0x22 <0x362f>
0000360f: b3 01 47                                       ORB2 &0x1,%r7
00003612: 7b 1d                                          BRB &0x1d <0x362f>
00003614: b3 02 47                                       ORB2 &0x2,%r7
00003617: 7b 18                                          BRB &0x18 <0x362f>
00003619: b3 03 47                                       ORB2 &0x3,%r7
0000361c: 7b 13                                          BRB &0x13 <0x362f>
0000361e: 3c 40 00                                       CMPW %r0,&0x0
00003621: 7f ec                                          BEB &0xec <0x360d>
00003623: 3c 40 10                                       CMPW %r0,&0x10
00003626: 7f e9                                          BEB &0xe9 <0x360f>
00003628: 3c 40 20                                       CMPW %r0,&0x20
0000362b: 7f e9                                          BEB &0xe9 <0x3614>
0000362d: 7b ec                                          BRB &0xec <0x3619>
0000362f: 87 47 da 04                                    MOVB %r7,*4(%ap)
00003633: 86 e2 72 e0 40                                 MOVH {uhalf}2(%ap),{uword}%r0
00003638: 38 40 6f 40                                    BITW %r0,&0x40
0000363c: 7f 07                                          BEB &0x7 <0x3643>
0000363e: 84 0f 40                                       MOVW &0xf,%r0
00003641: 7b 05                                          BRB &0x5 <0x3646>
00003643: 84 07 40                                       MOVW &0x7,%r0
00003646: b3 00 40                                       ORB2 &0x0,%r0
00003649: 87 40 da 04                                    MOVB %r0,*4(%ap)
0000364d: 84 74 40                                       MOVW 4(%ap),%r0
00003650: 86 e2 48 e0 41                                 MOVH {uhalf}%r8,{uword}%r1
00003655: d0 03 41 41                                    LLSW3 &0x3,%r1,%r1
00003659: 87 81 d7 0a 00 00 c0 01                        MOVB 0xad7(%r1),1(%r0)
00003661: 86 e2 48 e0 40                                 MOVH {uhalf}%r8,{uword}%r0
00003666: d0 03 40 40                                    LLSW3 &0x3,%r0,%r0
0000366a: 87 80 d8 0a 00 00 7f 4c 12 00 02               MOVB 0xad8(%r0),$0x200124c
00003675: 84 74 40                                       MOVW 4(%ap),%r0
00003678: 87 7f 4c 12 00 02 c0 04                        MOVB $0x200124c,4(%r0)
00003680: 84 74 40                                       MOVW 4(%ap),%r0
00003683: 87 15 c0 02                                    MOVB &0x15,2(%r0)
00003687: 87 30 7f 0e 90 04 00                           MOVB &0x30,$0x4900e
0000368e: a0 01                                          PUSHW &0x1
00003690: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
00003698: 84 74 40                                       MOVW 4(%ap),%r0
0000369b: 87 20 c0 03                                    MOVB &0x20,3(%r0)
0000369f: 18 47                                          RESTORE %r7
000036a1: 08                                             RET 
000036a2: 70                                             NOP 
000036a3: 70                                             NOP 
000036a4: 10 49                                          SAVE %fp
000036a6: 9c 4f 54 00 00 00 4c                           ADDW2 &0x54,%sp
000036ad: a0 4f 80 30 04 00                              PUSHW &0x43080
000036b3: 04 59 40                                       MOVAW (%fp),%r0
000036b6: a0 40                                          PUSHW %r0
000036b8: a0 02                                          PUSHW &0x2
000036ba: 2c cc f4 7f 2c 49 00 00                        CALL -12(%sp),$0x492c
000036c2: a0 4f 6f 0b 00 00                              PUSHW &0xb6f
000036c8: 86 e2 59 e0 40                                 MOVH {uhalf}(%fp),{uword}%r0
000036cd: b8 0f 40                                       ANDW2 &0xf,%r0
000036d0: d0 03 40 40                                    LLSW3 &0x3,%r0,%r0
000036d4: 86 80 d4 0a 00 00 e4 40                        MOVH 0xad4(%r0),{word}%r0
000036dc: a0 40                                          PUSHW %r0
000036de: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
000036e6: 04 62 40                                       MOVAW 2(%fp),%r0
000036e9: a0 40                                          PUSHW %r0
000036eb: 2c cc fc ef b4 04 00 00                        CALL -4(%sp),*$0x4b4
000036f3: 2b 62                                          TSTB 2(%fp)
000036f5: 7f 5c                                          BEB &0x5c <0x3751>
000036f7: 04 62 40                                       MOVAW 2(%fp),%r0
000036fa: a0 40                                          PUSHW %r0
000036fc: a0 4f 85 0b 00 00                              PUSHW &0xb85
00003702: 04 59 40                                       MOVAW (%fp),%r0
00003705: a0 40                                          PUSHW %r0
00003707: 2c cc f4 7f e0 40 00 00                        CALL -12(%sp),$0x40e0
0000370f: 3c 01 40                                       CMPW &0x1,%r0
00003712: 7f 17                                          BEB &0x17 <0x3729>
00003714: a0 4f 88 0b 00 00                              PUSHW &0xb88
0000371a: 04 62 40                                       MOVAW 2(%fp),%r0
0000371d: a0 40                                          PUSHW %r0
0000371f: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
00003727: 7b 2a                                          BRB &0x2a <0x3751>
00003729: a0 4f a3 0b 00 00                              PUSHW &0xba3
0000372f: 86 e2 59 e0 40                                 MOVH {uhalf}(%fp),{uword}%r0
00003734: a0 40                                          PUSHW %r0
00003736: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
0000373e: 86 e2 59 e0 40                                 MOVH {uhalf}(%fp),{uword}%r0
00003743: a0 40                                          PUSHW %r0
00003745: a0 4f 00 90 04 00                              PUSHW &0x49000
0000374b: 2c cc f8 af f9 fc                              CALL -8(%sp),0x..fcf9(%pc)
00003751: 18 49                                          RESTORE %fp
00003753: 08                                             RET 
00003754: 28 5d                                          TSTW (%pcbp)
00003756: 70                                             NOP 
00003757: 70                                             NOP 
00003758: 70                                             NOP 
00003759: 10 49                                          SAVE %fp
0000375b: 84 5a 42                                       MOVW (%ap),%r2
0000375e: 84 74 41                                       MOVW 4(%ap),%r1
00003761: 84 78 40                                       MOVW 8(%ap),%r0
00003764: 30 19                                          MOVBLW 
00003766: 18 49                                          RESTORE %fp
00003768: 08                                             RET 
00003769: 70                                             NOP 
0000376a: 70                                             NOP 
0000376b: 70                                             NOP 
0000376c: 84 ce fc 40                                    MOVW -4(%isp),%r0
00003770: 84 50 7f 10 04 00 02                           MOVW (%r0),$0x2000410
00003777: 84 c0 04 7f 14 04 00 02                        MOVW 4(%r0),$0x2000414
0000377f: 87 00 7f 25 04 00 02                           MOVB &0x0,$0x2000425
00003786: 2c 5c 7f 5e 6e 00 00                           CALL (%sp),$0x6e5e
0000378d: 30 c8                                          RETPS 
0000378f: 84 ce fc 40                                    MOVW -4(%isp),%r0
00003793: 84 50 7f 10 04 00 02                           MOVW (%r0),$0x2000410
0000379a: 84 c0 04 7f 14 04 00 02                        MOVW 4(%r0),$0x2000414
000037a2: 87 00 7f 25 04 00 02                           MOVB &0x0,$0x2000425
000037a9: 2c 5c 7f bc 6d 00 00                           CALL (%sp),$0x6dbc
000037b0: 30 c8                                          RETPS 
000037b2: 84 ce fc 40                                    MOVW -4(%isp),%r0
000037b6: 84 50 7f 10 04 00 02                           MOVW (%r0),$0x2000410
000037bd: 84 c0 04 7f 14 04 00 02                        MOVW 4(%r0),$0x2000414
000037c5: 87 08 7f 25 04 00 02                           MOVB &0x8,$0x2000425
000037cc: 2c 5c 7f bc 6d 00 00                           CALL (%sp),$0x6dbc
000037d3: 30 c8                                          RETPS 
000037d5: 84 ce fc 40                                    MOVW -4(%isp),%r0
000037d9: 84 50 7f 10 04 00 02                           MOVW (%r0),$0x2000410
000037e0: 84 c0 04 7f 14 04 00 02                        MOVW 4(%r0),$0x2000414
000037e8: 87 09 7f 25 04 00 02                           MOVB &0x9,$0x2000425
000037ef: 2c 5c 7f bc 6d 00 00                           CALL (%sp),$0x6dbc
000037f6: 30 c8                                          RETPS 
000037f8: 84 ce fc 40                                    MOVW -4(%isp),%r0
000037fc: 84 50 7f 10 04 00 02                           MOVW (%r0),$0x2000410
00003803: 84 c0 04 7f 14 04 00 02                        MOVW 4(%r0),$0x2000414
0000380b: 87 0a 7f 25 04 00 02                           MOVB &0xa,$0x2000425
00003812: 2c 5c 7f bc 6d 00 00                           CALL (%sp),$0x6dbc
00003819: 30 c8                                          RETPS 
0000381b: 84 ce fc 40                                    MOVW -4(%isp),%r0
0000381f: 84 50 7f 10 04 00 02                           MOVW (%r0),$0x2000410
00003826: 84 c0 04 7f 14 04 00 02                        MOVW 4(%r0),$0x2000414
0000382e: 87 0b 7f 25 04 00 02                           MOVB &0xb,$0x2000425
00003835: 2c 5c 7f bc 6d 00 00                           CALL (%sp),$0x6dbc
0000383c: 30 c8                                          RETPS 
0000383e: 84 ce fc 40                                    MOVW -4(%isp),%r0
00003842: 84 50 7f 10 04 00 02                           MOVW (%r0),$0x2000410
00003849: 84 c0 04 7f 14 04 00 02                        MOVW 4(%r0),$0x2000414
00003851: 87 0c 7f 25 04 00 02                           MOVB &0xc,$0x2000425
00003858: 2c 5c 7f bc 6d 00 00                           CALL (%sp),$0x6dbc
0000385f: 30 c8                                          RETPS 
00003861: 84 ce fc 40                                    MOVW -4(%isp),%r0
00003865: 84 50 7f 10 04 00 02                           MOVW (%r0),$0x2000410
0000386c: 84 c0 04 7f 14 04 00 02                        MOVW 4(%r0),$0x2000414
00003874: 87 0d 7f 25 04 00 02                           MOVB &0xd,$0x2000425
0000387b: 2c 5c 7f bc 6d 00 00                           CALL (%sp),$0x6dbc
00003882: 30 c8                                          RETPS 
00003884: 84 ce fc 40                                    MOVW -4(%isp),%r0
00003888: 84 50 7f 10 04 00 02                           MOVW (%r0),$0x2000410
0000388f: 84 c0 04 7f 14 04 00 02                        MOVW 4(%r0),$0x2000414
00003897: 87 0e 7f 25 04 00 02                           MOVB &0xe,$0x2000425
0000389e: 2c 5c 7f bc 6d 00 00                           CALL (%sp),$0x6dbc
000038a5: 30 c8                                          RETPS 
000038a7: 84 ce fc 40                                    MOVW -4(%isp),%r0
000038ab: 84 50 7f 10 04 00 02                           MOVW (%r0),$0x2000410
000038b2: 84 c0 04 7f 14 04 00 02                        MOVW 4(%r0),$0x2000414
000038ba: 87 0f 7f 25 04 00 02                           MOVB &0xf,$0x2000425
000038c1: 2c 5c 7f bc 6d 00 00                           CALL (%sp),$0x6dbc
000038c8: 30 c8                                          RETPS 
000038ca: 70                                             NOP 
000038cb: 70                                             NOP 
000038cc: 84 ce fc 40                                    MOVW -4(%isp),%r0
000038d0: 84 50 7f 10 04 00 02                           MOVW (%r0),$0x2000410
000038d7: 84 c0 04 7f 14 04 00 02                        MOVW 4(%r0),$0x2000414
000038df: 84 c0 1c 7f 1c 04 00 02                        MOVW 28(%r0),$0x200041c
000038e7: 2c 5c 7f 48 6f 00 00                           CALL (%sp),$0x6f48
000038ee: 30 c8                                          RETPS 
000038f0: 84 cc fc 7f 10 04 00 02                        MOVW -4(%sp),$0x2000410
000038f8: 84 cc f8 7f 14 04 00 02                        MOVW -8(%sp),$0x2000414
00003900: 84 40 7f 1c 04 00 02                           MOVW %r0,$0x200041c
00003907: 84 4f 00 e1 81 00 4b                           MOVW &0x81e100,%psw
0000390e: 70                                             NOP 
0000390f: 2c 5c 7f 48 6f 00 00                           CALL (%sp),$0x6f48
00003916: 84 7f 48 12 00 02 cc f8                        MOVW $0x2001248,-8(%sp)
0000391e: 84 7f 10 04 00 02 cc fc                        MOVW $0x2000410,-4(%sp)
00003926: 30 45                                          RETG 
00003928: 84 40 7f 1c 04 00 02                           MOVW %r0,$0x200041c
0000392f: 84 cc fc 7f 10 04 00 02                        MOVW -4(%sp),$0x2000410
00003937: 84 cc f8 7f 14 04 00 02                        MOVW -8(%sp),$0x2000414
0000393f: 04 7f f0 0e 00 02 40                           MOVAW $0x2000ef0,%r0
00003946: 30 ac                                          CALLPS 
00003948: 84 7f 48 12 00 02 cc f8                        MOVW $0x2001248,-8(%sp)
00003950: 84 7f 10 04 00 02 4b                           MOVW $0x2000410,%psw
00003957: 70                                             NOP 
00003958: 30 45                                          RETG 
0000395a: 84 4f 00 e1 81 00 4b                           MOVW &0x81e100,%psw
00003961: 70                                             NOP 
00003962: 2c 5c 7f 48 6f 00 00                           CALL (%sp),$0x6f48
00003969: 30 c8                                          RETPS 
0000396b: 70                                             NOP 
0000396c: 10 49                                          SAVE %fp
0000396e: 9c 4f 04 00 00 00 4c                           ADDW2 &0x4,%sp
00003975: 7b 21                                          BRB &0x21 <0x3996>
00003977: 2b ef 10 05 00 00                              TSTB *$0x510
0000397d: 77 19                                          BNEB &0x19 <0x3996>
0000397f: 38 7f 00 40 04 00 02                           BITW $0x44000,&0x2
00003986: 7f 10                                          BEB &0x10 <0x3996>
00003988: 80 ef 8c 04 00 00                              CLRW *$0x48c
0000398e: 80 7f 44 40 04 00                              CLRW $0x44044
00003994: 7b 00                                          BRB &0x0 <0x3994>
00003996: 84 5a 40                                       MOVW (%ap),%r0
00003999: 3b c0 01 01                                    BITB 1(%r0),&0x1
0000399d: 7f da                                          BEB &0xda <0x3977>
0000399f: 3c 7f 18 04 00 02 5a                           CMPW $0x2000418,(%ap)
000039a6: 77 3d                                          BNEB &0x3d <0x39e3>
000039a8: 84 5a 40                                       MOVW (%ap),%r0
000039ab: 3b c0 01 5f 80 00                              BITB 1(%r0),&0x80
000039b1: 7f 32                                          BEB &0x32 <0x39e3>
000039b3: 84 5a 40                                       MOVW (%ap),%r0
000039b6: 87 6f 40 c0 02                                 MOVB &0x40,2(%r0)
000039bb: 84 5a 40                                       MOVW (%ap),%r0
000039be: 87 6f 50 c0 02                                 MOVB &0x50,2(%r0)
000039c3: 84 5a 40                                       MOVW (%ap),%r0
000039c6: 87 c0 03 59                                    MOVB 3(%r0),(%fp)
000039ca: 84 5a 40                                       MOVW (%ap),%r0
000039cd: 3b c0 01 01                                    BITB 1(%r0),&0x1
000039d1: 77 e2                                          BNEB &0xe2 <0x39b3>
000039d3: 3f 01 7f 9d 0c 00 02                           CMPB &0x1,$0x2000c9d
000039da: 77 04                                          BNEB &0x4 <0x39de>
000039dc: 7b 99                                          BRB &0x99 <0x3975>
000039de: 84 ff 40                                       MOVW &-1,%r0
000039e1: 7b 0c                                          BRB &0xc <0x39ed>
000039e3: 84 5a 40                                       MOVW (%ap),%r0
000039e6: 87 c0 03 e0 40                                 MOVB 3(%r0),{uword}%r0
000039eb: 7b 02                                          BRB &0x2 <0x39ed>
000039ed: 18 49                                          RESTORE %fp
000039ef: 08                                             RET 
000039f0: 10 47                                          SAVE %r7
000039f2: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
000039f9: 2b ef c4 04 00 00                              TSTB *$0x4c4
000039ff: 77 29                                          BNEB &0x29 <0x3a28>
00003a01: 2b ef 10 05 00 00                              TSTB *$0x510
00003a07: 77 19                                          BNEB &0x19 <0x3a20>
00003a09: 38 7f 00 40 04 00 02                           BITW $0x44000,&0x2
00003a10: 7f 10                                          BEB &0x10 <0x3a20>
00003a12: 80 ef 8c 04 00 00                              CLRW *$0x48c
00003a18: 80 7f 44 40 04 00                              CLRW $0x44044
00003a1e: 7b 00                                          BRB &0x0 <0x3a1e>
00003a20: 80 40                                          CLRW %r0
00003a22: 24 7f 48 3b 00 00                              JMP $0x3b48
00003a28: 84 5a 48                                       MOVW (%ap),%r8
00003a2b: 24 7f 26 3b 00 00                              JMP $0x3b26
00003a31: a0 7f 18 04 00 02                              PUSHW $0x2000418
00003a37: 2c cc fc ef 28 00 00 02                        CALL -4(%sp),*$0x2000028
00003a3f: 84 40 47                                       MOVW %r0,%r7
00003a42: 28 47                                          TSTW %r7
00003a44: 43 0b                                          BGEB &0xb <0x3a4f>
00003a46: 84 ff 40                                       MOVW &-1,%r0
00003a49: 24 7f 48 3b 00 00                              JMP $0x3b48
00003a4f: f8 5f ff 00 47 e3 40                           ANDW3 &0xff,%r7,{ubyte}%r0
00003a56: 87 40 da 00                                    MOVB %r0,*0(%ap)
00003a5a: 3f 0a da 00                                    CMPB &0xa,*0(%ap)
00003a5e: 7f 08                                          BEB &0x8 <0x3a66>
00003a60: 3f 0d da 00                                    CMPB &0xd,*0(%ap)
00003a64: 77 2b                                          BNEB &0x2b <0x3a8f>
00003a66: 83 da 00                                       CLRB *0(%ap)
00003a69: a0 0a                                          PUSHW &0xa
00003a6b: a0 7f 18 04 00 02                              PUSHW $0x2000418
00003a71: 2c cc f8 ef 24 00 00 02                        CALL -8(%sp),*$0x2000024
00003a79: 28 40                                          TSTW %r0
00003a7b: 43 0b                                          BGEB &0xb <0x3a86>
00003a7d: 84 ff 40                                       MOVW &-1,%r0
00003a80: 24 7f 48 3b 00 00                              JMP $0x3b48
00003a86: 84 01 40                                       MOVW &0x1,%r0
00003a89: 24 7f 48 3b 00 00                              JMP $0x3b48
00003a8f: 3f 6f 7f da 00                                 CMPB &0x7f,*0(%ap)
00003a94: 77 0b                                          BNEB &0xb <0x3a9f>
00003a96: 84 ff 40                                       MOVW &-1,%r0
00003a99: 24 7f 48 3b 00 00                              JMP $0x3b48
00003a9f: 3f 13 da 00                                    CMPB &0x13,*0(%ap)
00003aa3: 7f 08                                          BEB &0x8 <0x3aab>
00003aa5: 3f 11 da 00                                    CMPB &0x11,*0(%ap)
00003aa9: 77 04                                          BNEB &0x4 <0x3aad>
00003aab: 7b 20                                          BRB &0x20 <0x3acb>
00003aad: 87 da 00 e0 40                                 MOVB *0(%ap),{uword}%r0
00003ab2: a0 40                                          PUSHW %r0
00003ab4: a0 7f 18 04 00 02                              PUSHW $0x2000418
00003aba: 2c cc f8 ef 24 00 00 02                        CALL -8(%sp),*$0x2000024
00003ac2: 28 40                                          TSTW %r0
00003ac4: 43 07                                          BGEB &0x7 <0x3acb>
00003ac6: 84 ff 40                                       MOVW &-1,%r0
00003ac9: 7b 7f                                          BRB &0x7f <0x3b48>
00003acb: 3f 08 da 00                                    CMPB &0x8,*0(%ap)
00003acf: 77 22                                          BNEB &0x22 <0x3af1>
00003ad1: 3c 48 5a                                       CMPW %r8,(%ap)
00003ad4: 7f 1b                                          BEB &0x1b <0x3aef>
00003ad6: a0 4f bc 0b 00 00                              PUSHW &0xbbc
00003adc: 2c cc fc ef b0 04 00 00                        CALL -4(%sp),*$0x4b0
00003ae4: 28 40                                          TSTW %r0
00003ae6: 43 07                                          BGEB &0x7 <0x3aed>
00003ae8: 84 ff 40                                       MOVW &-1,%r0
00003aeb: 7b 5d                                          BRB &0x5d <0x3b48>
00003aed: 94 5a                                          DECW (%ap)
00003aef: 7b 37                                          BRB &0x37 <0x3b26>
00003af1: 3f 6f 40 da 00                                 CMPB &0x40,*0(%ap)
00003af6: 77 20                                          BNEB &0x20 <0x3b16>
00003af8: 84 48 5a                                       MOVW %r8,(%ap)
00003afb: a0 0a                                          PUSHW &0xa
00003afd: a0 7f 18 04 00 02                              PUSHW $0x2000418
00003b03: 2c cc f8 ef 24 00 00 02                        CALL -8(%sp),*$0x2000024
00003b0b: 28 40                                          TSTW %r0
00003b0d: 43 07                                          BGEB &0x7 <0x3b14>
00003b0f: 84 ff 40                                       MOVW &-1,%r0
00003b12: 7b 36                                          BRB &0x36 <0x3b48>
00003b14: 7b 12                                          BRB &0x12 <0x3b26>
00003b16: 3f 13 da 00                                    CMPB &0x13,*0(%ap)
00003b1a: 7f 08                                          BEB &0x8 <0x3b22>
00003b1c: 3f 11 da 00                                    CMPB &0x11,*0(%ap)
00003b20: 77 04                                          BNEB &0x4 <0x3b24>
00003b22: 7b 04                                          BRB &0x4 <0x3b26>
00003b24: 90 5a                                          INCW (%ap)
00003b26: fc 48 5a 40                                    SUBW3 %r8,(%ap),%r0
00003b2a: 3c 6f 50 40                                    CMPW &0x50,%r0
00003b2e: 4a 03 ff                                       BLH &0xff03 <0x3a31>
00003b31: a0 4f bf 0b 00 00                              PUSHW &0xbbf
00003b37: a0 6f 50                                       PUSHW &0x50
00003b3a: 2c cc f8 ef b0 04 00 00                        CALL -8(%sp),*$0x4b0
00003b42: 84 48 5a                                       MOVW %r8,(%ap)
00003b45: 7a e6 fe                                       BRH &0xfee6 <0x3a2b>
00003b48: 18 47                                          RESTORE %r7
00003b4a: 08                                             RET 
00003b4b: 70                                             NOP 
00003b4c: 10 49                                          SAVE %fp
00003b4e: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
00003b55: 2c 5c ef 2c 00 00 02                           CALL (%sp),*$0x200002c
00003b5c: 87 40 e0 40                                    MOVB %r0,{uword}%r0
00003b60: 7b 02                                          BRB &0x2 <0x3b62>
00003b62: 18 49                                          RESTORE %fp
00003b64: 08                                             RET 
00003b65: 70                                             NOP 
00003b66: 70                                             NOP 
00003b67: 70                                             NOP 
00003b68: 10 49                                          SAVE %fp
00003b6a: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
00003b71: 2b ef 10 05 00 00                              TSTB *$0x510
00003b77: 77 19                                          BNEB &0x19 <0x3b90>
00003b79: 38 7f 00 40 04 00 02                           BITW $0x44000,&0x2
00003b80: 7f 10                                          BEB &0x10 <0x3b90>
00003b82: 80 ef 8c 04 00 00                              CLRW *$0x48c
00003b88: 80 7f 44 40 04 00                              CLRW $0x44044
00003b8e: 7b 00                                          BRB &0x0 <0x3b8e>
00003b90: 84 7f 18 04 00 02 40                           MOVW $0x2000418,%r0
00003b97: 3b c0 01 01                                    BITB 1(%r0),&0x1
00003b9b: 7f 10                                          BEB &0x10 <0x3bab>
00003b9d: 84 7f 18 04 00 02 40                           MOVW $0x2000418,%r0
00003ba4: 87 c0 03 e0 40                                 MOVB 3(%r0),{uword}%r0
00003ba9: 7b 06                                          BRB &0x6 <0x3baf>
00003bab: 80 40                                          CLRW %r0
00003bad: 7b 02                                          BRB &0x2 <0x3baf>
00003baf: 18 49                                          RESTORE %fp
00003bb1: 08                                             RET 
00003bb2: 70                                             NOP 
00003bb3: 70                                             NOP 
00003bb4: 10 49                                          SAVE %fp
00003bb6: 9c 4f 38 00 00 00 4c                           ADDW2 &0x38,%sp
00003bbd: 2b ef c4 04 00 00                              TSTB *$0x4c4
00003bc3: 77 29                                          BNEB &0x29 <0x3bec>
00003bc5: 2b ef 10 05 00 00                              TSTB *$0x510
00003bcb: 77 19                                          BNEB &0x19 <0x3be4>
00003bcd: 38 7f 00 40 04 00 02                           BITW $0x44000,&0x2
00003bd4: 7f 10                                          BEB &0x10 <0x3be4>
00003bd6: 80 ef 8c 04 00 00                              CLRW *$0x48c
00003bdc: 80 7f 44 40 04 00                              CLRW $0x44044
00003be2: 7b 00                                          BRB &0x0 <0x3be2>
00003be4: 80 40                                          CLRW %r0
00003be6: 24 7f 5e 3f 00 00                              JMP $0x3f5e
00003bec: 84 7f 18 04 00 02 40                           MOVW $0x2000418,%r0
00003bf3: 87 15 c0 02                                    MOVB &0x15,2(%r0)
00003bf7: 80 c9 28                                       CLRW 40(%fp)
00003bfa: 04 74 40                                       MOVAW 4(%ap),%r0
00003bfd: 84 40 59                                       MOVW %r0,(%fp)
00003c00: 24 7f 38 3f 00 00                              JMP $0x3f38
00003c06: 3f 25 da 00                                    CMPB &0x25,*0(%ap)
00003c0a: 7f 08                                          BEB &0x8 <0x3c12>
00003c0c: 24 7f 19 3f 00 00                              JMP $0x3f19
00003c12: 84 20 68                                       MOVW &0x20,8(%fp)
00003c15: 80 64                                          CLRW 4(%fp)
00003c17: 80 c9 18                                       CLRW 24(%fp)
00003c1a: 80 c9 1c                                       CLRW 28(%fp)
00003c1d: 90 5a                                          INCW (%ap)
00003c1f: 3f 2d da 00                                    CMPB &0x2d,*0(%ap)
00003c23: 77 07                                          BNEB &0x7 <0x3c2a>
00003c25: 84 01 64                                       MOVW &0x1,4(%fp)
00003c28: 90 5a                                          INCW (%ap)
00003c2a: 3f 30 da 00                                    CMPB &0x30,*0(%ap)
00003c2e: 77 0b                                          BNEB &0xb <0x3c39>
00003c30: 28 64                                          TSTW 4(%fp)
00003c32: 77 05                                          BNEB &0x5 <0x3c37>
00003c34: 84 30 68                                       MOVW &0x30,8(%fp)
00003c37: 90 5a                                          INCW (%ap)
00003c39: 7b 15                                          BRB &0x15 <0x3c4e>
00003c3b: e8 0a c9 1c 40                                 MULW3 &0xa,28(%fp),%r0
00003c40: ff 30 da 00 41                                 SUBB3 &0x30,*0(%ap),%r1
00003c45: 9c 41 40                                       ADDW2 %r1,%r0
00003c48: 84 40 c9 1c                                    MOVW %r0,28(%fp)
00003c4c: 90 5a                                          INCW (%ap)
00003c4e: 3f 30 da 00                                    CMPB &0x30,*0(%ap)
00003c52: 4b 08                                          BLB &0x8 <0x3c5a>
00003c54: 3f 39 da 00                                    CMPB &0x39,*0(%ap)
00003c58: 4f e3                                          BLEB &0xe3 <0x3c3b>
00003c5a: 3f 6f 6c da 00                                 CMPB &0x6c,*0(%ap)
00003c5f: 7f 09                                          BEB &0x9 <0x3c68>
00003c61: 3f 6f 68 da 00                                 CMPB &0x68,*0(%ap)
00003c66: 77 04                                          BNEB &0x4 <0x3c6a>
00003c68: 90 5a                                          INCW (%ap)
00003c6a: 87 da 00 e0 40                                 MOVB *0(%ap),{uword}%r0
00003c6f: 24 7f c4 3e 00 00                              JMP $0x3ec4
00003c75: 84 59 40                                       MOVW (%fp),%r0
00003c78: 87 c0 03 c9 10                                 MOVB 3(%r0),16(%fp)
00003c7d: 9c 04 59                                       ADDW2 &0x4,(%fp)
00003c80: 2b c9 10                                       TSTB 16(%fp)
00003c83: 7f 1f                                          BEB &0x1f <0x3ca2>
00003c85: 87 c9 10 e0 40                                 MOVB 16(%fp),{uword}%r0
00003c8a: a0 40                                          PUSHW %r0
00003c8c: a0 7f 18 04 00 02                              PUSHW $0x2000418
00003c92: 2c cc f8 ef 24 00 00 02                        CALL -8(%sp),*$0x2000024
00003c9a: 28 40                                          TSTW %r0
00003c9c: 43 06                                          BGEB &0x6 <0x3ca2>
00003c9e: 84 01 c9 28                                    MOVW &0x1,40(%fp)
00003ca2: 24 7f 17 3f 00 00                              JMP $0x3f17
00003ca8: 84 d9 00 c9 14                                 MOVW *0(%fp),20(%fp)
00003cad: 9c 04 59                                       ADDW2 &0x4,(%fp)
00003cb0: 28 c9 14                                       TSTW 20(%fp)
00003cb3: 77 0a                                          BNEB &0xa <0x3cbd>
00003cb5: 84 4f 08 0c 00 00 c9 14                        MOVW &0xc08,20(%fp)
00003cbd: 80 6c                                          CLRW 12(%fp)
00003cbf: 7b 27                                          BRB &0x27 <0x3ce6>
00003cc1: 90 6c                                          INCW 12(%fp)
00003cc3: 84 c9 14 40                                    MOVW 20(%fp),%r0
00003cc7: 90 c9 14                                       INCW 20(%fp)
00003cca: 87 50 e0 40                                    MOVB (%r0),{uword}%r0
00003cce: a0 40                                          PUSHW %r0
00003cd0: a0 7f 18 04 00 02                              PUSHW $0x2000418
00003cd6: 2c cc f8 ef 24 00 00 02                        CALL -8(%sp),*$0x2000024
00003cde: 28 40                                          TSTW %r0
00003ce0: 43 06                                          BGEB &0x6 <0x3ce6>
00003ce2: 84 01 c9 28                                    MOVW &0x1,40(%fp)
00003ce6: 2b d9 14                                       TSTB *20(%fp)
00003ce9: 77 d8                                          BNEB &0xd8 <0x3cc1>
00003ceb: 7b 1a                                          BRB &0x1a <0x3d05>
00003ced: a0 20                                          PUSHW &0x20
00003cef: a0 7f 18 04 00 02                              PUSHW $0x2000418
00003cf5: 2c cc f8 ef 24 00 00 02                        CALL -8(%sp),*$0x2000024
00003cfd: 28 40                                          TSTW %r0
00003cff: 43 06                                          BGEB &0x6 <0x3d05>
00003d01: 84 01 c9 28                                    MOVW &0x1,40(%fp)
00003d05: 84 6c 40                                       MOVW 12(%fp),%r0
00003d08: 90 6c                                          INCW 12(%fp)
00003d0a: 3c c9 1c 40                                    CMPW 28(%fp),%r0
00003d0e: 4b df                                          BLB &0xdf <0x3ced>
00003d10: 24 7f 17 3f 00 00                              JMP $0x3f17
00003d16: 84 10 c9 24                                    MOVW &0x10,36(%fp)
00003d1a: 7b 10                                          BRB &0x10 <0x3d2a>
00003d1c: 84 01 c9 18                                    MOVW &0x1,24(%fp)
00003d20: 84 0a c9 24                                    MOVW &0xa,36(%fp)
00003d24: 7b 06                                          BRB &0x6 <0x3d2a>
00003d26: 84 08 c9 24                                    MOVW &0x8,36(%fp)
00003d2a: 84 d9 00 c9 20                                 MOVW *0(%fp),32(%fp)
00003d2f: 9c 04 59                                       ADDW2 &0x4,(%fp)
00003d32: 28 c9 20                                       TSTW 32(%fp)
00003d35: 77 12                                          BNEB &0x12 <0x3d47>
00003d37: 84 01 6c                                       MOVW &0x1,12(%fp)
00003d3a: 87 7f f4 0b 00 00 c9 2c                        MOVB $0xbf4,44(%fp)
00003d42: 80 c9 18                                       CLRW 24(%fp)
00003d45: 7b 6c                                          BRB &0x6c <0x3db1>
00003d47: 3c 01 c9 18                                    CMPW &0x1,24(%fp)
00003d4b: 77 15                                          BNEB &0x15 <0x3d60>
00003d4d: d4 1f c9 20 40                                 LRSW3 &0x1f,32(%fp),%r0
00003d52: 7f 0e                                          BEB &0xe <0x3d60>
00003d54: 88 c9 20 40                                    MCOMW 32(%fp),%r0
00003d58: 90 40                                          INCW %r0
00003d5a: 84 40 c9 20                                    MOVW %r0,32(%fp)
00003d5e: 7b 05                                          BRB &0x5 <0x3d63>
00003d60: 80 c9 18                                       CLRW 24(%fp)
00003d63: 80 6c                                          CLRW 12(%fp)
00003d65: 7b 1f                                          BRB &0x1f <0x3d84>
00003d67: 04 c9 2c 40                                    MOVAW 44(%fp),%r0
00003d6b: 9c 6c 40                                       ADDW2 12(%fp),%r0
00003d6e: e4 e0 c9 24 c9 20 41                           MODW3 {uword}36(%fp),32(%fp),%r1
00003d75: 87 81 f4 0b 00 00 50                           MOVB 0xbf4(%r1),(%r0)
00003d7c: ac e0 c9 24 c9 20                              DIVW2 {uword}36(%fp),32(%fp)
00003d82: 90 6c                                          INCW 12(%fp)
00003d84: 28 c9 20                                       TSTW 32(%fp)
00003d87: 7f 07                                          BEB &0x7 <0x3d8e>
00003d89: 3c 0c 6c                                       CMPW &0xc,12(%fp)
00003d8c: 4b db                                          BLB &0xdb <0x3d67>
00003d8e: 3c 0c 6c                                       CMPW &0xc,12(%fp)
00003d91: 4b 20                                          BLB &0x20 <0x3db1>
00003d93: a0 3f                                          PUSHW &0x3f
00003d95: a0 7f 18 04 00 02                              PUSHW $0x2000418
00003d9b: 2c cc f8 ef 24 00 00 02                        CALL -8(%sp),*$0x2000024
00003da3: 28 40                                          TSTW %r0
00003da5: 43 06                                          BGEB &0x6 <0x3dab>
00003da7: 84 01 c9 28                                    MOVW &0x1,40(%fp)
00003dab: 24 7f 17 3f 00 00                              JMP $0x3f17
00003db1: 28 64                                          TSTW 4(%fp)
00003db3: 77 73                                          BNEB &0x73 <0x3e26>
00003db5: 3c 01 c9 18                                    CMPW &0x1,24(%fp)
00003db9: 77 22                                          BNEB &0x22 <0x3ddb>
00003dbb: 94 c9 1c                                       DECW 28(%fp)
00003dbe: 3c 30 68                                       CMPW &0x30,8(%fp)
00003dc1: 77 1a                                          BNEB &0x1a <0x3ddb>
00003dc3: a0 2d                                          PUSHW &0x2d
00003dc5: a0 7f 18 04 00 02                              PUSHW $0x2000418
00003dcb: 2c cc f8 ef 24 00 00 02                        CALL -8(%sp),*$0x2000024
00003dd3: 28 40                                          TSTW %r0
00003dd5: 43 06                                          BGEB &0x6 <0x3ddb>
00003dd7: 84 01 c9 28                                    MOVW &0x1,40(%fp)
00003ddb: 7b 1a                                          BRB &0x1a <0x3df5>
00003ddd: a0 68                                          PUSHW 8(%fp)
00003ddf: a0 7f 18 04 00 02                              PUSHW $0x2000418
00003de5: 2c cc f8 ef 24 00 00 02                        CALL -8(%sp),*$0x2000024
00003ded: 28 40                                          TSTW %r0
00003def: 43 06                                          BGEB &0x6 <0x3df5>
00003df1: 84 01 c9 28                                    MOVW &0x1,40(%fp)
00003df5: 84 c9 1c 40                                    MOVW 28(%fp),%r0
00003df9: 94 c9 1c                                       DECW 28(%fp)
00003dfc: 3c 6c 40                                       CMPW 12(%fp),%r0
00003dff: 47 de                                          BGB &0xde <0x3ddd>
00003e01: 3c 01 c9 18                                    CMPW &0x1,24(%fp)
00003e05: 77 1f                                          BNEB &0x1f <0x3e24>
00003e07: 3c 20 68                                       CMPW &0x20,8(%fp)
00003e0a: 77 1a                                          BNEB &0x1a <0x3e24>
00003e0c: a0 2d                                          PUSHW &0x2d
00003e0e: a0 7f 18 04 00 02                              PUSHW $0x2000418
00003e14: 2c cc f8 ef 24 00 00 02                        CALL -8(%sp),*$0x2000024
00003e1c: 28 40                                          TSTW %r0
00003e1e: 43 06                                          BGEB &0x6 <0x3e24>
00003e20: 84 01 c9 28                                    MOVW &0x1,40(%fp)
00003e24: 7b 27                                          BRB &0x27 <0x3e4b>
00003e26: 3c 01 c9 18                                    CMPW &0x1,24(%fp)
00003e2a: 77 1d                                          BNEB &0x1d <0x3e47>
00003e2c: 94 c9 1c                                       DECW 28(%fp)
00003e2f: a0 2d                                          PUSHW &0x2d
00003e31: a0 7f 18 04 00 02                              PUSHW $0x2000418
00003e37: 2c cc f8 ef 24 00 00 02                        CALL -8(%sp),*$0x2000024
00003e3f: 28 40                                          TSTW %r0
00003e41: 43 06                                          BGEB &0x6 <0x3e47>
00003e43: 84 01 c9 28                                    MOVW &0x1,40(%fp)
00003e47: bc 6c c9 1c                                    SUBW2 12(%fp),28(%fp)
00003e4b: 7b 25                                          BRB &0x25 <0x3e70>
00003e4d: 04 c9 2c 40                                    MOVAW 44(%fp),%r0
00003e51: 9c 6c 40                                       ADDW2 12(%fp),%r0
00003e54: 87 50 e0 40                                    MOVB (%r0),{uword}%r0
00003e58: a0 40                                          PUSHW %r0
00003e5a: a0 7f 18 04 00 02                              PUSHW $0x2000418
00003e60: 2c cc f8 ef 24 00 00 02                        CALL -8(%sp),*$0x2000024
00003e68: 28 40                                          TSTW %r0
00003e6a: 43 06                                          BGEB &0x6 <0x3e70>
00003e6c: 84 01 c9 28                                    MOVW &0x1,40(%fp)
00003e70: 94 6c                                          DECW 12(%fp)
00003e72: 43 db                                          BGEB &0xdb <0x3e4d>
00003e74: 3c 01 64                                       CMPW &0x1,4(%fp)
00003e77: 77 2c                                          BNEB &0x2c <0x3ea3>
00003e79: 7b 1a                                          BRB &0x1a <0x3e93>
00003e7b: a0 68                                          PUSHW 8(%fp)
00003e7d: a0 7f 18 04 00 02                              PUSHW $0x2000418
00003e83: 2c cc f8 ef 24 00 00 02                        CALL -8(%sp),*$0x2000024
00003e8b: 28 40                                          TSTW %r0
00003e8d: 43 06                                          BGEB &0x6 <0x3e93>
00003e8f: 84 01 c9 28                                    MOVW &0x1,40(%fp)
00003e93: 84 c9 1c 40                                    MOVW 28(%fp),%r0
00003e97: 94 c9 1c                                       DECW 28(%fp)
00003e9a: dc 01 6c 41                                    ADDW3 &0x1,12(%fp),%r1
00003e9e: 3c 41 40                                       CMPW %r1,%r0
00003ea1: 47 da                                          BGB &0xda <0x3e7b>
00003ea3: 7b 74                                          BRB &0x74 <0x3f17>
00003ea5: 87 da 00 e0 40                                 MOVB *0(%ap),{uword}%r0
00003eaa: a0 40                                          PUSHW %r0
00003eac: a0 7f 18 04 00 02                              PUSHW $0x2000418
00003eb2: 2c cc f8 ef 24 00 00 02                        CALL -8(%sp),*$0x2000024
00003eba: 28 40                                          TSTW %r0
00003ebc: 43 06                                          BGEB &0x6 <0x3ec2>
00003ebe: 84 01 c9 28                                    MOVW &0x1,40(%fp)
00003ec2: 7b 55                                          BRB &0x55 <0x3f17>
00003ec4: 3c 6f 6f 40                                    CMPW &0x6f,%r0
00003ec8: 7e 5e fe                                       BEH &0xfe5e <0x3d26>
00003ecb: 47 2f                                          BGB &0x2f <0x3efa>
00003ecd: 3c 6f 63 40                                    CMPW &0x63,%r0
00003ed1: 7e a4 fd                                       BEH &0xfda4 <0x3c75>
00003ed4: 47 1d                                          BGB &0x1d <0x3ef1>
00003ed6: 3c 6f 4f 40                                    CMPW &0x4f,%r0
00003eda: 7e 4c fe                                       BEH &0xfe4c <0x3d26>
00003edd: 47 0b                                          BGB &0xb <0x3ee8>
00003edf: 3c 6f 44 40                                    CMPW &0x44,%r0
00003ee3: 7e 39 fe                                       BEH &0xfe39 <0x3d1c>
00003ee6: 7b bf                                          BRB &0xbf <0x3ea5>
00003ee8: 3c 6f 58 40                                    CMPW &0x58,%r0
00003eec: 7e 2a fe                                       BEH &0xfe2a <0x3d16>
00003eef: 7b b6                                          BRB &0xb6 <0x3ea5>
00003ef1: 3c 6f 64 40                                    CMPW &0x64,%r0
00003ef5: 7e 27 fe                                       BEH &0xfe27 <0x3d1c>
00003ef8: 7b ad                                          BRB &0xad <0x3ea5>
00003efa: 3c 6f 75 40                                    CMPW &0x75,%r0
00003efe: 7e 22 fe                                       BEH &0xfe22 <0x3d20>
00003f01: 47 0b                                          BGB &0xb <0x3f0c>
00003f03: 3c 6f 73 40                                    CMPW &0x73,%r0
00003f07: 7e a1 fd                                       BEH &0xfda1 <0x3ca8>
00003f0a: 7b 9b                                          BRB &0x9b <0x3ea5>
00003f0c: 3c 6f 78 40                                    CMPW &0x78,%r0
00003f10: 7e 06 fe                                       BEH &0xfe06 <0x3d16>
00003f13: 7b 92                                          BRB &0x92 <0x3ea5>
00003f15: 7b 90                                          BRB &0x90 <0x3ea5>
00003f17: 7b 1f                                          BRB &0x1f <0x3f36>
00003f19: 87 da 00 e0 40                                 MOVB *0(%ap),{uword}%r0
00003f1e: a0 40                                          PUSHW %r0
00003f20: a0 7f 18 04 00 02                              PUSHW $0x2000418
00003f26: 2c cc f8 ef 24 00 00 02                        CALL -8(%sp),*$0x2000024
00003f2e: 28 40                                          TSTW %r0
00003f30: 43 06                                          BGEB &0x6 <0x3f36>
00003f32: 84 01 c9 28                                    MOVW &0x1,40(%fp)
00003f36: 90 5a                                          INCW (%ap)
00003f38: 2b da 00                                       TSTB *0(%ap)
00003f3b: 76 cb fc                                       BNEH &0xfccb <0x3c06>
00003f3e: 3c 01 c9 28                                    CMPW &0x1,40(%fp)
00003f42: 77 17                                          BNEB &0x17 <0x3f59>
00003f44: a0 0a                                          PUSHW &0xa
00003f46: a0 7f 18 04 00 02                              PUSHW $0x2000418
00003f4c: 2c cc f8 ef 24 00 00 02                        CALL -8(%sp),*$0x2000024
00003f54: 84 ff 40                                       MOVW &-1,%r0
00003f57: 7b 07                                          BRB &0x7 <0x3f5e>
00003f59: 84 01 40                                       MOVW &0x1,%r0
00003f5c: 7b 02                                          BRB &0x2 <0x3f5e>
00003f5e: 18 49                                          RESTORE %fp
00003f60: 08                                             RET 
00003f61: 70                                             NOP 
00003f62: 70                                             NOP 
00003f63: 70                                             NOP 
00003f64: 10 49                                          SAVE %fp
00003f66: 9c 4f 04 00 00 00 4c                           ADDW2 &0x4,%sp
00003f6d: 2b ef 10 05 00 00                              TSTB *$0x510
00003f73: 77 19                                          BNEB &0x19 <0x3f8c>
00003f75: 38 7f 00 40 04 00 02                           BITW $0x44000,&0x2
00003f7c: 7f 10                                          BEB &0x10 <0x3f8c>
00003f7e: 80 ef 8c 04 00 00                              CLRW *$0x48c
00003f84: 80 7f 44 40 04 00                              CLRW $0x44044
00003f8a: 7b 00                                          BRB &0x0 <0x3f8a>
00003f8c: 87 73 e2 40                                    MOVB 3(%ap),{uhalf}%r0
00003f90: 86 40 62                                       MOVH %r0,2(%fp)
00003f93: 3c 7f 18 04 00 02 74                           CMPW $0x2000418,4(%ap)
00003f9a: 7f 08                                          BEB &0x8 <0x3fa2>
00003f9c: 24 7f 46 40 00 00                              JMP $0x4046
00003fa2: 84 74 40                                       MOVW 4(%ap),%r0
00003fa5: 3b c0 01 01                                    BITB 1(%r0),&0x1
00003fa9: 77 08                                          BNEB &0x8 <0x3fb1>
00003fab: 24 7f 46 40 00 00                              JMP $0x4046
00003fb1: 84 74 40                                       MOVW 4(%ap),%r0
00003fb4: 3b c0 01 5f 80 00                              BITB 1(%r0),&0x80
00003fba: 7f 33                                          BEB &0x33 <0x3fed>
00003fbc: 84 74 40                                       MOVW 4(%ap),%r0
00003fbf: 87 6f 40 c0 02                                 MOVB &0x40,2(%r0)
00003fc4: 84 74 40                                       MOVW 4(%ap),%r0
00003fc7: 87 6f 50 c0 02                                 MOVB &0x50,2(%r0)
00003fcc: 84 74 40                                       MOVW 4(%ap),%r0
00003fcf: 87 c0 03 e2 40                                 MOVB 3(%r0),{uhalf}%r0
00003fd4: 86 40 59                                       MOVH %r0,(%fp)
00003fd7: 84 74 40                                       MOVW 4(%ap),%r0
00003fda: 3b c0 01 01                                    BITB 1(%r0),&0x1
00003fde: 77 de                                          BNEB &0xde <0x3fbc>
00003fe0: 2b 7f 9d 0c 00 02                              TSTB $0x2000c9d
00003fe6: 77 05                                          BNEB &0x5 <0x3feb>
00003fe8: 86 ff 62                                       MOVH &-1,2(%fp)
00003feb: 7b 5b                                          BRB &0x5b <0x4046>
00003fed: 84 74 40                                       MOVW 4(%ap),%r0
00003ff0: 87 c0 03 e2 40                                 MOVB 3(%r0),{uhalf}%r0
00003ff5: 86 40 59                                       MOVH %r0,(%fp)
00003ff8: 3e 5f ff 00 59                                 CMPH &0xff,(%fp)
00003ffd: 77 0f                                          BNEB &0xf <0x400c>
00003fff: 2b 7f 9d 0c 00 02                              TSTB $0x2000c9d
00004005: 77 05                                          BNEB &0x5 <0x400a>
00004007: 86 ff 62                                       MOVH &-1,2(%fp)
0000400a: 7b 3c                                          BRB &0x3c <0x4046>
0000400c: 3e 13 59                                       CMPH &0x13,(%fp)
0000400f: 77 37                                          BNEB &0x37 <0x4046>
00004011: 7b 21                                          BRB &0x21 <0x4032>
00004013: 2b ef 10 05 00 00                              TSTB *$0x510
00004019: 77 19                                          BNEB &0x19 <0x4032>
0000401b: 38 7f 00 40 04 00 02                           BITW $0x44000,&0x2
00004022: 7f 10                                          BEB &0x10 <0x4032>
00004024: 80 ef 8c 04 00 00                              CLRW *$0x48c
0000402a: 80 7f 44 40 04 00                              CLRW $0x44044
00004030: 7b 00                                          BRB &0x0 <0x4030>
00004032: 84 74 40                                       MOVW 4(%ap),%r0
00004035: 3b c0 01 01                                    BITB 1(%r0),&0x1
00004039: 7f da                                          BEB &0xda <0x4013>
0000403b: 84 74 40                                       MOVW 4(%ap),%r0
0000403e: 87 c0 03 e2 40                                 MOVB 3(%r0),{uhalf}%r0
00004043: 86 40 59                                       MOVH %r0,(%fp)
00004046: 7b 21                                          BRB &0x21 <0x4067>
00004048: 2b ef 10 05 00 00                              TSTB *$0x510
0000404e: 77 19                                          BNEB &0x19 <0x4067>
00004050: 38 7f 00 40 04 00 02                           BITW $0x44000,&0x2
00004057: 7f 10                                          BEB &0x10 <0x4067>
00004059: 80 ef 8c 04 00 00                              CLRW *$0x48c
0000405f: 80 7f 44 40 04 00                              CLRW $0x44044
00004065: 7b 00                                          BRB &0x0 <0x4065>
00004067: 84 74 40                                       MOVW 4(%ap),%r0
0000406a: fb 04 c0 01 40                                 ANDB3 &0x4,1(%r0),%r0
0000406f: 3c 04 40                                       CMPW &0x4,%r0
00004072: 77 d6                                          BNEB &0xd6 <0x4048>
00004074: 3c 7f 18 04 00 02 74                           CMPW $0x2000418,4(%ap)
0000407b: 77 45                                          BNEB &0x45 <0x40c0>
0000407d: 84 74 40                                       MOVW 4(%ap),%r0
00004080: 87 73 c0 03                                    MOVB 3(%ap),3(%r0)
00004084: 3f 0a 73                                       CMPB &0xa,3(%ap)
00004087: 77 37                                          BNEB &0x37 <0x40be>
00004089: 7b 21                                          BRB &0x21 <0x40aa>
0000408b: 2b ef 10 05 00 00                              TSTB *$0x510
00004091: 77 19                                          BNEB &0x19 <0x40aa>
00004093: 38 7f 00 40 04 00 02                           BITW $0x44000,&0x2
0000409a: 7f 10                                          BEB &0x10 <0x40aa>
0000409c: 80 ef 8c 04 00 00                              CLRW *$0x48c
000040a2: 80 7f 44 40 04 00                              CLRW $0x44044
000040a8: 7b 00                                          BRB &0x0 <0x40a8>
000040aa: 84 74 40                                       MOVW 4(%ap),%r0
000040ad: fb 04 c0 01 40                                 ANDB3 &0x4,1(%r0),%r0
000040b2: 3c 04 40                                       CMPW &0x4,%r0
000040b5: 77 d6                                          BNEB &0xd6 <0x408b>
000040b7: 84 74 40                                       MOVW 4(%ap),%r0
000040ba: 87 0d c0 03                                    MOVB &0xd,3(%r0)
000040be: 7b 17                                          BRB &0x17 <0x40d5>
000040c0: 3f 0a 73                                       CMPB &0xa,3(%ap)
000040c3: 77 0b                                          BNEB &0xb <0x40ce>
000040c5: 84 74 40                                       MOVW 4(%ap),%r0
000040c8: 87 0d c0 03                                    MOVB &0xd,3(%r0)
000040cc: 7b 09                                          BRB &0x9 <0x40d5>
000040ce: 84 74 40                                       MOVW 4(%ap),%r0
000040d1: 87 73 c0 03                                    MOVB 3(%ap),3(%r0)
000040d5: 86 62 e4 40                                    MOVH 2(%fp),{word}%r0
000040d9: 7b 02                                          BRB &0x2 <0x40db>
000040db: 18 49                                          RESTORE %fp
000040dd: 08                                             RET 
000040de: 70                                             NOP 
000040df: 70                                             NOP 
000040e0: 10 45                                          SAVE %r5
000040e2: 9c 4f 10 00 00 00 4c                           ADDW2 &0x10,%sp
000040e9: 04 78 40                                       MOVAW 8(%ap),%r0
000040ec: 84 40 6c                                       MOVW %r0,12(%fp)
000040ef: 80 45                                          CLRW %r5
000040f1: 80 47                                          CLRW %r7
000040f3: 24 7f 6b 43 00 00                              JMP $0x436b
000040f9: 7b 0e                                          BRB &0xe <0x4107>
000040fb: 2b da 04                                       TSTB *4(%ap)
000040fe: 77 07                                          BNEB &0x7 <0x4105>
00004100: 84 01 47                                       MOVW &0x1,%r7
00004103: 7b 0a                                          BRB &0xa <0x410d>
00004105: 90 74                                          INCW 4(%ap)
00004107: 3f 25 da 04                                    CMPB &0x25,*4(%ap)
0000410b: 77 f0                                          BNEB &0xf0 <0x40fb>
0000410d: 28 47                                          TSTW %r7
0000410f: 7f 08                                          BEB &0x8 <0x4117>
00004111: 24 7f 71 43 00 00                              JMP $0x4371
00004117: 7b 04                                          BRB &0x4 <0x411b>
00004119: 90 5a                                          INCW (%ap)
0000411b: 3f 20 da 00                                    CMPB &0x20,*0(%ap)
0000411f: 7f fa                                          BEB &0xfa <0x4119>
00004121: 3f 09 da 00                                    CMPB &0x9,*0(%ap)
00004125: 7f f4                                          BEB &0xf4 <0x4119>
00004127: 3f 2c da 00                                    CMPB &0x2c,*0(%ap)
0000412b: 7f ee                                          BEB &0xee <0x4119>
0000412d: 3f 2d da 00                                    CMPB &0x2d,*0(%ap)
00004131: 7f e8                                          BEB &0xe8 <0x4119>
00004133: 3f 3d da 00                                    CMPB &0x3d,*0(%ap)
00004137: 7f e2                                          BEB &0xe2 <0x4119>
00004139: 90 74                                          INCW 4(%ap)
0000413b: 84 74 40                                       MOVW 4(%ap),%r0
0000413e: 87 50 e0 40                                    MOVB (%r0),{uword}%r0
00004142: 24 7f 3c 43 00 00                              JMP $0x433c
00004148: 84 5a 48                                       MOVW (%ap),%r8
0000414b: 04 5a 40                                       MOVAW (%ap),%r0
0000414e: a0 40                                          PUSHW %r0
00004150: 2c cc fc af 2c 02                              CALL -4(%sp),0x22c(%pc)
00004156: 3c 5a 48                                       CMPW (%ap),%r8
00004159: 7f 22                                          BEB &0x22 <0x417b>
0000415b: 90 45                                          INCW %r5
0000415d: 7b 11                                          BRB &0x11 <0x416e>
0000415f: 84 6c 40                                       MOVW 12(%fp),%r0
00004162: 84 48 41                                       MOVW %r8,%r1
00004165: 90 48                                          INCW %r8
00004167: 87 51 d0 00                                    MOVB (%r1),*0(%r0)
0000416b: 90 d9 0c                                       INCW *12(%fp)
0000416e: 3c 5a 48                                       CMPW (%ap),%r8
00004171: 77 ee                                          BNEB &0xee <0x415f>
00004173: 84 6c 40                                       MOVW 12(%fp),%r0
00004176: 83 d0 00                                       CLRB *0(%r0)
00004179: 7b 05                                          BRB &0x5 <0x417e>
0000417b: 84 01 47                                       MOVW &0x1,%r7
0000417e: 24 7f 68 43 00 00                              JMP $0x4368
00004184: 2b da 00                                       TSTB *0(%ap)
00004187: 7f 10                                          BEB &0x10 <0x4197>
00004189: 84 6c 40                                       MOVW 12(%fp),%r0
0000418c: 87 da 00 d0 00                                 MOVB *0(%ap),*0(%r0)
00004191: 90 5a                                          INCW (%ap)
00004193: 90 45                                          INCW %r5
00004195: 7b 05                                          BRB &0x5 <0x419a>
00004197: 84 01 47                                       MOVW &0x1,%r7
0000419a: 24 7f 68 43 00 00                              JMP $0x4368
000041a0: 80 47                                          CLRW %r7
000041a2: 7b 0d                                          BRB &0xd <0x41af>
000041a4: 04 59 40                                       MOVAW (%fp),%r0
000041a7: 9c 47 40                                       ADDW2 %r7,%r0
000041aa: 87 30 50                                       MOVB &0x30,(%r0)
000041ad: 90 47                                          INCW %r7
000041af: 3c 08 47                                       CMPW &0x8,%r7
000041b2: 4b f2                                          BLB &0xf2 <0x41a4>
000041b4: 84 5a 48                                       MOVW (%ap),%r8
000041b7: 04 5a 40                                       MOVAW (%ap),%r0
000041ba: a0 40                                          PUSHW %r0
000041bc: 2c cc fc af c0 01                              CALL -4(%sp),0x1c0(%pc)
000041c2: 3c 5a 48                                       CMPW (%ap),%r8
000041c5: 77 08                                          BNEB &0x8 <0x41cd>
000041c7: 24 7f 66 42 00 00                              JMP $0x4266
000041cd: 94 5a                                          DECW (%ap)
000041cf: 84 07 47                                       MOVW &0x7,%r7
000041d2: 7b 17                                          BRB &0x17 <0x41e9>
000041d4: 04 59 40                                       MOVAW (%fp),%r0
000041d7: 9c 47 40                                       ADDW2 %r7,%r0
000041da: 87 da 00 50                                    MOVB *0(%ap),(%r0)
000041de: 3c 48 5a                                       CMPW %r8,(%ap)
000041e1: 77 04                                          BNEB &0x4 <0x41e5>
000041e3: 7b 0a                                          BRB &0xa <0x41ed>
000041e5: 94 5a                                          DECW (%ap)
000041e7: 94 47                                          DECW %r7
000041e9: 28 47                                          TSTW %r7
000041eb: 43 e9                                          BGEB &0xe9 <0x41d4>
000041ed: 04 59 40                                       MOVAW (%fp),%r0
000041f0: a0 40                                          PUSHW %r0
000041f2: a0 07                                          PUSHW &0x7
000041f4: a0 6f 78                                       PUSHW &0x78
000041f7: 2c cc f4 af 09 02                              CALL -12(%sp),0x209(%pc)
000041fd: 28 40                                          TSTW %r0
000041ff: 77 0b                                          BNEB &0xb <0x420a>
00004201: 84 01 47                                       MOVW &0x1,%r7
00004204: 24 7f 68 43 00 00                              JMP $0x4368
0000420a: 90 45                                          INCW %r5
0000420c: 80 46                                          CLRW %r6
0000420e: 84 07 47                                       MOVW &0x7,%r7
00004211: 7b 25                                          BRB &0x25 <0x4236>
00004213: 04 59 40                                       MOVAW (%fp),%r0
00004216: fc 47 07 41                                    SUBW3 %r7,&0x7,%r1
0000421a: 9c 41 40                                       ADDW2 %r1,%r0
0000421d: 87 50 e0 40                                    MOVB (%r0),{uword}%r0
00004221: a0 40                                          PUSHW %r0
00004223: 2c cc fc af a1 01                              CALL -4(%sp),0x1a1(%pc)
00004229: d0 02 47 41                                    LLSW3 &0x2,%r7,%r1
0000422d: d0 41 40 40                                    LLSW3 %r1,%r0,%r0
00004231: b0 40 46                                       ORW2 %r0,%r6
00004234: 94 47                                          DECW %r7
00004236: 28 47                                          TSTW %r7
00004238: 43 db                                          BGEB &0xdb <0x4213>
0000423a: 04 5a 40                                       MOVAW (%ap),%r0
0000423d: a0 40                                          PUSHW %r0
0000423f: 2c cc fc af 3d 01                              CALL -4(%sp),0x13d(%pc)
00004245: 3f 6f 78 da 04                                 CMPB &0x78,*4(%ap)
0000424a: 77 11                                          BNEB &0x11 <0x425b>
0000424c: 84 6c 40                                       MOVW 12(%fp),%r0
0000424f: 84 46 41                                       MOVW %r6,%r1
00004252: 86 41 41                                       MOVH %r1,%r1
00004255: 86 41 d0 00                                    MOVH %r1,*0(%r0)
00004259: 7b 09                                          BRB &0x9 <0x4262>
0000425b: 84 6c 40                                       MOVW 12(%fp),%r0
0000425e: 84 46 d0 00                                    MOVW %r6,*0(%r0)
00004262: 80 47                                          CLRW %r7
00004264: 7b 05                                          BRB &0x5 <0x4269>
00004266: 84 01 47                                       MOVW &0x1,%r7
00004269: 24 7f 68 43 00 00                              JMP $0x4368
0000426f: 84 09 47                                       MOVW &0x9,%r7
00004272: 7b 0d                                          BRB &0xd <0x427f>
00004274: 04 59 40                                       MOVAW (%fp),%r0
00004277: 9c 47 40                                       ADDW2 %r7,%r0
0000427a: 87 30 50                                       MOVB &0x30,(%r0)
0000427d: 94 47                                          DECW %r7
0000427f: 28 47                                          TSTW %r7
00004281: 43 f3                                          BGEB &0xf3 <0x4274>
00004283: 84 5a 48                                       MOVW (%ap),%r8
00004286: 04 5a 40                                       MOVAW (%ap),%r0
00004289: a0 40                                          PUSHW %r0
0000428b: 2c cc fc af f1 00                              CALL -4(%sp),0xf1(%pc)
00004291: 3c 5a 48                                       CMPW (%ap),%r8
00004294: 77 08                                          BNEB &0x8 <0x429c>
00004296: 24 7f 32 43 00 00                              JMP $0x4332
0000429c: 94 5a                                          DECW (%ap)
0000429e: 84 09 47                                       MOVW &0x9,%r7
000042a1: 7b 17                                          BRB &0x17 <0x42b8>
000042a3: 04 59 40                                       MOVAW (%fp),%r0
000042a6: 9c 47 40                                       ADDW2 %r7,%r0
000042a9: 87 da 00 50                                    MOVB *0(%ap),(%r0)
000042ad: 3c 48 5a                                       CMPW %r8,(%ap)
000042b0: 77 04                                          BNEB &0x4 <0x42b4>
000042b2: 7b 0a                                          BRB &0xa <0x42bc>
000042b4: 94 5a                                          DECW (%ap)
000042b6: 94 47                                          DECW %r7
000042b8: 28 47                                          TSTW %r7
000042ba: 43 e9                                          BGEB &0xe9 <0x42a3>
000042bc: 04 59 40                                       MOVAW (%fp),%r0
000042bf: a0 40                                          PUSHW %r0
000042c1: a0 09                                          PUSHW &0x9
000042c3: a0 6f 64                                       PUSHW &0x64
000042c6: 2c cc f4 af 3a 01                              CALL -12(%sp),0x13a(%pc)
000042cc: 28 40                                          TSTW %r0
000042ce: 77 0b                                          BNEB &0xb <0x42d9>
000042d0: 84 01 47                                       MOVW &0x1,%r7
000042d3: 24 7f 68 43 00 00                              JMP $0x4368
000042d9: 90 45                                          INCW %r5
000042db: 80 46                                          CLRW %r6
000042dd: ff 30 59 40                                    SUBB3 &0x30,(%fp),%r0
000042e1: 9c 46 40                                       ADDW2 %r6,%r0
000042e4: 84 40 46                                       MOVW %r0,%r6
000042e7: 84 01 47                                       MOVW &0x1,%r7
000042ea: 7b 17                                          BRB &0x17 <0x4301>
000042ec: a8 0a 46                                       MULW2 &0xa,%r6
000042ef: 04 59 40                                       MOVAW (%fp),%r0
000042f2: 9c 47 40                                       ADDW2 %r7,%r0
000042f5: ff 30 50 40                                    SUBB3 &0x30,(%r0),%r0
000042f9: 9c 46 40                                       ADDW2 %r6,%r0
000042fc: 84 40 46                                       MOVW %r0,%r6
000042ff: 90 47                                          INCW %r7
00004301: 3c 0a 47                                       CMPW &0xa,%r7
00004304: 4b e8                                          BLB &0xe8 <0x42ec>
00004306: 04 5a 40                                       MOVAW (%ap),%r0
00004309: a0 40                                          PUSHW %r0
0000430b: 2c cc fc af 71 00                              CALL -4(%sp),0x71(%pc)
00004311: 3f 6f 64 da 04                                 CMPB &0x64,*4(%ap)
00004316: 77 11                                          BNEB &0x11 <0x4327>
00004318: 84 6c 40                                       MOVW 12(%fp),%r0
0000431b: 84 46 41                                       MOVW %r6,%r1
0000431e: 86 41 41                                       MOVH %r1,%r1
00004321: 86 41 d0 00                                    MOVH %r1,*0(%r0)
00004325: 7b 09                                          BRB &0x9 <0x432e>
00004327: 84 6c 40                                       MOVW 12(%fp),%r0
0000432a: 84 46 d0 00                                    MOVW %r6,*0(%r0)
0000432e: 80 47                                          CLRW %r7
00004330: 7b 05                                          BRB &0x5 <0x4335>
00004332: 84 01 47                                       MOVW &0x1,%r7
00004335: 7b 33                                          BRB &0x33 <0x4368>
00004337: 84 01 47                                       MOVW &0x1,%r7
0000433a: 7b 2e                                          BRB &0x2e <0x4368>
0000433c: 3c 40 6f 44                                    CMPW %r0,&0x44
00004340: 7e 2f ff                                       BEH &0xff2f <0x426f>
00004343: 3c 40 6f 58                                    CMPW %r0,&0x58
00004347: 7e 59 fe                                       BEH &0xfe59 <0x41a0>
0000434a: 3c 40 6f 63                                    CMPW %r0,&0x63
0000434e: 7e 36 fe                                       BEH &0xfe36 <0x4184>
00004351: 3c 40 6f 64                                    CMPW %r0,&0x64
00004355: 7e 1a ff                                       BEH &0xff1a <0x426f>
00004358: 3c 40 6f 73                                    CMPW %r0,&0x73
0000435c: 7e ec fd                                       BEH &0xfdec <0x4148>
0000435f: 3c 40 6f 78                                    CMPW %r0,&0x78
00004363: 7e 3d fe                                       BEH &0xfe3d <0x41a0>
00004366: 7b d1                                          BRB &0xd1 <0x4337>
00004368: 9c 04 6c                                       ADDW2 &0x4,12(%fp)
0000436b: 2b da 04                                       TSTB *4(%ap)
0000436e: 76 8b fd                                       BNEH &0xfd8b <0x40f9>
00004371: 84 45 40                                       MOVW %r5,%r0
00004374: 7b 02                                          BRB &0x2 <0x4376>
00004376: 18 45                                          RESTORE %r5
00004378: 08                                             RET 
00004379: 70                                             NOP 
0000437a: 70                                             NOP 
0000437b: 70                                             NOP 
0000437c: 10 49                                          SAVE %fp
0000437e: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
00004385: 7b 05                                          BRB &0x5 <0x438a>
00004387: 90 da 00                                       INCW *0(%ap)
0000438a: 84 5a 40                                       MOVW (%ap),%r0
0000438d: 3f 20 d0 00                                    CMPB &0x20,*0(%r0)
00004391: 7f 2e                                          BEB &0x2e <0x43bf>
00004393: 84 5a 40                                       MOVW (%ap),%r0
00004396: 3f 09 d0 00                                    CMPB &0x9,*0(%r0)
0000439a: 7f 25                                          BEB &0x25 <0x43bf>
0000439c: 84 5a 40                                       MOVW (%ap),%r0
0000439f: 3f 2d d0 00                                    CMPB &0x2d,*0(%r0)
000043a3: 7f 1c                                          BEB &0x1c <0x43bf>
000043a5: 84 5a 40                                       MOVW (%ap),%r0
000043a8: 3f 2c d0 00                                    CMPB &0x2c,*0(%r0)
000043ac: 7f 13                                          BEB &0x13 <0x43bf>
000043ae: 84 5a 40                                       MOVW (%ap),%r0
000043b1: 2b d0 00                                       TSTB *0(%r0)
000043b4: 7f 0b                                          BEB &0xb <0x43bf>
000043b6: 84 5a 40                                       MOVW (%ap),%r0
000043b9: 3f 3d d0 00                                    CMPB &0x3d,*0(%r0)
000043bd: 77 ca                                          BNEB &0xca <0x4387>
000043bf: 18 49                                          RESTORE %fp
000043c1: 08                                             RET 
000043c2: 70                                             NOP 
000043c3: 70                                             NOP 
000043c4: 10 49                                          SAVE %fp
000043c6: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
000043cd: 3f 30 73                                       CMPB &0x30,3(%ap)
000043d0: 5b 11                                          BLUB &0x11 <0x43e1>
000043d2: 3f 39 73                                       CMPB &0x39,3(%ap)
000043d5: 57 0c                                          BGUB &0xc <0x43e1>
000043d7: ff 30 73 40                                    SUBB3 &0x30,3(%ap),%r0
000043db: 87 40 e0 40                                    MOVB %r0,{uword}%r0
000043df: 7b 1d                                          BRB &0x1d <0x43fc>
000043e1: 3f 6f 61 73                                    CMPB &0x61,3(%ap)
000043e5: 5b 0d                                          BLUB &0xd <0x43f2>
000043e7: ff 6f 57 73 40                                 SUBB3 &0x57,3(%ap),%r0
000043ec: 87 40 e0 40                                    MOVB %r0,{uword}%r0
000043f0: 7b 0c                                          BRB &0xc <0x43fc>
000043f2: ff 37 73 40                                    SUBB3 &0x37,3(%ap),%r0
000043f6: 87 40 e0 40                                    MOVB %r0,{uword}%r0
000043fa: 7b 02                                          BRB &0x2 <0x43fc>
000043fc: 18 49                                          RESTORE %fp
000043fe: 08                                             RET 
000043ff: 70                                             NOP 
00004400: 10 48                                          SAVE %r8
00004402: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
00004409: 87 7b e0 40                                    MOVB 11(%ap),{uword}%r0
0000440d: 7b 74                                          BRB &0x74 <0x4481>
0000440f: 80 48                                          CLRW %r8
00004411: 7b 44                                          BRB &0x44 <0x4455>
00004413: dc 48 5a 40                                    ADDW3 %r8,(%ap),%r0
00004417: 3f 30 50                                       CMPB &0x30,(%r0)
0000441a: 4b 0b                                          BLB &0xb <0x4425>
0000441c: dc 48 5a 40                                    ADDW3 %r8,(%ap),%r0
00004420: 3f 39 50                                       CMPB &0x39,(%r0)
00004423: 4f 2a                                          BLEB &0x2a <0x444d>
00004425: dc 48 5a 40                                    ADDW3 %r8,(%ap),%r0
00004429: 3f 6f 41 50                                    CMPB &0x41,(%r0)
0000442d: 4b 0c                                          BLB &0xc <0x4439>
0000442f: dc 48 5a 40                                    ADDW3 %r8,(%ap),%r0
00004433: 3f 6f 46 50                                    CMPB &0x46,(%r0)
00004437: 4f 16                                          BLEB &0x16 <0x444d>
00004439: dc 48 5a 40                                    ADDW3 %r8,(%ap),%r0
0000443d: 3f 6f 61 50                                    CMPB &0x61,(%r0)
00004441: 4b 0e                                          BLB &0xe <0x444f>
00004443: dc 48 5a 40                                    ADDW3 %r8,(%ap),%r0
00004447: 3f 6f 66 50                                    CMPB &0x66,(%r0)
0000444b: 47 04                                          BGB &0x4 <0x444f>
0000444d: 7b 06                                          BRB &0x6 <0x4453>
0000444f: 80 40                                          CLRW %r0
00004451: 7b 41                                          BRB &0x41 <0x4492>
00004453: 90 48                                          INCW %r8
00004455: 3c 74 48                                       CMPW 4(%ap),%r8
00004458: 4f bb                                          BLEB &0xbb <0x4413>
0000445a: 7b 33                                          BRB &0x33 <0x448d>
0000445c: 80 48                                          CLRW %r8
0000445e: 7b 1c                                          BRB &0x1c <0x447a>
00004460: dc 48 5a 40                                    ADDW3 %r8,(%ap),%r0
00004464: 3f 30 50                                       CMPB &0x30,(%r0)
00004467: 4b 0d                                          BLB &0xd <0x4474>
00004469: dc 48 5a 40                                    ADDW3 %r8,(%ap),%r0
0000446d: 3f 39 50                                       CMPB &0x39,(%r0)
00004470: 47 04                                          BGB &0x4 <0x4474>
00004472: 7b 06                                          BRB &0x6 <0x4478>
00004474: 80 40                                          CLRW %r0
00004476: 7b 1c                                          BRB &0x1c <0x4492>
00004478: 90 48                                          INCW %r8
0000447a: 3c 74 48                                       CMPW 4(%ap),%r8
0000447d: 4f e3                                          BLEB &0xe3 <0x4460>
0000447f: 7b 0e                                          BRB &0xe <0x448d>
00004481: 3c 40 6f 64                                    CMPW %r0,&0x64
00004485: 7f d7                                          BEB &0xd7 <0x445c>
00004487: 3c 40 6f 78                                    CMPW %r0,&0x78
0000448b: 7f 84                                          BEB &0x84 <0x440f>
0000448d: 84 01 40                                       MOVW &0x1,%r0
00004490: 7b 02                                          BRB &0x2 <0x4492>
00004492: 18 48                                          RESTORE %r8
00004494: 08                                             RET 
00004495: 70                                             NOP 
00004496: 70                                             NOP 
00004497: 70                                             NOP 
00004498: 10 49                                          SAVE %fp
0000449a: 9c 4f 08 00 00 00 4c                           ADDW2 &0x8,%sp
000044a1: 87 77 e0 40                                    MOVB 7(%ap),{uword}%r0
000044a5: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
000044a9: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
000044b0: 84 40 64                                       MOVW %r0,4(%fp)
000044b3: 80 59                                          CLRW (%fp)
000044b5: 7b 11                                          BRB &0x11 <0x44c6>
000044b7: 84 5a 40                                       MOVW (%ap),%r0
000044ba: 90 5a                                          INCW (%ap)
000044bc: 84 64 41                                       MOVW 4(%fp),%r1
000044bf: 90 64                                          INCW 4(%fp)
000044c1: 87 51 50                                       MOVB (%r1),(%r0)
000044c4: 90 59                                          INCW (%fp)
000044c6: 3c 20 59                                       CMPW &0x20,(%fp)
000044c9: 5b ee                                          BLUB &0xee <0x44b7>
000044cb: 18 49                                          RESTORE %fp
000044cd: 08                                             RET 
000044ce: 70                                             NOP 
000044cf: 70                                             NOP 
000044d0: 10 49                                          SAVE %fp
000044d2: 9c 4f 54 00 00 00 4c                           ADDW2 &0x54,%sp
000044d9: a0 00                                          PUSHW &0x0
000044db: 2c cc fc af 07 04                              CALL -4(%sp),0x407(%pc)
000044e1: a0 4f 28 0c 00 00                              PUSHW &0xc28
000044e7: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
000044ef: 28 40                                          TSTW %r0
000044f1: 43 08                                          BGEB &0x8 <0x44f9>
000044f3: 24 7f d7 48 00 00                              JMP $0x48d7
000044f9: a0 4f 49 0c 00 00                              PUSHW &0xc49
000044ff: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00004507: 28 40                                          TSTW %r0
00004509: 43 08                                          BGEB &0x8 <0x4511>
0000450b: 24 7f d7 48 00 00                              JMP $0x48d7
00004511: a0 4f 64 0c 00 00                              PUSHW &0xc64
00004517: d4 14 ef e4 04 00 00 40                        LRSW3 &0x14,*$0x4e4,%r0
0000451f: a0 40                                          PUSHW %r0
00004521: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
00004529: 28 40                                          TSTW %r0
0000452b: 43 08                                          BGEB &0x8 <0x4533>
0000452d: 24 7f d7 48 00 00                              JMP $0x48d7
00004533: 83 59                                          CLRB (%fp)
00004535: 7b 4e                                          BRB &0x4e <0x4583>
00004537: 87 59 e0 40                                    MOVB (%fp),{uword}%r0
0000453b: d0 02 40 40                                    LLSW3 &0x2,%r0,%r0
0000453f: 9c 7f 60 05 00 00 40                           ADDW2 $0x560,%r0
00004546: 28 50                                          TSTW (%r0)
00004548: 7f 37                                          BEB &0x37 <0x457f>
0000454a: a0 4f 74 0c 00 00                              PUSHW &0xc74
00004550: 87 59 e0 40                                    MOVB (%fp),{uword}%r0
00004554: a0 40                                          PUSHW %r0
00004556: 87 59 e0 40                                    MOVB (%fp),{uword}%r0
0000455a: d0 02 40 40                                    LLSW3 &0x2,%r0,%r0
0000455e: 9c 7f 60 05 00 00 40                           ADDW2 $0x560,%r0
00004565: d4 14 50 40                                    LRSW3 &0x14,(%r0),%r0
00004569: a0 40                                          PUSHW %r0
0000456b: 2c cc f4 7f b4 3b 00 00                        CALL -12(%sp),$0x3bb4
00004573: 28 40                                          TSTW %r0
00004575: 43 08                                          BGEB &0x8 <0x457d>
00004577: 24 7f d7 48 00 00                              JMP $0x48d7
0000457d: 7b 04                                          BRB &0x4 <0x4581>
0000457f: 7b 09                                          BRB &0x9 <0x4588>
00004581: 93 59                                          INCB (%fp)
00004583: 3f 04 59                                       CMPB &0x4,(%fp)
00004586: 5b b1                                          BLUB &0xb1 <0x4537>
00004588: 83 59                                          CLRB (%fp)
0000458a: 24 7f bf 48 00 00                              JMP $0x48bf
00004590: a0 4f 8b 0c 00 00                              PUSHW &0xc8b
00004596: 87 59 e0 40                                    MOVB (%fp),{uword}%r0
0000459a: a0 40                                          PUSHW %r0
0000459c: 87 59 e0 40                                    MOVB (%fp),{uword}%r0
000045a0: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
000045a4: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
000045ab: 9c 0c 40                                       ADDW2 &0xc,%r0
000045ae: a0 40                                          PUSHW %r0
000045b0: 2c cc f4 7f b4 3b 00 00                        CALL -12(%sp),$0x3bb4
000045b8: 28 40                                          TSTW %r0
000045ba: 43 08                                          BGEB &0x8 <0x45c2>
000045bc: 24 7f d7 48 00 00                              JMP $0x48d7
000045c2: a0 4f a9 0c 00 00                              PUSHW &0xca9
000045c8: 87 59 e0 40                                    MOVB (%fp),{uword}%r0
000045cc: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
000045d0: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
000045d7: cc 03 08 50 40                                 EXTFW &0x3,&0x8,(%r0),%r0
000045dc: a0 40                                          PUSHW %r0
000045de: 87 59 e0 40                                    MOVB (%fp),{uword}%r0
000045e2: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
000045e6: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
000045ed: cc 03 0c 50 40                                 EXTFW &0x3,&0xc,(%r0),%r0
000045f2: a0 40                                          PUSHW %r0
000045f4: 87 59 e0 40                                    MOVB (%fp),{uword}%r0
000045f8: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
000045fc: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00004603: 86 e2 50 e0 40                                 MOVH {uhalf}(%r0),{uword}%r0
00004608: a0 40                                          PUSHW %r0
0000460a: 2c cc f0 7f b4 3b 00 00                        CALL -16(%sp),$0x3bb4
00004612: 28 40                                          TSTW %r0
00004614: 43 08                                          BGEB &0x8 <0x461c>
00004616: 24 7f d7 48 00 00                              JMP $0x48d7
0000461c: 83 61                                          CLRB 1(%fp)
0000461e: 87 59 e0 40                                    MOVB (%fp),{uword}%r0
00004622: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00004626: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
0000462d: cc 02 0b c0 04 40                              EXTFW &0x2,&0xb,4(%r0),%r0
00004633: 7b 71                                          BRB &0x71 <0x46a4>
00004635: 04 62 40                                       MOVAW 2(%fp),%r0
00004638: a0 40                                          PUSHW %r0
0000463a: a0 4f da 0c 00 00                              PUSHW &0xcda
00004640: 2c cc f8 7f 28 70 00 00                        CALL -8(%sp),$0x7028
00004648: 87 01 61                                       MOVB &0x1,1(%fp)
0000464b: 7b 6c                                          BRB &0x6c <0x46b7>
0000464d: 04 62 40                                       MOVAW 2(%fp),%r0
00004650: a0 40                                          PUSHW %r0
00004652: a0 4f eb 0c 00 00                              PUSHW &0xceb
00004658: 2c cc f8 7f 28 70 00 00                        CALL -8(%sp),$0x7028
00004660: 7b 57                                          BRB &0x57 <0x46b7>
00004662: 04 62 40                                       MOVAW 2(%fp),%r0
00004665: a0 40                                          PUSHW %r0
00004667: a0 4f f8 0c 00 00                              PUSHW &0xcf8
0000466d: 2c cc f8 7f 28 70 00 00                        CALL -8(%sp),$0x7028
00004675: 7b 42                                          BRB &0x42 <0x46b7>
00004677: 04 62 40                                       MOVAW 2(%fp),%r0
0000467a: a0 40                                          PUSHW %r0
0000467c: a0 4f 01 0d 00 00                              PUSHW &0xd01
00004682: 2c cc f8 7f 28 70 00 00                        CALL -8(%sp),$0x7028
0000468a: 87 01 61                                       MOVB &0x1,1(%fp)
0000468d: 7b 2a                                          BRB &0x2a <0x46b7>
0000468f: 04 62 40                                       MOVAW 2(%fp),%r0
00004692: a0 40                                          PUSHW %r0
00004694: a0 4f 13 0d 00 00                              PUSHW &0xd13
0000469a: 2c cc f8 7f 28 70 00 00                        CALL -8(%sp),$0x7028
000046a2: 7b 15                                          BRB &0x15 <0x46b7>
000046a4: 3c 03 40                                       CMPW &0x3,%r0
000046a7: 47 e8                                          BGB &0xe8 <0x468f>
000046a9: c0 02 40 40                                    ALSW3 &0x2,%r0,%r0
000046ad: 28 40                                          TSTW %r0
000046af: 4b e0                                          BLB &0xe0 <0x468f>
000046b1: 24 90 18 0c 00 00                              JMP *0xc18(%r0)
000046b7: a0 4f 15 0d 00 00                              PUSHW &0xd15
000046bd: 04 62 40                                       MOVAW 2(%fp),%r0
000046c0: a0 40                                          PUSHW %r0
000046c2: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
000046ca: 28 40                                          TSTW %r0
000046cc: 43 08                                          BGEB &0x8 <0x46d4>
000046ce: 24 7f d7 48 00 00                              JMP $0x48d7
000046d4: 2b 61                                          TSTB 1(%fp)
000046d6: 77 08                                          BNEB &0x8 <0x46de>
000046d8: 24 7f 8b 48 00 00                              JMP $0x488b
000046de: a0 4f 25 0d 00 00                              PUSHW &0xd25
000046e4: 87 59 e0 40                                    MOVB (%fp),{uword}%r0
000046e8: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
000046ec: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
000046f3: cc 00 07 c0 04 40                              EXTFW &0x0,&0x7,4(%r0),%r0
000046f9: 28 40                                          TSTW %r0
000046fb: 7f 08                                          BEB &0x8 <0x4703>
000046fd: 84 6f 79 40                                    MOVW &0x79,%r0
00004701: 7b 06                                          BRB &0x6 <0x4707>
00004703: 84 6f 6e 40                                    MOVW &0x6e,%r0
00004707: a0 40                                          PUSHW %r0
00004709: 87 59 e0 40                                    MOVB (%fp),{uword}%r0
0000470d: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00004711: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00004718: cc 00 05 c0 04 40                              EXTFW &0x0,&0x5,4(%r0),%r0
0000471e: 28 40                                          TSTW %r0
00004720: 7f 0b                                          BEB &0xb <0x472b>
00004722: 84 4f 67 0d 00 00 40                           MOVW &0xd67,%r0
00004729: 7b 09                                          BRB &0x9 <0x4732>
0000472b: 84 4f 6e 0d 00 00 40                           MOVW &0xd6e,%r0
00004732: a0 40                                          PUSHW %r0
00004734: 87 59 e0 40                                    MOVB (%fp),{uword}%r0
00004738: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
0000473c: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00004743: cc 00 06 c0 04 40                              EXTFW &0x0,&0x6,4(%r0),%r0
00004749: 90 40                                          INCW %r0
0000474b: a0 40                                          PUSHW %r0
0000474d: 2c cc f0 7f b4 3b 00 00                        CALL -16(%sp),$0x3bb4
00004755: 28 40                                          TSTW %r0
00004757: 43 08                                          BGEB &0x8 <0x475f>
00004759: 24 7f d7 48 00 00                              JMP $0x48d7
0000475f: a0 4f 75 0d 00 00                              PUSHW &0xd75
00004765: 87 59 e0 40                                    MOVB (%fp),{uword}%r0
00004769: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
0000476d: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00004774: 87 c0 03 e0 40                                 MOVB 3(%r0),{uword}%r0
00004779: a0 40                                          PUSHW %r0
0000477b: 87 59 e0 40                                    MOVB (%fp),{uword}%r0
0000477f: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00004783: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
0000478a: 87 c0 04 e0 40                                 MOVB 4(%r0),{uword}%r0
0000478f: a0 40                                          PUSHW %r0
00004791: 2c cc f4 7f b4 3b 00 00                        CALL -12(%sp),$0x3bb4
00004799: 28 40                                          TSTW %r0
0000479b: 43 08                                          BGEB &0x8 <0x47a3>
0000479d: 24 7f d7 48 00 00                              JMP $0x48d7
000047a3: 87 59 e0 40                                    MOVB (%fp),{uword}%r0
000047a7: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
000047ab: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
000047b2: cc 00 0a c0 04 40                              EXTFW &0x0,&0xa,4(%r0),%r0
000047b8: 28 40                                          TSTW %r0
000047ba: 7f 1a                                          BEB &0x1a <0x47d4>
000047bc: a0 4f a4 0d 00 00                              PUSHW &0xda4
000047c2: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
000047ca: 28 40                                          TSTW %r0
000047cc: 43 08                                          BGEB &0x8 <0x47d4>
000047ce: 24 7f d7 48 00 00                              JMP $0x48d7
000047d4: 83 61                                          CLRB 1(%fp)
000047d6: 24 7f 6c 48 00 00                              JMP $0x486c
000047dc: 2b 61                                          TSTB 1(%fp)
000047de: 77 1a                                          BNEB &0x1a <0x47f8>
000047e0: a0 4f b3 0d 00 00                              PUSHW &0xdb3
000047e6: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
000047ee: 28 40                                          TSTW %r0
000047f0: 43 08                                          BGEB &0x8 <0x47f8>
000047f2: 24 7f d7 48 00 00                              JMP $0x48d7
000047f8: a0 4f c6 0d 00 00                              PUSHW &0xdc6
000047fe: 87 61 e0 40                                    MOVB 1(%fp),{uword}%r0
00004802: a4 e0 02 40                                    MODW2 {uword}&0x2,%r0
00004806: 77 0b                                          BNEB &0xb <0x4811>
00004808: 84 4f e7 0d 00 00 40                           MOVW &0xde7,%r0
0000480f: 7b 09                                          BRB &0x9 <0x4818>
00004811: 84 4f ee 0d 00 00 40                           MOVW &0xdee,%r0
00004818: a0 40                                          PUSHW %r0
0000481a: 87 61 e0 40                                    MOVB 1(%fp),{uword}%r0
0000481e: a0 40                                          PUSHW %r0
00004820: 87 59 e0 40                                    MOVB (%fp),{uword}%r0
00004824: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00004828: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
0000482f: eb 0c 61 41                                    MULB3 &0xc,1(%fp),%r1
00004833: dc 41 c0 08 40                                 ADDW3 %r1,8(%r0),%r0
00004838: 9c 02 40                                       ADDW2 &0x2,%r0
0000483b: a0 40                                          PUSHW %r0
0000483d: 87 59 e0 40                                    MOVB (%fp),{uword}%r0
00004841: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00004845: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
0000484c: eb 0c 61 41                                    MULB3 &0xc,1(%fp),%r1
00004850: dc 41 c0 08 40                                 ADDW3 %r1,8(%r0),%r0
00004855: 86 e2 50 e0 40                                 MOVH {uhalf}(%r0),{uword}%r0
0000485a: a0 40                                          PUSHW %r0
0000485c: 2c cc ec 7f b4 3b 00 00                        CALL -20(%sp),$0x3bb4
00004864: 28 40                                          TSTW %r0
00004866: 43 04                                          BGEB &0x4 <0x486a>
00004868: 7b 6f                                          BRB &0x6f <0x48d7>
0000486a: 93 61                                          INCB 1(%fp)
0000486c: 87 61 e0 40                                    MOVB 1(%fp),{uword}%r0
00004870: 87 59 e0 41                                    MOVB (%fp),{uword}%r1
00004874: d0 05 41 41                                    LLSW3 &0x5,%r1,%r1
00004878: 9c 7f 90 04 00 00 41                           ADDW2 $0x490,%r1
0000487f: cc 03 00 c1 04 41                              EXTFW &0x3,&0x0,4(%r1),%r1
00004885: 3c 41 40                                       CMPW %r1,%r0
00004888: 5a 54 ff                                       BLUH &0xff54 <0x47dc>
0000488b: 87 59 e0 40                                    MOVB (%fp),{uword}%r0
0000488f: ff 01 ef e0 04 00 00 41                        SUBB3 &0x1,*$0x4e0,%r1
00004897: 3c 41 40                                       CMPW %r1,%r0
0000489a: 53 23                                          BGEUB &0x23 <0x48bd>
0000489c: a0 4f f1 0d 00 00                              PUSHW &0xdf1
000048a2: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
000048aa: 28 40                                          TSTW %r0
000048ac: 43 04                                          BGEB &0x4 <0x48b0>
000048ae: 7b 29                                          BRB &0x29 <0x48d7>
000048b0: 7b 02                                          BRB &0x2 <0x48b2>
000048b2: 2c 5c ef c8 04 00 00                           CALL (%sp),*$0x4c8
000048b9: 28 40                                          TSTW %r0
000048bb: 7f f7                                          BEB &0xf7 <0x48b2>
000048bd: 93 59                                          INCB (%fp)
000048bf: 3f ef e0 04 00 00 59                           CMPB *$0x4e0,(%fp)
000048c6: 5a ca fc                                       BLUH &0xfcca <0x4590>
000048c9: a0 4f 0e 0e 00 00                              PUSHW &0xe0e
000048cf: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
000048d7: a0 01                                          PUSHW &0x1
000048d9: 2c cc fc af 09 00                              CALL -4(%sp),0x9(%pc)
000048df: 18 49                                          RESTORE %fp
000048e1: 08                                             RET 
000048e2: 10 49                                          SAVE %fp
000048e4: 9c 4f 04 00 00 00 4c                           ADDW2 &0x4,%sp
000048eb: 87 73 7f 9d 0c 00 02                           MOVB 3(%ap),$0x2000c9d
000048f2: 2b 73                                          TSTB 3(%ap)
000048f4: 77 34                                          BNEB &0x34 <0x4928>
000048f6: 7b 25                                          BRB &0x25 <0x491b>
000048f8: 84 7f 18 04 00 02 40                           MOVW $0x2000418,%r0
000048ff: 87 6f 40 c0 02                                 MOVB &0x40,2(%r0)
00004904: 84 7f 18 04 00 02 40                           MOVW $0x2000418,%r0
0000490b: 87 6f 50 c0 02                                 MOVB &0x50,2(%r0)
00004910: 84 7f 18 04 00 02 40                           MOVW $0x2000418,%r0
00004917: 87 c0 03 59                                    MOVB 3(%r0),(%fp)
0000491b: 84 7f 18 04 00 02 40                           MOVW $0x2000418,%r0
00004922: 3b c0 01 01                                    BITB 1(%r0),&0x1
00004926: 77 d2                                          BNEB &0xd2 <0x48f8>
00004928: 18 49                                          RESTORE %fp
0000492a: 08                                             RET 
0000492b: 70                                             NOP 
0000492c: 10 48                                          SAVE %r8
0000492e: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
00004935: 3c 4f 00 30 04 00 5a                           CMPW &0x43000,(%ap)
0000493c: 5b 2d                                          BLUB &0x2d <0x4969>
0000493e: 3c 4f ff 37 04 00 5a                           CMPW &0x437ff,(%ap)
00004945: 57 24                                          BGUB &0x24 <0x4969>
00004947: 86 e2 7a e0 40                                 MOVH {uhalf}10(%ap),{uword}%r0
0000494c: 9c 5a 40                                       ADDW2 (%ap),%r0
0000494f: 3c 4f 00 30 04 00 40                           CMPW &0x43000,%r0
00004956: 5b 13                                          BLUB &0x13 <0x4969>
00004958: 86 e2 7a e0 40                                 MOVH {uhalf}10(%ap),{uword}%r0
0000495d: 9c 5a 40                                       ADDW2 (%ap),%r0
00004960: 3c 4f ff 37 04 00 40                           CMPW &0x437ff,%r0
00004967: 5f 06                                          BLEUB &0x6 <0x496d>
00004969: 80 40                                          CLRW %r0
0000496b: 7b 6b                                          BRB &0x6b <0x49d6>
0000496d: bc 5f ff 0f 5a                                 SUBW2 &0xfff,(%ap)
00004972: f8 4f 00 f0 0f 00 5a 40                        ANDW3 &0xff000,(%ap),%r0
0000497a: f8 5f ff 0f 5a 41                              ANDW3 &0xfff,(%ap),%r1
00004980: d0 02 41 41                                    LLSW3 &0x2,%r1,%r1
00004984: 9c 41 40                                       ADDW2 %r1,%r0
00004987: 84 40 48                                       MOVW %r0,%r8
0000498a: 7b 17                                          BRB &0x17 <0x49a1>
0000498c: 84 74 40                                       MOVW 4(%ap),%r0
0000498f: 90 74                                          INCW 4(%ap)
00004991: 84 48 41                                       MOVW %r8,%r1
00004994: 9c 04 48                                       ADDW2 &0x4,%r8
00004997: fb 5f ff 00 c1 03 41                           ANDB3 &0xff,3(%r1),%r1
0000499e: 87 41 50                                       MOVB %r1,(%r0)
000049a1: 86 7a 40                                       MOVH 10(%ap),%r0
000049a4: 96 7a                                          DECH 10(%ap)
000049a6: 86 e2 40 e0 40                                 MOVH {uhalf}%r0,{uword}%r0
000049ab: 77 e1                                          BNEB &0xe1 <0x498c>
000049ad: 3c 4f 01 21 04 00 5a                           CMPW &0x42101,(%ap)
000049b4: 5b 07                                          BLUB &0x7 <0x49bb>
000049b6: 84 01 40                                       MOVW &0x1,%r0
000049b9: 7b 1d                                          BRB &0x1d <0x49d6>
000049bb: 80 7f 50 12 00 02                              CLRW $0x2001250
000049c1: a0 7f 50 12 00 02                              PUSHW $0x2001250
000049c7: 37 04                                          BSBB &0x4 <0x49cb>
000049c9: 7b 0b                                          BRB &0xb <0x49d4>
000049cb: a0 4a                                          PUSHW %ap
000049cd: fc 0c 4c 4a                                    SUBW3 &0xc,%sp,%ap
000049d1: 7a bb 00                                       BRH &0xbb <0x4a8c>
000049d4: 7b 02                                          BRB &0x2 <0x49d6>
000049d6: 18 48                                          RESTORE %r8
000049d8: 08                                             RET 
000049d9: 70                                             NOP 
000049da: 70                                             NOP 
000049db: 70                                             NOP 
000049dc: 10 48                                          SAVE %r8
000049de: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
000049e5: 3c 4f 00 30 04 00 74                           CMPW &0x43000,4(%ap)
000049ec: 5b 2d                                          BLUB &0x2d <0x4a19>
000049ee: 3c 4f ff 37 04 00 74                           CMPW &0x437ff,4(%ap)
000049f5: 57 24                                          BGUB &0x24 <0x4a19>
000049f7: 86 e2 7a e0 40                                 MOVH {uhalf}10(%ap),{uword}%r0
000049fc: 9c 74 40                                       ADDW2 4(%ap),%r0
000049ff: 3c 4f 00 30 04 00 40                           CMPW &0x43000,%r0
00004a06: 5b 13                                          BLUB &0x13 <0x4a19>
00004a08: 86 e2 7a e0 40                                 MOVH {uhalf}10(%ap),{uword}%r0
00004a0d: 9c 74 40                                       ADDW2 4(%ap),%r0
00004a10: 3c 4f ff 37 04 00 40                           CMPW &0x437ff,%r0
00004a17: 5f 06                                          BLEUB &0x6 <0x4a1d>
00004a19: 80 40                                          CLRW %r0
00004a1b: 7b 6b                                          BRB &0x6b <0x4a86>
00004a1d: bc 5f ff 0f 74                                 SUBW2 &0xfff,4(%ap)
00004a22: f8 4f 00 f0 0f 00 74 40                        ANDW3 &0xff000,4(%ap),%r0
00004a2a: f8 5f ff 0f 74 41                              ANDW3 &0xfff,4(%ap),%r1
00004a30: d0 02 41 41                                    LLSW3 &0x2,%r1,%r1
00004a34: 9c 41 40                                       ADDW2 %r1,%r0
00004a37: 84 40 48                                       MOVW %r0,%r8
00004a3a: 7b 16                                          BRB &0x16 <0x4a50>
00004a3c: 84 48 40                                       MOVW %r8,%r0
00004a3f: 9c 04 48                                       ADDW2 &0x4,%r8
00004a42: 84 5a 41                                       MOVW (%ap),%r1
00004a45: 90 5a                                          INCW (%ap)
00004a47: fb 5f ff 00 51 41                              ANDB3 &0xff,(%r1),%r1
00004a4d: 84 41 50                                       MOVW %r1,(%r0)
00004a50: 86 7a 40                                       MOVH 10(%ap),%r0
00004a53: 96 7a                                          DECH 10(%ap)
00004a55: 86 e2 40 e0 40                                 MOVH {uhalf}%r0,{uword}%r0
00004a5a: 77 e2                                          BNEB &0xe2 <0x4a3c>
00004a5c: 3c 4f 01 21 04 00 74                           CMPW &0x42101,4(%ap)
00004a63: 5b 07                                          BLUB &0x7 <0x4a6a>
00004a65: 84 01 40                                       MOVW &0x1,%r0
00004a68: 7b 1e                                          BRB &0x1e <0x4a86>
00004a6a: 84 01 7f 50 12 00 02                           MOVW &0x1,$0x2001250
00004a71: a0 7f 50 12 00 02                              PUSHW $0x2001250
00004a77: 37 04                                          BSBB &0x4 <0x4a7b>
00004a79: 7b 0b                                          BRB &0xb <0x4a84>
00004a7b: a0 4a                                          PUSHW %ap
00004a7d: fc 0c 4c 4a                                    SUBW3 &0xc,%sp,%ap
00004a81: 7a 0b 00                                       BRH &0xb <0x4a8c>
00004a84: 7b 02                                          BRB &0x2 <0x4a86>
00004a86: 18 48                                          RESTORE %r8
00004a88: 08                                             RET 
00004a89: 70                                             NOP 
00004a8a: 70                                             NOP 
00004a8b: 70                                             NOP 
00004a8c: 10 46                                          SAVE %r6
00004a8e: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
00004a95: 82 48                                          CLRH %r8
00004a97: 84 4f 04 20 04 00 47                           MOVW &0x42004,%r7
00004a9e: 84 4f 04 24 04 00 46                           MOVW &0x42404,%r6
00004aa5: 7b 4a                                          BRB &0x4a <0x4aef>
00004aa7: 84 5f ff 00 40                                 MOVW &0xff,%r0
00004aac: 86 e2 40 e0 40                                 MOVH {uhalf}%r0,{uword}%r0
00004ab1: 86 e2 c7 02 e0 41                              MOVH {uhalf}2(%r7),{uword}%r1
00004ab7: b8 41 40                                       ANDW2 %r1,%r0
00004aba: 86 e2 40 e0 40                                 MOVH {uhalf}%r0,{uword}%r0
00004abf: 86 e2 48 e0 41                                 MOVH {uhalf}%r8,{uword}%r1
00004ac4: 9c 41 40                                       ADDW2 %r1,%r0
00004ac7: 86 40 48                                       MOVH %r0,%r8
00004aca: 86 e2 48 e0 40                                 MOVH {uhalf}%r8,{uword}%r0
00004acf: d4 0f 40 40                                    LRSW3 &0xf,%r0,%r0
00004ad3: 86 e2 40 e0 40                                 MOVH {uhalf}%r0,{uword}%r0
00004ad8: 86 e2 48 e0 41                                 MOVH {uhalf}%r8,{uword}%r1
00004add: d0 01 41 41                                    LLSW3 &0x1,%r1,%r1
00004ae1: 86 e2 41 e0 41                                 MOVH {uhalf}%r1,{uword}%r1
00004ae6: b0 41 40                                       ORW2 %r1,%r0
00004ae9: 86 40 48                                       MOVH %r0,%r8
00004aec: 9c 04 47                                       ADDW2 &0x4,%r7
00004aef: 3c 46 47                                       CMPW %r6,%r7
00004af2: 5b b5                                          BLUB &0xb5 <0x4aa7>
00004af4: 86 e2 48 e0 40                                 MOVH {uhalf}%r8,{uword}%r0
00004af9: 88 40 40                                       MCOMW %r0,%r0
00004afc: 86 40 48                                       MOVH %r0,%r8
00004aff: 3f 01 73                                       CMPB &0x1,3(%ap)
00004b02: 77 21                                          BNEB &0x21 <0x4b23>
00004b04: 86 e2 48 e0 40                                 MOVH {uhalf}%r8,{uword}%r0
00004b09: b8 5f ff 00 40                                 ANDW2 &0xff,%r0
00004b0e: 84 40 57                                       MOVW %r0,(%r7)
00004b11: 86 e2 48 e0 40                                 MOVH {uhalf}%r8,{uword}%r0
00004b16: d4 08 40 40                                    LRSW3 &0x8,%r0,%r0
00004b1a: b8 5f ff 00 40                                 ANDW2 &0xff,%r0
00004b1f: 84 40 c7 04                                    MOVW %r0,4(%r7)
00004b23: 86 e2 48 e0 40                                 MOVH {uhalf}%r8,{uword}%r0
00004b28: 84 5f ff 00 41                                 MOVW &0xff,%r1
00004b2d: 86 e2 41 e0 41                                 MOVH {uhalf}%r1,{uword}%r1
00004b32: 86 e2 c7 02 e0 42                              MOVH {uhalf}2(%r7),{uword}%r2
00004b38: b8 42 41                                       ANDW2 %r2,%r1
00004b3b: 86 e2 41 e0 41                                 MOVH {uhalf}%r1,{uword}%r1
00004b40: f8 5f ff 00 c7 04 42                           ANDW3 &0xff,4(%r7),%r2
00004b47: d0 08 42 42                                    LLSW3 &0x8,%r2,%r2
00004b4b: 86 e2 42 e0 42                                 MOVH {uhalf}%r2,{uword}%r2
00004b50: b0 42 41                                       ORW2 %r2,%r1
00004b53: 86 e2 41 e0 41                                 MOVH {uhalf}%r1,{uword}%r1
00004b58: 3c 41 40                                       CMPW %r1,%r0
00004b5b: 77 07                                          BNEB &0x7 <0x4b62>
00004b5d: 84 01 40                                       MOVW &0x1,%r0
00004b60: 7b 06                                          BRB &0x6 <0x4b66>
00004b62: 80 40                                          CLRW %r0
00004b64: 7b 02                                          BRB &0x2 <0x4b66>
00004b66: 18 46                                          RESTORE %r6
00004b68: 08                                             RET 
00004b69: 70                                             NOP 
00004b6a: 70                                             NOP 
00004b6b: 70                                             NOP 
00004b6c: 84 5a 40                                       MOVW (%ap),%r0
00004b6f: 84 74 42                                       MOVW 4(%ap),%r2
00004b72: c4 02 42 42                                    ARSW3 &0x2,%r2,%r2
00004b76: 80 50                                          CLRW (%r0)
00004b78: 94 42                                          DECW %r2
00004b7a: 4f 08                                          BLEB &0x8 <0x4b82>
00004b7c: 04 c0 04 41                                    MOVAW 4(%r0),%r1
00004b80: 30 19                                          MOVBLW 
00004b82: 08                                             RET 
00004b83: 70                                             NOP 
00004b84: 84 5a 40                                       MOVW (%ap),%r0
00004b87: 28 40                                          TSTW %r0
00004b89: 77 09                                          BNEB &0x9 <0x4b92>
00004b8b: 04 7f 54 12 00 02 40                           MOVAW $0x2001254,%r0
00004b92: 84 43 50                                       MOVW %r3,(%r0)
00004b95: 84 44 c0 04                                    MOVW %r4,4(%r0)
00004b99: 84 45 c0 08                                    MOVW %r5,8(%r0)
00004b9d: 84 46 c0 0c                                    MOVW %r6,12(%r0)
00004ba1: 84 47 c0 10                                    MOVW %r7,16(%r0)
00004ba5: 84 48 c0 14                                    MOVW %r8,20(%r0)
00004ba9: 84 cc fc c0 18                                 MOVW -4(%sp),24(%r0)
00004bae: 84 cc f8 c0 1c                                 MOVW -8(%sp),28(%r0)
00004bb3: 84 4a c0 20                                    MOVW %ap,32(%r0)
00004bb7: 84 49 c0 24                                    MOVW %fp,36(%r0)
00004bbb: 84 cd 0c c0 28                                 MOVW 12(%pcbp),40(%r0)
00004bc0: 84 cd 10 c0 2c                                 MOVW 16(%pcbp),44(%r0)
00004bc5: 80 40                                          CLRW %r0
00004bc7: 08                                             RET 
00004bc8: 84 5a 40                                       MOVW (%ap),%r0
00004bcb: 28 40                                          TSTW %r0
00004bcd: 77 09                                          BNEB &0x9 <0x4bd6>
00004bcf: 04 7f 54 12 00 02 40                           MOVAW $0x2001254,%r0
00004bd6: 84 50 43                                       MOVW (%r0),%r3
00004bd9: 84 c0 04 44                                    MOVW 4(%r0),%r4
00004bdd: 84 c0 08 45                                    MOVW 8(%r0),%r5
00004be1: 84 c0 0c 46                                    MOVW 12(%r0),%r6
00004be5: 84 c0 10 47                                    MOVW 16(%r0),%r7
00004be9: 84 c0 14 48                                    MOVW 20(%r0),%r8
00004bed: 84 c0 18 4a                                    MOVW 24(%r0),%ap
00004bf1: 84 c0 1c 41                                    MOVW 28(%r0),%r1
00004bf5: 84 c0 20 4c                                    MOVW 32(%r0),%sp
00004bf9: 84 c0 24 49                                    MOVW 36(%r0),%fp
00004bfd: 84 c0 28 cd 0c                                 MOVW 40(%r0),12(%pcbp)
00004c02: 84 c0 2c cd 10                                 MOVW 44(%r0),16(%pcbp)
00004c07: 80 40                                          CLRW %r0
00004c09: 90 40                                          INCW %r0
00004c0b: 24 51                                          JMP (%r1)
00004c0d: 70                                             NOP 
00004c0e: 70                                             NOP 
00004c0f: 70                                             NOP 
00004c10: 10 49                                          SAVE %fp
00004c12: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
00004c19: 87 01 7f 84 12 00 02                           MOVB &0x1,$0x2001284
00004c20: 2c 5c ef 88 12 00 02                           CALL (%sp),*$0x2001288
00004c27: 18 49                                          RESTORE %fp
00004c29: 08                                             RET 
00004c2a: 70                                             NOP 
00004c2b: 70                                             NOP 
00004c2c: 10 49                                          SAVE %fp
00004c2e: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
00004c35: 86 e2 72 e0 40                                 MOVH {uhalf}2(%ap),{uword}%r0
00004c3a: a0 40                                          PUSHW %r0
00004c3c: a0 5f ff 08                                    PUSHW &0x8ff
00004c40: 2c cc f8 af 10 00                              CALL -8(%sp),0x10(%pc)
00004c46: 86 e2 40 e0 40                                 MOVH {uhalf}%r0,{uword}%r0
00004c4b: 7b 02                                          BRB &0x2 <0x4c4d>
00004c4d: 18 49                                          RESTORE %fp
00004c4f: 08                                             RET 
00004c50: 10 49                                          SAVE %fp
00004c52: 9c 4f 04 00 00 00 4c                           ADDW2 &0x4,%sp
00004c59: 83 7f 84 12 00 02                              CLRB $0x2001284
00004c5f: 84 ef 94 04 00 00 7f 88 12 00 02               MOVW *$0x494,$0x2001288
00004c6a: 84 4f 10 4c 00 00 ef 94 04 00 00               MOVW &0x4c10,*$0x494
00004c75: f3 30 7f 4c 12 00 02 40                        ORB3 &0x30,$0x200124c,%r0
00004c7d: 87 40 7f 04 90 04 00                           MOVB %r0,$0x49004
00004c84: 7b 7c                                          BRB &0x7c <0x4d00>
00004c86: 87 7f 0f 90 04 00 59                           MOVB $0x4900f,(%fp)
00004c8d: 86 e2 76 e0 40                                 MOVH {uhalf}6(%ap),{uword}%r0
00004c92: d4 08 40 40                                    LRSW3 &0x8,%r0,%r0
00004c96: 87 40 7f 06 90 04 00                           MOVB %r0,$0x49006
00004c9d: fb 5f ff 00 77 40                              ANDB3 &0xff,7(%ap),%r0
00004ca3: 87 40 7f 07 90 04 00                           MOVB %r0,$0x49007
00004caa: 87 7f 0e 90 04 00 59                           MOVB $0x4900e,(%fp)
00004cb1: 7b 42                                          BRB &0x42 <0x4cf3>
00004cb3: 2b ef 10 05 00 00                              TSTB *$0x510
00004cb9: 77 19                                          BNEB &0x19 <0x4cd2>
00004cbb: 38 7f 00 40 04 00 02                           BITW $0x44000,&0x2
00004cc2: 7f 10                                          BEB &0x10 <0x4cd2>
00004cc4: 80 ef 8c 04 00 00                              CLRW *$0x48c
00004cca: 80 7f 44 40 04 00                              CLRW $0x44044
00004cd0: 7b 00                                          BRB &0x0 <0x4cd0>
00004cd2: 2b 7f 84 12 00 02                              TSTB $0x2001284
00004cd8: 7f 1b                                          BEB &0x1b <0x4cf3>
00004cda: 87 7f 0f 90 04 00 59                           MOVB $0x4900f,(%fp)
00004ce1: 84 7f 88 12 00 02 ef 94 04 00 00               MOVW $0x2001288,*$0x494
00004cec: 86 e2 72 e0 40                                 MOVH {uhalf}2(%ap),{uword}%r0
00004cf1: 7b 32                                          BRB &0x32 <0x4d23>
00004cf3: fb 08 7f 05 90 04 00 40                        ANDB3 &0x8,$0x49005,%r0
00004cfb: 3c 08 40                                       CMPW &0x8,%r0
00004cfe: 77 b5                                          BNEB &0xb5 <0x4cb3>
00004d00: 86 72 40                                       MOVH 2(%ap),%r0
00004d03: 96 72                                          DECH 2(%ap)
00004d05: 86 e2 40 e0 40                                 MOVH {uhalf}%r0,{uword}%r0
00004d0a: 76 7c ff                                       BNEH &0xff7c <0x4c86>
00004d0d: 87 7f 0f 90 04 00 59                           MOVB $0x4900f,(%fp)
00004d14: 84 7f 88 12 00 02 ef 94 04 00 00               MOVW $0x2001288,*$0x494
00004d1f: 80 40                                          CLRW %r0
00004d21: 7b 02                                          BRB &0x2 <0x4d23>
00004d23: 18 49                                          RESTORE %fp
00004d25: 08                                             RET 
00004d26: 70                                             NOP 
00004d27: 70                                             NOP 
00004d28: 10 49                                          SAVE %fp
00004d2a: 9c 4f 08 00 00 00 4c                           ADDW2 &0x8,%sp
00004d31: 28 5a                                          TSTW (%ap)
00004d33: 77 0a                                          BNEB &0xa <0x4d3d>
00004d35: 80 40                                          CLRW %r0
00004d37: 24 7f c3 4e 00 00                              JMP $0x4ec3
00004d3d: 83 65                                          CLRB 5(%fp)
00004d3f: d4 04 5a 40                                    LRSW3 &0x4,(%ap),%r0
00004d43: 87 40 66                                       MOVB %r0,6(%fp)
00004d46: 87 66 e0 40                                    MOVB 6(%fp),{uword}%r0
00004d4a: 3f 0d 40                                       CMPB &0xd,%r0
00004d4d: 77 0e                                          BNEB &0xe <0x4d5b>
00004d4f: 87 03 65                                       MOVB &0x3,5(%fp)
00004d52: fb 0f 73 40                                    ANDB3 &0xf,3(%ap),%r0
00004d56: 87 40 66                                       MOVB %r0,6(%fp)
00004d59: 7b 09                                          BRB &0x9 <0x4d62>
00004d5b: 2b 66                                          TSTB 6(%fp)
00004d5d: 77 05                                          BNEB &0x5 <0x4d62>
00004d5f: 87 73 66                                       MOVB 3(%ap),6(%fp)
00004d62: 83 64                                          CLRB 4(%fp)
00004d64: 84 ef 94 04 00 00 7f a4 12 00 02               MOVW *$0x494,$0x20012a4
00004d6f: 84 4f 26 51 00 00 ef 94 04 00 00               MOVW &0x5126,*$0x494
00004d7a: 70                                             NOP 
00004d7b: cc 03 0d 4b 7f a0 12 00 02                     EXTFW &0x3,&0xd,%psw,$0x20012a0
00004d84: c8 03 0d 0f 4b                                 INSFW &0x3,&0xd,&0xf,%psw
00004d89: 70                                             NOP 
00004d8a: 84 4f 94 12 00 02 7f 00 00 00 02               MOVW &0x2001294,$0x2000000
00004d95: 84 4f f4 37 00 02 7f 94 12 00 02               MOVW &0x20037f4,$0x2001294
00004da0: 84 4f ec 37 00 02 7f 98 12 00 02               MOVW &0x20037ec,$0x2001298
00004dab: 87 02 7f 9c 12 00 02                           MOVB &0x2,$0x200129c
00004db2: 87 02 7f 9d 12 00 02                           MOVB &0x2,$0x200129d
00004db9: 87 0c 7f 9e 12 00 02                           MOVB &0xc,$0x200129e
00004dc0: 87 01 7f 9f 12 00 02                           MOVB &0x1,$0x200129f
00004dc7: a0 4f ec 37 00 02                              PUSHW &0x20037ec
00004dcd: a0 5f 14 08                                    PUSHW &0x814
00004dd1: 2c cc f8 ef 18 05 00 00                        CALL -8(%sp),*$0x518
00004dd9: a0 14                                          PUSHW &0x14
00004ddb: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
00004de3: 2b 65                                          TSTB 5(%fp)
00004de5: 77 13                                          BNEB &0x13 <0x4df8>
00004de7: ff 01 66 40                                    SUBB3 &0x1,6(%fp),%r0
00004deb: d0 15 40 40                                    LLSW3 &0x15,%r0,%r0
00004def: 87 01 80 05 00 20 00                           MOVB &0x1,0x200005(%r0)
00004df6: 7b 11                                          BRB &0x11 <0x4e07>
00004df8: 87 66 e0 40                                    MOVB 6(%fp),{uword}%r0
00004dfc: d0 1a 40 40                                    LLSW3 &0x1a,%r0,%r0
00004e00: 87 01 80 03 00 01 06                           MOVB &0x1,0x6010003(%r0)
00004e07: a0 14                                          PUSHW &0x14
00004e09: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
00004e11: 2b 65                                          TSTB 5(%fp)
00004e13: 77 1c                                          BNEB &0x1c <0x4e2f>
00004e15: ff 01 66 40                                    SUBB3 &0x1,6(%fp),%r0
00004e19: d0 15 40 40                                    LLSW3 &0x15,%r0,%r0
00004e1d: 87 80 01 00 20 00 e0 59                        MOVB 0x200001(%r0),{uword}(%fp)
00004e25: a0 14                                          PUSHW &0x14
00004e27: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
00004e2f: 2b 65                                          TSTB 5(%fp)
00004e31: 77 14                                          BNEB &0x14 <0x4e45>
00004e33: ff 01 66 40                                    SUBB3 &0x1,6(%fp),%r0
00004e37: d0 15 40 40                                    LLSW3 &0x15,%r0,%r0
00004e3b: 87 80 03 00 20 00 e0 59                        MOVB 0x200003(%r0),{uword}(%fp)
00004e43: 7b 11                                          BRB &0x11 <0x4e54>
00004e45: 87 66 e0 40                                    MOVB 6(%fp),{uword}%r0
00004e49: d0 1a 40 40                                    LLSW3 &0x1a,%r0,%r0
00004e4d: 87 01 80 37 00 01 06                           MOVB &0x1,0x6010037(%r0)
00004e54: 80 59                                          CLRW (%fp)
00004e56: 7b 1c                                          BRB &0x1c <0x4e72>
00004e58: 3f 03 7f ef 37 00 02                           CMPB &0x3,$0x20037ef
00004e5f: 77 07                                          BNEB &0x7 <0x4e66>
00004e61: 87 01 64                                       MOVB &0x1,4(%fp)
00004e64: 7b 14                                          BRB &0x14 <0x4e78>
00004e66: a0 01                                          PUSHW &0x1
00004e68: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
00004e70: 90 59                                          INCW (%fp)
00004e72: 3c 6f 64 59                                    CMPW &0x64,(%fp)
00004e76: 5b e2                                          BLUB &0xe2 <0x4e58>
00004e78: 3c 6f 64 59                                    CMPW &0x64,(%fp)
00004e7c: 5b 36                                          BLUB &0x36 <0x4eb2>
00004e7e: 2b 65                                          TSTB 5(%fp)
00004e80: 77 13                                          BNEB &0x13 <0x4e93>
00004e82: ff 01 66 40                                    SUBB3 &0x1,6(%fp),%r0
00004e86: d0 15 40 40                                    LLSW3 &0x15,%r0,%r0
00004e8a: 87 01 80 05 00 20 00                           MOVB &0x1,0x200005(%r0)
00004e91: 7b 11                                          BRB &0x11 <0x4ea2>
00004e93: 87 66 e0 40                                    MOVB 6(%fp),{uword}%r0
00004e97: d0 1a 40 40                                    LLSW3 &0x1a,%r0,%r0
00004e9b: 87 01 80 03 00 01 06                           MOVB &0x1,0x6010003(%r0)
00004ea2: a0 14                                          PUSHW &0x14
00004ea4: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
00004eac: 87 64 e0 40                                    MOVB 4(%fp),{uword}%r0
00004eb0: 7b 13                                          BRB &0x13 <0x4ec3>
00004eb2: 2c 5c af 2e 03                                 CALL (%sp),0x32e(%pc)
00004eb7: 28 40                                          TSTW %r0
00004eb9: 77 04                                          BNEB &0x4 <0x4ebd>
00004ebb: 83 64                                          CLRB 4(%fp)
00004ebd: 87 64 e0 40                                    MOVB 4(%fp),{uword}%r0
00004ec1: 7b 02                                          BRB &0x2 <0x4ec3>
00004ec3: 18 49                                          RESTORE %fp
00004ec5: 08                                             RET 
00004ec6: 70                                             NOP 
00004ec7: 70                                             NOP 
00004ec8: 10 49                                          SAVE %fp
00004eca: 9c 4f 08 00 00 00 4c                           ADDW2 &0x8,%sp
00004ed1: 87 73 e0 40                                    MOVB 3(%ap),{uword}%r0
00004ed5: d0 04 40 40                                    LLSW3 &0x4,%r0,%r0
00004ed9: 87 77 e0 41                                    MOVB 7(%ap),{uword}%r1
00004edd: b0 41 40                                       ORW2 %r1,%r0
00004ee0: a0 40                                          PUSHW %r0
00004ee2: 2c cc fc af 46 fe                              CALL -4(%sp),0x..fe46(%pc)
00004ee8: 28 40                                          TSTW %r0
00004eea: 77 0a                                          BNEB &0xa <0x4ef4>
00004eec: 80 40                                          CLRW %r0
00004eee: 24 7f a1 4f 00 00                              JMP $0x4fa1
00004ef4: 84 ef 94 04 00 00 7f a4 12 00 02               MOVW *$0x494,$0x20012a4
00004eff: 84 4f 26 51 00 00 ef 94 04 00 00               MOVW &0x5126,*$0x494
00004f0a: 70                                             NOP 
00004f0b: cc 03 0d 4b 7f a0 12 00 02                     EXTFW &0x3,&0xd,%psw,$0x20012a0
00004f14: c8 03 0d 0f 4b                                 INSFW &0x3,&0xd,&0xf,%psw
00004f19: 70                                             NOP 
00004f1a: 87 0a 7f f7 37 00 02                           MOVB &0xa,$0x20037f7
00004f21: 87 77 7f f6 37 00 02                           MOVB 7(%ap),$0x20037f6
00004f28: 87 5f ff 00 7f ef 37 00 02                     MOVB &0xff,$0x20037ef
00004f31: 3f 0d 73                                       CMPB &0xd,3(%ap)
00004f34: 77 13                                          BNEB &0x13 <0x4f47>
00004f36: 87 77 e0 40                                    MOVB 7(%ap),{uword}%r0
00004f3a: d0 1a 40 40                                    LLSW3 &0x1a,%r0,%r0
00004f3e: 87 01 80 37 00 01 06                           MOVB &0x1,0x6010037(%r0)
00004f45: 7b 12                                          BRB &0x12 <0x4f57>
00004f47: ff 01 73 40                                    SUBB3 &0x1,3(%ap),%r0
00004f4b: d0 15 40 40                                    LLSW3 &0x15,%r0,%r0
00004f4f: 87 80 01 00 20 00 e0 64                        MOVB 0x200001(%r0),{uword}4(%fp)
00004f57: 80 64                                          CLRW 4(%fp)
00004f59: 7b 2e                                          BRB &0x2e <0x4f87>
00004f5b: a0 01                                          PUSHW &0x1
00004f5d: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
00004f65: 3f 5f ff 00 7f ef 37 00 02                     CMPB &0xff,$0x20037ef
00004f6e: 7f 17                                          BEB &0x17 <0x4f85>
00004f70: 2b 7f ef 37 00 02                              TSTB $0x20037ef
00004f76: 77 0b                                          BNEB &0xb <0x4f81>
00004f78: 84 7f f0 37 00 02 59                           MOVW $0x20037f0,(%fp)
00004f7f: 7b 0f                                          BRB &0xf <0x4f8e>
00004f81: 80 59                                          CLRW (%fp)
00004f83: 7b 0b                                          BRB &0xb <0x4f8e>
00004f85: 90 64                                          INCW 4(%fp)
00004f87: 3c 5f 30 75 64                                 CMPW &0x7530,4(%fp)
00004f8c: 4b cf                                          BLB &0xcf <0x4f5b>
00004f8e: 2c 5c af 52 02                                 CALL (%sp),0x252(%pc)
00004f93: 3c 01 40                                       CMPW &0x1,%r0
00004f96: 77 07                                          BNEB &0x7 <0x4f9d>
00004f98: 84 59 40                                       MOVW (%fp),%r0
00004f9b: 7b 06                                          BRB &0x6 <0x4fa1>
00004f9d: 80 40                                          CLRW %r0
00004f9f: 7b 02                                          BRB &0x2 <0x4fa1>
00004fa1: 18 49                                          RESTORE %fp
00004fa3: 08                                             RET 
00004fa4: 10 49                                          SAVE %fp
00004fa6: 9c 4f 08 00 00 00 4c                           ADDW2 &0x8,%sp
00004fad: 70                                             NOP 
00004fae: cc 03 0d 4b 7f a0 12 00 02                     EXTFW &0x3,&0xd,%psw,$0x20012a0
00004fb7: c8 03 0d 0f 4b                                 INSFW &0x3,&0xd,&0xf,%psw
00004fbc: 70                                             NOP 
00004fbd: 84 ef 94 04 00 00 7f a4 12 00 02               MOVW *$0x494,$0x20012a4
00004fc8: 84 4f 26 51 00 00 ef 94 04 00 00               MOVW &0x5126,*$0x494
00004fd3: 83 59                                          CLRB (%fp)
00004fd5: 84 74 7f 8c 12 00 02                           MOVW 4(%ap),$0x200128c
00004fdc: 84 78 7f 90 12 00 02                           MOVW 8(%ap),$0x2001290
00004fe3: 3f 01 ca 0f                                    CMPB &0x1,15(%ap)
00004fe7: 77 0b                                          BNEB &0xb <0x4ff2>
00004fe9: 87 0c 7f f7 37 00 02                           MOVB &0xc,$0x20037f7
00004ff0: 7b 2d                                          BRB &0x2d <0x501d>
00004ff2: 2b ca 0f                                       TSTB 15(%ap)
00004ff5: 77 0b                                          BNEB &0xb <0x5000>
00004ff7: 87 0b 7f f7 37 00 02                           MOVB &0xb,$0x20037f7
00004ffe: 7b 1f                                          BRB &0x1f <0x501d>
00005000: 84 7f a4 12 00 02 ef 94 04 00 00               MOVW $0x20012a4,*$0x494
0000500b: c8 03 0d 7f a0 12 00 02 4b                     INSFW &0x3,&0xd,$0x20012a0,%psw
00005014: 70                                             NOP 
00005015: 80 40                                          CLRW %r0
00005017: 24 7f 21 51 00 00                              JMP $0x5121
0000501d: 2b 73                                          TSTB 3(%ap)
0000501f: 77 1f                                          BNEB &0x1f <0x503e>
00005021: 84 7f a4 12 00 02 ef 94 04 00 00               MOVW $0x20012a4,*$0x494
0000502c: c8 03 0d 7f a0 12 00 02 4b                     INSFW &0x3,&0xd,$0x20012a0,%psw
00005035: 70                                             NOP 
00005036: 80 40                                          CLRW %r0
00005038: 24 7f 21 51 00 00                              JMP $0x5121
0000503e: 83 63                                          CLRB 3(%fp)
00005040: 87 73 e0 40                                    MOVB 3(%ap),{uword}%r0
00005044: d4 04 40 40                                    LRSW3 &0x4,%r0,%r0
00005048: 87 40 62                                       MOVB %r0,2(%fp)
0000504b: 87 62 e0 40                                    MOVB 2(%fp),{uword}%r0
0000504f: 3f 0d 40                                       CMPB &0xd,%r0
00005052: 77 0c                                          BNEB &0xc <0x505e>
00005054: 87 03 63                                       MOVB &0x3,3(%fp)
00005057: fb 0f 73 40                                    ANDB3 &0xf,3(%ap),%r0
0000505b: 87 40 62                                       MOVB %r0,2(%fp)
0000505e: fb 0f 73 40                                    ANDB3 &0xf,3(%ap),%r0
00005062: 87 40 61                                       MOVB %r0,1(%fp)
00005065: 87 61 7f f6 37 00 02                           MOVB 1(%fp),$0x20037f6
0000506c: 84 4f 8c 12 00 02 7f f8 37 00 02               MOVW &0x200128c,$0x20037f8
00005077: 87 5f ff 00 7f ef 37 00 02                     MOVB &0xff,$0x20037ef
00005080: 2b 63                                          TSTB 3(%fp)
00005082: 77 14                                          BNEB &0x14 <0x5096>
00005084: ff 01 62 40                                    SUBB3 &0x1,2(%fp),%r0
00005088: d0 15 40 40                                    LLSW3 &0x15,%r0,%r0
0000508c: 87 80 01 00 20 00 e0 64                        MOVB 0x200001(%r0),{uword}4(%fp)
00005094: 7b 11                                          BRB &0x11 <0x50a5>
00005096: 87 61 e0 40                                    MOVB 1(%fp),{uword}%r0
0000509a: d0 1a 40 40                                    LLSW3 &0x1a,%r0,%r0
0000509e: 87 01 80 37 00 01 06                           MOVB &0x1,0x6010037(%r0)
000050a5: 80 64                                          CLRW 4(%fp)
000050a7: 7b 2a                                          BRB &0x2a <0x50d1>
000050a9: a0 01                                          PUSHW &0x1
000050ab: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
000050b3: 3f 5f ff 00 7f ef 37 00 02                     CMPB &0xff,$0x20037ef
000050bc: 7f 13                                          BEB &0x13 <0x50cf>
000050be: 2b 7f ef 37 00 02                              TSTB $0x20037ef
000050c4: 77 07                                          BNEB &0x7 <0x50cb>
000050c6: 87 01 59                                       MOVB &0x1,(%fp)
000050c9: 7b 0f                                          BRB &0xf <0x50d8>
000050cb: 83 59                                          CLRB (%fp)
000050cd: 7b 0b                                          BRB &0xb <0x50d8>
000050cf: 90 64                                          INCW 4(%fp)
000050d1: 3c 5f 28 23 64                                 CMPW &0x2328,4(%fp)
000050d6: 4b d3                                          BLB &0xd3 <0x50a9>
000050d8: 2c 5c af 08 01                                 CALL (%sp),0x108(%pc)
000050dd: 28 40                                          TSTW %r0
000050df: 7f 06                                          BEB &0x6 <0x50e5>
000050e1: 2b 59                                          TSTB (%fp)
000050e3: 77 39                                          BNEB &0x39 <0x511c>
000050e5: a0 4f 18 0e 00 00                              PUSHW &0xe18
000050eb: 2b ca 0f                                       TSTB 15(%ap)
000050ee: 77 0b                                          BNEB &0xb <0x50f9>
000050f0: 84 4f 54 0e 00 00 40                           MOVW &0xe54,%r0
000050f7: 7b 09                                          BRB &0x9 <0x5100>
000050f9: 84 4f 59 0e 00 00 40                           MOVW &0xe59,%r0
00005100: a0 40                                          PUSHW %r0
00005102: a0 74                                          PUSHW 4(%ap)
00005104: 87 61 e0 40                                    MOVB 1(%fp),{uword}%r0
00005108: a0 40                                          PUSHW %r0
0000510a: 87 62 e0 40                                    MOVB 2(%fp),{uword}%r0
0000510e: a0 40                                          PUSHW %r0
00005110: 2c cc ec 7f b4 3b 00 00                        CALL -20(%sp),$0x3bb4
00005118: 80 40                                          CLRW %r0
0000511a: 7b 07                                          BRB &0x7 <0x5121>
0000511c: 84 01 40                                       MOVW &0x1,%r0
0000511f: 7b 02                                          BRB &0x2 <0x5121>
00005121: 18 49                                          RESTORE %fp
00005123: 08                                             RET 
00005124: 70                                             NOP 
00005125: 70                                             NOP 
00005126: 10 49                                          SAVE %fp
00005128: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
0000512f: 2b ef 10 05 00 00                              TSTB *$0x510
00005135: 77 19                                          BNEB &0x19 <0x514e>
00005137: 38 7f 00 40 04 00 02                           BITW $0x44000,&0x2
0000513e: 7f 10                                          BEB &0x10 <0x514e>
00005140: 80 ef 8c 04 00 00                              CLRW *$0x48c
00005146: 80 7f 44 40 04 00                              CLRW $0x44044
0000514c: 7b 00                                          BRB &0x0 <0x514c>
0000514e: 38 7f 00 40 04 00 01                           BITW $0x44000,&0x1
00005155: 77 3b                                          BNEB &0x3b <0x5190>
00005157: 38 7f 00 40 04 00 6f 40                        BITW $0x44000,&0x40
0000515f: 77 31                                          BNEB &0x31 <0x5190>
00005161: 38 7f 00 40 04 00 20                           BITW $0x44000,&0x20
00005168: 77 28                                          BNEB &0x28 <0x5190>
0000516a: 38 7f 00 40 04 00 08                           BITW $0x44000,&0x8
00005171: 77 1f                                          BNEB &0x1f <0x5190>
00005173: 38 7f 00 40 04 00 10                           BITW $0x44000,&0x10
0000517a: 77 16                                          BNEB &0x16 <0x5190>
0000517c: 38 7f 00 40 04 00 04                           BITW $0x44000,&0x4
00005183: 77 0d                                          BNEB &0xd <0x5190>
00005185: 38 7f 40 40 04 00 5f 80 00                     BITW $0x44040,&0x80
0000518e: 7f 47                                          BEB &0x47 <0x51d5>
00005190: a0 5f 80 00                                    PUSHW &0x80
00005194: 2c cc fc 7f 6a 56 00 00                        CALL -4(%sp),$0x566a
0000519c: a0 4f 7c 0e 00 00                              PUSHW &0xe7c
000051a2: a0 4f 5f 0e 00 00                              PUSHW &0xe5f
000051a8: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
000051b0: a0 4f 8c 0e 00 00                              PUSHW &0xe8c
000051b6: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
000051be: 2c 5c 7f 7e 53 00 00                           CALL (%sp),$0x537e
000051c5: a0 4f ef be ed fe                              PUSHW &0xfeedbeef
000051cb: 2c cc fc 7f fe 58 00 00                        CALL -4(%sp),$0x58fe
000051d3: 7b 09                                          BRB &0x9 <0x51dc>
000051d5: 84 01 7f a8 12 00 02                           MOVW &0x1,$0x20012a8
000051dc: 18 49                                          RESTORE %fp
000051de: 08                                             RET 
000051df: 70                                             NOP 
000051e0: 10 49                                          SAVE %fp
000051e2: 9c 4f 04 00 00 00 4c                           ADDW2 &0x4,%sp
000051e9: 80 7f a8 12 00 02                              CLRW $0x20012a8
000051ef: 80 59                                          CLRW (%fp)
000051f1: 7b 2a                                          BRB &0x2a <0x521b>
000051f3: c8 03 0d 00 4b                                 INSFW &0x3,&0xd,&0x0,%psw
000051f8: 70                                             NOP 
000051f9: 70                                             NOP 
000051fa: 70                                             NOP 
000051fb: 70                                             NOP 
000051fc: 70                                             NOP 
000051fd: 70                                             NOP 
000051fe: c8 03 0d 0f 4b                                 INSFW &0x3,&0xd,&0xf,%psw
00005203: 70                                             NOP 
00005204: 3c 01 7f a8 12 00 02                           CMPW &0x1,$0x20012a8
0000520b: 77 04                                          BNEB &0x4 <0x520f>
0000520d: 7b 14                                          BRB &0x14 <0x5221>
0000520f: a0 01                                          PUSHW &0x1
00005211: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
00005219: 90 59                                          INCW (%fp)
0000521b: 3c 6f 64 59                                    CMPW &0x64,(%fp)
0000521f: 4b d4                                          BLB &0xd4 <0x51f3>
00005221: 84 7f a4 12 00 02 ef 94 04 00 00               MOVW $0x20012a4,*$0x494
0000522c: c8 03 0d 7f a0 12 00 02 4b                     INSFW &0x3,&0xd,$0x20012a0,%psw
00005235: 70                                             NOP 
00005236: 84 7f a8 12 00 02 40                           MOVW $0x20012a8,%r0
0000523d: 7b 02                                          BRB &0x2 <0x523f>
0000523f: 18 49                                          RESTORE %fp
00005241: 08                                             RET 
00005242: 70                                             NOP 
00005243: 70                                             NOP 
00005244: 10 49                                          SAVE %fp
00005246: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
0000524d: 2c 5c af 31 01                                 CALL (%sp),0x131(%pc)
00005252: 87 01 ef c4 04 00 00                           MOVB &0x1,*$0x4c4
00005259: 38 7f 98 0c 00 02 4f 00 00 00 20               BITW $0x2000c98,&0x20000000
00005264: 7f 24                                          BEB &0x24 <0x5288>
00005266: a0 4f 7c 0e 00 00                              PUSHW &0xe7c
0000526c: a0 4f b0 0e 00 00                              PUSHW &0xeb0
00005272: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
0000527a: a0 4f c9 0e 00 00                              PUSHW &0xec9
00005280: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00005288: 38 7f 98 0c 00 02 4f 00 00 00 40               BITW $0x2000c98,&0x40000000
00005293: 7f 10                                          BEB &0x10 <0x52a3>
00005295: a0 4f 1e 0f 00 00                              PUSHW &0xf1e
0000529b: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
000052a3: 38 7f 98 0c 00 02 01                           BITW $0x2000c98,&0x1
000052aa: 7f 16                                          BEB &0x16 <0x52c0>
000052ac: a0 4f 7c 0e 00 00                              PUSHW &0xe7c
000052b2: a0 4f 4a 0f 00 00                              PUSHW &0xf4a
000052b8: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
000052c0: 38 7f 98 0c 00 02 04                           BITW $0x2000c98,&0x4
000052c7: 7f 16                                          BEB &0x16 <0x52dd>
000052c9: a0 4f 7c 0e 00 00                              PUSHW &0xe7c
000052cf: a0 4f 69 0f 00 00                              PUSHW &0xf69
000052d5: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
000052dd: 38 7f 98 0c 00 02 20                           BITW $0x2000c98,&0x20
000052e4: 7f 16                                          BEB &0x16 <0x52fa>
000052e6: a0 4f 7c 0e 00 00                              PUSHW &0xe7c
000052ec: a0 4f 7a 0f 00 00                              PUSHW &0xf7a
000052f2: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
000052fa: 38 7f 98 0c 00 02 08                           BITW $0x2000c98,&0x8
00005301: 7f 16                                          BEB &0x16 <0x5317>
00005303: a0 4f 7c 0e 00 00                              PUSHW &0xe7c
00005309: a0 4f 98 0f 00 00                              PUSHW &0xf98
0000530f: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
00005317: 28 7f 98 0c 00 02                              TSTW $0x2000c98
0000531d: 7f 23                                          BEB &0x23 <0x5340>
0000531f: 3c 4f 00 00 00 01 7f 98 0c 00 02               CMPW &0x1000000,$0x2000c98
0000532a: 53 16                                          BGEUB &0x16 <0x5340>
0000532c: a0 4f b0 0f 00 00                              PUSHW &0xfb0
00005332: a0 4f 8c 0e 00 00                              PUSHW &0xe8c
00005338: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
00005340: 3c 4f 00 00 00 80 7f 98 0c 00 02               CMPW &0x80000000,$0x2000c98
0000534b: 77 1d                                          BNEB &0x1d <0x5368>
0000534d: 3c 4f ef be ed fe 7f a0 03 00 02               CMPW &0xfeedbeef,$0x20003a0
00005358: 7f 10                                          BEB &0x10 <0x5368>
0000535a: a0 4f b3 0f 00 00                              PUSHW &0xfb3
00005360: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00005368: 80 7f 98 0c 00 02                              CLRW $0x2000c98
0000536e: a0 01                                          PUSHW &0x1
00005370: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
00005378: 18 49                                          RESTORE %fp
0000537a: 08                                             RET 
0000537b: 70                                             NOP 
0000537c: 70                                             NOP 
0000537d: 70                                             NOP 
0000537e: 10 49                                          SAVE %fp
00005380: 9c 4f 04 00 00 00 4c                           ADDW2 &0x4,%sp
00005387: 87 01 7f 0d 80 04 00                           MOVB &0x1,$0x4800d
0000538e: 87 7f 00 a0 04 00 59                           MOVB $0x4a000,(%fp)
00005395: 87 38 7f 0f 10 04 00                           MOVB &0x38,$0x4100f
0000539c: 87 6f 74 7f 0f 10 04 00                        MOVB &0x74,$0x4100f
000053a4: 84 6f 64 7f 00 20 04 00                        MOVW &0x64,$0x42000
000053ac: 80 7f 60 40 04 00                              CLRW $0x44060
000053b2: 80 7f 64 40 04 00                              CLRW $0x44064
000053b8: 80 7f 68 40 04 00                              CLRW $0x44068
000053be: 80 7f 70 40 04 00                              CLRW $0x44070
000053c4: 80 7f 74 40 04 00                              CLRW $0x44074
000053ca: 80 7f 78 40 04 00                              CLRW $0x44078
000053d0: 84 01 7f 44 40 04 00                           MOVW &0x1,$0x44044
000053d7: 80 7f 5c 40 04 00                              CLRW $0x4405c
000053dd: 80 7f 20 40 04 00                              CLRW $0x44020
000053e3: 80 7f 24 40 04 00                              CLRW $0x44024
000053e9: 84 01 7f 2c 40 04 00                           MOVW &0x1,$0x4402c
000053f0: 80 7f 30 40 04 00                              CLRW $0x44030
000053f6: 80 7f 34 40 04 00                              CLRW $0x44034
000053fc: 84 01 7f 38 40 04 00                           MOVW &0x1,$0x44038
00005403: 80 7f 3c 40 04 00                              CLRW $0x4403c
00005409: 80 7f 28 40 04 00                              CLRW $0x44028
0000540f: 80 7f 6c 40 04 00                              CLRW $0x4406c
00005415: 80 7f 00 40 04 00                              CLRW $0x44000
0000541b: 80 7f 04 40 04 00                              CLRW $0x44004
00005421: 80 7f 08 40 04 00                              CLRW $0x44008
00005427: 80 7f 0c 40 04 00                              CLRW $0x4400c
0000542d: 80 7f 10 40 04 00                              CLRW $0x44010
00005433: 80 7f 14 40 04 00                              CLRW $0x44014
00005439: 80 7f 18 40 04 00                              CLRW $0x44018
0000543f: 84 01 7f 1c 40 04 00                           MOVW &0x1,$0x4401c
00005446: 18 49                                          RESTORE %fp
00005448: 08                                             RET 
00005449: 70                                             NOP 
0000544a: 10 49                                          SAVE %fp
0000544c: 9c 4f 1c 00 00 00 4c                           ADDW2 &0x1c,%sp
00005453: a0 4f df 33 04 00                              PUSHW &0x433df
00005459: 04 59 40                                       MOVAW (%fp),%r0
0000545c: a0 40                                          PUSHW %r0
0000545e: a0 04                                          PUSHW &0x4
00005460: 2c cc f4 7f 2c 49 00 00                        CALL -12(%sp),$0x492c
00005468: 3c 4f ef be 0d 60 59                           CMPW &0x600dbeef,(%fp)
0000546f: 7f 08                                          BEB &0x8 <0x5477>
00005471: 24 7f af 55 00 00                              JMP $0x55af
00005477: a0 4f e3 33 04 00                              PUSHW &0x433e3
0000547d: 04 59 40                                       MOVAW (%fp),%r0
00005480: a0 40                                          PUSHW %r0
00005482: a0 04                                          PUSHW &0x4
00005484: 2c cc f4 7f 2c 49 00 00                        CALL -12(%sp),$0x492c
0000548c: 28 59                                          TSTW (%fp)
0000548e: 77 16                                          BNEB &0x16 <0x54a4>
00005490: a0 4f c1 0f 00 00                              PUSHW &0xfc1
00005496: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
0000549e: 24 7f 67 56 00 00                              JMP $0x5667
000054a4: 38 59 5f 00 04                                 BITW (%fp),&0x400
000054a9: 7f 16                                          BEB &0x16 <0x54bf>
000054ab: a0 4f c9 0f 00 00                              PUSHW &0xfc9
000054b1: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
000054b9: 24 7f ad 55 00 00                              JMP $0x55ad
000054bf: a0 4f e7 33 04 00                              PUSHW &0x433e7
000054c5: 04 68 40                                       MOVAW 8(%fp),%r0
000054c8: a0 40                                          PUSHW %r0
000054ca: a0 04                                          PUSHW &0x4
000054cc: 2c cc f4 7f 2c 49 00 00                        CALL -12(%sp),$0x492c
000054d4: a0 4f eb 33 04 00                              PUSHW &0x433eb
000054da: 04 64 40                                       MOVAW 4(%fp),%r0
000054dd: a0 40                                          PUSHW %r0
000054df: a0 04                                          PUSHW &0x4
000054e1: 2c cc f4 7f 2c 49 00 00                        CALL -12(%sp),$0x492c
000054e9: a0 4f f3 33 04 00                              PUSHW &0x433f3
000054ef: 04 6c 40                                       MOVAW 12(%fp),%r0
000054f2: a0 40                                          PUSHW %r0
000054f4: a0 04                                          PUSHW &0x4
000054f6: 2c cc f4 7f 2c 49 00 00                        CALL -12(%sp),$0x492c
000054fe: a0 4f f7 33 04 00                              PUSHW &0x433f7
00005504: 04 c9 10 40                                    MOVAW 16(%fp),%r0
00005508: a0 40                                          PUSHW %r0
0000550a: a0 04                                          PUSHW &0x4
0000550c: 2c cc f4 7f 2c 49 00 00                        CALL -12(%sp),$0x492c
00005514: a0 4f fb 33 04 00                              PUSHW &0x433fb
0000551a: 04 c9 14 40                                    MOVAW 20(%fp),%r0
0000551e: a0 40                                          PUSHW %r0
00005520: a0 04                                          PUSHW &0x4
00005522: 2c cc f4 7f 2c 49 00 00                        CALL -12(%sp),$0x492c
0000552a: a0 4f ef 33 04 00                              PUSHW &0x433ef
00005530: 04 c9 18 40                                    MOVAW 24(%fp),%r0
00005534: a0 40                                          PUSHW %r0
00005536: a0 04                                          PUSHW &0x4
00005538: 2c cc f4 7f 2c 49 00 00                        CALL -12(%sp),$0x492c
00005540: 38 59 5f 80 00                                 BITW (%fp),&0x80
00005545: 7f 15                                          BEB &0x15 <0x555a>
00005547: a0 4f dc 0f 00 00                              PUSHW &0xfdc
0000554d: a0 c9 18                                       PUSHW 24(%fp)
00005550: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
00005558: 7b 2d                                          BRB &0x2d <0x5585>
0000555a: 38 59 6f 40                                    BITW (%fp),&0x40
0000555e: 7f 12                                          BEB &0x12 <0x5570>
00005560: a0 4f f3 0f 00 00                              PUSHW &0xff3
00005566: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
0000556e: 7b 17                                          BRB &0x17 <0x5585>
00005570: 38 59 5f 00 01                                 BITW (%fp),&0x100
00005575: 7f 10                                          BEB &0x10 <0x5585>
00005577: a0 4f ff 0f 00 00                              PUSHW &0xfff
0000557d: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00005585: a0 4f 07 10 00 00                              PUSHW &0x1007
0000558b: a0 64                                          PUSHW 4(%fp)
0000558d: a0 68                                          PUSHW 8(%fp)
0000558f: a0 6c                                          PUSHW 12(%fp)
00005591: 2c cc f0 7f b4 3b 00 00                        CALL -16(%sp),$0x3bb4
00005599: a0 4f 2f 10 00 00                              PUSHW &0x102f
0000559f: a0 c9 10                                       PUSHW 16(%fp)
000055a2: a0 c9 14                                       PUSHW 20(%fp)
000055a5: 2c cc f4 7f b4 3b 00 00                        CALL -12(%sp),$0x3bb4
000055ad: 7b 10                                          BRB &0x10 <0x55bd>
000055af: a0 4f 4b 10 00 00                              PUSHW &0x104b
000055b5: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
000055bd: 80 59                                          CLRW (%fp)
000055bf: 04 59 40                                       MOVAW (%fp),%r0
000055c2: a0 40                                          PUSHW %r0
000055c4: a0 4f e3 33 04 00                              PUSHW &0x433e3
000055ca: a0 04                                          PUSHW &0x4
000055cc: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
000055d4: 04 59 40                                       MOVAW (%fp),%r0
000055d7: a0 40                                          PUSHW %r0
000055d9: a0 4f e7 33 04 00                              PUSHW &0x433e7
000055df: a0 04                                          PUSHW &0x4
000055e1: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
000055e9: 04 59 40                                       MOVAW (%fp),%r0
000055ec: a0 40                                          PUSHW %r0
000055ee: a0 4f eb 33 04 00                              PUSHW &0x433eb
000055f4: a0 04                                          PUSHW &0x4
000055f6: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
000055fe: 04 59 40                                       MOVAW (%fp),%r0
00005601: a0 40                                          PUSHW %r0
00005603: a0 4f f3 33 04 00                              PUSHW &0x433f3
00005609: a0 04                                          PUSHW &0x4
0000560b: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
00005613: 04 59 40                                       MOVAW (%fp),%r0
00005616: a0 40                                          PUSHW %r0
00005618: a0 4f f7 33 04 00                              PUSHW &0x433f7
0000561e: a0 04                                          PUSHW &0x4
00005620: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
00005628: 04 59 40                                       MOVAW (%fp),%r0
0000562b: a0 40                                          PUSHW %r0
0000562d: a0 4f fb 33 04 00                              PUSHW &0x433fb
00005633: a0 04                                          PUSHW &0x4
00005635: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
0000563d: 04 59 40                                       MOVAW (%fp),%r0
00005640: a0 40                                          PUSHW %r0
00005642: a0 4f ef 33 04 00                              PUSHW &0x433ef
00005648: a0 04                                          PUSHW &0x4
0000564a: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
00005652: 04 59 40                                       MOVAW (%fp),%r0
00005655: a0 40                                          PUSHW %r0
00005657: a0 4f df 33 04 00                              PUSHW &0x433df
0000565d: a0 04                                          PUSHW &0x4
0000565f: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
00005667: 18 49                                          RESTORE %fp
00005669: 08                                             RET 
0000566a: 10 49                                          SAVE %fp
0000566c: 9c 4f 04 00 00 00 4c                           ADDW2 &0x4,%sp
00005673: 84 5a 7f 98 0c 00 02                           MOVW (%ap),$0x2000c98
0000567a: a0 4f 98 0c 00 02                              PUSHW &0x2000c98
00005680: a0 4f e3 33 04 00                              PUSHW &0x433e3
00005686: a0 04                                          PUSHW &0x4
00005688: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
00005690: 3c 5f 00 04 5a                                 CMPW &0x400,(%ap)
00005695: 77 08                                          BNEB &0x8 <0x569d>
00005697: 24 7f dc 58 00 00                              JMP $0x58dc
0000569d: a0 4f 10 04 00 02                              PUSHW &0x2000410
000056a3: a0 4f e7 33 04 00                              PUSHW &0x433e7
000056a9: a0 04                                          PUSHW &0x4
000056ab: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
000056b3: a0 4f 14 04 00 02                              PUSHW &0x2000414
000056b9: a0 4f eb 33 04 00                              PUSHW &0x433eb
000056bf: a0 04                                          PUSHW &0x4
000056c1: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
000056c9: 87 7f 63 40 04 00 e0 40                        MOVB $0x44063,{uword}%r0
000056d1: d0 18 40 40                                    LLSW3 &0x18,%r0,%r0
000056d5: 87 7f 43 40 04 00 e0 41                        MOVB $0x44043,{uword}%r1
000056dd: d0 10 41 41                                    LLSW3 &0x10,%r1,%r1
000056e1: b0 41 40                                       ORW2 %r1,%r0
000056e4: 87 7f 23 40 04 00 e0 41                        MOVB $0x44023,{uword}%r1
000056ec: d0 08 41 41                                    LLSW3 &0x8,%r1,%r1
000056f0: b0 41 40                                       ORW2 %r1,%r0
000056f3: 87 7f 03 40 04 00 e0 41                        MOVB $0x44003,{uword}%r1
000056fb: b0 41 40                                       ORW2 %r1,%r0
000056fe: 84 40 59                                       MOVW %r0,(%fp)
00005701: 04 59 40                                       MOVAW (%fp),%r0
00005704: a0 40                                          PUSHW %r0
00005706: a0 4f f3 33 04 00                              PUSHW &0x433f3
0000570c: a0 04                                          PUSHW &0x4
0000570e: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
00005716: 38 7f 60 40 04 00 08                           BITW $0x44060,&0x8
0000571d: 77 08                                          BNEB &0x8 <0x5725>
0000571f: 24 7f b8 58 00 00                              JMP $0x58b8
00005725: 3f 02 7f 94 0c 00 02                           CMPB &0x2,$0x2000c94
0000572c: 77 2c                                          BNEB &0x2c <0x5758>
0000572e: cc 03 0d 7f 00 d0 04 00 40                     EXTFW &0x3,&0xd,$0x4d000,%r0
00005737: 3c 0f 40                                       CMPW &0xf,%r0
0000573a: 7f 55                                          BEB &0x55 <0x578f>
0000573c: cc 03 0d 7f 00 d0 04 00 40                     EXTFW &0x3,&0xd,$0x4d000,%r0
00005745: 3c 0d 40                                       CMPW &0xd,%r0
00005748: 7f 47                                          BEB &0x47 <0x578f>
0000574a: cc 03 0d 7f 00 d0 04 00 40                     EXTFW &0x3,&0xd,$0x4d000,%r0
00005753: 3c 07 40                                       CMPW &0x7,%r0
00005756: 7f 39                                          BEB &0x39 <0x578f>
00005758: 3f 02 7f 94 0c 00 02                           CMPB &0x2,$0x2000c94
0000575f: 77 08                                          BNEB &0x8 <0x5767>
00005761: 24 7f 46 58 00 00                              JMP $0x5846
00005767: cc 00 0f 7f 00 d0 04 00 40                     EXTFW &0x0,&0xf,$0x4d000,%r0
00005770: 3c 01 40                                       CMPW &0x1,%r0
00005773: 7f 08                                          BEB &0x8 <0x577b>
00005775: 24 7f 46 58 00 00                              JMP $0x5846
0000577b: cc 00 0d 7f 00 d0 04 00 40                     EXTFW &0x0,&0xd,$0x4d000,%r0
00005784: 3c 01 40                                       CMPW &0x1,%r0
00005787: 7f 08                                          BEB &0x8 <0x578f>
00005789: 24 7f 46 58 00 00                              JMP $0x5846
0000578f: 38 7f 60 40 04 00 01                           BITW $0x44060,&0x1
00005796: 77 08                                          BNEB &0x8 <0x579e>
00005798: 24 7f 42 58 00 00                              JMP $0x5842
0000579e: 3f 02 7f 94 0c 00 02                           CMPB &0x2,$0x2000c94
000057a5: 77 4c                                          BNEB &0x4c <0x57f1>
000057a7: cc 11 00 7f 00 c0 04 00 40                     EXTFW &0x11,&0x0,$0x4c000,%r0
000057b0: b8 fc 40                                       ANDW2 &-4,%r0
000057b3: 84 40 59                                       MOVW %r0,(%fp)
000057b6: cc 00 12 7f 00 d0 04 00 40                     EXTFW &0x0,&0x12,$0x4d000,%r0
000057bf: 28 40                                          TSTW %r0
000057c1: 7f 07                                          BEB &0x7 <0x57c8>
000057c3: b4 04 59                                       XORW2 &0x4,(%fp)
000057c6: 7b 12                                          BRB &0x12 <0x57d8>
000057c8: cc 00 11 7f 00 d0 04 00 40                     EXTFW &0x0,&0x11,$0x4d000,%r0
000057d1: 28 40                                          TSTW %r0
000057d3: 7f 05                                          BEB &0x5 <0x57d8>
000057d5: bc 04 59                                       SUBW2 &0x4,(%fp)
000057d8: b8 4f ff ff 03 00 59                           ANDW2 &0x3ffff,(%fp)
000057df: cc 05 12 7f 00 c0 04 00 40                     EXTFW &0x5,&0x12,$0x4c000,%r0
000057e8: d0 12 40 40                                    LLSW3 &0x12,%r0,%r0
000057ec: b0 40 59                                       ORW2 %r0,(%fp)
000057ef: 7b 4a                                          BRB &0x4a <0x5839>
000057f1: cc 11 00 7f 00 c0 04 00 40                     EXTFW &0x11,&0x0,$0x4c000,%r0
000057fa: b8 fc 40                                       ANDW2 &-4,%r0
000057fd: 84 40 59                                       MOVW %r0,(%fp)
00005800: cc 00 12 7f 00 d0 04 00 40                     EXTFW &0x0,&0x12,$0x4d000,%r0
00005809: 28 40                                          TSTW %r0
0000580b: 7f 07                                          BEB &0x7 <0x5812>
0000580d: b4 04 59                                       XORW2 &0x4,(%fp)
00005810: 7b 12                                          BRB &0x12 <0x5822>
00005812: cc 00 11 7f 00 d0 04 00 40                     EXTFW &0x0,&0x11,$0x4d000,%r0
0000581b: 28 40                                          TSTW %r0
0000581d: 7f 05                                          BEB &0x5 <0x5822>
0000581f: bc 04 59                                       SUBW2 &0x4,(%fp)
00005822: b8 4f ff ff 03 00 59                           ANDW2 &0x3ffff,(%fp)
00005829: cc 07 12 7f 00 c0 04 00 40                     EXTFW &0x7,&0x12,$0x4c000,%r0
00005832: d0 12 40 40                                    LLSW3 &0x12,%r0,%r0
00005836: b0 40 59                                       ORW2 %r0,(%fp)
00005839: 9c 4f 00 00 00 02 59                           ADDW2 &0x2000000,(%fp)
00005840: 7b 04                                          BRB &0x4 <0x5844>
00005842: 80 59                                          CLRW (%fp)
00005844: 7b 25                                          BRB &0x25 <0x5869>
00005846: 3f 02 7f 94 0c 00 02                           CMPB &0x2,$0x2000c94
0000584d: 77 10                                          BNEB &0x10 <0x585d>
0000584f: cc 17 00 7f 00 c0 04 00 40                     EXTFW &0x17,&0x0,$0x4c000,%r0
00005858: 84 40 59                                       MOVW %r0,(%fp)
0000585b: 7b 0e                                          BRB &0xe <0x5869>
0000585d: cc 19 00 7f 00 c0 04 00 40                     EXTFW &0x19,&0x0,$0x4c000,%r0
00005866: 84 40 59                                       MOVW %r0,(%fp)
00005869: 04 59 40                                       MOVAW (%fp),%r0
0000586c: a0 40                                          PUSHW %r0
0000586e: a0 4f f7 33 04 00                              PUSHW &0x433f7
00005874: a0 04                                          PUSHW &0x4
00005876: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
0000587e: 3f 02 7f 94 0c 00 02                           CMPB &0x2,$0x2000c94
00005885: 77 11                                          BNEB &0x11 <0x5896>
00005887: f8 5f 00 e0 7f 00 d0 04 00 40                  ANDW3 &0xe000,$0x4d000,%r0
00005891: 84 40 59                                       MOVW %r0,(%fp)
00005894: 7b 0f                                          BRB &0xf <0x58a3>
00005896: f8 5f 00 ff 7f 00 d0 04 00 40                  ANDW3 &0xff00,$0x4d000,%r0
000058a0: 84 40 59                                       MOVW %r0,(%fp)
000058a3: 04 59 40                                       MOVAW (%fp),%r0
000058a6: a0 40                                          PUSHW %r0
000058a8: a0 4f fb 33 04 00                              PUSHW &0x433fb
000058ae: a0 04                                          PUSHW &0x4
000058b0: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
000058b8: 38 5a 5f 80 00                                 BITW (%ap),&0x80
000058bd: 7f 1f                                          BEB &0x1f <0x58dc>
000058bf: 87 7f 25 04 00 02 e0 59                        MOVB $0x2000425,{uword}(%fp)
000058c7: 04 59 40                                       MOVAW (%fp),%r0
000058ca: a0 40                                          PUSHW %r0
000058cc: a0 4f ef 33 04 00                              PUSHW &0x433ef
000058d2: a0 04                                          PUSHW &0x4
000058d4: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
000058dc: 84 4f ef be 0d 60 59                           MOVW &0x600dbeef,(%fp)
000058e3: 04 59 40                                       MOVAW (%fp),%r0
000058e6: a0 40                                          PUSHW %r0
000058e8: a0 4f df 33 04 00                              PUSHW &0x433df
000058ee: a0 04                                          PUSHW &0x4
000058f0: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
000058f8: 18 49                                          RESTORE %fp
000058fa: 08                                             RET 
000058fb: 70                                             NOP 
000058fc: 70                                             NOP 
000058fd: 70                                             NOP 
000058fe: 10 49                                          SAVE %fp
00005900: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
00005907: 2b ef 10 05 00 00                              TSTB *$0x510
0000590d: 77 19                                          BNEB &0x19 <0x5926>
0000590f: 38 7f 00 40 04 00 02                           BITW $0x44000,&0x2
00005916: 7f 10                                          BEB &0x10 <0x5926>
00005918: 80 ef 8c 04 00 00                              CLRW *$0x48c
0000591e: 80 7f 44 40 04 00                              CLRW $0x44044
00005924: 7b 00                                          BRB &0x0 <0x5924>
00005926: 84 5a ef 8c 04 00 00                           MOVW (%ap),*$0x48c
0000592d: 84 01 7f 7c 40 04 00                           MOVW &0x1,$0x4407c
00005934: 7b 00                                          BRB &0x0 <0x5934>
00005936: 18 49                                          RESTORE %fp
00005938: 08                                             RET 
00005939: 70                                             NOP 
0000593a: 10 49                                          SAVE %fp
0000593c: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
00005943: 84 4f ef be ed fe ef 8c 04 00 00               MOVW &0xfeedbeef,*$0x48c
0000594e: 2c 5c af f6 f8                                 CALL (%sp),0x..f8f6(%pc)
00005953: 84 01 7f 7c 40 04 00                           MOVW &0x1,$0x4407c
0000595a: 7b 00                                          BRB &0x0 <0x595a>
0000595c: 18 49                                          RESTORE %fp
0000595e: 08                                             RET 
0000595f: 70                                             NOP 
00005960: 70                                             NOP 
00005961: 70                                             NOP 
00005962: 10 49                                          SAVE %fp
00005964: 9c 4f 54 00 00 00 4c                           ADDW2 &0x54,%sp
0000596b: a0 4f 3b 30 04 00                              PUSHW &0x4303b
00005971: 04 59 40                                       MOVAW (%fp),%r0
00005974: a0 40                                          PUSHW %r0
00005976: a0 01                                          PUSHW &0x1
00005978: 2c cc f4 7f 2c 49 00 00                        CALL -12(%sp),$0x492c
00005980: 28 40                                          TSTW %r0
00005982: 77 19                                          BNEB &0x19 <0x599b>
00005984: 83 59                                          CLRB (%fp)
00005986: 04 59 40                                       MOVAW (%fp),%r0
00005989: a0 40                                          PUSHW %r0
0000598b: a0 4f 3b 30 04 00                              PUSHW &0x4303b
00005991: a0 01                                          PUSHW &0x1
00005993: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
0000599b: a0 4f 53 10 00 00                              PUSHW &0x1053
000059a1: 2b 59                                          TSTB (%fp)
000059a3: 7f 0b                                          BEB &0xb <0x59ae>
000059a5: 84 4f 84 10 00 00 40                           MOVW &0x1084,%r0
000059ac: 7b 09                                          BRB &0x9 <0x59b5>
000059ae: 84 4f 88 10 00 00 40                           MOVW &0x1088,%r0
000059b5: a0 40                                          PUSHW %r0
000059b7: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
000059bf: 04 61 40                                       MOVAW 1(%fp),%r0
000059c2: a0 40                                          PUSHW %r0
000059c4: 2c cc fc 7f f0 39 00 00                        CALL -4(%sp),$0x39f0
000059cc: 3f 6f 79 61                                    CMPB &0x79,1(%fp)
000059d0: 77 1a                                          BNEB &0x1a <0x59ea>
000059d2: b7 01 59                                       XORB2 &0x1,(%fp)
000059d5: 04 59 40                                       MOVAW (%fp),%r0
000059d8: a0 40                                          PUSHW %r0
000059da: a0 4f 3b 30 04 00                              PUSHW &0x4303b
000059e0: a0 01                                          PUSHW &0x1
000059e2: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
000059ea: a0 4f 8b 10 00 00                              PUSHW &0x108b
000059f0: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
000059f8: 18 49                                          RESTORE %fp
000059fa: 08                                             RET 
000059fb: 70                                             NOP 
000059fc: 32 ff 4f 00 00                                 SPOP &0x4fff
00005a01: 78                                             RSB 
00005a02: 32 ff 4f 00 01                                 SPOP &0x1004fff
00005a07: 78                                             RSB 
00005a08: 32 ff 4f 00 02                                 SPOP &0x2004fff
00005a0d: 78                                             RSB 
00005a0e: 32 ff 4f 00 03                                 SPOP &0x3004fff
00005a13: 78                                             RSB 
00005a14: 32 ff 4f 00 04                                 SPOP &0x4004fff
00005a19: 78                                             RSB 
00005a1a: 32 ff 4f 00 05                                 SPOP &0x5004fff
00005a1f: 78                                             RSB 
00005a20: 32 ff 4f 00 06                                 SPOP &0x6004fff
00005a25: 78                                             RSB 
00005a26: 32 ff 4f 00 07                                 SPOP &0x7004fff
00005a2b: 78                                             RSB 
00005a2c: 32 ff 4f 00 08                                 SPOP &0x8004fff
00005a31: 78                                             RSB 
00005a32: 32 ff 4f 00 09                                 SPOP &0x9004fff
00005a37: 78                                             RSB 
00005a38: 32 ff 4f 00 0a                                 SPOP &0xa004fff
00005a3d: 78                                             RSB 
00005a3e: 32 ff 4f 00 0b                                 SPOP &0xb004fff
00005a43: 78                                             RSB 
00005a44: 32 ff 4f 00 0c                                 SPOP &0xc004fff
00005a49: 78                                             RSB 
00005a4a: 32 ff 4f 00 0d                                 SPOP &0xd004fff
00005a4f: 78                                             RSB 
00005a50: 32 ff 4f 00 0e                                 SPOP &0xe004fff
00005a55: 78                                             RSB 
00005a56: 32 ff 4f 00 0f                                 SPOP &0xf004fff
00005a5b: 78                                             RSB 
00005a5c: 32 ff 4f 00 10                                 SPOP &0x10004fff
00005a61: 78                                             RSB 
00005a62: 32 ff 4f 00 11                                 SPOP &0x11004fff
00005a67: 78                                             RSB 
00005a68: 32 ff 4f 00 12                                 SPOP &0x12004fff
00005a6d: 78                                             RSB 
00005a6e: 32 ff 4f 00 13                                 SPOP &0x13004fff
00005a73: 78                                             RSB 
00005a74: 32 ff 4f 00 14                                 SPOP &0x14004fff
00005a79: 78                                             RSB 
00005a7a: 32 ff 4f 00 15                                 SPOP &0x15004fff
00005a7f: 78                                             RSB 
00005a80: 32 ff 4f 00 16                                 SPOP &0x16004fff
00005a85: 78                                             RSB 
00005a86: 32 ff 4f 00 17                                 SPOP &0x17004fff
00005a8b: 78                                             RSB 
00005a8c: 32 ff 4f 00 18                                 SPOP &0x18004fff
00005a91: 78                                             RSB 
00005a92: 32 ff 4f 00 19                                 SPOP &0x19004fff
00005a97: 78                                             RSB 
00005a98: 32 ff 4f 00 1a                                 SPOP &0x1a004fff
00005a9d: 78                                             RSB 
00005a9e: 32 ff 4f 00 1b                                 SPOP &0x1b004fff
00005aa3: 78                                             RSB 
00005aa4: 32 ff 4f 00 1c                                 SPOP &0x1c004fff
00005aa9: 78                                             RSB 
00005aaa: 32 ff 4f 00 1d                                 SPOP &0x1d004fff
00005aaf: 78                                             RSB 
00005ab0: 32 ff 4f 00 1e                                 SPOP &0x1e004fff
00005ab5: 78                                             RSB 
00005ab6: 32 ff 4f 00 1f                                 SPOP &0x1f004fff
00005abb: 78                                             RSB 
00005abc: 32 ff 4f 00 20                                 SPOP &0x20004fff
00005ac1: 78                                             RSB 
00005ac2: 32 ff 4f 00 21                                 SPOP &0x21004fff
00005ac7: 78                                             RSB 
00005ac8: 32 ff 4f 00 22                                 SPOP &0x22004fff
00005acd: 78                                             RSB 
00005ace: 32 ff 4f 00 23                                 SPOP &0x23004fff
00005ad3: 78                                             RSB 
00005ad4: 32 ff 4f 00 24                                 SPOP &0x24004fff
00005ad9: 78                                             RSB 
00005ada: 32 ff 4f 00 25                                 SPOP &0x25004fff
00005adf: 78                                             RSB 
00005ae0: 32 ff 4f 00 26                                 SPOP &0x26004fff
00005ae5: 78                                             RSB 
00005ae6: 32 ff 4f 00 27                                 SPOP &0x27004fff
00005aeb: 78                                             RSB 
00005aec: 32 ff 4f 00 28                                 SPOP &0x28004fff
00005af1: 78                                             RSB 
00005af2: 32 ff 4f 00 29                                 SPOP &0x29004fff
00005af7: 78                                             RSB 
00005af8: 32 ff 4f 00 2a                                 SPOP &0x2a004fff
00005afd: 78                                             RSB 
00005afe: 32 ff 4f 00 2b                                 SPOP &0x2b004fff
00005b03: 78                                             RSB 
00005b04: 32 ff 4f 00 2c                                 SPOP &0x2c004fff
00005b09: 78                                             RSB 
00005b0a: 32 ff 4f 00 2d                                 SPOP &0x2d004fff
00005b0f: 78                                             RSB 
00005b10: 32 ff 4f 00 2e                                 SPOP &0x2e004fff
00005b15: 78                                             RSB 
00005b16: 32 ff 4f 00 2f                                 SPOP &0x2f004fff
00005b1b: 78                                             RSB 
00005b1c: 32 ff 4f 00 30                                 SPOP &0x30004fff
00005b21: 78                                             RSB 
00005b22: 32 ff 4f 00 31                                 SPOP &0x31004fff
00005b27: 78                                             RSB 
00005b28: 32 ff 4f 00 32                                 SPOP &0x32004fff
00005b2d: 78                                             RSB 
00005b2e: 32 ff 4f 00 33                                 SPOP &0x33004fff
00005b33: 78                                             RSB 
00005b34: 32 ff 4f 00 34                                 SPOP &0x34004fff
00005b39: 78                                             RSB 
00005b3a: 32 ff 4f 00 35                                 SPOP &0x35004fff
00005b3f: 78                                             RSB 
00005b40: 32 ff 4f 00 36                                 SPOP &0x36004fff
00005b45: 78                                             RSB 
00005b46: 32 ff 4f 00 37                                 SPOP &0x37004fff
00005b4b: 78                                             RSB 
00005b4c: 32 ff 4f 00 38                                 SPOP &0x38004fff
00005b51: 78                                             RSB 
00005b52: 32 ff 4f 00 39                                 SPOP &0x39004fff
00005b57: 78                                             RSB 
00005b58: 32 ff 4f 00 3a                                 SPOP &0x3a004fff
00005b5d: 78                                             RSB 
00005b5e: 32 ff 4f 00 3b                                 SPOP &0x3b004fff
00005b63: 78                                             RSB 
00005b64: 32 ff 4f 00 3c                                 SPOP &0x3c004fff
00005b69: 78                                             RSB 
00005b6a: 32 ff 4f 00 3d                                 SPOP &0x3d004fff
00005b6f: 78                                             RSB 
00005b70: 32 ff 4f 00 3e                                 SPOP &0x3e004fff
00005b75: 78                                             RSB 
00005b76: 32 ff 4f 00 3f                                 SPOP &0x3f004fff
00005b7b: 78                                             RSB 
00005b7c: 32 ff 4f 00 40                                 SPOP &0x40004fff
00005b81: 78                                             RSB 
00005b82: 32 ff 4f 00 41                                 SPOP &0x41004fff
00005b87: 78                                             RSB 
00005b88: 32 ff 4f 00 42                                 SPOP &0x42004fff
00005b8d: 78                                             RSB 
00005b8e: 32 ff 4f 00 43                                 SPOP &0x43004fff
00005b93: 78                                             RSB 
00005b94: 32 ff 4f 00 44                                 SPOP &0x44004fff
00005b99: 78                                             RSB 
00005b9a: 32 ff 4f 00 45                                 SPOP &0x45004fff
00005b9f: 78                                             RSB 
00005ba0: 32 ff 4f 00 46                                 SPOP &0x46004fff
00005ba5: 78                                             RSB 
00005ba6: 32 ff 4f 00 47                                 SPOP &0x47004fff
00005bab: 78                                             RSB 
00005bac: 32 ff 4f 00 48                                 SPOP &0x48004fff
00005bb1: 78                                             RSB 
00005bb2: 32 ff 4f 00 49                                 SPOP &0x49004fff
00005bb7: 78                                             RSB 
00005bb8: 32 ff 4f 00 4a                                 SPOP &0x4a004fff
00005bbd: 78                                             RSB 
00005bbe: 32 ff 4f 00 4b                                 SPOP &0x4b004fff
00005bc3: 78                                             RSB 
00005bc4: 32 ff 4f 00 4c                                 SPOP &0x4c004fff
00005bc9: 78                                             RSB 
00005bca: 32 ff 4f 00 4d                                 SPOP &0x4d004fff
00005bcf: 78                                             RSB 
00005bd0: 32 ff 4f 00 4e                                 SPOP &0x4e004fff
00005bd5: 78                                             RSB 
00005bd6: 32 ff 4f 00 4f                                 SPOP &0x4f004fff
00005bdb: 78                                             RSB 
00005bdc: 32 ff 4f 00 50                                 SPOP &0x50004fff
00005be1: 78                                             RSB 
00005be2: 32 ff 4f 00 51                                 SPOP &0x51004fff
00005be7: 78                                             RSB 
00005be8: 32 ff 4f 00 52                                 SPOP &0x52004fff
00005bed: 78                                             RSB 
00005bee: 32 ff 4f 00 53                                 SPOP &0x53004fff
00005bf3: 78                                             RSB 
00005bf4: 32 ff 4f 00 54                                 SPOP &0x54004fff
00005bf9: 78                                             RSB 
00005bfa: 32 ff 4f 00 55                                 SPOP &0x55004fff
00005bff: 78                                             RSB 
00005c00: 32 ff 4f 00 56                                 SPOP &0x56004fff
00005c05: 78                                             RSB 
00005c06: 32 ff 4f 00 57                                 SPOP &0x57004fff
00005c0b: 78                                             RSB 
00005c0c: 32 ff 4f 00 58                                 SPOP &0x58004fff
00005c11: 78                                             RSB 
00005c12: 32 ff 4f 00 59                                 SPOP &0x59004fff
00005c17: 78                                             RSB 
00005c18: 32 ff 4f 00 5a                                 SPOP &0x5a004fff
00005c1d: 78                                             RSB 
00005c1e: 32 ff 4f 00 5b                                 SPOP &0x5b004fff
00005c23: 78                                             RSB 
00005c24: 32 ff 4f 00 5c                                 SPOP &0x5c004fff
00005c29: 78                                             RSB 
00005c2a: 32 ff 4f 00 5d                                 SPOP &0x5d004fff
00005c2f: 78                                             RSB 
00005c30: 32 ff 4f 00 5e                                 SPOP &0x5e004fff
00005c35: 78                                             RSB 
00005c36: 32 ff 4f 00 5f                                 SPOP &0x5f004fff
00005c3b: 78                                             RSB 
00005c3c: 32 ff 4f 00 60                                 SPOP &0x60004fff
00005c41: 78                                             RSB 
00005c42: 32 ff 4f 00 61                                 SPOP &0x61004fff
00005c47: 78                                             RSB 
00005c48: 32 ff 4f 00 62                                 SPOP &0x62004fff
00005c4d: 78                                             RSB 
00005c4e: 32 ff 4f 00 63                                 SPOP &0x63004fff
00005c53: 78                                             RSB 
00005c54: 32 ff 4f 00 64                                 SPOP &0x64004fff
00005c59: 78                                             RSB 
00005c5a: 32 ff 4f 00 65                                 SPOP &0x65004fff
00005c5f: 78                                             RSB 
00005c60: 32 ff 4f 00 66                                 SPOP &0x66004fff
00005c65: 78                                             RSB 
00005c66: 32 ff 4f 00 67                                 SPOP &0x67004fff
00005c6b: 78                                             RSB 
00005c6c: 32 ff 4f 00 68                                 SPOP &0x68004fff
00005c71: 78                                             RSB 
00005c72: 32 ff 4f 00 69                                 SPOP &0x69004fff
00005c77: 78                                             RSB 
00005c78: 32 ff 4f 00 6a                                 SPOP &0x6a004fff
00005c7d: 78                                             RSB 
00005c7e: 32 ff 4f 00 6b                                 SPOP &0x6b004fff
00005c83: 78                                             RSB 
00005c84: 32 ff 4f 00 6c                                 SPOP &0x6c004fff
00005c89: 78                                             RSB 
00005c8a: 32 ff 4f 00 6d                                 SPOP &0x6d004fff
00005c8f: 78                                             RSB 
00005c90: 32 ff 4f 00 6e                                 SPOP &0x6e004fff
00005c95: 78                                             RSB 
00005c96: 32 ff 4f 00 6f                                 SPOP &0x6f004fff
00005c9b: 78                                             RSB 
00005c9c: 32 ff 4f 00 70                                 SPOP &0x70004fff
00005ca1: 78                                             RSB 
00005ca2: 32 ff 4f 00 71                                 SPOP &0x71004fff
00005ca7: 78                                             RSB 
00005ca8: 32 ff 4f 00 72                                 SPOP &0x72004fff
00005cad: 78                                             RSB 
00005cae: 32 ff 4f 00 73                                 SPOP &0x73004fff
00005cb3: 78                                             RSB 
00005cb4: 32 ff 4f 00 74                                 SPOP &0x74004fff
00005cb9: 78                                             RSB 
00005cba: 32 ff 4f 00 75                                 SPOP &0x75004fff
00005cbf: 78                                             RSB 
00005cc0: 32 ff 4f 00 76                                 SPOP &0x76004fff
00005cc5: 78                                             RSB 
00005cc6: 32 ff 4f 00 77                                 SPOP &0x77004fff
00005ccb: 78                                             RSB 
00005ccc: 32 ff 4f 00 78                                 SPOP &0x78004fff
00005cd1: 78                                             RSB 
00005cd2: 32 ff 4f 00 79                                 SPOP &0x79004fff
00005cd7: 78                                             RSB 
00005cd8: 32 ff 4f 00 7a                                 SPOP &0x7a004fff
00005cdd: 78                                             RSB 
00005cde: 32 ff 4f 00 7b                                 SPOP &0x7b004fff
00005ce3: 78                                             RSB 
00005ce4: 32 ff 4f 00 7c                                 SPOP &0x7c004fff
00005ce9: 78                                             RSB 
00005cea: 32 ff 4f 00 7d                                 SPOP &0x7d004fff
00005cef: 78                                             RSB 
00005cf0: 32 ff 4f 00 7e                                 SPOP &0x7e004fff
00005cf5: 78                                             RSB 
00005cf6: 32 ff 4f 00 7f                                 SPOP &0x7f004fff
00005cfb: 78                                             RSB 
00005cfc: 32 ff 4f 00 80                                 SPOP &0x80004fff
00005d01: 78                                             RSB 
00005d02: 32 ff 4f 00 81                                 SPOP &0x81004fff
00005d07: 78                                             RSB 
00005d08: 32 ff 4f 00 82                                 SPOP &0x82004fff
00005d0d: 78                                             RSB 
00005d0e: 32 ff 4f 00 83                                 SPOP &0x83004fff
00005d13: 78                                             RSB 
00005d14: 32 ff 4f 00 84                                 SPOP &0x84004fff
00005d19: 78                                             RSB 
00005d1a: 32 ff 4f 00 85                                 SPOP &0x85004fff
00005d1f: 78                                             RSB 
00005d20: 32 ff 4f 00 86                                 SPOP &0x86004fff
00005d25: 78                                             RSB 
00005d26: 32 ff 4f 00 87                                 SPOP &0x87004fff
00005d2b: 78                                             RSB 
00005d2c: 32 ff 4f 00 88                                 SPOP &0x88004fff
00005d31: 78                                             RSB 
00005d32: 32 ff 4f 00 89                                 SPOP &0x89004fff
00005d37: 78                                             RSB 
00005d38: 32 ff 4f 00 8a                                 SPOP &0x8a004fff
00005d3d: 78                                             RSB 
00005d3e: 32 ff 4f 00 8b                                 SPOP &0x8b004fff
00005d43: 78                                             RSB 
00005d44: 32 ff 4f 00 8c                                 SPOP &0x8c004fff
00005d49: 78                                             RSB 
00005d4a: 32 ff 4f 00 8d                                 SPOP &0x8d004fff
00005d4f: 78                                             RSB 
00005d50: 32 ff 4f 00 8e                                 SPOP &0x8e004fff
00005d55: 78                                             RSB 
00005d56: 32 ff 4f 00 8f                                 SPOP &0x8f004fff
00005d5b: 78                                             RSB 
00005d5c: 32 ff 4f 00 90                                 SPOP &0x90004fff
00005d61: 78                                             RSB 
00005d62: 32 ff 4f 00 91                                 SPOP &0x91004fff
00005d67: 78                                             RSB 
00005d68: 32 ff 4f 00 92                                 SPOP &0x92004fff
00005d6d: 78                                             RSB 
00005d6e: 32 ff 4f 00 93                                 SPOP &0x93004fff
00005d73: 78                                             RSB 
00005d74: 32 ff 4f 00 94                                 SPOP &0x94004fff
00005d79: 78                                             RSB 
00005d7a: 32 ff 4f 00 95                                 SPOP &0x95004fff
00005d7f: 78                                             RSB 
00005d80: 32 ff 4f 00 96                                 SPOP &0x96004fff
00005d85: 78                                             RSB 
00005d86: 32 ff 4f 00 97                                 SPOP &0x97004fff
00005d8b: 78                                             RSB 
00005d8c: 32 ff 4f 00 98                                 SPOP &0x98004fff
00005d91: 78                                             RSB 
00005d92: 32 ff 4f 00 99                                 SPOP &0x99004fff
00005d97: 78                                             RSB 
00005d98: 32 ff 4f 00 9a                                 SPOP &0x9a004fff
00005d9d: 78                                             RSB 
00005d9e: 32 ff 4f 00 9b                                 SPOP &0x9b004fff
00005da3: 78                                             RSB 
00005da4: 32 ff 4f 00 9c                                 SPOP &0x9c004fff
00005da9: 78                                             RSB 
00005daa: 32 ff 4f 00 9d                                 SPOP &0x9d004fff
00005daf: 78                                             RSB 
00005db0: 32 ff 4f 00 9e                                 SPOP &0x9e004fff
00005db5: 78                                             RSB 
00005db6: 32 ff 4f 00 9f                                 SPOP &0x9f004fff
00005dbb: 78                                             RSB 
00005dbc: 32 ff 4f 00 a0                                 SPOP &0xa0004fff
00005dc1: 78                                             RSB 
00005dc2: 32 ff 4f 00 a1                                 SPOP &0xa1004fff
00005dc7: 78                                             RSB 
00005dc8: 32 ff 4f 00 a2                                 SPOP &0xa2004fff
00005dcd: 78                                             RSB 
00005dce: 32 ff 4f 00 a3                                 SPOP &0xa3004fff
00005dd3: 78                                             RSB 
00005dd4: 32 ff 4f 00 a4                                 SPOP &0xa4004fff
00005dd9: 78                                             RSB 
00005dda: 32 ff 4f 00 a5                                 SPOP &0xa5004fff
00005ddf: 78                                             RSB 
00005de0: 32 ff 4f 00 a6                                 SPOP &0xa6004fff
00005de5: 78                                             RSB 
00005de6: 32 ff 4f 00 a7                                 SPOP &0xa7004fff
00005deb: 78                                             RSB 
00005dec: 32 ff 4f 00 a8                                 SPOP &0xa8004fff
00005df1: 78                                             RSB 
00005df2: 32 ff 4f 00 a9                                 SPOP &0xa9004fff
00005df7: 78                                             RSB 
00005df8: 32 ff 4f 00 aa                                 SPOP &0xaa004fff
00005dfd: 78                                             RSB 
00005dfe: 32 ff 4f 00 ab                                 SPOP &0xab004fff
00005e03: 78                                             RSB 
00005e04: 32 ff 4f 00 ac                                 SPOP &0xac004fff
00005e09: 78                                             RSB 
00005e0a: 32 ff 4f 00 ad                                 SPOP &0xad004fff
00005e0f: 78                                             RSB 
00005e10: 32 ff 4f 00 ae                                 SPOP &0xae004fff
00005e15: 78                                             RSB 
00005e16: 32 ff 4f 00 af                                 SPOP &0xaf004fff
00005e1b: 78                                             RSB 
00005e1c: 32 ff 4f 00 b0                                 SPOP &0xb0004fff
00005e21: 78                                             RSB 
00005e22: 32 ff 4f 00 b1                                 SPOP &0xb1004fff
00005e27: 78                                             RSB 
00005e28: 32 ff 4f 00 b2                                 SPOP &0xb2004fff
00005e2d: 78                                             RSB 
00005e2e: 32 ff 4f 00 b3                                 SPOP &0xb3004fff
00005e33: 78                                             RSB 
00005e34: 32 ff 4f 00 b4                                 SPOP &0xb4004fff
00005e39: 78                                             RSB 
00005e3a: 32 ff 4f 00 b5                                 SPOP &0xb5004fff
00005e3f: 78                                             RSB 
00005e40: 32 ff 4f 00 b6                                 SPOP &0xb6004fff
00005e45: 78                                             RSB 
00005e46: 32 ff 4f 00 b7                                 SPOP &0xb7004fff
00005e4b: 78                                             RSB 
00005e4c: 32 ff 4f 00 b8                                 SPOP &0xb8004fff
00005e51: 78                                             RSB 
00005e52: 32 ff 4f 00 b9                                 SPOP &0xb9004fff
00005e57: 78                                             RSB 
00005e58: 32 ff 4f 00 ba                                 SPOP &0xba004fff
00005e5d: 78                                             RSB 
00005e5e: 32 ff 4f 00 bb                                 SPOP &0xbb004fff
00005e63: 78                                             RSB 
00005e64: 32 ff 4f 00 bc                                 SPOP &0xbc004fff
00005e69: 78                                             RSB 
00005e6a: 32 ff 4f 00 bd                                 SPOP &0xbd004fff
00005e6f: 78                                             RSB 
00005e70: 32 ff 4f 00 be                                 SPOP &0xbe004fff
00005e75: 78                                             RSB 
00005e76: 32 ff 4f 00 bf                                 SPOP &0xbf004fff
00005e7b: 78                                             RSB 
00005e7c: 32 ff 4f 00 c0                                 SPOP &0xc0004fff
00005e81: 78                                             RSB 
00005e82: 32 ff 4f 00 c1                                 SPOP &0xc1004fff
00005e87: 78                                             RSB 
00005e88: 32 ff 4f 00 c2                                 SPOP &0xc2004fff
00005e8d: 78                                             RSB 
00005e8e: 32 ff 4f 00 c3                                 SPOP &0xc3004fff
00005e93: 78                                             RSB 
00005e94: 32 ff 4f 00 c4                                 SPOP &0xc4004fff
00005e99: 78                                             RSB 
00005e9a: 32 ff 4f 00 c5                                 SPOP &0xc5004fff
00005e9f: 78                                             RSB 
00005ea0: 32 ff 4f 00 c6                                 SPOP &0xc6004fff
00005ea5: 78                                             RSB 
00005ea6: 32 ff 4f 00 c7                                 SPOP &0xc7004fff
00005eab: 78                                             RSB 
00005eac: 32 ff 4f 00 c8                                 SPOP &0xc8004fff
00005eb1: 78                                             RSB 
00005eb2: 32 ff 4f 00 c9                                 SPOP &0xc9004fff
00005eb7: 78                                             RSB 
00005eb8: 32 ff 4f 00 ca                                 SPOP &0xca004fff
00005ebd: 78                                             RSB 
00005ebe: 32 ff 4f 00 cb                                 SPOP &0xcb004fff
00005ec3: 78                                             RSB 
00005ec4: 32 ff 4f 00 cc                                 SPOP &0xcc004fff
00005ec9: 78                                             RSB 
00005eca: 32 ff 4f 00 cd                                 SPOP &0xcd004fff
00005ecf: 78                                             RSB 
00005ed0: 32 ff 4f 00 ce                                 SPOP &0xce004fff
00005ed5: 78                                             RSB 
00005ed6: 32 ff 4f 00 cf                                 SPOP &0xcf004fff
00005edb: 78                                             RSB 
00005edc: 32 ff 4f 00 d0                                 SPOP &0xd0004fff
00005ee1: 78                                             RSB 
00005ee2: 32 ff 4f 00 d1                                 SPOP &0xd1004fff
00005ee7: 78                                             RSB 
00005ee8: 32 ff 4f 00 d2                                 SPOP &0xd2004fff
00005eed: 78                                             RSB 
00005eee: 32 ff 4f 00 d3                                 SPOP &0xd3004fff
00005ef3: 78                                             RSB 
00005ef4: 32 ff 4f 00 d4                                 SPOP &0xd4004fff
00005ef9: 78                                             RSB 
00005efa: 32 ff 4f 00 d5                                 SPOP &0xd5004fff
00005eff: 78                                             RSB 
00005f00: 32 ff 4f 00 d6                                 SPOP &0xd6004fff
00005f05: 78                                             RSB 
00005f06: 32 ff 4f 00 d7                                 SPOP &0xd7004fff
00005f0b: 78                                             RSB 
00005f0c: 32 ff 4f 00 d8                                 SPOP &0xd8004fff
00005f11: 78                                             RSB 
00005f12: 32 ff 4f 00 d9                                 SPOP &0xd9004fff
00005f17: 78                                             RSB 
00005f18: 32 ff 4f 00 da                                 SPOP &0xda004fff
00005f1d: 78                                             RSB 
00005f1e: 32 ff 4f 00 db                                 SPOP &0xdb004fff
00005f23: 78                                             RSB 
00005f24: 32 ff 4f 00 dc                                 SPOP &0xdc004fff
00005f29: 78                                             RSB 
00005f2a: 32 ff 4f 00 dd                                 SPOP &0xdd004fff
00005f2f: 78                                             RSB 
00005f30: 32 ff 4f 00 de                                 SPOP &0xde004fff
00005f35: 78                                             RSB 
00005f36: 32 ff 4f 00 df                                 SPOP &0xdf004fff
00005f3b: 78                                             RSB 
00005f3c: 32 ff 4f 00 e0                                 SPOP &0xe0004fff
00005f41: 78                                             RSB 
00005f42: 32 ff 4f 00 e1                                 SPOP &0xe1004fff
00005f47: 78                                             RSB 
00005f48: 32 ff 4f 00 e2                                 SPOP &0xe2004fff
00005f4d: 78                                             RSB 
00005f4e: 32 ff 4f 00 e3                                 SPOP &0xe3004fff
00005f53: 78                                             RSB 
00005f54: 32 ff 4f 00 e4                                 SPOP &0xe4004fff
00005f59: 78                                             RSB 
00005f5a: 32 ff 4f 00 e5                                 SPOP &0xe5004fff
00005f5f: 78                                             RSB 
00005f60: 32 ff 4f 00 e6                                 SPOP &0xe6004fff
00005f65: 78                                             RSB 
00005f66: 32 ff 4f 00 e7                                 SPOP &0xe7004fff
00005f6b: 78                                             RSB 
00005f6c: 32 ff 4f 00 e8                                 SPOP &0xe8004fff
00005f71: 78                                             RSB 
00005f72: 32 ff 4f 00 e9                                 SPOP &0xe9004fff
00005f77: 78                                             RSB 
00005f78: 32 ff 4f 00 ea                                 SPOP &0xea004fff
00005f7d: 78                                             RSB 
00005f7e: 32 ff 4f 00 eb                                 SPOP &0xeb004fff
00005f83: 78                                             RSB 
00005f84: 32 ff 4f 00 ec                                 SPOP &0xec004fff
00005f89: 78                                             RSB 
00005f8a: 32 ff 4f 00 ed                                 SPOP &0xed004fff
00005f8f: 78                                             RSB 
00005f90: 32 ff 4f 00 ee                                 SPOP &0xee004fff
00005f95: 78                                             RSB 
00005f96: 32 ff 4f 00 ef                                 SPOP &0xef004fff
00005f9b: 78                                             RSB 
00005f9c: 32 ff 4f 00 f0                                 SPOP &0xf0004fff
00005fa1: 78                                             RSB 
00005fa2: 32 ff 4f 00 f1                                 SPOP &0xf1004fff
00005fa7: 78                                             RSB 
00005fa8: 32 ff 4f 00 f2                                 SPOP &0xf2004fff
00005fad: 78                                             RSB 
00005fae: 32 ff 4f 00 f3                                 SPOP &0xf3004fff
00005fb3: 78                                             RSB 
00005fb4: 32 ff 4f 00 f4                                 SPOP &0xf4004fff
00005fb9: 78                                             RSB 
00005fba: 32 ff 4f 00 f5                                 SPOP &0xf5004fff
00005fbf: 78                                             RSB 
00005fc0: 32 ff 4f 00 f6                                 SPOP &0xf6004fff
00005fc5: 78                                             RSB 
00005fc6: 32 ff 4f 00 f7                                 SPOP &0xf7004fff
00005fcb: 78                                             RSB 
00005fcc: 32 ff 4f 00 f8                                 SPOP &0xf8004fff
00005fd1: 78                                             RSB 
00005fd2: 32 ff 4f 00 f9                                 SPOP &0xf9004fff
00005fd7: 78                                             RSB 
00005fd8: 32 ff 4f 00 fa                                 SPOP &0xfa004fff
00005fdd: 78                                             RSB 
00005fde: 32 ff 4f 00 fb                                 SPOP &0xfb004fff
00005fe3: 78                                             RSB 
00005fe4: 32 ff 4f 00 fc                                 SPOP &0xfc004fff
00005fe9: 78                                             RSB 
00005fea: 32 ff 4f 00 fd                                 SPOP &0xfd004fff
00005fef: 78                                             RSB 
00005ff0: 32 ff 4f 00 fe                                 SPOP &0xfe004fff
00005ff5: 78                                             RSB 
00005ff6: 32 ff 4f 00 ff                                 SPOP &0xff004fff
00005ffb: 78                                             RSB 
00005ffc: 10 49                                          SAVE %fp
00005ffe: 9c 4f 10 00 00 00 4c                           ADDW2 &0x10,%sp
00006005: 2c 5c 7f 2c 24 00 00                           CALL (%sp),$0x242c
0000600c: 84 40 59                                       MOVW %r0,(%fp)
0000600f: 3c 4f 00 00 00 01 59                           CMPW &0x1000000,(%fp)
00006016: 5f 2d                                          BLEUB &0x2d <0x6043>
00006018: fb 10 7f 94 0c 00 02 40                        ANDB3 &0x10,$0x2000c94,%r0
00006020: 3c 10 40                                       CMPW &0x10,%r0
00006023: 7f 20                                          BEB &0x20 <0x6043>
00006025: a0 4f 90 10 00 00                              PUSHW &0x1090
0000602b: d4 14 59 40                                    LRSW3 &0x14,(%fp),%r0
0000602f: a0 40                                          PUSHW %r0
00006031: a0 10                                          PUSHW &0x10
00006033: 2c cc f4 7f b4 3b 00 00                        CALL -12(%sp),$0x3bb4
0000603b: 80 40                                          CLRW %r0
0000603d: 24 7f 1a 64 00 00                              JMP $0x641a
00006043: 3b 7f 94 0c 00 02 10                           BITB $0x2000c94,&0x10
0000604a: 77 2e                                          BNEB &0x2e <0x6078>
0000604c: 3c 4f 00 00 00 01 59                           CMPW &0x1000000,(%fp)
00006053: 77 25                                          BNEB &0x25 <0x6078>
00006055: cc 00 02 7f 04 d0 04 00 40                     EXTFW &0x0,&0x2,$0x4d004,%r0
0000605e: 28 40                                          TSTW %r0
00006060: 77 18                                          BNEB &0x18 <0x6078>
00006062: a0 4f ea 10 00 00                              PUSHW &0x10ea
00006068: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00006070: 80 40                                          CLRW %r0
00006072: 24 7f 1a 64 00 00                              JMP $0x641a
00006078: 83 6e                                          CLRB 14(%fp)
0000607a: 82 6c                                          CLRH 12(%fp)
0000607c: 87 01 69                                       MOVB &0x1,9(%fp)
0000607f: 7b 4a                                          BRB &0x4a <0x60c9>
00006081: 87 69 e0 40                                    MOVB 9(%fp),{uword}%r0
00006085: d0 02 40 40                                    LLSW3 &0x2,%r0,%r0
00006089: cc 00 02 80 00 d0 04 00 40                     EXTFW &0x0,&0x2,0x4d000(%r0),%r0
00006092: 28 40                                          TSTW %r0
00006094: 77 07                                          BNEB &0x7 <0x609b>
00006096: 87 01 6e                                       MOVB &0x1,14(%fp)
00006099: 7b 0e                                          BRB &0xe <0x60a7>
0000609b: 3f 01 6e                                       CMPB &0x1,14(%fp)
0000609e: 77 09                                          BNEB &0x9 <0x60a7>
000060a0: 87 69 e2 40                                    MOVB 9(%fp),{uhalf}%r0
000060a4: 86 40 6c                                       MOVH %r0,12(%fp)
000060a7: 2a 6c                                          TSTH 12(%fp)
000060a9: 7f 1e                                          BEB &0x1e <0x60c7>
000060ab: a0 4f 25 11 00 00                              PUSHW &0x1125
000060b1: 86 6c e4 40                                    MOVH 12(%fp),{word}%r0
000060b5: a0 40                                          PUSHW %r0
000060b7: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
000060bf: 80 40                                          CLRW %r0
000060c1: 24 7f 1a 64 00 00                              JMP $0x641a
000060c7: 93 69                                          INCB 9(%fp)
000060c9: 3f 04 69                                       CMPB &0x4,9(%fp)
000060cc: 5b b5                                          BLUB &0xb5 <0x6081>
000060ce: 80 59                                          CLRW (%fp)
000060d0: 82 6c                                          CLRH 12(%fp)
000060d2: 7b 1c                                          BRB &0x1c <0x60ee>
000060d4: 86 6c e4 40                                    MOVH 12(%fp),{word}%r0
000060d8: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
000060dc: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
000060e3: cc 03 00 c0 04 40                              EXTFW &0x3,&0x0,4(%r0),%r0
000060e9: 9c 40 59                                       ADDW2 %r0,(%fp)
000060ec: 92 6c                                          INCH 12(%fp)
000060ee: 86 6c e4 40                                    MOVH 12(%fp),{word}%r0
000060f2: 87 ef e0 04 00 00 e0 41                        MOVB *$0x4e0,{uword}%r1
000060fa: 3c 41 40                                       CMPW %r1,%r0
000060fd: 4b d7                                          BLB &0xd7 <0x60d4>
000060ff: 87 ef e0 04 00 00 e0 40                        MOVB *$0x4e0,{uword}%r0
00006107: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
0000610b: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
00006112: e8 0c 59 41                                    MULW3 &0xc,(%fp),%r1
00006116: 9c 41 40                                       ADDW2 %r1,%r0
00006119: 84 40 ef e8 04 00 00                           MOVW %r0,*$0x4e8
00006120: fc 5f 94 30 ef e4 04 00 00 40                  SUBW3 &0x3094,*$0x4e4,%r0
0000612a: d4 02 40 40                                    LRSW3 &0x2,%r0,%r0
0000612e: 84 40 59                                       MOVW %r0,(%fp)
00006131: 80 7f 94 30 00 02                              CLRW $0x2003094
00006137: fc 01 59 40                                    SUBW3 &0x1,(%fp),%r0
0000613b: a0 40                                          PUSHW %r0
0000613d: a0 4f 98 30 00 02                              PUSHW &0x2003098
00006143: a0 4f 94 30 00 02                              PUSHW &0x2003094
00006149: 2c cc f4 7f 54 37 00 00                        CALL -12(%sp),$0x3754
00006151: 2c 5c 7f 7e 53 00 00                           CALL (%sp),$0x537e
00006158: a0 00                                          PUSHW &0x0
0000615a: 2c cc fc ef 40 05 00 00                        CALL -4(%sp),*$0x540
00006162: 84 4f ef be ed fe 7f a0 03 00 02               MOVW &0xfeedbeef,$0x20003a0
0000616d: 3f 01 ef a0 04 00 00                           CMPB &0x1,*$0x4a0
00006174: 77 0a                                          BNEB &0xa <0x617e>
00006176: 2b 7f e8 11 00 00                              TSTB $0x11e8
0000617c: 77 26                                          BNEB &0x26 <0x61a2>
0000617e: 84 4f 1e 64 00 00 7f a4 03 00 02               MOVW &0x641e,$0x20003a4
00006189: 84 4f 66 64 00 00 7f 20 04 00 02               MOVW &0x6466,$0x2000420
00006194: 84 7f 20 04 00 02 40                           MOVW $0x2000420,%r0
0000619b: 84 40 7f a8 03 00 02                           MOVW %r0,$0x20003a8
000061a2: 84 7f a0 04 00 00 40                           MOVW $0x4a0,%r0
000061a9: 2b c0 01                                       TSTB 1(%r0)
000061ac: 77 36                                          BNEB &0x36 <0x61e2>
000061ae: a0 00                                          PUSHW &0x0
000061b0: a0 4f 00 40 00 02                              PUSHW &0x2004000
000061b6: a0 00                                          PUSHW &0x0
000061b8: a0 00                                          PUSHW &0x0
000061ba: 2c cc f0 7f 2c 65 00 00                        CALL -16(%sp),$0x652c
000061c2: 28 40                                          TSTW %r0
000061c4: 77 11                                          BNEB &0x11 <0x61d5>
000061c6: 2c 5c 7f 48 68 00 00                           CALL (%sp),$0x6848
000061cd: 80 40                                          CLRW %r0
000061cf: 24 7f 1a 64 00 00                              JMP $0x641a
000061d5: 84 4f 00 40 00 02 64                           MOVW &0x2004000,4(%fp)
000061dc: 24 7f 5f 63 00 00                              JMP $0x635f
000061e2: 84 7f a0 04 00 00 40                           MOVW $0x4a0,%r0
000061e9: 3f 07 c0 01                                    CMPB &0x7,1(%r0)
000061ed: 77 2b                                          BNEB &0x2b <0x6218>
000061ef: a0 00                                          PUSHW &0x0
000061f1: a0 4f 00 40 00 02                              PUSHW &0x2004000
000061f7: a0 00                                          PUSHW &0x0
000061f9: 2c cc f4 af b5 02                              CALL -12(%sp),0x2b5(%pc)
000061ff: 28 40                                          TSTW %r0
00006201: 77 0a                                          BNEB &0xa <0x620b>
00006203: 80 40                                          CLRW %r0
00006205: 24 7f 1a 64 00 00                              JMP $0x641a
0000620b: 84 4f 00 40 00 02 64                           MOVW &0x2004000,4(%fp)
00006212: 24 7f 5f 63 00 00                              JMP $0x635f
00006218: 83 6a                                          CLRB 10(%fp)
0000621a: 84 7f a0 04 00 00 40                           MOVW $0x4a0,%r0
00006221: 87 c0 01 e0 40                                 MOVB 1(%r0),{uword}%r0
00006226: d4 04 40 40                                    LRSW3 &0x4,%r0,%r0
0000622a: 87 40 69                                       MOVB %r0,9(%fp)
0000622d: 87 69 e0 40                                    MOVB 9(%fp),{uword}%r0
00006231: 3f 0d 40                                       CMPB &0xd,%r0
00006234: 77 14                                          BNEB &0x14 <0x6248>
00006236: 87 03 6a                                       MOVB &0x3,10(%fp)
00006239: 84 7f a0 04 00 00 40                           MOVW $0x4a0,%r0
00006240: fb 0f c0 01 40                                 ANDB3 &0xf,1(%r0),%r0
00006245: 87 40 69                                       MOVB %r0,9(%fp)
00006248: 86 01 6c                                       MOVH &0x1,12(%fp)
0000624b: 7b 41                                          BRB &0x41 <0x628c>
0000624d: 86 6c e4 40                                    MOVH 12(%fp),{word}%r0
00006251: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00006255: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
0000625c: cc 02 0b c0 04 40                              EXTFW &0x2,&0xb,4(%r0),%r0
00006262: 87 6a e0 41                                    MOVB 10(%fp),{uword}%r1
00006266: 3c 41 40                                       CMPW %r1,%r0
00006269: 77 21                                          BNEB &0x21 <0x628a>
0000626b: 86 6c e4 40                                    MOVH 12(%fp),{word}%r0
0000626f: d0 05 40 40                                    LLSW3 &0x5,%r0,%r0
00006273: 9c 7f 90 04 00 00 40                           ADDW2 $0x490,%r0
0000627a: cc 03 0c 50 40                                 EXTFW &0x3,&0xc,(%r0),%r0
0000627f: 87 69 e0 41                                    MOVB 9(%fp),{uword}%r1
00006283: 3c 41 40                                       CMPW %r1,%r0
00006286: 77 04                                          BNEB &0x4 <0x628a>
00006288: 7b 15                                          BRB &0x15 <0x629d>
0000628a: 92 6c                                          INCH 12(%fp)
0000628c: 86 6c e4 40                                    MOVH 12(%fp),{word}%r0
00006290: 87 ef e0 04 00 00 e0 41                        MOVB *$0x4e0,{uword}%r1
00006298: 3c 41 40                                       CMPW %r1,%r0
0000629b: 4b b2                                          BLB &0xb2 <0x624d>
0000629d: 86 6c e4 40                                    MOVH 12(%fp),{word}%r0
000062a1: 87 ef e0 04 00 00 e0 41                        MOVB *$0x4e0,{uword}%r1
000062a9: 3c 41 40                                       CMPW %r1,%r0
000062ac: 4b 34                                          BLB &0x34 <0x62e0>
000062ae: a0 4f 4c 11 00 00                              PUSHW &0x114c
000062b4: 2b 6a                                          TSTB 10(%fp)
000062b6: 77 0b                                          BNEB &0xb <0x62c1>
000062b8: 84 4f 7a 11 00 00 40                           MOVW &0x117a,%r0
000062bf: 7b 09                                          BRB &0x9 <0x62c8>
000062c1: 84 4f 82 11 00 00 40                           MOVW &0x1182,%r0
000062c8: a0 40                                          PUSHW %r0
000062ca: 87 69 e0 40                                    MOVB 9(%fp),{uword}%r0
000062ce: a0 40                                          PUSHW %r0
000062d0: 2c cc f4 7f b4 3b 00 00                        CALL -12(%sp),$0x3bb4
000062d8: 80 40                                          CLRW %r0
000062da: 24 7f 1a 64 00 00                              JMP $0x641a
000062e0: 84 7f a0 04 00 00 40                           MOVW $0x4a0,%r0
000062e7: fb 0f c0 01 40                                 ANDB3 &0xf,1(%r0),%r0
000062ec: 87 40 68                                       MOVB %r0,8(%fp)
000062ef: 82 6c                                          CLRH 12(%fp)
000062f1: 7b 39                                          BRB &0x39 <0x632a>
000062f3: 84 7f a0 04 00 00 40                           MOVW $0x4a0,%r0
000062fa: 87 c0 01 e0 40                                 MOVB 1(%r0),{uword}%r0
000062ff: d4 04 40 40                                    LRSW3 &0x4,%r0,%r0
00006303: a0 40                                          PUSHW %r0
00006305: 87 68 e0 40                                    MOVB 8(%fp),{uword}%r0
00006309: a0 40                                          PUSHW %r0
0000630b: 2c cc f8 7f c8 4e 00 00                        CALL -8(%sp),$0x4ec8
00006313: 84 40 64                                       MOVW %r0,4(%fp)
00006316: 28 64                                          TSTW 4(%fp)
00006318: 7f 04                                          BEB &0x4 <0x631c>
0000631a: 7b 15                                          BRB &0x15 <0x632f>
0000631c: a0 5f f4 01                                    PUSHW &0x1f4
00006320: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
00006328: 92 6c                                          INCH 12(%fp)
0000632a: 3e 08 6c                                       CMPH &0x8,12(%fp)
0000632d: 4b c6                                          BLB &0xc6 <0x62f3>
0000632f: 28 64                                          TSTW 4(%fp)
00006331: 77 2e                                          BNEB &0x2e <0x635f>
00006333: 3f 03 6a                                       CMPB &0x3,10(%fp)
00006336: 77 13                                          BNEB &0x13 <0x6349>
00006338: 87 69 e0 40                                    MOVB 9(%fp),{uword}%r0
0000633c: d0 1a 40 40                                    LLSW3 &0x1a,%r0,%r0
00006340: 87 01 80 03 00 01 06                           MOVB &0x1,0x6010003(%r0)
00006347: 7b 10                                          BRB &0x10 <0x6357>
00006349: ff 01 69 40                                    SUBB3 &0x1,9(%fp),%r0
0000634d: d0 15 40 40                                    LLSW3 &0x15,%r0,%r0
00006351: 83 80 05 00 20 00                              CLRB 0x200005(%r0)
00006357: 80 40                                          CLRW %r0
00006359: 24 7f 1a 64 00 00                              JMP $0x641a
0000635f: 84 64 40                                       MOVW 4(%fp),%r0
00006362: 3c c0 04 d9 04                                 CMPW 4(%r0),*4(%fp)
00006367: 77 1e                                          BNEB &0x1e <0x6385>
00006369: 84 64 40                                       MOVW 4(%fp),%r0
0000636c: 84 64 41                                       MOVW 4(%fp),%r1
0000636f: 3c c1 08 c0 04                                 CMPW 8(%r1),4(%r0)
00006374: 77 11                                          BNEB &0x11 <0x6385>
00006376: 84 64 40                                       MOVW 4(%fp),%r0
00006379: 84 64 41                                       MOVW 4(%fp),%r1
0000637c: 3c c1 0c c0 08                                 CMPW 12(%r1),8(%r0)
00006381: 77 04                                          BNEB &0x4 <0x6385>
00006383: 7b 14                                          BRB &0x14 <0x6397>
00006385: a0 00                                          PUSHW &0x0
00006387: 2c cc fc ef 1c 05 00 00                        CALL -4(%sp),*$0x51c
0000638f: 28 40                                          TSTW %r0
00006391: 77 06                                          BNEB &0x6 <0x6397>
00006393: 2c 5c d9 04                                    CALL (%sp),*4(%fp)
00006397: a0 01                                          PUSHW &0x1
00006399: 2c cc fc ef 40 05 00 00                        CALL -4(%sp),*$0x540
000063a1: 84 7f a0 04 00 00 40                           MOVW $0x4a0,%r0
000063a8: 2b c0 01                                       TSTB 1(%r0)
000063ab: 77 0b                                          BNEB &0xb <0x63b6>
000063ad: 2c 5c 7f 48 68 00 00                           CALL (%sp),$0x6848
000063b4: 7b 33                                          BRB &0x33 <0x63e7>
000063b6: 84 7f a0 04 00 00 40                           MOVW $0x4a0,%r0
000063bd: 3f 07 c0 01                                    CMPB &0x7,1(%r0)
000063c1: 7f 26                                          BEB &0x26 <0x63e7>
000063c3: 3f 03 6a                                       CMPB &0x3,10(%fp)
000063c6: 77 13                                          BNEB &0x13 <0x63d9>
000063c8: 87 69 e0 40                                    MOVB 9(%fp),{uword}%r0
000063cc: d0 1a 40 40                                    LLSW3 &0x1a,%r0,%r0
000063d0: 87 01 80 03 00 01 06                           MOVB &0x1,0x6010003(%r0)
000063d7: 7b 10                                          BRB &0x10 <0x63e7>
000063d9: ff 01 69 40                                    SUBB3 &0x1,9(%fp),%r0
000063dd: d0 15 40 40                                    LLSW3 &0x15,%r0,%r0
000063e1: 83 80 05 00 20 00                              CLRB 0x200005(%r0)
000063e7: 3c 4f ef be ed fe 7f a0 03 00 02               CMPW &0xfeedbeef,$0x20003a0
000063f2: 77 06                                          BNEB &0x6 <0x63f8>
000063f4: 80 40                                          CLRW %r0
000063f6: 7b 24                                          BRB &0x24 <0x641a>
000063f8: 3f 01 ef a0 04 00 00                           CMPB &0x1,*$0x4a0
000063ff: 77 16                                          BNEB &0x16 <0x6415>
00006401: 3f 01 7f e8 11 00 00                           CMPB &0x1,$0x11e8
00006408: 77 0d                                          BNEB &0xd <0x6415>
0000640a: 84 4f ed 0d 1c a1 7f a0 03 00 02               MOVW &0xa11c0ded,$0x20003a0
00006415: 84 01 40                                       MOVW &0x1,%r0
00006418: 7b 02                                          BRB &0x2 <0x641a>
0000641a: 18 49                                          RESTORE %fp
0000641c: 08                                             RET 
0000641d: 70                                             NOP 
0000641e: 10 49                                          SAVE %fp
00006420: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
00006427: a0 4f 7c 0e 00 00                              PUSHW &0xe7c
0000642d: a0 4f 88 11 00 00                              PUSHW &0x1188
00006433: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
0000643b: a0 4f 8c 0e 00 00                              PUSHW &0xe8c
00006441: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00006449: a0 5f 80 00                                    PUSHW &0x80
0000644d: 2c cc fc 7f 6a 56 00 00                        CALL -4(%sp),$0x566a
00006455: a0 4f ef be ed fe                              PUSHW &0xfeedbeef
0000645b: 2c cc fc 7f fe 58 00 00                        CALL -4(%sp),$0x58fe
00006463: 18 49                                          RESTORE %fp
00006465: 08                                             RET 
00006466: 10 49                                          SAVE %fp
00006468: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
0000646f: a0 4f 7c 0e 00 00                              PUSHW &0xe7c
00006475: a0 4f a2 11 00 00                              PUSHW &0x11a2
0000647b: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
00006483: a0 4f 8c 0e 00 00                              PUSHW &0xe8c
00006489: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00006491: a0 6f 40                                       PUSHW &0x40
00006494: 2c cc fc 7f 6a 56 00 00                        CALL -4(%sp),$0x566a
0000649c: a0 4f ef be ed fe                              PUSHW &0xfeedbeef
000064a2: 2c cc fc 7f fe 58 00 00                        CALL -4(%sp),$0x58fe
000064aa: 18 49                                          RESTORE %fp
000064ac: 08                                             RET 
000064ad: 70                                             NOP 
000064ae: 10 49                                          SAVE %fp
000064b0: 9c 4f 0c 00 00 00 4c                           ADDW2 &0xc,%sp
000064b7: 28 7f 3c 04 00 02                              TSTW $0x200043c
000064bd: 77 06                                          BNEB &0x6 <0x64c3>
000064bf: 80 40                                          CLRW %r0
000064c1: 7b 67                                          BRB &0x67 <0x6528>
000064c3: 3f 01 7b                                       CMPB &0x1,11(%ap)
000064c6: 77 22                                          BNEB &0x22 <0x64e8>
000064c8: 84 74 59                                       MOVW 4(%ap),(%fp)
000064cb: dc 4f 00 00 00 02 ef e4 04 00 00 40            ADDW3 &0x2000000,*$0x4e4,%r0
000064d7: 86 e2 72 e0 41                                 MOVH {uhalf}2(%ap),{uword}%r1
000064dc: d0 09 41 41                                    LLSW3 &0x9,%r1,%r1
000064e0: 9c 41 40                                       ADDW2 %r1,%r0
000064e3: 84 40 64                                       MOVW %r0,4(%fp)
000064e6: 7b 20                                          BRB &0x20 <0x6506>
000064e8: dc 4f 00 00 00 02 ef e4 04 00 00 40            ADDW3 &0x2000000,*$0x4e4,%r0
000064f4: 86 e2 72 e0 41                                 MOVH {uhalf}2(%ap),{uword}%r1
000064f9: d0 09 41 41                                    LLSW3 &0x9,%r1,%r1
000064fd: 9c 41 40                                       ADDW2 %r1,%r0
00006500: 84 40 59                                       MOVW %r0,(%fp)
00006503: 84 74 64                                       MOVW 4(%ap),4(%fp)
00006506: dc 5f 00 02 64 40                              ADDW3 &0x200,4(%fp),%r0
0000650c: 84 40 68                                       MOVW %r0,8(%fp)
0000650f: 7b 0f                                          BRB &0xf <0x651e>
00006511: 84 64 40                                       MOVW 4(%fp),%r0
00006514: 90 64                                          INCW 4(%fp)
00006516: 84 59 41                                       MOVW (%fp),%r1
00006519: 90 59                                          INCW (%fp)
0000651b: 87 51 50                                       MOVB (%r1),(%r0)
0000651e: 3c 68 64                                       CMPW 8(%fp),4(%fp)
00006521: 5b f0                                          BLUB &0xf0 <0x6511>
00006523: 84 01 40                                       MOVW &0x1,%r0
00006526: 7b 02                                          BRB &0x2 <0x6528>
00006528: 18 49                                          RESTORE %fp
0000652a: 08                                             RET 
0000652b: 70                                             NOP 
0000652c: 10 49                                          SAVE %fp
0000652e: 9c 4f 0c 00 00 00 4c                           ADDW2 &0xc,%sp
00006535: 86 01 62                                       MOVH &0x1,2(%fp)
00006538: ec e0 12 5a 40                                 DIVW3 {uword}&0x12,(%ap),%r0
0000653d: 3c 6f 50 40                                    CMPW &0x50,%r0
00006541: 5b 06                                          BLUB &0x6 <0x6547>
00006543: 82 62                                          CLRH 2(%fp)
00006545: 7b 72                                          BRB &0x72 <0x65b7>
00006547: 2b ca 0f                                       TSTB 15(%ap)
0000654a: 7f 08                                          BEB &0x8 <0x6552>
0000654c: 3f 03 ca 0f                                    CMPB &0x3,15(%ap)
00006550: 77 67                                          BNEB &0x67 <0x65b7>
00006552: 83 7f ad 12 00 02                              CLRB $0x20012ad
00006558: a0 01                                          PUSHW &0x1
0000655a: 2c cc fc 7f a8 67 00 00                        CALL -4(%sp),$0x67a8
00006562: 28 40                                          TSTW %r0
00006564: 77 06                                          BNEB &0x6 <0x656a>
00006566: 82 62                                          CLRH 2(%fp)
00006568: 7b 4f                                          BRB &0x4f <0x65b7>
0000656a: a0 5f 8e 05                                    PUSHW &0x58e
0000656e: a0 4f a0 0c 00 02                              PUSHW &0x2000ca0
00006574: a0 00                                          PUSHW &0x0
00006576: a0 01                                          PUSHW &0x1
00006578: 2c cc f0 cf b4                                 CALL -16(%sp),-76(%pc)
0000657d: 28 40                                          TSTW %r0
0000657f: 77 06                                          BNEB &0x6 <0x6585>
00006581: 82 62                                          CLRH 2(%fp)
00006583: 7b 34                                          BRB &0x34 <0x65b7>
00006585: 3c 4f 0d 60 5e ca 7f a4 0c 00 02               CMPW &0xca5e600d,$0x2000ca4
00006590: 77 27                                          BNEB &0x27 <0x65b7>
00006592: a0 7f dc 0c 00 02                              PUSHW $0x2000cdc
00006598: a0 4f a0 0c 00 02                              PUSHW &0x2000ca0
0000659e: a0 00                                          PUSHW &0x0
000065a0: a0 01                                          PUSHW &0x1
000065a2: 2c cc f0 af 8a ff                              CALL -16(%sp),0x..f8a(%pc)
000065a8: 28 40                                          TSTW %r0
000065aa: 77 06                                          BNEB &0x6 <0x65b0>
000065ac: 82 62                                          CLRH 2(%fp)
000065ae: 7b 09                                          BRB &0x9 <0x65b7>
000065b0: 87 01 7f ad 12 00 02                           MOVB &0x1,$0x20012ad
000065b7: 2a 62                                          TSTH 2(%fp)
000065b9: 77 23                                          BNEB &0x23 <0x65dc>
000065bb: 3f 02 ca 0f                                    CMPB &0x2,15(%ap)
000065bf: 7f 08                                          BEB &0x8 <0x65c7>
000065c1: 3f 03 ca 0f                                    CMPB &0x3,15(%ap)
000065c5: 77 17                                          BNEB &0x17 <0x65dc>
000065c7: 83 7f ad 12 00 02                              CLRB $0x20012ad
000065cd: 2c 5c 7f 48 68 00 00                           CALL (%sp),$0x6848
000065d4: 80 40                                          CLRW %r0
000065d6: 24 7f 13 67 00 00                              JMP $0x6713
000065dc: 83 68                                          CLRB 8(%fp)
000065de: ec e0 12 5a 40                                 DIVW3 {uword}&0x12,(%ap),%r0
000065e3: 87 40 69                                       MOVB %r0,9(%fp)
000065e6: e4 e0 12 5a 40                                 MODW3 {uword}&0x12,(%ap),%r0
000065eb: ac e0 09 40                                    DIVW2 {uword}&0x9,%r0
000065ef: 87 40 6a                                       MOVB %r0,10(%fp)
000065f2: e4 e0 09 5a 40                                 MODW3 {uword}&0x9,(%ap),%r0
000065f7: 87 40 6b                                       MOVB %r0,11(%fp)
000065fa: 2b 7f ad 12 00 02                              TSTB $0x20012ad
00006600: 7f 13                                          BEB &0x13 <0x6613>
00006602: 04 68 40                                       MOVAW 8(%fp),%r0
00006605: a0 40                                          PUSHW %r0
00006607: a0 4f a0 0c 00 02                              PUSHW &0x2000ca0
0000660d: 2c cc f8 af 3f 01                              CALL -8(%sp),0x13f(%pc)
00006613: 87 5f 9c 00 66                                 MOVB &0x9c,6(%fp)
00006618: 3f 01 7b                                       CMPB &0x1,11(%ap)
0000661b: 77 10                                          BNEB &0x10 <0x662b>
0000661d: 87 08 64                                       MOVB &0x8,4(%fp)
00006620: 87 5f a0 00 65                                 MOVB &0xa0,5(%fp)
00006625: b3 6f 40 66                                    ORB2 &0x40,6(%fp)
00006629: 7b 0a                                          BRB &0xa <0x6633>
0000662b: 87 04 64                                       MOVB &0x4,4(%fp)
0000662e: 87 5f 80 00 65                                 MOVB &0x80,5(%fp)
00006633: b3 08 65                                       ORB2 &0x8,5(%fp)
00006636: 8b 6a 40                                       MCOMB 10(%fp),%r0
00006639: 84 40 7f 4c 40 04 00                           MOVW %r0,$0x4404c
00006640: 82 62                                          CLRH 2(%fp)
00006642: 82 59                                          CLRH (%fp)
00006644: 24 7f d4 66 00 00                              JMP $0x66d4
0000664a: 87 69 e0 40                                    MOVB 9(%fp),{uword}%r0
0000664e: a0 40                                          PUSHW %r0
00006650: 2c cc fc af c6 00                              CALL -4(%sp),0xc6(%pc)
00006656: 28 40                                          TSTW %r0
00006658: 77 14                                          BNEB &0x14 <0x666c>
0000665a: a0 01                                          PUSHW &0x1
0000665c: 2c cc fc 7f a8 67 00 00                        CALL -4(%sp),$0x67a8
00006664: 28 40                                          TSTW %r0
00006666: 77 04                                          BNEB &0x4 <0x666a>
00006668: 7b 72                                          BRB &0x72 <0x66da>
0000666a: 7b 68                                          BRB &0x68 <0x66d2>
0000666c: df 01 6b 40                                    ADDB3 &0x1,11(%fp),%r0
00006670: 87 40 7f 02 a0 04 00                           MOVB %r0,$0x4a002
00006677: a0 74                                          PUSHW 4(%ap)
00006679: 87 64 e0 40                                    MOVB 4(%fp),{uword}%r0
0000667d: a0 40                                          PUSHW %r0
0000667f: a0 5f 00 02                                    PUSHW &0x200
00006683: 2c cc f4 7f 2c 69 00 00                        CALL -12(%sp),$0x692c
0000668b: 28 40                                          TSTW %r0
0000668d: 77 04                                          BNEB &0x4 <0x6691>
0000668f: 7b 4b                                          BRB &0x4b <0x66da>
00006691: 83 7f ac 12 00 02                              CLRB $0x20012ac
00006697: 87 65 e0 40                                    MOVB 5(%fp),{uword}%r0
0000669b: a0 40                                          PUSHW %r0
0000669d: 87 66 e0 40                                    MOVB 6(%fp),{uword}%r0
000066a1: a0 40                                          PUSHW %r0
000066a3: 2c cc f8 7f 64 68 00 00                        CALL -8(%sp),$0x6864
000066ab: 3c 01 40                                       CMPW &0x1,%r0
000066ae: 77 07                                          BNEB &0x7 <0x66b5>
000066b0: 86 01 62                                       MOVH &0x1,2(%fp)
000066b3: 7b 27                                          BRB &0x27 <0x66da>
000066b5: 3b 7f 00 a0 04 00 5f 80 00                     BITB $0x4a000,&0x80
000066be: 7f 04                                          BEB &0x4 <0x66c2>
000066c0: 7b 1a                                          BRB &0x1a <0x66da>
000066c2: a0 01                                          PUSHW &0x1
000066c4: 2c cc fc 7f a8 67 00 00                        CALL -4(%sp),$0x67a8
000066cc: 28 40                                          TSTW %r0
000066ce: 77 04                                          BNEB &0x4 <0x66d2>
000066d0: 7b 0a                                          BRB &0xa <0x66da>
000066d2: 92 59                                          INCH (%fp)
000066d4: 3e 10 59                                       CMPH &0x10,(%fp)
000066d7: 4a 73 ff                                       BLH &0xff73 <0x664a>
000066da: 2b 7f ac 12 00 02                              TSTB $0x20012ac
000066e0: 7f 14                                          BEB &0x14 <0x66f4>
000066e2: a0 4f b8 11 00 00                              PUSHW &0x11b8
000066e8: a0 68                                          PUSHW 8(%fp)
000066ea: a0 10                                          PUSHW &0x10
000066ec: 2c cc f4 ef b0 04 00 00                        CALL -12(%sp),*$0x4b0
000066f4: 3f 02 ca 0f                                    CMPB &0x2,15(%ap)
000066f8: 7f 08                                          BEB &0x8 <0x6700>
000066fa: 3f 03 ca 0f                                    CMPB &0x3,15(%ap)
000066fe: 77 0f                                          BNEB &0xf <0x670d>
00006700: 83 7f ad 12 00 02                              CLRB $0x20012ad
00006706: 2c 5c 7f 48 68 00 00                           CALL (%sp),$0x6848
0000670d: 86 62 e4 40                                    MOVH 2(%fp),{word}%r0
00006711: 7b 02                                          BRB &0x2 <0x6713>
00006713: 18 49                                          RESTORE %fp
00006715: 08                                             RET 
00006716: 10 49                                          SAVE %fp
00006718: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
0000671f: 3f 73 7f 01 a0 04 00                           CMPB 3(%ap),$0x4a001
00006726: 77 07                                          BNEB &0x7 <0x672d>
00006728: 84 01 40                                       MOVW &0x1,%r0
0000672b: 7b 1c                                          BRB &0x1c <0x6747>
0000672d: 87 73 7f 03 a0 04 00                           MOVB 3(%ap),$0x4a003
00006734: a0 1c                                          PUSHW &0x1c
00006736: a0 10                                          PUSHW &0x10
00006738: 2c cc f8 7f 64 68 00 00                        CALL -8(%sp),$0x6864
00006740: 86 e2 40 e0 40                                 MOVH {uhalf}%r0,{uword}%r0
00006745: 7b 02                                          BRB &0x2 <0x6747>
00006747: 18 49                                          RESTORE %fp
00006749: 08                                             RET 
0000674a: 70                                             NOP 
0000674b: 70                                             NOP 
0000674c: 10 49                                          SAVE %fp
0000674e: 9c 4f 04 00 00 00 4c                           ADDW2 &0x4,%sp
00006755: 82 59                                          CLRH (%fp)
00006757: 7b 42                                          BRB &0x42 <0x6799>
00006759: 86 59 e4 40                                    MOVH (%fp),{word}%r0
0000675d: d0 03 40 40                                    LLSW3 &0x3,%r0,%r0
00006761: 3c da 00 80 a0 0c 00 02                        CMPW *0(%ap),0x2000ca0(%r0)
00006769: 77 17                                          BNEB &0x17 <0x6780>
0000676b: 86 59 e4 40                                    MOVH (%fp),{word}%r0
0000676f: d0 03 40 40                                    LLSW3 &0x3,%r0,%r0
00006773: 84 80 a4 0c 00 02 da 00                        MOVW 0x2000ca4(%r0),*0(%ap)
0000677b: 84 01 40                                       MOVW &0x1,%r0
0000677e: 7b 25                                          BRB &0x25 <0x67a3>
00006780: 86 59 e4 40                                    MOVH (%fp),{word}%r0
00006784: d0 03 40 40                                    LLSW3 &0x3,%r0,%r0
00006788: 3c da 00 80 a0 0c 00 02                        CMPW *0(%ap),0x2000ca0(%r0)
00006790: 5f 07                                          BLEUB &0x7 <0x6797>
00006792: 84 01 40                                       MOVW &0x1,%r0
00006795: 7b 0e                                          BRB &0xe <0x67a3>
00006797: 92 59                                          INCH (%fp)
00006799: 3e 6f 40 59                                    CMPH &0x40,(%fp)
0000679d: 4b bc                                          BLB &0xbc <0x6759>
0000679f: 80 40                                          CLRW %r0
000067a1: 7b 02                                          BRB &0x2 <0x67a3>
000067a3: 18 49                                          RESTORE %fp
000067a5: 08                                             RET 
000067a6: 70                                             NOP 
000067a7: 70                                             NOP 
000067a8: 10 49                                          SAVE %fp
000067aa: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
000067b1: 80 7f 48 40 04 00                              CLRW $0x44048
000067b7: 80 7f 58 40 04 00                              CLRW $0x44058
000067bd: 84 01 7f 54 40 04 00                           MOVW &0x1,$0x44054
000067c4: 38 7f 40 40 04 00 10                           BITW $0x44040,&0x10
000067cb: 7f 14                                          BEB &0x14 <0x67df>
000067cd: 80 7f 50 40 04 00                              CLRW $0x44050
000067d3: a0 5f 2c 01                                    PUSHW &0x12c
000067d7: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
000067df: 87 21 7f 03 00 04 00                           MOVB &0x21,$0x40003
000067e6: a0 5f c8 00                                    PUSHW &0xc8
000067ea: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
000067f2: 87 5f d0 00 7f 00 a0 04 00                     MOVB &0xd0,$0x4a000
000067fb: a0 01                                          PUSHW &0x1
000067fd: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
00006805: 3b 7f 00 a0 04 00 5f 80 00                     BITB $0x4a000,&0x80
0000680e: 7f 0b                                          BEB &0xb <0x6819>
00006810: 2c 5c af 38 00                                 CALL (%sp),0x38(%pc)
00006815: 80 40                                          CLRW %r0
00006817: 7b 2e                                          BRB &0x2e <0x6845>
00006819: 3f 01 73                                       CMPB &0x1,3(%ap)
0000681c: 77 07                                          BNEB &0x7 <0x6823>
0000681e: 84 04 40                                       MOVW &0x4,%r0
00006821: 7b 04                                          BRB &0x4 <0x6825>
00006823: 80 40                                          CLRW %r0
00006825: b0 08 40                                       ORW2 &0x8,%r0
00006828: a0 40                                          PUSHW %r0
0000682a: a0 10                                          PUSHW &0x10
0000682c: 2c cc f8 af 38 00                              CALL -8(%sp),0x38(%pc)
00006832: 3c 01 40                                       CMPW &0x1,%r0
00006835: 77 07                                          BNEB &0x7 <0x683c>
00006837: 84 01 40                                       MOVW &0x1,%r0
0000683a: 7b 0b                                          BRB &0xb <0x6845>
0000683c: 2c 5c af 0c 00                                 CALL (%sp),0xc(%pc)
00006841: 80 40                                          CLRW %r0
00006843: 7b 02                                          BRB &0x2 <0x6845>
00006845: 18 49                                          RESTORE %fp
00006847: 08                                             RET 
00006848: 10 49                                          SAVE %fp
0000684a: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
00006851: 84 01 7f 50 40 04 00                           MOVW &0x1,$0x44050
00006858: 83 7f 03 00 04 00                              CLRB $0x40003
0000685e: 18 49                                          RESTORE %fp
00006860: 08                                             RET 
00006861: 70                                             NOP 
00006862: 70                                             NOP 
00006863: 70                                             NOP 
00006864: 10 49                                          SAVE %fp
00006866: 9c 4f 04 00 00 00 4c                           ADDW2 &0x4,%sp
0000686d: 3b 7f 00 a0 04 00 01                           BITB $0x4a000,&0x1
00006874: 7f 0a                                          BEB &0xa <0x687e>
00006876: 80 40                                          CLRW %r0
00006878: 24 7f 29 69 00 00                              JMP $0x6929
0000687e: 70                                             NOP 
0000687f: 84 4b 7f b0 12 00 02                           MOVW %psw,$0x20012b0
00006886: 70                                             NOP 
00006887: b0 4f 00 e1 01 00 4b                           ORW2 &0x1e100,%psw
0000688e: 70                                             NOP 
0000688f: 87 73 7f 00 a0 04 00                           MOVB 3(%ap),$0x4a000
00006896: a0 01                                          PUSHW &0x1
00006898: a0 5f e6 00                                    PUSHW &0xe6
0000689c: 2c cc f8 7f 50 4c 00 00                        CALL -8(%sp),$0x4c50
000068a4: 80 59                                          CLRW (%fp)
000068a6: 7b 20                                          BRB &0x20 <0x68c6>
000068a8: 3c 6f 64 59                                    CMPW &0x64,(%fp)
000068ac: 4f 0e                                          BLEB &0xe <0x68ba>
000068ae: 84 7f b0 12 00 02 4b                           MOVW $0x20012b0,%psw
000068b5: 70                                             NOP 
000068b6: 80 40                                          CLRW %r0
000068b8: 7b 71                                          BRB &0x71 <0x6929>
000068ba: a0 01                                          PUSHW &0x1
000068bc: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
000068c4: 90 59                                          INCW (%fp)
000068c6: 3b 7f 00 a0 04 00 01                           BITB $0x4a000,&0x1
000068cd: 77 db                                          BNEB &0xdb <0x68a8>
000068cf: fb 5f a0 00 73 40                              ANDB3 &0xa0,3(%ap),%r0
000068d5: 3c 5f a0 00 40                                 CMPW &0xa0,%r0
000068da: 7f 0f                                          BEB &0xf <0x68e9>
000068dc: fb 5f f0 00 73 40                              ANDB3 &0xf0,3(%ap),%r0
000068e2: 3c 5f f0 00 40                                 CMPW &0xf0,%r0
000068e7: 77 10                                          BNEB &0x10 <0x68f7>
000068e9: a0 01                                          PUSHW &0x1
000068eb: a0 5f e6 00                                    PUSHW &0xe6
000068ef: 2c cc f8 7f 50 4c 00 00                        CALL -8(%sp),$0x4c50
000068f7: 3b 7f 00 a0 04 00 77                           BITB $0x4a000,7(%ap)
000068fe: 7f 1e                                          BEB &0x1e <0x691c>
00006900: 3b 7f 00 a0 04 00 08                           BITB $0x4a000,&0x8
00006907: 7f 09                                          BEB &0x9 <0x6910>
00006909: 87 01 7f ac 12 00 02                           MOVB &0x1,$0x20012ac
00006910: 84 7f b0 12 00 02 4b                           MOVW $0x20012b0,%psw
00006917: 70                                             NOP 
00006918: 80 40                                          CLRW %r0
0000691a: 7b 0f                                          BRB &0xf <0x6929>
0000691c: 84 7f b0 12 00 02 4b                           MOVW $0x20012b0,%psw
00006923: 70                                             NOP 
00006924: 84 01 40                                       MOVW &0x1,%r0
00006927: 7b 02                                          BRB &0x2 <0x6929>
00006929: 18 49                                          RESTORE %fp
0000692b: 08                                             RET 
0000692c: 10 49                                          SAVE %fp
0000692e: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
00006935: bc 4f 00 00 00 02 5a                           SUBW2 &0x2000000,(%ap)
0000693c: 96 7a                                          DECH 10(%ap)
0000693e: ec e0 4f 00 00 01 00 5a 40                     DIVW3 {uword}&0x10000,(%ap),%r0
00006947: 86 e2 7a e0 41                                 MOVH {uhalf}10(%ap),{uword}%r1
0000694c: 9c 5a 41                                       ADDW2 (%ap),%r1
0000694f: ac e0 4f 00 00 01 00 41                        DIVW2 {uword}&0x10000,%r1
00006957: 3c 41 40                                       CMPW %r1,%r0
0000695a: 53 0a                                          BGEUB &0xa <0x6964>
0000695c: 80 40                                          CLRW %r0
0000695e: 24 7f fa 69 00 00                              JMP $0x69fa
00006964: 83 7f 0d 80 04 00                              CLRB $0x4800d
0000696a: 83 7f 08 80 04 00                              CLRB $0x48008
00006970: 83 7f 0c 80 04 00                              CLRB $0x4800c
00006976: 87 73 7f 02 80 04 00                           MOVB 3(%ap),$0x48002
0000697d: 87 72 7f 02 80 04 00                           MOVB 2(%ap),$0x48002
00006984: 3f 08 77                                       CMPB &0x8,7(%ap)
00006987: 77 1d                                          BNEB &0x1d <0x69a4>
00006989: 84 5f 00 08 40                                 MOVW &0x800,%r0
0000698e: 86 e2 40 e0 40                                 MOVH {uhalf}%r0,{uword}%r0
00006993: 86 e2 5a e0 41                                 MOVH {uhalf}(%ap),{uword}%r1
00006998: b0 41 40                                       ORW2 %r1,%r0
0000699b: 86 40 7f 02 50 04 00                           MOVH %r0,$0x45002
000069a2: 7b 18                                          BRB &0x18 <0x69ba>
000069a4: 80 40                                          CLRW %r0
000069a6: 86 e2 40 e0 40                                 MOVH {uhalf}%r0,{uword}%r0
000069ab: 86 e2 5a e0 41                                 MOVH {uhalf}(%ap),{uword}%r1
000069b0: b0 41 40                                       ORW2 %r1,%r0
000069b3: 86 40 7f 02 50 04 00                           MOVH %r0,$0x45002
000069ba: 83 7f 0c 80 04 00                              CLRB $0x4800c
000069c0: fb 5f ff 00 7b 40                              ANDB3 &0xff,11(%ap),%r0
000069c6: 87 40 7f 03 80 04 00                           MOVB %r0,$0x48003
000069cd: 86 e2 7a e0 40                                 MOVH {uhalf}10(%ap),{uword}%r0
000069d2: d4 08 40 40                                    LRSW3 &0x8,%r0,%r0
000069d6: bb 5f ff 00 40                                 ANDB2 &0xff,%r0
000069db: 87 40 7f 03 80 04 00                           MOVB %r0,$0x48003
000069e2: f3 6f 41 77 40                                 ORB3 &0x41,7(%ap),%r0
000069e7: 87 40 7f 0b 80 04 00                           MOVB %r0,$0x4800b
000069ee: 87 0d 7f 0f 80 04 00                           MOVB &0xd,$0x4800f
000069f5: 84 01 40                                       MOVW &0x1,%r0
000069f8: 7b 02                                          BRB &0x2 <0x69fa>
000069fa: 18 49                                          RESTORE %fp
000069fc: 08                                             RET 
000069fd: 70                                             NOP 
000069fe: 70                                             NOP 
000069ff: 70                                             NOP 
00006a00: 10 49                                          SAVE %fp
00006a02: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
00006a09: 84 4f a0 03 00 02 7f 08 00 00 02               MOVW &0x20003a0,$0x2000008
00006a14: 84 4f c4 12 00 02 7f 0c 00 00 02               MOVW &0x20012c4,$0x200000c
00006a1f: 84 4f 09 04 00 02 7f 10 00 00 02               MOVW &0x2000409,$0x2000010
00006a2a: 84 4f b0 03 00 02 7f 14 00 00 02               MOVW &0x20003b0,$0x2000014
00006a35: 84 4f ac 03 00 02 7f 18 00 00 02               MOVW &0x20003ac,$0x2000018
00006a40: 84 4f 0c 04 00 02 7f 1c 00 00 02               MOVW &0x200040c,$0x200001c
00006a4b: 84 4f 18 04 00 02 7f 20 00 00 02               MOVW &0x2000418,$0x2000020
00006a56: 84 4f 64 3f 00 00 7f 24 00 00 02               MOVW &0x3f64,$0x2000024
00006a61: 84 4f 6c 39 00 00 7f 28 00 00 02               MOVW &0x396c,$0x2000028
00006a6c: 84 4f 68 3b 00 00 7f 2c 00 00 02               MOVW &0x3b68,$0x200002c
00006a77: 18 49                                          RESTORE %fp
00006a79: 08                                             RET 
00006a7a: 70                                             NOP 
00006a7b: 70                                             NOP 
00006a7c: 10 47                                          SAVE %r7
00006a7e: 9c 4f 5c 00 00 00 4c                           ADDW2 &0x5c,%sp
00006a85: 87 01 ef c4 04 00 00                           MOVB &0x1,*$0x4c4
00006a8c: 84 4f 0c 6e 00 00 7f a4 03 00 02               MOVW &0x6e0c,$0x20003a4
00006a97: 84 4f 98 6f 00 00 7f a8 03 00 02               MOVW &0x6f98,$0x20003a8
00006aa2: 84 4f 98 6f 00 00 7f 20 04 00 02               MOVW &0x6f98,$0x2000420
00006aad: 84 4f 72 6e 00 00 7f 28 04 00 02               MOVW &0x6e72,$0x2000428
00006ab8: 3c 4f ef be ed fe 7f a0 03 00 02               CMPW &0xfeedbeef,$0x20003a0
00006ac3: 7f 0a                                          BEB &0xa <0x6acd>
00006ac5: 84 4f 00 00 80 00 4b                           MOVW &0x800000,%psw
00006acc: 70                                             NOP 
00006acd: 84 7f a0 03 00 02 48                           MOVW $0x20003a0,%r8
00006ad4: 3c 4f ef be ed fe 7f a0 03 00 02               CMPW &0xfeedbeef,$0x20003a0
00006adf: 7f 15                                          BEB &0x15 <0x6af4>
00006ae1: 3c 4f 1e ac eb ad 7f a0 03 00 02               CMPW &0xadebac1e,$0x20003a0
00006aec: 7f 08                                          BEB &0x8 <0x6af4>
00006aee: 24 7f 20 6c 00 00                              JMP $0x6c20
00006af4: 80 7f a0 03 00 02                              CLRW $0x20003a0
00006afa: a0 4f 00 30 04 00                              PUSHW &0x43000
00006b00: 04 c9 50 40                                    MOVAW 80(%fp),%r0
00006b04: a0 40                                          PUSHW %r0
00006b06: a0 09                                          PUSHW &0x9
00006b08: 2c cc f4 7f 2c 49 00 00                        CALL -12(%sp),$0x492c
00006b10: 2b c9 50                                       TSTB 80(%fp)
00006b13: 77 2c                                          BNEB &0x2c <0x6b3f>
00006b15: 04 c9 50 40                                    MOVAW 80(%fp),%r0
00006b19: a0 40                                          PUSHW %r0
00006b1b: a0 4f ec 11 00 00                              PUSHW &0x11ec
00006b21: 2c cc f8 7f 28 70 00 00                        CALL -8(%sp),$0x7028
00006b29: 04 c9 50 40                                    MOVAW 80(%fp),%r0
00006b2d: a0 40                                          PUSHW %r0
00006b2f: a0 4f 00 30 04 00                              PUSHW &0x43000
00006b35: a0 09                                          PUSHW &0x9
00006b37: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
00006b3f: 7b 43                                          BRB &0x43 <0x6b82>
00006b41: 84 01 7f 40 40 04 00                           MOVW &0x1,$0x44040
00006b48: a0 21                                          PUSHW &0x21
00006b4a: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
00006b52: 80 7f 40 40 04 00                              CLRW $0x44040
00006b58: a0 6f 43                                       PUSHW &0x43
00006b5b: 2c cc fc ef 28 05 00 00                        CALL -4(%sp),*$0x528
00006b63: 2b ef 10 05 00 00                              TSTB *$0x510
00006b69: 77 19                                          BNEB &0x19 <0x6b82>
00006b6b: 38 7f 00 40 04 00 02                           BITW $0x44000,&0x2
00006b72: 7f 10                                          BEB &0x10 <0x6b82>
00006b74: 80 ef 8c 04 00 00                              CLRW *$0x48c
00006b7a: 80 7f 44 40 04 00                              CLRW $0x44044
00006b80: 7b 00                                          BRB &0x0 <0x6b80>
00006b82: 3b 7f 0d 90 04 00 04                           BITB $0x4900d,&0x4
00006b89: 77 07                                          BNEB &0x7 <0x6b90>
00006b8b: 84 01 40                                       MOVW &0x1,%r0
00006b8e: 7b 04                                          BRB &0x4 <0x6b92>
00006b90: 80 40                                          CLRW %r0
00006b92: 28 40                                          TSTW %r0
00006b94: 7f ad                                          BEB &0xad <0x6b41>
00006b96: 3c 4f ef be ed fe 48                           CMPW &0xfeedbeef,%r8
00006b9d: 77 19                                          BNEB &0x19 <0x6bb6>
00006b9f: 84 01 7f 40 40 04 00                           MOVW &0x1,$0x44040
00006ba6: a0 4f f0 11 00 00                              PUSHW &0x11f0
00006bac: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00006bb4: 7b 16                                          BRB &0x16 <0x6bca>
00006bb6: 80 7f 40 40 04 00                              CLRW $0x44040
00006bbc: a0 4f 34 12 00 00                              PUSHW &0x1234
00006bc2: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00006bca: 04 59 40                                       MOVAW (%fp),%r0
00006bcd: a0 40                                          PUSHW %r0
00006bcf: 2c cc fc 7f 1c 33 00 00                        CALL -4(%sp),$0x331c
00006bd7: 04 59 40                                       MOVAW (%fp),%r0
00006bda: a0 40                                          PUSHW %r0
00006bdc: 04 c9 50 40                                    MOVAW 80(%fp),%r0
00006be0: a0 40                                          PUSHW %r0
00006be2: 2c cc f8 7f e8 6f 00 00                        CALL -8(%sp),$0x6fe8
00006bea: 28 40                                          TSTW %r0
00006bec: 77 31                                          BNEB &0x31 <0x6c1d>
00006bee: 84 4f 1e ac eb ad 7f a0 03 00 02               MOVW &0xadebac1e,$0x20003a0
00006bf9: 2c 5c 7f d8 24 00 00                           CALL (%sp),$0x24d8
00006c00: 84 7f a0 03 00 02 48                           MOVW $0x20003a0,%r8
00006c07: a0 4f 00 30 04 00                              PUSHW &0x43000
00006c0d: 04 c9 50 40                                    MOVAW 80(%fp),%r0
00006c11: a0 40                                          PUSHW %r0
00006c13: a0 09                                          PUSHW &0x9
00006c15: 2c cc f4 7f 2c 49 00 00                        CALL -12(%sp),$0x492c
00006c1d: 7a 22 ff                                       BRH &0xff22 <0x6b3f>
00006c20: 3c 4f 7e ca d1 de 7f a0 03 00 02               CMPW &0xded1ca7e,$0x20003a0
00006c2b: 7f 4f                                          BEB &0x4f <0x6c7a>
00006c2d: a0 4f 0c 30 04 00                              PUSHW &0x4300c
00006c33: 04 c9 5a 40                                    MOVAW 90(%fp),%r0
00006c37: a0 40                                          PUSHW %r0
00006c39: a0 01                                          PUSHW &0x1
00006c3b: 2c cc f4 7f 2c 49 00 00                        CALL -12(%sp),$0x492c
00006c43: 28 40                                          TSTW %r0
00006c45: 77 29                                          BNEB &0x29 <0x6c6e>
00006c47: 84 7f a0 04 00 00 40                           MOVW $0x4a0,%r0
00006c4e: 87 10 c0 01                                    MOVB &0x10,1(%r0)
00006c52: dc 01 7f a0 04 00 00 40                        ADDW3 &0x1,$0x4a0,%r0
00006c5a: a0 40                                          PUSHW %r0
00006c5c: a0 4f 0c 30 04 00                              PUSHW &0x4300c
00006c62: a0 01                                          PUSHW &0x1
00006c64: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
00006c6c: 7b 0e                                          BRB &0xe <0x6c7a>
00006c6e: 84 7f a0 04 00 00 40                           MOVW $0x4a0,%r0
00006c75: 87 c9 5a c0 01                                 MOVB 90(%fp),1(%r0)
00006c7a: 83 ef a0 04 00 00                              CLRB *$0x4a0
00006c80: 3c 4f 0d f0 ad 8b 48                           CMPW &0x8badf00d,%r8
00006c87: 77 08                                          BNEB &0x8 <0x6c8f>
00006c89: 24 7f 40 6d 00 00                              JMP $0x6d40
00006c8f: 3c 4f 7e ca d1 de 48                           CMPW &0xded1ca7e,%r8
00006c96: 77 0f                                          BNEB &0xf <0x6ca5>
00006c98: 84 7f a0 04 00 00 40                           MOVW $0x4a0,%r0
00006c9f: 3f 07 c0 01                                    CMPB &0x7,1(%r0)
00006ca3: 77 2c                                          BNEB &0x2c <0x6ccf>
00006ca5: dc 02 7f a0 04 00 00 40                        ADDW3 &0x2,$0x4a0,%r0
00006cad: a0 40                                          PUSHW %r0
00006caf: a0 4f 45 12 00 00                              PUSHW &0x1245
00006cb5: 2c cc f8 7f 28 70 00 00                        CALL -8(%sp),$0x7028
00006cbd: 2c 5c 7f fc 5f 00 00                           CALL (%sp),$0x5ffc
00006cc4: 28 40                                          TSTW %r0
00006cc6: 77 09                                          BNEB &0x9 <0x6ccf>
00006cc8: 2c 5c 7f 3a 59 00 00                           CALL (%sp),$0x593a
00006ccf: 3c 4f 7e ca d1 de 48                           CMPW &0xded1ca7e,%r8
00006cd6: 77 08                                          BNEB &0x8 <0x6cde>
00006cd8: 87 01 c9 5a                                    MOVB &0x1,90(%fp)
00006cdc: 7b 35                                          BRB &0x35 <0x6d11>
00006cde: a0 4f 3b 30 04 00                              PUSHW &0x4303b
00006ce4: 04 c9 5a 40                                    MOVAW 90(%fp),%r0
00006ce8: a0 40                                          PUSHW %r0
00006cea: a0 01                                          PUSHW &0x1
00006cec: 2c cc f4 7f 2c 49 00 00                        CALL -12(%sp),$0x492c
00006cf4: 28 40                                          TSTW %r0
00006cf6: 77 1b                                          BNEB &0x1b <0x6d11>
00006cf8: 83 c9 5a                                       CLRB 90(%fp)
00006cfb: 04 c9 5a 40                                    MOVAW 90(%fp),%r0
00006cff: a0 40                                          PUSHW %r0
00006d01: a0 4f 3b 30 04 00                              PUSHW &0x4303b
00006d07: a0 01                                          PUSHW &0x1
00006d09: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
00006d11: 2b c9 5a                                       TSTB 90(%fp)
00006d14: 77 2c                                          BNEB &0x2c <0x6d40>
00006d16: dc 02 7f a0 04 00 00 40                        ADDW3 &0x2,$0x4a0,%r0
00006d1e: a0 40                                          PUSHW %r0
00006d20: a0 4f 4e 12 00 00                              PUSHW &0x124e
00006d26: 2c cc f8 7f 28 70 00 00                        CALL -8(%sp),$0x7028
00006d2e: 2c 5c 7f fc 5f 00 00                           CALL (%sp),$0x5ffc
00006d35: 28 40                                          TSTW %r0
00006d37: 77 09                                          BNEB &0x9 <0x6d40>
00006d39: 2c 5c 7f 3a 59 00 00                           CALL (%sp),$0x593a
00006d40: 3c 4f ef be ed fe 7f a0 03 00 02               CMPW &0xfeedbeef,$0x20003a0
00006d4b: 7f 08                                          BEB &0x8 <0x6d53>
00006d4d: 80 7f 40 40 04 00                              CLRW $0x44040
00006d53: a0 4f 0d 30 04 00                              PUSHW &0x4300d
00006d59: dc 02 7f a0 04 00 00 40                        ADDW3 &0x2,$0x4a0,%r0
00006d61: a0 40                                          PUSHW %r0
00006d63: a0 2d                                          PUSHW &0x2d
00006d65: 2c cc f4 7f 2c 49 00 00                        CALL -12(%sp),$0x492c
00006d6d: 28 40                                          TSTW %r0
00006d6f: 77 34                                          BNEB &0x34 <0x6da3>
00006d71: dc 02 7f a0 04 00 00 40                        ADDW3 &0x2,$0x4a0,%r0
00006d79: a0 40                                          PUSHW %r0
00006d7b: a0 4f 55 12 00 00                              PUSHW &0x1255
00006d81: 2c cc f8 7f 28 70 00 00                        CALL -8(%sp),$0x7028
00006d89: dc 02 7f a0 04 00 00 40                        ADDW3 &0x2,$0x4a0,%r0
00006d91: a0 40                                          PUSHW %r0
00006d93: a0 4f 0d 30 04 00                              PUSHW &0x4300d
00006d99: a0 2d                                          PUSHW &0x2d
00006d9b: 2c cc f4 7f dc 49 00 00                        CALL -12(%sp),$0x49dc
00006da3: 87 02 ef a0 04 00 00                           MOVB &0x2,*$0x4a0
00006daa: 2c 5c 7f fc 5f 00 00                           CALL (%sp),$0x5ffc
00006db1: 2c 5c 7f 3a 59 00 00                           CALL (%sp),$0x593a
00006db8: 18 47                                          RESTORE %r7
00006dba: 08                                             RET 
00006dbb: 70                                             NOP 
00006dbc: 10 48                                          SAVE %r8
00006dbe: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
00006dc5: 2c 5c ef a4 03 00 02                           CALL (%sp),*$0x20003a4
00006dcc: 80 48                                          CLRW %r8
00006dce: 7b 34                                          BRB &0x34 <0x6e02>
00006dd0: 2b 88 40 12 00 02                              TSTB 0x2001240(%r8)
00006dd6: 7f 2a                                          BEB &0x2a <0x6e00>
00006dd8: d0 1a 48 40                                    LLSW3 &0x1a,%r8,%r0
00006ddc: 83 80 0b 00 01 06                              CLRB 0x601000b(%r0)
00006de2: d0 1a 48 40                                    LLSW3 &0x1a,%r8,%r0
00006de6: 83 80 23 00 01 06                              CLRB 0x6010023(%r0)
00006dec: d0 1a 48 40                                    LLSW3 &0x1a,%r8,%r0
00006df0: 83 80 27 00 01 06                              CLRB 0x6010027(%r0)
00006df6: d0 1a 48 40                                    LLSW3 &0x1a,%r8,%r0
00006dfa: 83 80 2b 00 01 06                              CLRB 0x601002b(%r0)
00006e00: 90 48                                          INCW %r8
00006e02: 3c 04 48                                       CMPW &0x4,%r8
00006e05: 4b cb                                          BLB &0xcb <0x6dd0>
00006e07: 18 48                                          RESTORE %r8
00006e09: 08                                             RET 
00006e0a: 70                                             NOP 
00006e0b: 70                                             NOP 
00006e0c: 10 49                                          SAVE %fp
00006e0e: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
00006e15: a0 5f 80 00                                    PUSHW &0x80
00006e19: 2c cc fc 7f 6a 56 00 00                        CALL -4(%sp),$0x566a
00006e21: a0 4f 7c 0e 00 00                              PUSHW &0xe7c
00006e27: a0 4f 5c 12 00 00                              PUSHW &0x125c
00006e2d: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
00006e35: a0 4f 8c 0e 00 00                              PUSHW &0xe8c
00006e3b: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00006e43: 2c 5c 7f 7e 53 00 00                           CALL (%sp),$0x537e
00006e4a: a0 4f ef be ed fe                              PUSHW &0xfeedbeef
00006e50: 2c cc fc 7f fe 58 00 00                        CALL -4(%sp),$0x58fe
00006e58: 18 49                                          RESTORE %fp
00006e5a: 08                                             RET 
00006e5b: 70                                             NOP 
00006e5c: 70                                             NOP 
00006e5d: 70                                             NOP 
00006e5e: 10 49                                          SAVE %fp
00006e60: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
00006e67: 2c 5c ef 28 04 00 02                           CALL (%sp),*$0x2000428
00006e6e: 18 49                                          RESTORE %fp
00006e70: 08                                             RET 
00006e71: 70                                             NOP 
00006e72: 10 49                                          SAVE %fp
00006e74: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
00006e7b: 38 7f 20 40 04 00 5f 80 00                     BITW $0x44020,&0x80
00006e84: 7f 24                                          BEB &0x24 <0x6ea8>
00006e86: a0 5f 00 04                                    PUSHW &0x400
00006e8a: 2c cc fc 7f 6a 56 00 00                        CALL -4(%sp),$0x566a
00006e92: a0 4f 76 12 00 00                              PUSHW &0x1276
00006e98: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00006ea0: 80 7f 44 40 04 00                              CLRW $0x44044
00006ea6: 7b 00                                          BRB &0x0 <0x6ea6>
00006ea8: 38 7f 60 40 04 00 20                           BITW $0x44060,&0x20
00006eaf: 7f 2a                                          BEB &0x2a <0x6ed9>
00006eb1: 80 7f 74 40 04 00                              CLRW $0x44074
00006eb7: a0 5f 00 02                                    PUSHW &0x200
00006ebb: 2c cc fc 7f 6a 56 00 00                        CALL -4(%sp),$0x566a
00006ec3: a0 4f 7c 0e 00 00                              PUSHW &0xe7c
00006ec9: a0 4f 89 12 00 00                              PUSHW &0x1289
00006ecf: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
00006ed7: 7b 49                                          BRB &0x49 <0x6f20>
00006ed9: 38 7f 60 40 04 00 6f 40                        BITW $0x44060,&0x40
00006ee1: 7f 36                                          BEB &0x36 <0x6f17>
00006ee3: 7b 08                                          BRB &0x8 <0x6eeb>
00006ee5: 80 7f 78 40 04 00                              CLRW $0x44078
00006eeb: 38 7f 60 40 04 00 6f 40                        BITW $0x44060,&0x40
00006ef3: 77 f2                                          BNEB &0xf2 <0x6ee5>
00006ef5: a0 5f 00 01                                    PUSHW &0x100
00006ef9: 2c cc fc 7f 6a 56 00 00                        CALL -4(%sp),$0x566a
00006f01: a0 4f 7c 0e 00 00                              PUSHW &0xe7c
00006f07: a0 4f a9 12 00 00                              PUSHW &0x12a9
00006f0d: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
00006f15: 7b 0b                                          BRB &0xb <0x6f20>
00006f17: 2c 5c ef a4 03 00 02                           CALL (%sp),*$0x20003a4
00006f1e: 7b 25                                          BRB &0x25 <0x6f43>
00006f20: 2c 5c 7f 7e 53 00 00                           CALL (%sp),$0x537e
00006f27: a0 4f 8c 0e 00 00                              PUSHW &0xe8c
00006f2d: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00006f35: a0 4f ef be ed fe                              PUSHW &0xfeedbeef
00006f3b: 2c cc fc 7f fe 58 00 00                        CALL -4(%sp),$0x58fe
00006f43: 18 49                                          RESTORE %fp
00006f45: 08                                             RET 
00006f46: 70                                             NOP 
00006f47: 70                                             NOP 
00006f48: 10 49                                          SAVE %fp
00006f4a: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
00006f51: f8 03 7f 10 04 00 02 40                        ANDW3 &0x3,$0x2000410,%r0
00006f59: 3c 03 40                                       CMPW &0x3,%r0
00006f5c: 77 31                                          BNEB &0x31 <0x6f8d>
00006f5e: f8 6f 78 7f 10 04 00 02 40                     ANDW3 &0x78,$0x2000410,%r0
00006f67: 3c 6f 70 40                                    CMPW &0x70,%r0
00006f6b: 7f 10                                          BEB &0x10 <0x6f7b>
00006f6d: f8 6f 78 7f 10 04 00 02 40                     ANDW3 &0x78,$0x2000410,%r0
00006f76: 3c 08 40                                       CMPW &0x8,%r0
00006f79: 77 0b                                          BNEB &0xb <0x6f84>
00006f7b: 2c 5c ef 20 04 00 02                           CALL (%sp),*$0x2000420
00006f82: 7b 09                                          BRB &0x9 <0x6f8b>
00006f84: 2c 5c ef a8 03 00 02                           CALL (%sp),*$0x20003a8
00006f8b: 7b 09                                          BRB &0x9 <0x6f94>
00006f8d: 2c 5c ef a8 03 00 02                           CALL (%sp),*$0x20003a8
00006f94: 18 49                                          RESTORE %fp
00006f96: 08                                             RET 
00006f97: 70                                             NOP 
00006f98: 10 49                                          SAVE %fp
00006f9a: 9c 4f 00 00 00 00 4c                           ADDW2 &0x0,%sp
00006fa1: a0 6f 40                                       PUSHW &0x40
00006fa4: 2c cc fc 7f 6a 56 00 00                        CALL -4(%sp),$0x566a
00006fac: a0 4f 7c 0e 00 00                              PUSHW &0xe7c
00006fb2: a0 4f c0 12 00 00                              PUSHW &0x12c0
00006fb8: 2c cc f8 7f b4 3b 00 00                        CALL -8(%sp),$0x3bb4
00006fc0: a0 4f 8c 0e 00 00                              PUSHW &0xe8c
00006fc6: 2c cc fc 7f b4 3b 00 00                        CALL -4(%sp),$0x3bb4
00006fce: 2c 5c 7f 7e 53 00 00                           CALL (%sp),$0x537e
00006fd5: a0 4f ef be ed fe                              PUSHW &0xfeedbeef
00006fdb: 2c cc fc 7f fe 58 00 00                        CALL -4(%sp),$0x58fe
00006fe3: 18 49                                          RESTORE %fp
00006fe5: 08                                             RET 
00006fe6: 70                                             NOP 
00006fe7: 70                                             NOP 
00006fe8: 10 49                                          SAVE %fp
00006fea: 84 5a 40                                       MOVW (%ap),%r0
00006fed: 84 74 41                                       MOVW 4(%ap),%r1
00006ff0: 3c 41 40                                       CMPW %r1,%r0
00006ff3: 77 08                                          BNEB &0x8 <0x6ffb>
00006ff5: 7b 10                                          BRB &0x10 <0x7005>
00006ff7: 90 40                                          INCW %r0
00006ff9: 90 41                                          INCW %r1
00006ffb: 3f 51 50                                       CMPB (%r1),(%r0)
00006ffe: 77 07                                          BNEB &0x7 <0x7005>
00007000: 3f 50 00                                       CMPB (%r0),&0x0
00007003: 77 f4                                          BNEB &0xf4 <0x6ff7>
00007005: ff 51 50 40                                    SUBB3 (%r1),(%r0),%r0
00007009: 04 c9 e8 4c                                    MOVAW -24(%fp),%sp
0000700d: 20 49                                          POPW %fp
0000700f: 08                                             RET 
00007010: 10 49                                          SAVE %fp
00007012: 84 5a 40                                       MOVW (%ap),%r0
00007015: 7b 04                                          BRB &0x4 <0x7019>
00007017: 90 40                                          INCW %r0
00007019: 2b 50                                          TSTB (%r0)
0000701b: 77 fc                                          BNEB &0xfc <0x7017>
0000701d: bc 5a 40                                       SUBW2 (%ap),%r0
00007020: 04 c9 e8 4c                                    MOVAW -24(%fp),%sp
00007024: 20 49                                          POPW %fp
00007026: 08                                             RET 
00007027: 70                                             NOP 
00007028: 10 49                                          SAVE %fp
0000702a: 84 5a 41                                       MOVW (%ap),%r1
0000702d: 84 74 40                                       MOVW 4(%ap),%r0
00007030: 30 35                                          STRCPY 
00007032: 84 5a 40                                       MOVW (%ap),%r0
00007035: 04 c9 e8 4c                                    MOVAW -24(%fp),%sp
00007039: 20 49                                          POPW %fp
0000703b: 08                                             RET 
