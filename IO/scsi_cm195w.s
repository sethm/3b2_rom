                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void start(void)
                                                          ;XREF[1,0]:   f000:ffce
ram:f000:8000   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:8005   81ec0400        SUB         SP,0x4                                  
ram:f000:8009   c746fc0001      MOV         word ptr [BP + -0x4],0x100              
ram:f000:800e   c746fe0000      MOV         word ptr [BP + -0x2],0x0                
ram:f000:8013   b820c0          MOV         AX,0xc020                               
ram:f000:8016   8ed8            MOV         DS,AX                                   
ram:f000:8018   a09000          MOV         AL,[offset DMA_CSR &0xff]               
ram:f000:801b   30e4            XOR         AH,AH                                   
ram:f000:801d   a94000          TEST        AX,0x40                                 
ram:f000:8020   750c            JNZ         LAB_f000_802e                           
ram:f000:8022   b800c0          MOV         AX,0xc000                               
ram:f000:8025   8ed8            MOV         DS,AX                                   
ram:f000:8027   f6060b00ff      TEST        byte ptr [SCSI_ID_REG],0xff             
ram:f000:802c   740d            JZ          LAB_f000_803b                           
                            LAB_f000_802e:                ;XREF[1,0]:   f000:8020
ram:f000:802e   b8001f          MOV         AX,0x1f00                               
ram:f000:8031   8ed8            MOV         DS,AX                                   
ram:f000:8033   c7067c000000    MOV         word ptr [offset UNUSUAL_CARD &0xff],0x0
ram:f000:8039   eb15            JMP         LAB_f000_8050                           
                            LAB_f000_803b:                ;XREF[1,0]:   f000:802c
ram:f000:803b   b8001f          MOV         AX,0x1f00                               
ram:f000:803e   8ed8            MOV         DS,AX                                   
ram:f000:8040   c7067c000100    MOV         word ptr [offset UNUSUAL_CARD &0xff],0x1
ram:f000:8046   c746fc0011      MOV         word ptr [BP + -0x4],0x1100             
ram:f000:804b   c746fe0000      MOV         word ptr [BP + -0x2],0x0                
                            LAB_f000_8050:                ;XREF[1,0]:   f000:8039
ram:f000:8050   b800c0          MOV         AX,0xc000                               
ram:f000:8053   8ed8            MOV         DS,AX                                   
ram:f000:8055   c606880000      MOV         byte ptr [PCSR_0_INT0],0x0              
ram:f000:805a   b800c0          MOV         AX,0xc000                               
ram:f000:805d   8ed8            MOV         DS,AX                                   
ram:f000:805f   c6068a0000      MOV         byte ptr [PCSR_2_INT2],0x0              
ram:f000:8064   b800c0          MOV         AX,0xc000                               
ram:f000:8067   8ed8            MOV         DS,AX                                   
ram:f000:8069   c6068b0000      MOV         byte ptr [PCSR_3_INT3],0x0              
ram:f000:806e   b800c0          MOV         AX,0xc000                               
ram:f000:8071   8ed8            MOV         DS,AX                                   
ram:f000:8073   c6068c0000      MOV         byte ptr [PCSR_4_INT3],0x0              
ram:f000:8078   b800c0          MOV         AX,0xc000                               
ram:f000:807b   8ed8            MOV         DS,AX                                   
ram:f000:807d   c6068d0000      MOV         byte ptr [PCSR_5_NMI],0x0               
ram:f000:8082   b840c0          MOV         AX,0xc040                               
ram:f000:8085   8ed8            MOV         DS,AX                                   
ram:f000:8087   a13a00          MOV         AX,[offset INT1_CTRL &0xff]             
ram:f000:808a   0d1000          OR          AX,0x10                                 
ram:f000:808d   ba40c0          MOV         DX,0xc040                               
ram:f000:8090   8eda            MOV         DS,DX                                   
ram:f000:8092   a33a00          MOV         [offset INT1_CTRL &0xff],AX             
ram:f000:8095   b800c0          MOV         AX,0xc000                               
ram:f000:8098   8ed8            MOV         DS,AX                                   
ram:f000:809a   c606890000      MOV         byte ptr [PCSR_1_INT1],0x0              
ram:f000:809f   b840c0          MOV         AX,0xc040                               
ram:f000:80a2   8ed8            MOV         DS,AX                                   
ram:f000:80a4   a12e00          MOV         AX,[offset DAT_c000_042e &0xff]         
ram:f000:80a7   252000          AND         AX,0x20                                 
ram:f000:80aa   3d2000          CMP         AX,0x20                                 
ram:f000:80ad   7505            JNZ         LAB_f000_80b4                           
ram:f000:80af   9a720040f8      CALLF       start_timers                            ;void start_timers(void)
                            LAB_f000_80b4:                ;XREF[1,0]:   f000:80ad
ram:f000:80b4   b840c0          MOV         AX,0xc040                               
ram:f000:80b7   8ed8            MOV         DS,AX                                   
ram:f000:80b9   c7063a000f00    MOV         word ptr [offset INT1_CTRL &0xff],0xf   
ram:f000:80bf   b80100          MOV         AX,0x1                                  
ram:f000:80c2   50              PUSH        AX                                      
ram:f000:80c3   b80400          MOV         AX,0x4                                  
ram:f000:80c6   50              PUSH        AX                                      
ram:f000:80c7   b80002          MOV         AX,0x200                                
ram:f000:80ca   50              PUSH        AX                                      
ram:f000:80cb   b80400          MOV         AX,0x4                                  
ram:f000:80ce   50              PUSH        AX                                      
ram:f000:80cf   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:80d2   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:80d5   2c04            SUB         AL,0x4                                  
ram:f000:80d7   7303            JNC         LAB_f000_80dc                           
ram:f000:80d9   83ea10          SUB         DX,0x10                                 
                            LAB_f000_80dc:                ;XREF[1,0]:   f000:80d7
ram:f000:80dc   d1ea            SHR         DX,1                                    
ram:f000:80de   d1ea            SHR         DX,1                                    
ram:f000:80e0   d1ea            SHR         DX,1                                    
ram:f000:80e2   d1ea            SHR         DX,1                                    
ram:f000:80e4   86d4            XCHG        AH,DL                                   
ram:f000:80e6   86f2            XCHG        DL,DH                                   
ram:f000:80e8   52              PUSH        DX                                      
ram:f000:80e9   50              PUSH        AX                                      
                            ;This is the routine that sucks the pointer to the sysgen
                            ;block out of system memory at 0x2000000. It sticks the pointer
                            ;onto the stack.
ram:f000:80ea   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:80ef   83c40c          ADD         SP,0xc                                  
ram:f000:80f2   b800c0          MOV         AX,0xc000                               
ram:f000:80f5   8ed8            MOV         DS,AX                                   
ram:f000:80f7   c70680000000    MOV         word ptr [ID_VEC],0x0                   
ram:f000:80fd   9a0c00b0fd      CALLF       test_registers                          ;undefined2 test_registers(void)
ram:f000:8102   85c0            TEST        AX,AX                                   
ram:f000:8104   7501            JNZ         LAB_f000_8107                           
ram:f000:8106   f4              HLT                                                  
                            LAB_f000_8107:                ;XREF[1,0]:   f000:8104
ram:f000:8107   b8f01f          MOV         AX,0x1ff0                               
ram:f000:810a   8ed8            MOV         DS,AX                                   
ram:f000:810c   c706f2000000    MOV         word ptr [offset STATE_FLAGS &0xff],0x0 
ram:f000:8112   b8f01f          MOV         AX,0x1ff0                               
ram:f000:8115   8ed8            MOV         DS,AX                                   
ram:f000:8117   813efa003412    CMP         word ptr [offset...,0x1234              
ram:f000:811d   7508            JNZ         LAB_f000_8127                           
ram:f000:811f   813ef8007856    CMP         word ptr [offset...,0x5678              
ram:f000:8125   7432            JZ          LAB_f000_8159                           
                            LAB_f000_8127:                ;XREF[1,0]:   f000:811d
ram:f000:8127   b8f01f          MOV         AX,0x1ff0                               
ram:f000:812a   8ed8            MOV         DS,AX                                   
ram:f000:812c   c706f0009001    MOV         word ptr [offset...,0x190               
ram:f000:8132   b8f01f          MOV         AX,0x1ff0                               
ram:f000:8135   8ed8            MOV         DS,AX                                   
ram:f000:8137   c706f4000000    MOV         word ptr [offset...,0x0                 
ram:f000:813d   b8f01f          MOV         AX,0x1ff0                               
ram:f000:8140   8ed8            MOV         DS,AX                                   
ram:f000:8142   c706f6000000    MOV         word ptr [offset...,0x0                 
ram:f000:8148   b8f01f          MOV         AX,0x1ff0                               
ram:f000:814b   8ed8            MOV         DS,AX                                   
ram:f000:814d   c706f8007856    MOV         word ptr [offset...,0x5678              
ram:f000:8153   c706fa003412    MOV         word ptr [offset...,0x1234              
                            LAB_f000_8159:                ;XREF[1,0]:   f000:8125
ram:f000:8159   9aec0010f8      CALLF       init_vectors                            ;undefined init_vectors(void)
ram:f000:815e   b8001f          MOV         AX,0x1f00                               
ram:f000:8161   8ed8            MOV         DS,AX                                   
ram:f000:8163   f7067c00ffff    TEST        word ptr [offset...,0xffff              
ram:f000:8169   7416            JZ          LAB_f000_8181                           
ram:f000:816b   b80011          MOV         AX,0x1100                               
ram:f000:816e   50              PUSH        AX                                      
ram:f000:816f   9a6800c0fd      CALLF       byte_swap_ax                            ;undefined2 byte_swap_ax(undefined2 p...
ram:f000:8174   83c402          ADD         SP,0x2                                  
ram:f000:8177   ba00c0          MOV         DX,0xc000                               
ram:f000:817a   8eda            MOV         DS,DX                                   
ram:f000:817c   a38000          MOV         [ID_VEC],AX                             
ram:f000:817f   eb14            JMP         LAB_f000_8195                           
                            LAB_f000_8181:                ;XREF[1,0]:   f000:8169
ram:f000:8181   b80001          MOV         AX,0x100                                
ram:f000:8184   50              PUSH        AX                                      
ram:f000:8185   9a6800c0fd      CALLF       byte_swap_ax                            ;undefined2 byte_swap_ax(undefined2 p...
ram:f000:818a   83c402          ADD         SP,0x2                                  
ram:f000:818d   ba00c0          MOV         DX,0xc000                               
ram:f000:8190   8eda            MOV         DS,DX                                   
ram:f000:8192   a38000          MOV         [ID_VEC],AX                             
                            LAB_f000_8195:                ;XREF[1,0]:   f000:817f
ram:f000:8195   b840c0          MOV         AX,0xc040                               
ram:f000:8198   8ed8            MOV         DS,AX                                   
ram:f000:819a   c70660000000    MOV         word ptr [offset TIMER2_CNT &0xff],0x0  
ram:f000:81a0   b840c0          MOV         AX,0xc040                               
ram:f000:81a3   8ed8            MOV         DS,AX                                   
ram:f000:81a5   c706620050c3    MOV         word ptr [offset...,0xc350              
ram:f000:81ab   b840c0          MOV         AX,0xc040                               
ram:f000:81ae   8ed8            MOV         DS,AX                                   
ram:f000:81b0   c706660001e0    MOV         word ptr [offset...,0xe001              
ram:f000:81b6   b840c0          MOV         AX,0xc040                               
ram:f000:81b9   8ed8            MOV         DS,AX                                   
ram:f000:81bb   81263800f7ff    AND         word ptr [offset INT0_CTRL &0xff],0xfff7
ram:f000:81c1   b840c0          MOV         AX,0xc040                               
ram:f000:81c4   8ed8            MOV         DS,AX                                   
ram:f000:81c6   81263200f7ff    AND         word ptr [offset...,0xfff7              
ram:f000:81cc   9a7a0050fa      CALLF       scsi_init                               ;void scsi_init(void)
ram:f000:81d1   fb              STI                                                  
                            LAB_f000_81d2:                ;XREF[1,0]:   f000:81e0
ram:f000:81d2   b8f01f          MOV         AX,0x1ff0                               
ram:f000:81d5   8ed8            MOV         DS,AX                                   
ram:f000:81d7   a1f200          MOV         AX,[offset STATE_FLAGS &0xff]           
ram:f000:81da   a90400          TEST        AX,0x4                                  
ram:f000:81dd   7503            JNZ         LAB_f000_81e2                           
ram:f000:81df   f4              HLT                                                  
ram:f000:81e0   ebf0            JMP         LAB_f000_81d2                           
                            LAB_f000_81e2:                ;XREF[1,0]:   f000:81dd
ram:f000:81e2   9ab00060f8      CALLF       loop_and_handle_jobs                    ;void loop_and_handle_jobs(void)
ram:f000:81e7   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*  Initialize interrupt and timer control registers,                                           *
                            ;*  and register interrupt vectors.                                                             *
                            ;************************************************************************************************
                            ;undefined init_vectors(void)
                                                          ;XREF[1,0]:   f000:8159
ram:f000:81ec   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:81f1   81ec0000        SUB         SP,0x0                                  
ram:f000:81f5   b840c0          MOV         AX,0xc040                               
ram:f000:81f8   8ed8            MOV         DS,AX                                   
ram:f000:81fa   c7062c000000    MOV         word ptr [offset INT_IN_SVC &0xff],0x0  
ram:f000:8200   b840c0          MOV         AX,0xc040                               
ram:f000:8203   8ed8            MOV         DS,AX                                   
ram:f000:8205   c70638000900    MOV         word ptr [offset INT0_CTRL &0xff],0x9   
ram:f000:820b   b840c0          MOV         AX,0xc040                               
ram:f000:820e   8ed8            MOV         DS,AX                                   
ram:f000:8210   c7063a000a00    MOV         word ptr [offset INT1_CTRL &0xff],0xa   
ram:f000:8216   b840c0          MOV         AX,0xc040                               
ram:f000:8219   8ed8            MOV         DS,AX                                   
ram:f000:821b   c70632000b00    MOV         word ptr [offset...,0xb                 
ram:f000:8221   b840c0          MOV         AX,0xc040                               
ram:f000:8224   8ed8            MOV         DS,AX                                   
ram:f000:8226   c7063c001f00    MOV         word ptr [offset INT2_CTRL &0xff],0x1f  
ram:f000:822c   b840c0          MOV         AX,0xc040                               
ram:f000:822f   8ed8            MOV         DS,AX                                   
ram:f000:8231   c7063e000c00    MOV         word ptr [offset INT3_CTRL &0xff],0xc   
ram:f000:8237   b840c0          MOV         AX,0xc040                               
ram:f000:823a   8ed8            MOV         DS,AX                                   
ram:f000:823c   c70634000f00    MOV         word ptr [offset...,0xf                 
ram:f000:8242   b840c0          MOV         AX,0xc040                               
ram:f000:8245   8ed8            MOV         DS,AX                                   
ram:f000:8247   c70636000f00    MOV         word ptr [offset...,0xf                 
ram:f000:824d   b80000          MOV         AX,0x0                                  
ram:f000:8250   8ed8            MOV         DS,AX                                   
ram:f000:8252   c70600006800    MOV         word ptr [0x0],0x68                     
ram:f000:8258   c706020080f8    MOV         word ptr [0x2],0xf880                   
ram:f000:825e   b80000          MOV         AX,0x0                                  
ram:f000:8261   8ed8            MOV         DS,AX                                   
                            ;Single Step Vector getes set to 0xf8868
ram:f000:8263   c70604006800    MOV         word ptr [SING_STEP_VEC_IP],0x68        
ram:f000:8269   c706060080f8    MOV         word ptr [SING_STEP_VEC_CS],0xf880      
ram:f000:826f   b80000          MOV         AX,0x0                                  
ram:f000:8272   8ed8            MOV         DS,AX                                   
                            ;NMI Vector gets set to 0xf8868
ram:f000:8274   c70608006800    MOV         word ptr [NMI_VEC_IP],0x68              
ram:f000:827a   c7060a0080f8    MOV         word ptr [NMI_VEC_CS],0xf880            
ram:f000:8280   b80000          MOV         AX,0x0                                  
ram:f000:8283   8ed8            MOV         DS,AX                                   
                            ;Breakpoint Vector gets set to 0xf8868
ram:f000:8285   c7060c006800    MOV         word ptr [BPT_VEC_IP],0x68              
ram:f000:828b   c7060e0080f8    MOV         word ptr [BPT_VEC_CS],0xf880            
ram:f000:8291   b80000          MOV         AX,0x0                                  
ram:f000:8294   8ed8            MOV         DS,AX                                   
                            ;Overflow Vector gets set to 0xf8868
ram:f000:8296   c70610006800    MOV         word ptr [OVRFL_VEC_IP],0x68            
ram:f000:829c   c706120080f8    MOV         word ptr [OVRFL_VEC_CS],0xf880          
ram:f000:82a2   b80000          MOV         AX,0x0                                  
ram:f000:82a5   8ed8            MOV         DS,AX                                   
                            ;Array Bounds Vector gets set to 0xf8868
ram:f000:82a7   c70614006800    MOV         word ptr [ARY_BNDS_VEC_IP],0x68         
ram:f000:82ad   c706160080f8    MOV         word ptr [ARY_BNDS_VEC_CS],0xf880       
ram:f000:82b3   b80000          MOV         AX,0x0                                  
ram:f000:82b6   8ed8            MOV         DS,AX                                   
ram:f000:82b8   c70618006800    MOV         word ptr [UNUSED_OPCODE_VEC_IP],0x68    
ram:f000:82be   c7061a0080f8    MOV         word ptr [UNUSED_OPCODE_VEC_CS],0xf880  
ram:f000:82c4   b80000          MOV         AX,0x0                                  
ram:f000:82c7   8ed8            MOV         DS,AX                                   
ram:f000:82c9   c7061c006800    MOV         word ptr [ESC_OP_VEC_IP],0x68           
ram:f000:82cf   c7061e0080f8    MOV         word ptr [ESC_OP_VEC_CS],0xf880         
ram:f000:82d5   b80000          MOV         AX,0x0                                  
ram:f000:82d8   8ed8            MOV         DS,AX                                   
ram:f000:82da   c70620005c00    MOV         word ptr [TIMER0_VEC_IP],0x5c           
ram:f000:82e0   c706220080f8    MOV         word ptr [TIMER0_VEC_CS],0xf880         
ram:f000:82e6   b80000          MOV         AX,0x0                                  
ram:f000:82e9   8ed8            MOV         DS,AX                                   
ram:f000:82eb   c70624005c00    MOV         word ptr [DAT_0000_0024],0x5c           
ram:f000:82f1   c706260080f8    MOV         word ptr [DAT_0000_0026],0xf880         
ram:f000:82f7   b80000          MOV         AX,0x0                                  
ram:f000:82fa   8ed8            MOV         DS,AX                                   
ram:f000:82fc   c70628005c00    MOV         word ptr [DMA0_VEC_IP],0x5c             
ram:f000:8302   c7062a0080f8    MOV         word ptr [DMA0_VEC_CS],0xf880           
ram:f000:8308   b80000          MOV         AX,0x0                                  
ram:f000:830b   8ed8            MOV         DS,AX                                   
ram:f000:830d   c7062c005c00    MOV         word ptr [DMA1_VEC_IP],0x5c             
ram:f000:8313   c7062e0080f8    MOV         word ptr [DMA1_VEC_CS],0xf880           
ram:f000:8319   b80000          MOV         AX,0x0                                  
ram:f000:831c   8ed8            MOV         DS,AX                                   
ram:f000:831e   c70630007400    MOV         word ptr [INT0_VEC_IP],0x74             
ram:f000:8324   c706320080f8    MOV         word ptr [INT0_VEC_CS],0xf880           
ram:f000:832a   b80000          MOV         AX,0x0                                  
ram:f000:832d   8ed8            MOV         DS,AX                                   
ram:f000:832f   c70634005c00    MOV         word ptr [INT1_VEC_IP],0x5c             
ram:f000:8335   c706360080f8    MOV         word ptr [INT1_VEC_CS],0xf880           
ram:f000:833b   b80000          MOV         AX,0x0                                  
ram:f000:833e   8ed8            MOV         DS,AX                                   
ram:f000:8340   c7063800a400    MOV         word ptr [INT2_VEC_IP],0xa4             
ram:f000:8346   c7063a0080f8    MOV         word ptr [INT2_VEC_CS],0xf880           
ram:f000:834c   b80000          MOV         AX,0x0                                  
ram:f000:834f   8ed8            MOV         DS,AX                                   
ram:f000:8351   c7063c00b000    MOV         word ptr [INT3_VEC_IP],0xb0             
ram:f000:8357   c7063e0080f8    MOV         word ptr [INT3_VEC_CS],0xf880           
ram:f000:835d   b80000          MOV         AX,0x0                                  
ram:f000:8360   8ed8            MOV         DS,AX                                   
ram:f000:8362   c70640005c00    MOV         word ptr [DAT_0000_0040],0x5c           
ram:f000:8368   c706420080f8    MOV         word ptr [DAT_0000_0042],0xf880         
ram:f000:836e   b80000          MOV         AX,0x0                                  
ram:f000:8371   8ed8            MOV         DS,AX                                   
ram:f000:8373   c70644005c00    MOV         word ptr [DAT_0000_0044],0x5c           
ram:f000:8379   c706460080f8    MOV         word ptr [DAT_0000_0046],0xf880         
ram:f000:837f   b80000          MOV         AX,0x0                                  
ram:f000:8382   8ed8            MOV         DS,AX                                   
ram:f000:8384   c70648005c00    MOV         word ptr [DAT_0000_0048],0x5c           
ram:f000:838a   c7064a0080f8    MOV         word ptr [DAT_0000_004a],0xf880         
ram:f000:8390   b80000          MOV         AX,0x0                                  
ram:f000:8393   8ed8            MOV         DS,AX                                   
ram:f000:8395   c7064c00bc00    MOV         word ptr [TIMER2_INT_VEC_IP],0xbc       
ram:f000:839b   c7064e0080f8    MOV         word ptr [TIMER2_INT_VEC_CS],0xf880     
ram:f000:83a1   b80000          MOV         AX,0x0                                  
ram:f000:83a4   8ed8            MOV         DS,AX                                   
ram:f000:83a6   c70650005c00    MOV         word ptr [DAT_0000_0050],0x5c           
ram:f000:83ac   c706520080f8    MOV         word ptr [DAT_0000_0052],0xf880         
ram:f000:83b2   b80000          MOV         AX,0x0                                  
ram:f000:83b5   8ed8            MOV         DS,AX                                   
ram:f000:83b7   c70654005c00    MOV         word ptr [DAT_0000_0054],0x5c           
ram:f000:83bd   c706560080f8    MOV         word ptr [DAT_0000_0056],0xf880         
ram:f000:83c3   b80000          MOV         AX,0x0                                  
ram:f000:83c6   8ed8            MOV         DS,AX                                   
ram:f000:83c8   c70658005c00    MOV         word ptr [DAT_0000_0058],0x5c           
ram:f000:83ce   c7065a0080f8    MOV         word ptr [DAT_0000_005a],0xf880         
ram:f000:83d4   b80000          MOV         AX,0x0                                  
ram:f000:83d7   8ed8            MOV         DS,AX                                   
ram:f000:83d9   c7065c005c00    MOV         word ptr [DAT_0000_005c],0x5c           
ram:f000:83df   c7065e0080f8    MOV         word ptr [DAT_0000_005e],0xf880         
ram:f000:83e5   b80000          MOV         AX,0x0                                  
ram:f000:83e8   8ed8            MOV         DS,AX                                   
ram:f000:83ea   c70660005c00    MOV         word ptr [DAT_0000_0060],0x5c           
ram:f000:83f0   c706620080f8    MOV         word ptr [DAT_0000_0062],0xf880         
ram:f000:83f6   b80000          MOV         AX,0x0                                  
ram:f000:83f9   8ed8            MOV         DS,AX                                   
ram:f000:83fb   c70664005c00    MOV         word ptr [DAT_0000_0064],0x5c           
ram:f000:8401   c706660080f8    MOV         word ptr [DAT_0000_0066],0xf880         
ram:f000:8407   b80000          MOV         AX,0x0                                  
ram:f000:840a   8ed8            MOV         DS,AX                                   
ram:f000:840c   c70668005c00    MOV         word ptr [DAT_0000_0068],0x5c           
ram:f000:8412   c7066a0080f8    MOV         word ptr [DAT_0000_006a],0xf880         
ram:f000:8418   b80000          MOV         AX,0x0                                  
ram:f000:841b   8ed8            MOV         DS,AX                                   
ram:f000:841d   c7066c005c00    MOV         word ptr [DAT_0000_006c],0x5c           
ram:f000:8423   c7066e0080f8    MOV         word ptr [DAT_0000_006e],0xf880         
ram:f000:8429   b80000          MOV         AX,0x0                                  
ram:f000:842c   8ed8            MOV         DS,AX                                   
ram:f000:842e   c70670005c00    MOV         word ptr [DAT_0000_0070],0x5c           
ram:f000:8434   c706720080f8    MOV         word ptr [DAT_0000_0072],0xf880         
ram:f000:843a   b80000          MOV         AX,0x0                                  
ram:f000:843d   8ed8            MOV         DS,AX                                   
ram:f000:843f   c70674005c00    MOV         word ptr [DAT_0000_0074],0x5c           
ram:f000:8445   c706760080f8    MOV         word ptr [DAT_0000_0076],0xf880         
ram:f000:844b   b80000          MOV         AX,0x0                                  
ram:f000:844e   8ed8            MOV         DS,AX                                   
ram:f000:8450   c70678005c00    MOV         word ptr [DAT_0000_0078],0x5c           
ram:f000:8456   c7067a0080f8    MOV         word ptr [DAT_0000_007a],0xf880         
ram:f000:845c   b80000          MOV         AX,0x0                                  
ram:f000:845f   8ed8            MOV         DS,AX                                   
ram:f000:8461   c7067c005c00    MOV         word ptr [DAT_0000_007c],0x5c           
ram:f000:8467   c7067e0080f8    MOV         word ptr [DAT_0000_007e],0xf880         
ram:f000:846d   ea7e00e0fd      JMPF        function_return                         
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void start_timers(void)
                                                          ;XREF[1,0]:   f000:80af
ram:f000:8472   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:8477   81ec0200        SUB         SP,0x2                                  
ram:f000:847b   c646ff00        MOV         byte ptr [BP + -0x1],0x0                
ram:f000:847f   b840c0          MOV         AX,0xc040                               
ram:f000:8482   8ed8            MOV         DS,AX                                   
ram:f000:8484   c70662000000    MOV         word ptr [offset...,0x0                 
ram:f000:848a   b840c0          MOV         AX,0xc040                               
ram:f000:848d   8ed8            MOV         DS,AX                                   
ram:f000:848f   c7066000ff00    MOV         word ptr [offset TIMER2_CNT &0xff],0xff 
ram:f000:8495   b840c0          MOV         AX,0xc040                               
ram:f000:8498   8ed8            MOV         DS,AX                                   
ram:f000:849a   c706660001c0    MOV         word ptr [offset...,0xc001              
ram:f000:84a0   b840c0          MOV         AX,0xc040                               
ram:f000:84a3   8ed8            MOV         DS,AX                                   
ram:f000:84a5   c70650000000    MOV         word ptr [offset TIMER0_CNT &0xff],0x0  
ram:f000:84ab   b840c0          MOV         AX,0xc040                               
ram:f000:84ae   8ed8            MOV         DS,AX                                   
ram:f000:84b0   c70652000300    MOV         word ptr [offset...,0x3                 
ram:f000:84b6   b840c0          MOV         AX,0xc040                               
ram:f000:84b9   8ed8            MOV         DS,AX                                   
ram:f000:84bb   c7065400ff02    MOV         word ptr [offset...,0x2ff               
ram:f000:84c1   b840c0          MOV         AX,0xc040                               
ram:f000:84c4   8ed8            MOV         DS,AX                                   
ram:f000:84c6   c70656000ac0    MOV         word ptr [offset...,0xc00a              
ram:f000:84cc   bfffff          MOV         DI,0xffff                               
                            LAB_f000_84cf:                ;XREF[1,0]:   f000:84d4
ram:f000:84cf   85ff            TEST        DI,DI                                   
ram:f000:84d1   7403            JZ          LAB_f000_84d6                           
ram:f000:84d3   4f              DEC         DI                                      
ram:f000:84d4   ebf9            JMP         LAB_f000_84cf                           
                            LAB_f000_84d6:                ;XREF[2,0]:   f000:84d1,f000:8552
ram:f000:84d6   fe46ff          INC         byte ptr [BP + -0x1]                    
ram:f000:84d9   9a0c00b0fd      CALLF       test_registers                          ;undefined2 test_registers(void)
ram:f000:84de   85c0            TEST        AX,AX                                   
ram:f000:84e0   7412            JZ          LAB_f000_84f4                           
ram:f000:84e2   8a46ff          MOV         AL,byte ptr [BP + -0x1]                 
ram:f000:84e5   30e4            XOR         AH,AH                                   
ram:f000:84e7   50              PUSH        AX                                      
ram:f000:84e8   9a590050f8      CALLF       FUN_f000_8559                           ;undefined2 FUN_f000_8559(void)
ram:f000:84ed   83c402          ADD         SP,0x2                                  
ram:f000:84f0   85c0            TEST        AX,AX                                   
ram:f000:84f2   7533            JNZ         LAB_f000_8527                           
                            LAB_f000_84f4:                ;XREF[1,0]:   f000:84e0
ram:f000:84f4   b840c0          MOV         AX,0xc040                               
ram:f000:84f7   8ed8            MOV         DS,AX                                   
ram:f000:84f9   c70656000040    MOV         word ptr [offset...,0x4000              
ram:f000:84ff   b840c0          MOV         AX,0xc040                               
ram:f000:8502   8ed8            MOV         DS,AX                                   
ram:f000:8504   c70650000000    MOV         word ptr [offset TIMER0_CNT &0xff],0x0  
ram:f000:850a   b840c0          MOV         AX,0xc040                               
ram:f000:850d   8ed8            MOV         DS,AX                                   
ram:f000:850f   c70652000100    MOV         word ptr [offset...,0x1                 
ram:f000:8515   b840c0          MOV         AX,0xc040                               
ram:f000:8518   8ed8            MOV         DS,AX                                   
ram:f000:851a   c706560000c0    MOV         word ptr [offset...,0xc000              
ram:f000:8520   9a8b0050fd      CALLF       FUN_f000_d58b                           ;void FUN_f000_d58b(void)
ram:f000:8525   eb2b            JMP         LAB_f000_8552                           
                            LAB_f000_8527:                ;XREF[1,0]:   f000:84f2
ram:f000:8527   b840c0          MOV         AX,0xc040                               
ram:f000:852a   8ed8            MOV         DS,AX                                   
ram:f000:852c   c70656000040    MOV         word ptr [offset...,0x4000              
ram:f000:8532   b840c0          MOV         AX,0xc040                               
ram:f000:8535   8ed8            MOV         DS,AX                                   
ram:f000:8537   c70650000000    MOV         word ptr [offset TIMER0_CNT &0xff],0x0  
ram:f000:853d   b840c0          MOV         AX,0xc040                               
ram:f000:8540   8ed8            MOV         DS,AX                                   
ram:f000:8542   c70656000ac0    MOV         word ptr [offset...,0xc00a              
ram:f000:8548   bfffff          MOV         DI,0xffff                               
                            LAB_f000_854b:                ;XREF[1,0]:   f000:8550
ram:f000:854b   85ff            TEST        DI,DI                                   
ram:f000:854d   7403            JZ          LAB_f000_8552                           
ram:f000:854f   4f              DEC         DI                                      
ram:f000:8550   ebf9            JMP         LAB_f000_854b                           
                            LAB_f000_8552:                ;XREF[2,0]:   f000:8525,f000:854d
ram:f000:8552   eb82            JMP         LAB_f000_84d6                           
ram:f000:8554   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 FUN_f000_8559(void)
                                                          ;XREF[1,0]:   f000:84e8
ram:f000:8559   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:855e   81ec0400        SUB         SP,0x4                                  
ram:f000:8562   c746fc0000      MOV         word ptr [BP + -0x4],0x0                
ram:f000:8567   c746fe0000      MOV         word ptr [BP + -0x2],0x0                
ram:f000:856c   8a460e          MOV         AL,byte ptr [BP + 0xe]                  
ram:f000:856f   30e4            XOR         AH,AH                                   
ram:f000:8571   50              PUSH        AX                                      
ram:f000:8572   b80a00          MOV         AX,0xa                                  
ram:f000:8575   50              PUSH        AX                                      
ram:f000:8576   ff76fe          PUSH        word ptr [BP + -0x2]                    
ram:f000:8579   ff76fc          PUSH        word ptr [BP + -0x4]                    
ram:f000:857c   9aea0020fd      CALLF       FUN_f000_d2ea                           ;void FUN_f000_d2ea(void)
ram:f000:8581   83c408          ADD         SP,0x8                                  
ram:f000:8584   31ff            XOR         DI,DI                                   
                            LAB_f000_8586:                ;XREF[1,0]:   f000:85ab
ram:f000:8586   83ff0a          CMP         DI,0xa                                  
ram:f000:8589   7d22            JGE         LAB_f000_85ad                           
ram:f000:858b   c576fc          LDS         SI,[BP + -0x4]                          
ram:f000:858e   8a04            MOV         AL,byte ptr [SI]                        
ram:f000:8590   30e4            XOR         AH,AH                                   
ram:f000:8592   8a560e          MOV         DL,byte ptr [BP + 0xe]                  
ram:f000:8595   30f6            XOR         DH,DH                                   
ram:f000:8597   3bc2            CMP         AX,DX                                   
ram:f000:8599   7405            JZ          LAB_f000_85a0                           
ram:f000:859b   b80000          MOV         AX,0x0                                  
ram:f000:859e   eb12            JMP         LAB_f000_85b2                           
                            LAB_f000_85a0:                ;XREF[1,0]:   f000:8599
ram:f000:85a0   8046fc01        ADD         byte ptr [BP + -0x4],0x1                
ram:f000:85a4   7304            JNC         LAB_f000_85aa                           
ram:f000:85a6   8346fe10        ADD         word ptr [BP + -0x2],0x10               
                            LAB_f000_85aa:                ;XREF[1,0]:   f000:85a4
ram:f000:85aa   47              INC         DI                                      
ram:f000:85ab   ebd9            JMP         LAB_f000_8586                           
                            LAB_f000_85ad:                ;XREF[1,0]:   f000:8589
ram:f000:85ad   b80100          MOV         AX,0x1                                  
ram:f000:85b0   eb00            JMP         LAB_f000_85b2                           
                            LAB_f000_85b2:                ;XREF[2,0]:   f000:859e,f000:85b0
ram:f000:85b2   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined init_state(void)
                                                          ;XREF[2,0]:   f000:8c14,f000:cdbc
ram:f000:85b7   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:85bc   81ec0000        SUB         SP,0x0                                  
ram:f000:85c0   fa              CLI                                                  
ram:f000:85c1   b840c0          MOV         AX,0xc040                               
ram:f000:85c4   8ed8            MOV         DS,AX                                   
ram:f000:85c6   c70656000040    MOV         word ptr [offset...,0x4000              
ram:f000:85cc   b840c0          MOV         AX,0xc040                               
ram:f000:85cf   8ed8            MOV         DS,AX                                   
ram:f000:85d1   c70650000000    MOV         word ptr [offset TIMER0_CNT &0xff],0x0  
ram:f000:85d7   b840c0          MOV         AX,0xc040                               
ram:f000:85da   8ed8            MOV         DS,AX                                   
ram:f000:85dc   c70652000000    MOV         word ptr [offset...,0x0                 
ram:f000:85e2   b840c0          MOV         AX,0xc040                               
ram:f000:85e5   8ed8            MOV         DS,AX                                   
ram:f000:85e7   c70654000000    MOV         word ptr [offset...,0x0                 
ram:f000:85ed   b840c0          MOV         AX,0xc040                               
ram:f000:85f0   8ed8            MOV         DS,AX                                   
ram:f000:85f2   c70666000040    MOV         word ptr [offset...,0x4000              
ram:f000:85f8   b840c0          MOV         AX,0xc040                               
ram:f000:85fb   8ed8            MOV         DS,AX                                   
ram:f000:85fd   c70660000000    MOV         word ptr [offset TIMER2_CNT &0xff],0x0  
ram:f000:8603   b840c0          MOV         AX,0xc040                               
ram:f000:8606   8ed8            MOV         DS,AX                                   
ram:f000:8608   c70662000000    MOV         word ptr [offset...,0x0                 
ram:f000:860e   b800c0          MOV         AX,0xc000                               
ram:f000:8611   8ed8            MOV         DS,AX                                   
ram:f000:8613   c606880000      MOV         byte ptr [PCSR_0_INT0],0x0              
ram:f000:8618   b800c0          MOV         AX,0xc000                               
ram:f000:861b   8ed8            MOV         DS,AX                                   
ram:f000:861d   c606890000      MOV         byte ptr [PCSR_1_INT1],0x0              
ram:f000:8622   b800c0          MOV         AX,0xc000                               
ram:f000:8625   8ed8            MOV         DS,AX                                   
ram:f000:8627   c6068a0000      MOV         byte ptr [PCSR_2_INT2],0x0              
ram:f000:862c   b800c0          MOV         AX,0xc000                               
ram:f000:862f   8ed8            MOV         DS,AX                                   
ram:f000:8631   c6068b0000      MOV         byte ptr [PCSR_3_INT3],0x0              
ram:f000:8636   b800c0          MOV         AX,0xc000                               
ram:f000:8639   8ed8            MOV         DS,AX                                   
ram:f000:863b   c6068c0000      MOV         byte ptr [PCSR_4_INT3],0x0              
ram:f000:8640   b840c0          MOV         AX,0xc040                               
ram:f000:8643   8ed8            MOV         DS,AX                                   
ram:f000:8645   c7062c000000    MOV         word ptr [offset INT_IN_SVC &0xff],0x0  
ram:f000:864b   b840c0          MOV         AX,0xc040                               
ram:f000:864e   8ed8            MOV         DS,AX                                   
ram:f000:8650   c70632000f00    MOV         word ptr [offset TIMER_CTRL &0xff],0xf  
ram:f000:8656   b840c0          MOV         AX,0xc040                               
ram:f000:8659   8ed8            MOV         DS,AX                                   
ram:f000:865b   c70634000f00    MOV         word ptr [offset...,0xf                 
ram:f000:8661   b840c0          MOV         AX,0xc040                               
ram:f000:8664   8ed8            MOV         DS,AX                                   
ram:f000:8666   c70636000f00    MOV         word ptr [offset...,0xf                 
ram:f000:866c   b840c0          MOV         AX,0xc040                               
ram:f000:866f   8ed8            MOV         DS,AX                                   
ram:f000:8671   c70638000f00    MOV         word ptr [offset INT0_CTRL &0xff],0xf   
ram:f000:8677   b840c0          MOV         AX,0xc040                               
ram:f000:867a   8ed8            MOV         DS,AX                                   
ram:f000:867c   c7063a000f00    MOV         word ptr [offset INT1_CTRL &0xff],0xf   
ram:f000:8682   b840c0          MOV         AX,0xc040                               
ram:f000:8685   8ed8            MOV         DS,AX                                   
ram:f000:8687   c7063c000f00    MOV         word ptr [offset INT2_CTRL &0xff],0xf   
ram:f000:868d   b840c0          MOV         AX,0xc040                               
ram:f000:8690   8ed8            MOV         DS,AX                                   
ram:f000:8692   c7063e000f00    MOV         word ptr [offset INT3_CTRL &0xff],0xf   
ram:f000:8698   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 return_success(void)
                                                          ;XREF[2,0]:   f000:c811,f000:c8ed
ram:f000:869d   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:86a2   81ec0000        SUB         SP,0x0                                  
ram:f000:86a6   b80100          MOV         AX,0x1                                  
ram:f000:86a9   eb00            JMP         LAB_f000_86ab                           
                            LAB_f000_86ab:                ;XREF[1,0]:   f000:86a9
ram:f000:86ab   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void loop_and_handle_jobs(void)
                                                          ;XREF[1,0]:   f000:81e2
ram:f000:86b0   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:86b5   81ec0000        SUB         SP,0x0                                  
ram:f000:86b9   b8301f          MOV         AX,0x1f30                               
ram:f000:86bc   8ed8            MOV         DS,AX                                   
ram:f000:86be   f706e600ffff    TEST        word ptr [offset...,0xffff              
ram:f000:86c4   7405            JZ          LAB_f000_86cb                           
ram:f000:86c6   9a0800a0fc      CALLF       pre_sysgen_loop                         ;void pre_sysgen_loop(void)
                            LAB_f000_86cb:                ;XREF[1,0]:   f000:86c4
ram:f000:86cb   b8001f          MOV         AX,0x1f00                               
ram:f000:86ce   8ed8            MOV         DS,AX                                   
ram:f000:86d0   c606010000      MOV         byte ptr [offset job_pending &0xff],0x0 
ram:f000:86d5   b8001f          MOV         AX,0x1f00                               
ram:f000:86d8   8ed8            MOV         DS,AX                                   
ram:f000:86da   c606000000      MOV         byte ptr [0x0]=>express_job_pending,0x0 
ram:f000:86df   fa              CLI                                                  
ram:f000:86e0   b80000          MOV         AX,0x0                                  
ram:f000:86e3   8ed8            MOV         DS,AX                                   
ram:f000:86e5   c70630008c00    MOV         word ptr [INT0_VEC_IP],0x8c             
ram:f000:86eb   c706320080f8    MOV         word ptr [INT0_VEC_CS],0xf880           
ram:f000:86f1   b80000          MOV         AX,0x0                                  
ram:f000:86f4   8ed8            MOV         DS,AX                                   
ram:f000:86f6   c70634009800    MOV         word ptr [INT1_VEC_IP],0x98             
ram:f000:86fc   c706360080f8    MOV         word ptr [INT1_VEC_CS],0xf880           
ram:f000:8702   b840c0          MOV         AX,0xc040                               
ram:f000:8705   8ed8            MOV         DS,AX                                   
ram:f000:8707   81263800f7ff    AND         word ptr [offset INT0_CTRL &0xff],0xfff7
ram:f000:870d   b840c0          MOV         AX,0xc040                               
ram:f000:8710   8ed8            MOV         DS,AX                                   
ram:f000:8712   81263a00f7ff    AND         word ptr [offset INT1_CTRL &0xff],0xfff7
ram:f000:8718   fb              STI                                                  
                            LAB_f000_8719:                ;XREF[1,0]:   f000:8854
ram:f000:8719   b8001f          MOV         AX,0x1f00                               
ram:f000:871c   8ed8            MOV         DS,AX                                   
ram:f000:871e   f6060000ff      TEST        byte ptr [0x0]=>express_job_pending,0xff
ram:f000:8723   7503            JNZ         LAB_f000_8728                           
ram:f000:8725   e98b00          JMP         LAB_f000_87b3                           
                            LAB_f000_8728:                ;XREF[1,0]:   f000:8723
ram:f000:8728   bf001f          MOV         DI,0x1f00                               
ram:f000:872b   8ec7            MOV         ES,DI                                   
ram:f000:872d   bf2600          MOV         DI,0x26                                 
ram:f000:8730   be001f          MOV         SI,0x1f00                               
ram:f000:8733   8ede            MOV         DS,SI                                   
ram:f000:8735   c5362200        LDS         SI,[offset JOB_Q_IP &0xff]              
ram:f000:8739   b90400          MOV         CX,0x4                                  
ram:f000:873c   fc              CLD                                                  
ram:f000:873d   f2a5            MOVSW       ES:DI=>DAT_1000_f026,SI                 
ram:f000:873f   be001f          MOV         SI,0x1f00                               
ram:f000:8742   8ede            MOV         DS,SI                                   
ram:f000:8744   c5362200        LDS         SI,[offset JOB_Q_IP &0xff]              
ram:f000:8748   8a4403          MOV         AL,byte ptr [SI + 0x3]                  
ram:f000:874b   30e4            XOR         AH,AH                                   
ram:f000:874d   ba001f          MOV         DX,0x1f00                               
ram:f000:8750   8eda            MOV         DS,DX                                   
ram:f000:8752   a22e00          MOV         [offset JOB_OPCODE &0xff],AL            
ram:f000:8755   be001f          MOV         SI,0x1f00                               
ram:f000:8758   8ede            MOV         DS,SI                                   
ram:f000:875a   c5362200        LDS         SI,[offset JOB_Q_IP &0xff]              
ram:f000:875e   ff740a          PUSH        word ptr [SI + 0xa]                     
ram:f000:8761   ff7408          PUSH        word ptr [SI + 0x8]                     
ram:f000:8764   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:8769   83c404          ADD         SP,0x4                                  
ram:f000:876c   b9001f          MOV         CX,0x1f00                               
ram:f000:876f   8ed9            MOV         DS,CX                                   
ram:f000:8771   a32a00          MOV         [offset DAT_1000_f02a &0xff],AX         
ram:f000:8774   89162c00        MOV         word ptr [offset DAT_1000_f02c &0xff],DX
ram:f000:8778   b80100          MOV         AX,0x1                                  
ram:f000:877b   50              PUSH        AX                                      
ram:f000:877c   b8001f          MOV         AX,0x1f00                               
ram:f000:877f   8ed8            MOV         DS,AX                                   
ram:f000:8781   ff362400        PUSH        word ptr [offset JOB_Q_CS &0xff]        
ram:f000:8785   ff362200        PUSH        word ptr [offset JOB_Q_IP &0xff]        
ram:f000:8789   9ae00080f8      CALLF       handle_job                              ;void handle_job(void)
ram:f000:878e   83c406          ADD         SP,0x6                                  
ram:f000:8791   ba001f          MOV         DX,0x1f00                               
ram:f000:8794   8eda            MOV         DS,DX                                   
ram:f000:8796   a22900          MOV         [offset DAT_1000_f029 &0xff],AL         
ram:f000:8799   b8001f          MOV         AX,0x1f00                               
ram:f000:879c   8ed8            MOV         DS,AX                                   
ram:f000:879e   c606000000      MOV         byte ptr [0x0]=>express_job_pending,0x0 
ram:f000:87a3   b8001f          MOV         AX,0x1f00                               
ram:f000:87a6   50              PUSH        AX                                      
ram:f000:87a7   b82600          MOV         AX,0x26                                 
ram:f000:87aa   50              PUSH        AX                                      
ram:f000:87ab   9aa70000f9      CALLF       after_express_job                       ;void after_express_job(void)
ram:f000:87b0   83c404          ADD         SP,0x4                                  
                            LAB_f000_87b3:                ;XREF[1,0]:   f000:8725
ram:f000:87b3   b8001f          MOV         AX,0x1f00                               
ram:f000:87b6   8ed8            MOV         DS,AX                                   
ram:f000:87b8   f6060100ff      TEST        byte ptr [offset job_pending &0xff],0xff
ram:f000:87bd   7503            JNZ         LAB_f000_87c2                           
ram:f000:87bf   e99200          JMP         LAB_f000_8854                           
                            LAB_f000_87c2:                ;XREF[1,0]:   f000:87bd
ram:f000:87c2   bf001f          MOV         DI,0x1f00                               
ram:f000:87c5   8ec7            MOV         ES,DI                                   
ram:f000:87c7   bf2600          MOV         DI,0x26                                 
ram:f000:87ca   be001f          MOV         SI,0x1f00                               
ram:f000:87cd   8ede            MOV         DS,SI                                   
ram:f000:87cf   c5362200        LDS         SI,[offset JOB_Q_IP &0xff]              
ram:f000:87d3   b90400          MOV         CX,0x4                                  
ram:f000:87d6   fc              CLD                                                  
ram:f000:87d7   f2a5            MOVSW       ES:DI=>DAT_1000_f026,SI                 
ram:f000:87d9   be001f          MOV         SI,0x1f00                               
ram:f000:87dc   8ede            MOV         DS,SI                                   
ram:f000:87de   c5362200        LDS         SI,[offset JOB_Q_IP &0xff]              
ram:f000:87e2   8a4403          MOV         AL,byte ptr [SI + 0x3]                  
ram:f000:87e5   30e4            XOR         AH,AH                                   
ram:f000:87e7   ba001f          MOV         DX,0x1f00                               
ram:f000:87ea   8eda            MOV         DS,DX                                   
ram:f000:87ec   a22e00          MOV         [offset JOB_OPCODE &0xff],AL            
ram:f000:87ef   be001f          MOV         SI,0x1f00                               
ram:f000:87f2   8ede            MOV         DS,SI                                   
ram:f000:87f4   c5362200        LDS         SI,[offset JOB_Q_IP &0xff]              
ram:f000:87f8   ff740a          PUSH        word ptr [SI + 0xa]                     
ram:f000:87fb   ff7408          PUSH        word ptr [SI + 0x8]                     
ram:f000:87fe   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:8803   83c404          ADD         SP,0x4                                  
ram:f000:8806   b9001f          MOV         CX,0x1f00                               
ram:f000:8809   8ed9            MOV         DS,CX                                   
ram:f000:880b   a32a00          MOV         [offset DAT_1000_f02a &0xff],AX         
ram:f000:880e   89162c00        MOV         word ptr [offset DAT_1000_f02c &0xff],DX
ram:f000:8812   b80000          MOV         AX,0x0                                  
ram:f000:8815   50              PUSH        AX                                      
ram:f000:8816   b8001f          MOV         AX,0x1f00                               
ram:f000:8819   8ed8            MOV         DS,AX                                   
ram:f000:881b   ff362400        PUSH        word ptr [offset JOB_Q_CS &0xff]        
ram:f000:881f   ff362200        PUSH        word ptr [offset JOB_Q_IP &0xff]        
ram:f000:8823   9ae00080f8      CALLF       handle_job                              ;void handle_job(void)
ram:f000:8828   83c406          ADD         SP,0x6                                  
ram:f000:882b   ba001f          MOV         DX,0x1f00                               
ram:f000:882e   8eda            MOV         DS,DX                                   
ram:f000:8830   a22900          MOV         [offset DAT_1000_f029 &0xff],AL         
ram:f000:8833   b8001f          MOV         AX,0x1f00                               
ram:f000:8836   50              PUSH        AX                                      
ram:f000:8837   b82600          MOV         AX,0x26                                 
ram:f000:883a   50              PUSH        AX                                      
ram:f000:883b   9a660000f9      CALLF       after_full_job                          ;void after_full_job(void)
ram:f000:8840   83c404          ADD         SP,0x4                                  
ram:f000:8843   b8001f          MOV         AX,0x1f00                               
ram:f000:8846   8ed8            MOV         DS,AX                                   
ram:f000:8848   c606010000      MOV         byte ptr [offset job_pending &0xff],0x0 
ram:f000:884d   fa              CLI                                                  
ram:f000:884e   9ae40000f9      CALLF       find_next_available_job                 ;void find_next_available_job(void)
ram:f000:8853   fb              STI                                                  
                            LAB_f000_8854:                ;XREF[1,0]:   f000:87bf
ram:f000:8854   e9c2fe          JMP         LAB_f000_8719                           
ram:f000:8857   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;INTERRUPT HANDLER: Timer 0
                            TIMER0_HNDLR:                 
ram:f000:885c   60              PUSHA                                                
ram:f000:885d   06              PUSH        ES                                      
ram:f000:885e   1e              PUSH        DS                                      
ram:f000:885f   9ac900f0f8      CALLF       FUN_f000_8fc9                           ;void FUN_f000_8fc9(void)
ram:f000:8864   1f              POP         DS                                      
ram:f000:8865   07              POP         ES                                      
ram:f000:8866   61              POPA                                                 
ram:f000:8867   cf              IRET                                                 
                            ;INTERRUPT HANDLER: NMI Interrupts
                            NMI_HNDLR:                    
ram:f000:8868   60              PUSHA                                                
ram:f000:8869   06              PUSH        ES                                      
ram:f000:886a   1e              PUSH        DS                                      
ram:f000:886b   9ab700f0f8      CALLF       halt_on_error                           ;void halt_on_error(void)
ram:f000:8870   1f              POP         DS                                      
ram:f000:8871   07              POP         ES                                      
ram:f000:8872   61              POPA                                                 
ram:f000:8873   cf              IRET                                                 
                            ;INTERRUPT HANDLER: INT0
                            SYSGEN_INT0_HNDLR:            
ram:f000:8874   60              PUSHA                                                
ram:f000:8875   06              PUSH        ES                                      
ram:f000:8876   1e              PUSH        DS                                      
ram:f000:8877   9af900e0f8      CALLF       int0_sysgen                             ;void int0_sysgen(void)
ram:f000:887c   1f              POP         DS                                      
ram:f000:887d   07              POP         ES                                      
ram:f000:887e   61              POPA                                                 
ram:f000:887f   cf              IRET                                                 
                            SYSGEN_INT1_HNDLR:            
ram:f000:8880   60              PUSHA                                                
ram:f000:8881   06              PUSH        ES                                      
ram:f000:8882   1e              PUSH        DS                                      
ram:f000:8883   9a5f00f0f8      CALLF       int1_sysgen                             ;void int1_sysgen(void)
ram:f000:8888   1f              POP         DS                                      
ram:f000:8889   07              POP         ES                                      
ram:f000:888a   61              POPA                                                 
ram:f000:888b   cf              IRET                                                 
                            ;INTERRUPT HANDLER: INT0 (express)
                            EXPRESS_INT0_HNDLR:           
ram:f000:888c   60              PUSHA                                                
ram:f000:888d   06              PUSH        ES                                      
ram:f000:888e   1e              PUSH        DS                                      
ram:f000:888f   9aff00f0f8      CALLF       int0_express                            ;void int0_express(void)
ram:f000:8894   1f              POP         DS                                      
ram:f000:8895   07              POP         ES                                      
ram:f000:8896   61              POPA                                                 
ram:f000:8897   cf              IRET                                                 
                            ;INTERRUPT HANDLER: UNKNOWN
                            UNKNOWN_HNDLR_0:              
ram:f000:8898   60              PUSHA                                                
ram:f000:8899   06              PUSH        ES                                      
ram:f000:889a   1e              PUSH        DS                                      
ram:f000:889b   9ad700f0f8      CALLF       FUN_f000_8fd7                           ;void FUN_f000_8fd7(void)
ram:f000:88a0   1f              POP         DS                                      
ram:f000:88a1   07              POP         ES                                      
ram:f000:88a2   61              POPA                                                 
ram:f000:88a3   cf              IRET                                                 
                            ;INTERRUPT HANDLER: INT2
                            INT2_HNDLR:                   
ram:f000:88a4   60              PUSHA                                                
ram:f000:88a5   06              PUSH        ES                                      
ram:f000:88a6   1e              PUSH        DS                                      
ram:f000:88a7   9aec00e0f9      CALLF       scsi_interrupt_handler                  ;void scsi_interrupt_handler(void)
ram:f000:88ac   1f              POP         DS                                      
ram:f000:88ad   07              POP         ES                                      
ram:f000:88ae   61              POPA                                                 
ram:f000:88af   cf              IRET                                                 
                            ;INTERRUPT HANDLER: INT3
                            INT3_HNDLR:                   
ram:f000:88b0   60              PUSHA                                                
ram:f000:88b1   06              PUSH        ES                                      
ram:f000:88b2   1e              PUSH        DS                                      
ram:f000:88b3   9a1b00c0f9      CALLF       dma_end_interrupt_handler               ;void dma_end_interrupt_handler(void)
ram:f000:88b8   1f              POP         DS                                      
ram:f000:88b9   07              POP         ES                                      
ram:f000:88ba   61              POPA                                                 
ram:f000:88bb   cf              IRET                                                 
                            UNKNOWN_HNDLR_1:              
ram:f000:88bc   60              PUSHA                                                
ram:f000:88bd   06              PUSH        ES                                      
ram:f000:88be   1e              PUSH        DS                                      
ram:f000:88bf   9aac00e0f8      CALLF       FUN_f000_8eac                           ;void FUN_f000_8eac(void)
ram:f000:88c4   1f              POP         DS                                      
ram:f000:88c5   07              POP         ES                                      
ram:f000:88c6   61              POPA                                                 
ram:f000:88c7   cf              IRET                                                 
                            UNKNOWN_HNDLR_2:              
ram:f000:88c8   60              PUSHA                                                
ram:f000:88c9   06              PUSH        ES                                      
ram:f000:88ca   1e              PUSH        DS                                      
ram:f000:88cb   9ab80090fc      CALLF       FUN_f000_c9b8                           ;void FUN_f000_c9b8(void)
ram:f000:88d0   1f              POP         DS                                      
ram:f000:88d1   07              POP         ES                                      
ram:f000:88d2   61              POPA                                                 
ram:f000:88d3   cf              IRET                                                 
                            UNKNOWN_HNDLR_3:              
ram:f000:88d4   60              PUSHA                                                
ram:f000:88d5   06              PUSH        ES                                      
ram:f000:88d6   1e              PUSH        DS                                      
ram:f000:88d7   9ae00090fc      CALLF       FUN_f000_c9e0                           ;void FUN_f000_c9e0(void)
ram:f000:88dc   1f              POP         DS                                      
ram:f000:88dd   07              POP         ES                                      
ram:f000:88de   61              POPA                                                 
ram:f000:88df   cf              IRET                                                 
                            ;************************************************************************************************
                            ;*  Takes three arguments:                                                                      *
                            ;*                                                                                              *
                            ;*  1 & 2: Page and Offset to location to queue entry in memory.                                *
                            ;*  3: Flag (take job or complete job)                                                          *
                            ;************************************************************************************************
                            ;void handle_job(void)
                                                          ;XREF[2,0]:   f000:8789,f000:8823
ram:f000:88e0   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:88e5   81ec0000        SUB         SP,0x0                                  
ram:f000:88e9   8b7e12          MOV         DI,word ptr [BP + 0x12]                 
ram:f000:88ec   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:88ef   8a4403          MOV         AL,byte ptr [SI + 0x3]                  
ram:f000:88f2   30e4            XOR         AH,AH                                   
ram:f000:88f4   e9ef00          JMP         LAB_f000_89e6                           
                            LAB_f000_88f7:                ;XREF[1,0]:   f000:8a06
ram:f000:88f7   57              PUSH        DI                                      
ram:f000:88f8   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:88fb   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:88fe   9a7800a0f8      CALLF       scsi_dlm                                ;undefined2 scsi_dlm(void)
ram:f000:8903   83c406          ADD         SP,0x6                                  
ram:f000:8906   e96a01          JMP         LAB_f000_8a73                           
                            LAB_f000_8909:                ;XREF[1,0]:   f000:89fc
ram:f000:8909   57              PUSH        DI                                      
ram:f000:890a   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:890d   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:8910   9aeb00a0f8      CALLF       scsi_ulm                                ;undefined2 scsi_ulm(void)
ram:f000:8915   83c406          ADD         SP,0x6                                  
ram:f000:8918   e95801          JMP         LAB_f000_8a73                           
                            LAB_f000_891b:                ;XREF[1,0]:   f000:8a10
ram:f000:891b   57              PUSH        DI                                      
ram:f000:891c   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:891f   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:8922   9a5e00b0f8      CALLF       scsi_ffc                                ;void scsi_ffc(void)
ram:f000:8927   83c406          ADD         SP,0x6                                  
ram:f000:892a   e94601          JMP         LAB_f000_8a73                           
                            LAB_f000_892d:                ;XREF[1,0]:   f000:89f2
ram:f000:892d   b80000          MOV         AX,0x0                                  
ram:f000:8930   e94001          JMP         LAB_f000_8a73                           
                            LAB_f000_8933:                ;XREF[1,0]:   f000:8a24
ram:f000:8933   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:8936   ff7406          PUSH        word ptr [SI + 0x6]                     
ram:f000:8939   ff7404          PUSH        word ptr [SI + 0x4]                     
ram:f000:893c   9a2c00c0f8      CALLF       scsi_dsd                                ;undefined2 scsi_dsd(void)
ram:f000:8941   83c404          ADD         SP,0x4                                  
ram:f000:8944   e92c01          JMP         LAB_f000_8a73                           
                            CALL_SCSI_BOOT:               ;XREF[1,0]:   f000:8a1a
ram:f000:8947   57              PUSH        DI                                      
ram:f000:8948   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:894b   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:894e   9a1f0070fb      CALLF       scsi_boot                               ;undefined2 scsi_boot(void)
ram:f000:8953   83c406          ADD         SP,0x6                                  
ram:f000:8956   e91a01          JMP         LAB_f000_8a73                           
                            LAB_f000_8959:                ;XREF[1,0]:   f000:8a2e
ram:f000:8959   57              PUSH        DI                                      
ram:f000:895a   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:895d   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:8960   9ae20050fb      CALLF       scsi_next_block                         ;void scsi_next_block(void)
ram:f000:8965   83c406          ADD         SP,0x6                                  
ram:f000:8968   e90801          JMP         LAB_f000_8a73                           
                            LAB_f000_896b:                ;XREF[1,0]:   f000:89e9
ram:f000:896b   57              PUSH        DI                                      
ram:f000:896c   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:896f   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:8972   9aa50040fb      CALLF       FUN_f000_b4a5                           ;void FUN_f000_b4a5(void)
ram:f000:8977   83c406          ADD         SP,0x6                                  
ram:f000:897a   e9f600          JMP         LAB_f000_8a73                           
                            LAB_f000_897d:                ;XREF[1,0]:   f000:8a49
ram:f000:897d   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:8980   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:8983   9ab90000fb      CALLF       scsi_control                            ;undefined2 scsi_control(void)
ram:f000:8988   83c404          ADD         SP,0x4                                  
ram:f000:898b   e9e500          JMP         LAB_f000_8a73                           
                            LAB_f000_898e:                ;XREF[1,0]:   f000:8a5d
ram:f000:898e   fa              CLI                                                  
ram:f000:898f   9a350050fa      CALLF       scsi_reset_bus                          ;void scsi_reset_bus(void)
ram:f000:8994   fb              STI                                                  
ram:f000:8995   b80000          MOV         AX,0x0                                  
ram:f000:8998   e9d800          JMP         LAB_f000_8a73                           
                            LAB_f000_899b:                ;XREF[1,0]:   f000:8a3f
ram:f000:899b   57              PUSH        DI                                      
ram:f000:899c   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:899f   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:89a2   9a5300e0f8      CALLF       FUN_f000_8e53                           ;undefined FUN_f000_8e53()
ram:f000:89a7   83c406          ADD         SP,0x6                                  
ram:f000:89aa   e9c600          JMP         LAB_f000_8a73                           
                            LAB_f000_89ad:                ;XREF[1,0]:   f000:8a6a
ram:f000:89ad   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:89b0   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:89b3   9a820030fb      CALLF       scsi_extended_dsd                       ;undefined2 scsi_extended_dsd(void)
ram:f000:89b8   83c404          ADD         SP,0x4                                  
ram:f000:89bb   e9b500          JMP         LAB_f000_8a73                           
                            LAB_f000_89be:                ;XREF[1,0]:   f000:8a53
ram:f000:89be   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:89c1   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:89c4   9a9d0040fc      CALLF       FUN_f000_c49d                           ;undefined2 FUN_f000_c49d(void)
ram:f000:89c9   83c404          ADD         SP,0x4                                  
ram:f000:89cc   e9a400          JMP         LAB_f000_8a73                           
                            LAB_f000_89cf:                ;XREF[1,0]:   f000:8a36
ram:f000:89cf   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:89d2   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:89d5   9aea0040fc      CALLF       FUN_f000_c4ea                           ;undefined2 FUN_f000_c4ea(void)
ram:f000:89da   83c404          ADD         SP,0x4                                  
ram:f000:89dd   e99300          JMP         LAB_f000_8a73                           
                            LAB_f000_89e0:                ;XREF[9,0]:   f000:8a09,f000:8a13,f000:8a27,f000:8a31
                                                          ;             f000:8a4c,f000:8a56,f000:8a62,f000:8a6d
                                                          ;             f000:8a70
ram:f000:89e0   b88000          MOV         AX,0x80                                 
ram:f000:89e3   e98d00          JMP         LAB_f000_8a73                           
                            LAB_f000_89e6:                ;XREF[1,0]:   f000:88f4
ram:f000:89e6   3d0c00          CMP         AX,0xc                                  
ram:f000:89e9   7480            JZ          LAB_f000_896b                           
ram:f000:89eb   7f46            JG          LAB_f000_8a33                           
ram:f000:89ed   3d0400          CMP         AX,0x4                                  
ram:f000:89f0   7503            JNZ         LAB_f000_89f5                           
ram:f000:89f2   e938ff          JMP         LAB_f000_892d                           
                            LAB_f000_89f5:                ;XREF[1,0]:   f000:89f0
ram:f000:89f5   7f1e            JG          LAB_f000_8a15                           
ram:f000:89f7   3d0200          CMP         AX,0x2                                  
ram:f000:89fa   7503            JNZ         LAB_f000_89ff                           
ram:f000:89fc   e90aff          JMP         LAB_f000_8909                           
                            LAB_f000_89ff:                ;XREF[1,0]:   f000:89fa
ram:f000:89ff   7f0a            JG          LAB_f000_8a0b                           
ram:f000:8a01   3d0100          CMP         AX,0x1                                  
ram:f000:8a04   7503            JNZ         LAB_f000_8a09                           
ram:f000:8a06   e9eefe          JMP         LAB_f000_88f7                           
                            LAB_f000_8a09:                ;XREF[1,0]:   f000:8a04
ram:f000:8a09   ebd5            JMP         LAB_f000_89e0                           
                            LAB_f000_8a0b:                ;XREF[1,0]:   f000:89ff
ram:f000:8a0b   3d0300          CMP         AX,0x3                                  
ram:f000:8a0e   7503            JNZ         LAB_f000_8a13                           
ram:f000:8a10   e908ff          JMP         LAB_f000_891b                           
                            LAB_f000_8a13:                ;XREF[1,0]:   f000:8a0e
ram:f000:8a13   ebcb            JMP         LAB_f000_89e0                           
                            LAB_f000_8a15:                ;XREF[1,0]:   f000:89f5
ram:f000:8a15   3d0a00          CMP         AX,0xa                                  
ram:f000:8a18   7503            JNZ         LAB_f000_8a1d                           
ram:f000:8a1a   e92aff          JMP         CALL_SCSI_BOOT                          
                            LAB_f000_8a1d:                ;XREF[1,0]:   f000:8a18
ram:f000:8a1d   7f0a            JG          LAB_f000_8a29                           
ram:f000:8a1f   3d0500          CMP         AX,0x5                                  
ram:f000:8a22   7503            JNZ         LAB_f000_8a27                           
ram:f000:8a24   e90cff          JMP         LAB_f000_8933                           
                            LAB_f000_8a27:                ;XREF[1,0]:   f000:8a22
ram:f000:8a27   ebb7            JMP         LAB_f000_89e0                           
                            LAB_f000_8a29:                ;XREF[1,0]:   f000:8a1d
ram:f000:8a29   3d0b00          CMP         AX,0xb                                  
ram:f000:8a2c   7503            JNZ         LAB_f000_8a31                           
ram:f000:8a2e   e928ff          JMP         LAB_f000_8959                           
                            LAB_f000_8a31:                ;XREF[1,0]:   f000:8a2c
ram:f000:8a31   ebad            JMP         LAB_f000_89e0                           
                            LAB_f000_8a33:                ;XREF[1,0]:   f000:89eb
ram:f000:8a33   3d4300          CMP         AX,0x43                                 
ram:f000:8a36   7497            JZ          LAB_f000_89cf                           
ram:f000:8a38   7f1e            JG          LAB_f000_8a58                           
ram:f000:8a3a   3d4000          CMP         AX,0x40                                 
ram:f000:8a3d   7503            JNZ         LAB_f000_8a42                           
ram:f000:8a3f   e959ff          JMP         LAB_f000_899b                           
                            LAB_f000_8a42:                ;XREF[1,0]:   f000:8a3d
ram:f000:8a42   7f0a            JG          LAB_f000_8a4e                           
ram:f000:8a44   3d2000          CMP         AX,0x20                                 
ram:f000:8a47   7503            JNZ         LAB_f000_8a4c                           
ram:f000:8a49   e931ff          JMP         LAB_f000_897d                           
                            LAB_f000_8a4c:                ;XREF[1,0]:   f000:8a47
ram:f000:8a4c   eb92            JMP         LAB_f000_89e0                           
                            LAB_f000_8a4e:                ;XREF[1,0]:   f000:8a42
ram:f000:8a4e   3d4200          CMP         AX,0x42                                 
ram:f000:8a51   7503            JNZ         LAB_f000_8a56                           
ram:f000:8a53   e968ff          JMP         LAB_f000_89be                           
                            LAB_f000_8a56:                ;XREF[1,0]:   f000:8a51
ram:f000:8a56   eb88            JMP         LAB_f000_89e0                           
                            LAB_f000_8a58:                ;XREF[1,0]:   f000:8a38
ram:f000:8a58   3d4500          CMP         AX,0x45                                 
ram:f000:8a5b   7503            JNZ         LAB_f000_8a60                           
ram:f000:8a5d   e92eff          JMP         LAB_f000_898e                           
                            LAB_f000_8a60:                ;XREF[1,0]:   f000:8a5b
ram:f000:8a60   7e03            JLE         LAB_f000_8a65                           
ram:f000:8a62   e97bff          JMP         LAB_f000_89e0                           
                            LAB_f000_8a65:                ;XREF[1,0]:   f000:8a60
ram:f000:8a65   3d4400          CMP         AX,0x44                                 
ram:f000:8a68   7503            JNZ         LAB_f000_8a6d                           
ram:f000:8a6a   e940ff          JMP         LAB_f000_89ad                           
                            LAB_f000_8a6d:                ;XREF[1,0]:   f000:8a68
ram:f000:8a6d   e970ff          JMP         LAB_f000_89e0                           
ram:f000:8a70   e96dff          JMP         LAB_f000_89e0                           
                            LAB_f000_8a73:                ;XREF[15,0]:  f000:8906,f000:8918,f000:892a,f000:8930
                                                          ;             f000:8944,f000:8956,f000:8968,f000:897a
                                                          ;             f000:898b,f000:8998,f000:89aa,f000:89bb
                                                          ;             f000:89cc,f000:89dd,f000:89e3
ram:f000:8a73   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 scsi_dlm(void)
                                                          ;XREF[1,0]:   f000:88fe
ram:f000:8a78   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:8a7d   81ec0800        SUB         SP,0x8                                  
ram:f000:8a81   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:8a84   8b4404          MOV         AX,word ptr [SI + 0x4]                  
ram:f000:8a87   8b5406          MOV         DX,word ptr [SI + 0x6]                  
ram:f000:8a8a   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:8a8d   8956fe          MOV         word ptr [BP + -0x2],DX                 
ram:f000:8a90   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:8a93   8b4402          MOV         AX,word ptr [SI + 0x2]                  
ram:f000:8a96   253f00          AND         AX,0x3f                                 
ram:f000:8a99   b90a00          MOV         CX,0xa                                  
ram:f000:8a9c   d3e0            SHL         AX,CL                                   
ram:f000:8a9e   31d2            XOR         DX,DX                                   
ram:f000:8aa0   8946f8          MOV         word ptr [BP + -0x8],AX                 
ram:f000:8aa3   8956fa          MOV         word ptr [BP + -0x6],DX                 
ram:f000:8aa6   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:8aa9   8b4402          MOV         AX,word ptr [SI + 0x2]                  
ram:f000:8aac   b106            MOV         CL,0x6                                  
ram:f000:8aae   d3e8            SHR         AX,CL                                   
ram:f000:8ab0   250100          AND         AX,0x1                                  
ram:f000:8ab3   3d0100          CMP         AX,0x1                                  
ram:f000:8ab6   7508            JNZ         LAB_f000_8ac0                           
ram:f000:8ab8   8346f800        ADD         word ptr [BP + -0x8],0x0                
ram:f000:8abc   8356fa01        ADC         word ptr [BP + -0x6],0x1                
                            LAB_f000_8ac0:                ;XREF[1,0]:   f000:8ab6
ram:f000:8ac0   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:8ac3   8b04            MOV         AX,word ptr [SI]                        
ram:f000:8ac5   40              INC         AX                                      
ram:f000:8ac6   8bf8            MOV         DI,AX                                   
ram:f000:8ac8   b80000          MOV         AX,0x0                                  
ram:f000:8acb   50              PUSH        AX                                      
ram:f000:8acc   57              PUSH        DI                                      
ram:f000:8acd   ff76fa          PUSH        word ptr [BP + -0x6]                    
ram:f000:8ad0   ff76f8          PUSH        word ptr [BP + -0x8]                    
ram:f000:8ad3   ff76fe          PUSH        word ptr [BP + -0x2]                    
ram:f000:8ad6   ff76fc          PUSH        word ptr [BP + -0x4]                    
ram:f000:8ad9   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:8ade   83c40c          ADD         SP,0xc                                  
ram:f000:8ae1   b80000          MOV         AX,0x0                                  
ram:f000:8ae4   eb00            JMP         LAB_f000_8ae6                           
                            LAB_f000_8ae6:                ;XREF[1,0]:   f000:8ae4
ram:f000:8ae6   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 scsi_ulm(void)
                                                          ;XREF[1,0]:   f000:8910
ram:f000:8aeb   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:8af0   81ec0800        SUB         SP,0x8                                  
ram:f000:8af4   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:8af7   8b4402          MOV         AX,word ptr [SI + 0x2]                  
ram:f000:8afa   253f00          AND         AX,0x3f                                 
ram:f000:8afd   b90a00          MOV         CX,0xa                                  
ram:f000:8b00   d3e0            SHL         AX,CL                                   
ram:f000:8b02   31d2            XOR         DX,DX                                   
ram:f000:8b04   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:8b07   8956fe          MOV         word ptr [BP + -0x2],DX                 
ram:f000:8b0a   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:8b0d   8b4404          MOV         AX,word ptr [SI + 0x4]                  
ram:f000:8b10   8b5406          MOV         DX,word ptr [SI + 0x6]                  
ram:f000:8b13   8946f8          MOV         word ptr [BP + -0x8],AX                 
ram:f000:8b16   8956fa          MOV         word ptr [BP + -0x6],DX                 
ram:f000:8b19   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:8b1c   8b4402          MOV         AX,word ptr [SI + 0x2]                  
ram:f000:8b1f   b106            MOV         CL,0x6                                  
ram:f000:8b21   d3e8            SHR         AX,CL                                   
ram:f000:8b23   250100          AND         AX,0x1                                  
ram:f000:8b26   3d0100          CMP         AX,0x1                                  
ram:f000:8b29   7508            JNZ         LAB_f000_8b33                           
ram:f000:8b2b   8346fc00        ADD         word ptr [BP + -0x4],0x0                
ram:f000:8b2f   8356fe01        ADC         word ptr [BP + -0x2],0x1                
                            LAB_f000_8b33:                ;XREF[1,0]:   f000:8b29
ram:f000:8b33   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:8b36   8b04            MOV         AX,word ptr [SI]                        
ram:f000:8b38   40              INC         AX                                      
ram:f000:8b39   8bf8            MOV         DI,AX                                   
ram:f000:8b3b   b80100          MOV         AX,0x1                                  
ram:f000:8b3e   50              PUSH        AX                                      
ram:f000:8b3f   57              PUSH        DI                                      
ram:f000:8b40   ff76fa          PUSH        word ptr [BP + -0x6]                    
ram:f000:8b43   ff76f8          PUSH        word ptr [BP + -0x8]                    
ram:f000:8b46   ff76fe          PUSH        word ptr [BP + -0x2]                    
ram:f000:8b49   ff76fc          PUSH        word ptr [BP + -0x4]                    
ram:f000:8b4c   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:8b51   83c40c          ADD         SP,0xc                                  
ram:f000:8b54   b80000          MOV         AX,0x0                                  
ram:f000:8b57   eb00            JMP         LAB_f000_8b59                           
                            LAB_f000_8b59:                ;XREF[1,0]:   f000:8b57
ram:f000:8b59   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void scsi_ffc(void)
          ;express       undefined2     HASH...                      
                                                          ;XREF[1,0]:   f000:8922
ram:f000:8b5e   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:8b63   81ec1000        SUB         SP,0x10                                 
ram:f000:8b67   8b7e12          MOV         DI,word ptr [BP + 0x12]                 
ram:f000:8b6a   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:8b6d   8b4404          MOV         AX,word ptr [SI + 0x4]                  
ram:f000:8b70   8b5406          MOV         DX,word ptr [SI + 0x6]                  
ram:f000:8b73   2500ff          AND         AX,0xff00                               
ram:f000:8b76   81e20f00        AND         DX,0xf                                  
ram:f000:8b7a   b90400          MOV         CX,0x4                                  
ram:f000:8b7d   e306            JCXZ        LAB_f000_8b85                           
                            LAB_f000_8b7f:                ;XREF[1,0]:   f000:8b83
ram:f000:8b7f   d1fa            SAR         DX,1                                    
ram:f000:8b81   d1d8            RCR         AX,1                                    
ram:f000:8b83   e2fa            LOOP        LAB_f000_8b7f                           
                            LAB_f000_8b85:                ;XREF[1,0]:   f000:8b7d
ram:f000:8b85   8946f2          MOV         word ptr [BP + -0xe],AX                 
ram:f000:8b88   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:8b8b   8b4404          MOV         AX,word ptr [SI + 0x4]                  
ram:f000:8b8e   8b5406          MOV         DX,word ptr [SI + 0x6]                  
ram:f000:8b91   25ff00          AND         AX,0xff                                 
ram:f000:8b94   81e20000        AND         DX,0x0                                  
ram:f000:8b98   8946f0          MOV         word ptr [BP + -0x10],AX                
ram:f000:8b9b   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:8b9e   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:8ba1   2c0c            SUB         AL,0xc                                  
ram:f000:8ba3   7303            JNC         LAB_f000_8ba8                           
ram:f000:8ba5   83ea10          SUB         DX,0x10                                 
                            LAB_f000_8ba8:                ;XREF[1,0]:   f000:8ba3
ram:f000:8ba8   57              PUSH        DI                                      
ram:f000:8ba9   8bf8            MOV         DI,AX                                   
ram:f000:8bab   8ec2            MOV         ES,DX                                   
ram:f000:8bad   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:8bb0   b90400          MOV         CX,0x4                                  
ram:f000:8bb3   fc              CLD                                                  
ram:f000:8bb4   f2a5            MOVSW       ES:DI,SI                                
ram:f000:8bb6   5f              POP         DI                                      
ram:f000:8bb7   c646f700        MOV         byte ptr [BP + -0x9],0x0                
ram:f000:8bbb   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:8bbe   8a4403          MOV         AL,byte ptr [SI + 0x3]                  
ram:f000:8bc1   8846fc          MOV         byte ptr [BP + -0x4],AL                 
ram:f000:8bc4   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:8bc7   ff740a          PUSH        word ptr [SI + 0xa]                     
ram:f000:8bca   ff7408          PUSH        word ptr [SI + 0x8]                     
ram:f000:8bcd   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:8bd2   83c404          ADD         SP,0x4                                  
ram:f000:8bd5   8946f8          MOV         word ptr [BP + -0x8],AX                 
ram:f000:8bd8   8956fa          MOV         word ptr [BP + -0x6],DX                 
ram:f000:8bdb   85ff            TEST        DI,DI                                   
ram:f000:8bdd   7419            JZ          LAB_f000_8bf8                           
ram:f000:8bdf   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:8be2   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:8be5   2c0c            SUB         AL,0xc                                  
ram:f000:8be7   7303            JNC         LAB_f000_8bec                           
ram:f000:8be9   83ea10          SUB         DX,0x10                                 
                            LAB_f000_8bec:                ;XREF[1,0]:   f000:8be7
ram:f000:8bec   52              PUSH        DX                                      
ram:f000:8bed   50              PUSH        AX                                      
ram:f000:8bee   9a300020fd      CALLF       complete_express_job                    ;void complete_express_job(void)
ram:f000:8bf3   83c404          ADD         SP,0x4                                  
ram:f000:8bf6   eb17            JMP         LAB_f000_8c0f                           
                            LAB_f000_8bf8:                ;XREF[1,0]:   f000:8bdd
ram:f000:8bf8   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:8bfb   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:8bfe   2c0c            SUB         AL,0xc                                  
ram:f000:8c00   7303            JNC         LAB_f000_8c05                           
ram:f000:8c02   83ea10          SUB         DX,0x10                                 
                            LAB_f000_8c05:                ;XREF[1,0]:   f000:8c00
ram:f000:8c05   52              PUSH        DX                                      
ram:f000:8c06   50              PUSH        AX                                      
ram:f000:8c07   9a4c0090fd      CALLF       complete_full_job                       ;undefined2 complete_full_job(void)
ram:f000:8c0c   83c404          ADD         SP,0x4                                  
                            LAB_f000_8c0f:                ;XREF[1,0]:   f000:8bf6
ram:f000:8c0f   9a220090fd      CALLF       req_sbd_interrupt                       ;void req_sbd_interrupt(void)
ram:f000:8c14   9ab70050f8      CALLF       init_state                              ;undefined init_state(void)
ram:f000:8c19   ff76f0          PUSH        word ptr [BP + -0x10]                   
ram:f000:8c1c   ff76f2          PUSH        word ptr [BP + -0xe]                    
ram:f000:8c1f   9a6e0050fd      CALLF       call_pumped_function                    ;void call_pumped_function(void)
ram:f000:8c24   83c404          ADD         SP,0x4                                  
ram:f000:8c27   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 scsi_dsd(void)
                                                          ;XREF[2,0]:   f000:893c,f000:cb54
ram:f000:8c2c   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:8c31   81ec4c00        SUB         SP,0x4c                                 
ram:f000:8c35   c746fc0000      MOV         word ptr [BP + -0x4],0x0                
ram:f000:8c3a   c746fee01f      MOV         word ptr [BP + -0x2],0x1fe0             
ram:f000:8c3f   b80000          MOV         AX,0x0                                  
ram:f000:8c42   50              PUSH        AX                                      
ram:f000:8c43   9aea0060fa      CALLF       enumerate_scsi_bus                      ;void enumerate_scsi_bus(void)
ram:f000:8c48   83c402          ADD         SP,0x2                                  
ram:f000:8c4b   c746da0000      MOV         word ptr [BP + -0x26],0x0               
ram:f000:8c50   31ff            XOR         DI,DI                                   
                            LAB_f000_8c52:                ;XREF[1,0]:   f000:8c61
ram:f000:8c52   83ff10          CMP         DI,0x10                                 
ram:f000:8c55   7d0c            JGE         LAB_f000_8c63                           
ram:f000:8c57   8bf7            MOV         SI,DI                                   
ram:f000:8c59   d1e6            SHL         SI,1                                    
ram:f000:8c5b   c742dc0000      MOV         word ptr [BP + SI + -0x24],0x0          
ram:f000:8c60   47              INC         DI                                      
ram:f000:8c61   ebef            JMP         LAB_f000_8c52                           
                            LAB_f000_8c63:                ;XREF[1,0]:   f000:8c55
ram:f000:8c63   b8001f          MOV         AX,0x1f00                               
ram:f000:8c66   8ed8            MOV         DS,AX                                   
ram:f000:8c68   f7067c00ffff    TEST        word ptr [offset...,0xffff              
ram:f000:8c6e   7503            JNZ         LAB_f000_8c73                           
ram:f000:8c70   e9e200          JMP         LAB_f000_8d55                           
                            LAB_f000_8c73:                ;XREF[1,0]:   f000:8c6e
ram:f000:8c73   b800c0          MOV         AX,0xc000                               
ram:f000:8c76   8ed8            MOV         DS,AX                                   
ram:f000:8c78   f6060b00ff      TEST        byte ptr [SCSI_ID_REG],0xff             
ram:f000:8c7d   7403            JZ          LAB_f000_8c82                           
ram:f000:8c7f   e9d000          JMP         LAB_f000_8d52                           
                            LAB_f000_8c82:                ;XREF[1,0]:   f000:8c7d
ram:f000:8c82   31ff            XOR         DI,DI                                   
                            LAB_f000_8c84:                ;XREF[1,0]:   f000:8d4f
ram:f000:8c84   83ff10          CMP         DI,0x10                                 
ram:f000:8c87   7c03            JL          LAB_f000_8c8c                           
ram:f000:8c89   e9c600          JMP         LAB_f000_8d52                           
                            LAB_f000_8c8c:                ;XREF[1,0]:   f000:8c87
ram:f000:8c8c   8bf7            MOV         SI,DI                                   
ram:f000:8c8e   d1e6            SHL         SI,1                                    
ram:f000:8c90   b8e0fd          MOV         AX,0xfde0                               
ram:f000:8c93   8ed8            MOV         DS,AX                                   
ram:f000:8c95   8a848b00        MOV         AL,byte ptr [SI + offset DAT_f000_de8...
ram:f000:8c99   30e4            XOR         AH,AH                                   
ram:f000:8c9b   8946b4          MOV         word ptr [BP + -0x4c],AX                
ram:f000:8c9e   8bf7            MOV         SI,DI                                   
ram:f000:8ca0   d1e6            SHL         SI,1                                    
ram:f000:8ca2   b8e0fd          MOV         AX,0xfde0                               
ram:f000:8ca5   8ed8            MOV         DS,AX                                   
ram:f000:8ca7   8a848a00        MOV         AL,byte ptr [SI + offset DAT_f000_de8...;= 01h
ram:f000:8cab   30e4            XOR         AH,AH                                   
ram:f000:8cad   8946b6          MOV         word ptr [BP + -0x4a],AX                
ram:f000:8cb0   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:8cb3   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:8cb6   040c            ADD         AL,0xc                                  
ram:f000:8cb8   7303            JNC         LAB_f000_8cbd                           
ram:f000:8cba   83c210          ADD         DX,0x10                                 
                            LAB_f000_8cbd:                ;XREF[1,0]:   f000:8cb8
ram:f000:8cbd   8b4eb6          MOV         CX,word ptr [BP + -0x4a]                
ram:f000:8cc0   be0300          MOV         SI,0x3                                  
ram:f000:8cc3   87ce            XCHG        SI,CX                                   
ram:f000:8cc5   d3e6            SHL         SI,CL                                   
ram:f000:8cc7   87ce            XCHG        SI,CX                                   
ram:f000:8cc9   02c1            ADD         AL,CL                                   
ram:f000:8ccb   7303            JNC         LAB_f000_8cd0                           
ram:f000:8ccd   83c210          ADD         DX,0x10                                 
                            LAB_f000_8cd0:                ;XREF[1,0]:   f000:8ccb
ram:f000:8cd0   30c9            XOR         CL,CL                                   
ram:f000:8cd2   d1f9            SAR         CX,1                                    
ram:f000:8cd4   d1f9            SAR         CX,1                                    
ram:f000:8cd6   d1f9            SAR         CX,1                                    
ram:f000:8cd8   d1f9            SAR         CX,1                                    
ram:f000:8cda   03d1            ADD         DX,CX                                   
ram:f000:8cdc   8b4eb4          MOV         CX,word ptr [BP + -0x4c]                
ram:f000:8cdf   02c1            ADD         AL,CL                                   
ram:f000:8ce1   7303            JNC         LAB_f000_8ce6                           
ram:f000:8ce3   83c210          ADD         DX,0x10                                 
                            LAB_f000_8ce6:                ;XREF[1,0]:   f000:8ce1
ram:f000:8ce6   30c9            XOR         CL,CL                                   
ram:f000:8ce8   d1f9            SAR         CX,1                                    
ram:f000:8cea   d1f9            SAR         CX,1                                    
ram:f000:8cec   d1f9            SAR         CX,1                                    
ram:f000:8cee   d1f9            SAR         CX,1                                    
ram:f000:8cf0   03d1            ADD         DX,CX                                   
ram:f000:8cf2   8bf0            MOV         SI,AX                                   
ram:f000:8cf4   8eda            MOV         DS,DX                                   
ram:f000:8cf6   8a04            MOV         AL,byte ptr [SI]                        
ram:f000:8cf8   30e4            XOR         AH,AH                                   
ram:f000:8cfa   a90100          TEST        AX,0x1                                  
ram:f000:8cfd   7446            JZ          LAB_f000_8d45                           
ram:f000:8cff   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:8d02   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:8d05   044c            ADD         AL,0x4c                                 
ram:f000:8d07   7303            JNC         LAB_f000_8d0c                           
ram:f000:8d09   83c210          ADD         DX,0x10                                 
                            LAB_f000_8d0c:                ;XREF[1,0]:   f000:8d07
ram:f000:8d0c   8b4eb6          MOV         CX,word ptr [BP + -0x4a]                
ram:f000:8d0f   be0500          MOV         SI,0x5                                  
ram:f000:8d12   87ce            XCHG        SI,CX                                   
ram:f000:8d14   d3e6            SHL         SI,CL                                   
ram:f000:8d16   87ce            XCHG        SI,CX                                   
ram:f000:8d18   02c1            ADD         AL,CL                                   
ram:f000:8d1a   7303            JNC         LAB_f000_8d1f                           
ram:f000:8d1c   83c210          ADD         DX,0x10                                 
                            LAB_f000_8d1f:                ;XREF[1,0]:   f000:8d1a
ram:f000:8d1f   30c9            XOR         CL,CL                                   
ram:f000:8d21   d1f9            SAR         CX,1                                    
ram:f000:8d23   d1f9            SAR         CX,1                                    
ram:f000:8d25   d1f9            SAR         CX,1                                    
ram:f000:8d27   d1f9            SAR         CX,1                                    
ram:f000:8d29   03d1            ADD         DX,CX                                   
ram:f000:8d2b   8bf0            MOV         SI,AX                                   
ram:f000:8d2d   8eda            MOV         DS,DX                                   
ram:f000:8d2f   8a04            MOV         AL,byte ptr [SI]                        
ram:f000:8d31   30e4            XOR         AH,AH                                   
ram:f000:8d33   050002          ADD         AX,0x200                                
ram:f000:8d36   8bf7            MOV         SI,DI                                   
ram:f000:8d38   d1e6            SHL         SI,1                                    
ram:f000:8d3a   8942dc          MOV         word ptr [BP + SI + -0x24],AX           
ram:f000:8d3d   8bc7            MOV         AX,DI                                   
ram:f000:8d3f   40              INC         AX                                      
ram:f000:8d40   8946da          MOV         word ptr [BP + -0x26],AX                
ram:f000:8d43   eb09            JMP         LAB_f000_8d4e                           
                            LAB_f000_8d45:                ;XREF[1,0]:   f000:8cfd
ram:f000:8d45   8bf7            MOV         SI,DI                                   
ram:f000:8d47   d1e6            SHL         SI,1                                    
ram:f000:8d49   c742dc7f02      MOV         word ptr [BP + SI + -0x24],0x27f        
                            LAB_f000_8d4e:                ;XREF[1,0]:   f000:8d43
ram:f000:8d4e   47              INC         DI                                      
ram:f000:8d4f   e932ff          JMP         LAB_f000_8c84                           
                            LAB_f000_8d52:                ;XREF[2,0]:   f000:8c7f,f000:8c89
ram:f000:8d52   e99500          JMP         LAB_f000_8dea                           
                            LAB_f000_8d55:                ;XREF[1,0]:   f000:8c70
ram:f000:8d55   31ff            XOR         DI,DI                                   
ram:f000:8d57   c746b60000      MOV         word ptr [BP + -0x4a],0x0               
                            LAB_f000_8d5c:                ;XREF[1,0]:   f000:8de7
ram:f000:8d5c   837eb608        CMP         word ptr [BP + -0x4a],0x8               
ram:f000:8d60   7c03            JL          LAB_f000_8d65                           
ram:f000:8d62   e98500          JMP         LAB_f000_8dea                           
                            LAB_f000_8d65:                ;XREF[1,0]:   f000:8d60
ram:f000:8d65   b800c0          MOV         AX,0xc000                               
ram:f000:8d68   8ed8            MOV         DS,AX                                   
ram:f000:8d6a   a00b00          MOV         AL,[SCSI_ID_REG]                        
ram:f000:8d6d   30e4            XOR         AH,AH                                   
ram:f000:8d6f   3946b6          CMP         word ptr [BP + -0x4a],AX                
ram:f000:8d72   7502            JNZ         LAB_f000_8d76                           
ram:f000:8d74   eb6e            JMP         LAB_f000_8de4                           
                            LAB_f000_8d76:                ;XREF[1,0]:   f000:8d72
ram:f000:8d76   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:8d79   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:8d7c   0404            ADD         AL,0x4                                  
ram:f000:8d7e   7303            JNC         LAB_f000_8d83                           
ram:f000:8d80   83c210          ADD         DX,0x10                                 
                            LAB_f000_8d83:                ;XREF[1,0]:   f000:8d7e
ram:f000:8d83   8b4eb6          MOV         CX,word ptr [BP + -0x4a]                
ram:f000:8d86   02c1            ADD         AL,CL                                   
ram:f000:8d88   7303            JNC         LAB_f000_8d8d                           
ram:f000:8d8a   83c210          ADD         DX,0x10                                 
                            LAB_f000_8d8d:                ;XREF[1,0]:   f000:8d88
ram:f000:8d8d   30c9            XOR         CL,CL                                   
ram:f000:8d8f   d1f9            SAR         CX,1                                    
ram:f000:8d91   d1f9            SAR         CX,1                                    
ram:f000:8d93   d1f9            SAR         CX,1                                    
ram:f000:8d95   d1f9            SAR         CX,1                                    
ram:f000:8d97   03d1            ADD         DX,CX                                   
ram:f000:8d99   8bf0            MOV         SI,AX                                   
ram:f000:8d9b   8eda            MOV         DS,DX                                   
ram:f000:8d9d   803c01          CMP         byte ptr [SI],0x1                       
ram:f000:8da0   7542            JNZ         LAB_f000_8de4                           
ram:f000:8da2   ff46da          INC         word ptr [BP + -0x26]                   
ram:f000:8da5   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:8da8   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:8dab   044c            ADD         AL,0x4c                                 
ram:f000:8dad   7303            JNC         LAB_f000_8db2                           
ram:f000:8daf   83c210          ADD         DX,0x10                                 
                            LAB_f000_8db2:                ;XREF[1,0]:   f000:8dad
ram:f000:8db2   8b4eb6          MOV         CX,word ptr [BP + -0x4a]                
ram:f000:8db5   be0500          MOV         SI,0x5                                  
ram:f000:8db8   87ce            XCHG        SI,CX                                   
ram:f000:8dba   d3e6            SHL         SI,CL                                   
ram:f000:8dbc   87ce            XCHG        SI,CX                                   
ram:f000:8dbe   02c1            ADD         AL,CL                                   
ram:f000:8dc0   7303            JNC         LAB_f000_8dc5                           
ram:f000:8dc2   83c210          ADD         DX,0x10                                 
                            LAB_f000_8dc5:                ;XREF[1,0]:   f000:8dc0
ram:f000:8dc5   30c9            XOR         CL,CL                                   
ram:f000:8dc7   d1f9            SAR         CX,1                                    
ram:f000:8dc9   d1f9            SAR         CX,1                                    
ram:f000:8dcb   d1f9            SAR         CX,1                                    
ram:f000:8dcd   d1f9            SAR         CX,1                                    
ram:f000:8dcf   03d1            ADD         DX,CX                                   
ram:f000:8dd1   8bf0            MOV         SI,AX                                   
ram:f000:8dd3   8eda            MOV         DS,DX                                   
ram:f000:8dd5   8a04            MOV         AL,byte ptr [SI]                        
ram:f000:8dd7   30e4            XOR         AH,AH                                   
ram:f000:8dd9   050001          ADD         AX,0x100                                
ram:f000:8ddc   8bf7            MOV         SI,DI                                   
ram:f000:8dde   47              INC         DI                                      
ram:f000:8ddf   d1e6            SHL         SI,1                                    
ram:f000:8de1   8942dc          MOV         word ptr [BP + SI + -0x24],AX           
                            LAB_f000_8de4:                ;XREF[2,0]:   f000:8d74,f000:8da0
ram:f000:8de4   ff46b6          INC         word ptr [BP + -0x4a]                   
ram:f000:8de7   e972ff          JMP         LAB_f000_8d5c                           
                            LAB_f000_8dea:                ;XREF[2,0]:   f000:8d52,f000:8d62
ram:f000:8dea   ff76da          PUSH        word ptr [BP + -0x26]                   
ram:f000:8ded   9a6800c0fd      CALLF       byte_swap_ax                            ;undefined2 byte_swap_ax(undefined2 p...
ram:f000:8df2   83c402          ADD         SP,0x2                                  
ram:f000:8df5   8946b8          MOV         word ptr [BP + -0x48],AX                
ram:f000:8df8   31ff            XOR         DI,DI                                   
                            LAB_f000_8dfa:                ;XREF[1,0]:   f000:8e16
ram:f000:8dfa   83ff10          CMP         DI,0x10                                 
ram:f000:8dfd   7d19            JGE         LAB_f000_8e18                           
ram:f000:8dff   8bf7            MOV         SI,DI                                   
ram:f000:8e01   d1e6            SHL         SI,1                                    
ram:f000:8e03   ff72dc          PUSH        word ptr [BP + SI + -0x24]              
ram:f000:8e06   9a6800c0fd      CALLF       byte_swap_ax                            ;undefined2 byte_swap_ax(undefined2 p...
ram:f000:8e0b   83c402          ADD         SP,0x2                                  
ram:f000:8e0e   8bf7            MOV         SI,DI                                   
ram:f000:8e10   d1e6            SHL         SI,1                                    
ram:f000:8e12   8942ba          MOV         word ptr [BP + SI + -0x46],AX           
ram:f000:8e15   47              INC         DI                                      
ram:f000:8e16   ebe2            JMP         LAB_f000_8dfa                           
                            LAB_f000_8e18:                ;XREF[1,0]:   f000:8dfd
ram:f000:8e18   b80100          MOV         AX,0x1                                  
ram:f000:8e1b   50              PUSH        AX                                      
ram:f000:8e1c   b81100          MOV         AX,0x11                                 
ram:f000:8e1f   50              PUSH        AX                                      
ram:f000:8e20   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:8e23   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:8e26   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:8e29   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:8e2c   2c48            SUB         AL,0x48                                 
ram:f000:8e2e   7303            JNC         LAB_f000_8e33                           
ram:f000:8e30   83ea10          SUB         DX,0x10                                 
                            LAB_f000_8e33:                ;XREF[1,0]:   f000:8e2e
ram:f000:8e33   d1ea            SHR         DX,1                                    
ram:f000:8e35   d1ea            SHR         DX,1                                    
ram:f000:8e37   d1ea            SHR         DX,1                                    
ram:f000:8e39   d1ea            SHR         DX,1                                    
ram:f000:8e3b   86d4            XCHG        AH,DL                                   
ram:f000:8e3d   86f2            XCHG        DL,DH                                   
ram:f000:8e3f   52              PUSH        DX                                      
ram:f000:8e40   50              PUSH        AX                                      
ram:f000:8e41   9a200070fd      CALLF       transfer_words                          ;undefined transfer_words()
ram:f000:8e46   83c40c          ADD         SP,0xc                                  
ram:f000:8e49   b80000          MOV         AX,0x0                                  
ram:f000:8e4c   eb00            JMP         LAB_f000_8e4e                           
                            LAB_f000_8e4e:                ;XREF[1,0]:   f000:8e4c
ram:f000:8e4e   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined FUN_f000_8e53()
                                                          ;XREF[1,0]:   f000:89a2
ram:f000:8e53   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:8e58   81ec0400        SUB         SP,0x4                                  
ram:f000:8e5c   b80100          MOV         AX,0x1                                  
ram:f000:8e5f   50              PUSH        AX                                      
ram:f000:8e60   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:8e65   83c402          ADD         SP,0x2                                  
ram:f000:8e68   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:8e6b   8956fe          MOV         word ptr [BP + -0x2],DX                 
ram:f000:8e6e   b80100          MOV         AX,0x1                                  
ram:f000:8e71   50              PUSH        AX                                      
ram:f000:8e72   b80400          MOV         AX,0x4                                  
ram:f000:8e75   50              PUSH        AX                                      
ram:f000:8e76   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:8e79   ff7406          PUSH        word ptr [SI + 0x6]                     
ram:f000:8e7c   ff7404          PUSH        word ptr [SI + 0x4]                     
ram:f000:8e7f   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:8e82   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:8e85   2c04            SUB         AL,0x4                                  
ram:f000:8e87   7303            JNC         LAB_f000_8e8c                           
ram:f000:8e89   83ea10          SUB         DX,0x10                                 
                            LAB_f000_8e8c:                ;XREF[1,0]:   f000:8e87
ram:f000:8e8c   d1ea            SHR         DX,1                                    
ram:f000:8e8e   d1ea            SHR         DX,1                                    
ram:f000:8e90   d1ea            SHR         DX,1                                    
ram:f000:8e92   d1ea            SHR         DX,1                                    
ram:f000:8e94   86d4            XCHG        AH,DL                                   
ram:f000:8e96   86f2            XCHG        DL,DH                                   
ram:f000:8e98   52              PUSH        DX                                      
ram:f000:8e99   50              PUSH        AX                                      
ram:f000:8e9a   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:8e9f   83c40c          ADD         SP,0xc                                  
ram:f000:8ea2   b80000          MOV         AX,0x0                                  
ram:f000:8ea5   eb00            JMP         LAB_f000_8ea7                           
                            LAB_f000_8ea7:                ;XREF[1,0]:   f000:8ea5
ram:f000:8ea7   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void FUN_f000_8eac(void)
                                                          ;XREF[1,0]:   f000:88bf
ram:f000:8eac   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:8eb1   81ec0000        SUB         SP,0x0                                  
ram:f000:8eb5   b8f01f          MOV         AX,0x1ff0                               
ram:f000:8eb8   8ed8            MOV         DS,AX                                   
ram:f000:8eba   f706f000ffff    TEST        word ptr [offset...,0xffff              
ram:f000:8ec0   7427            JZ          LAB_f000_8ee9                           
ram:f000:8ec2   b8f01f          MOV         AX,0x1ff0                               
ram:f000:8ec5   8ed8            MOV         DS,AX                                   
ram:f000:8ec7   ff0ef000        DEC         word ptr [offset DAT_1000_fff0 &0xff]   
ram:f000:8ecb   f706f000ffff    TEST        word ptr [offset...,0xffff              
ram:f000:8ed1   7516            JNZ         LAB_f000_8ee9                           
ram:f000:8ed3   b8f01f          MOV         AX,0x1ff0                               
ram:f000:8ed6   8ed8            MOV         DS,AX                                   
ram:f000:8ed8   c706f0000000    MOV         word ptr [offset...,0x0                 
ram:f000:8ede   b8f01f          MOV         AX,0x1ff0                               
ram:f000:8ee1   8ed8            MOV         DS,AX                                   
ram:f000:8ee3   810ef2000800    OR          word ptr [offset STATE_FLAGS &0xff],0x8 
                            LAB_f000_8ee9:                ;XREF[2,0]:   f000:8ec0,f000:8ed1
ram:f000:8ee9   b840c0          MOV         AX,0xc040                               
ram:f000:8eec   8ed8            MOV         DS,AX                                   
ram:f000:8eee   c70622000800    MOV         word ptr [offset INT_CTRL_EOI &0xff],0x8
ram:f000:8ef4   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void int0_sysgen(void)
                                                          ;XREF[1,0]:   f000:8877
ram:f000:8ef9   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:8efe   81ec0000        SUB         SP,0x0                                  
ram:f000:8f02   b840c0          MOV         AX,0xc040                               
ram:f000:8f05   8ed8            MOV         DS,AX                                   
ram:f000:8f07   810e38000800    OR          word ptr [offset INT0_CTRL &0xff],0x8   
ram:f000:8f0d   b8f01f          MOV         AX,0x1ff0                               
ram:f000:8f10   8ed8            MOV         DS,AX                                   
ram:f000:8f12   810ef2000100    OR          word ptr [offset STATE_FLAGS &0xff],0x1 
ram:f000:8f18   b8001f          MOV         AX,0x1f00                               
ram:f000:8f1b   8ed8            MOV         DS,AX                                   
ram:f000:8f1d   c70622000200    MOV         word ptr [offset JOB_Q_IP &0xff],0x2    
ram:f000:8f23   c7062400001f    MOV         word ptr [offset JOB_Q_CS &0xff],0x1f00 
ram:f000:8f29   b80000          MOV         AX,0x0                                  
ram:f000:8f2c   8ed8            MOV         DS,AX                                   
ram:f000:8f2e   c70634008000    MOV         word ptr [INT1_VEC_IP],0x80             
ram:f000:8f34   c706360080f8    MOV         word ptr [INT1_VEC_CS],0xf880           
ram:f000:8f3a   b840c0          MOV         AX,0xc040                               
ram:f000:8f3d   8ed8            MOV         DS,AX                                   
ram:f000:8f3f   81263a00f7ff    AND         word ptr [offset INT1_CTRL &0xff],0xfff7
ram:f000:8f45   b800c0          MOV         AX,0xc000                               
ram:f000:8f48   8ed8            MOV         DS,AX                                   
ram:f000:8f4a   c606880000      MOV         byte ptr [PCSR_0_INT0],0x0              
ram:f000:8f4f   b840c0          MOV         AX,0xc040                               
ram:f000:8f52   8ed8            MOV         DS,AX                                   
ram:f000:8f54   c70622000c00    MOV         word ptr [offset INT_CTRL_EOI &0xff],0xc
ram:f000:8f5a   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void int1_sysgen(void)
                                                          ;XREF[1,0]:   f000:8883
ram:f000:8f5f   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:8f64   81ec0000        SUB         SP,0x0                                  
ram:f000:8f68   b840c0          MOV         AX,0xc040                               
ram:f000:8f6b   8ed8            MOV         DS,AX                                   
ram:f000:8f6d   810e3a000800    OR          word ptr [offset INT1_CTRL &0xff],0x8   
ram:f000:8f73   b8f01f          MOV         AX,0x1ff0                               
ram:f000:8f76   8ed8            MOV         DS,AX                                   
ram:f000:8f78   810ef2000200    OR          word ptr [offset STATE_FLAGS &0xff],0x2 
ram:f000:8f7e   9a380050fc      CALLF       perform_sysgen                          ;undefined perform_sysgen()
ram:f000:8f83   3d0100          CMP         AX,0x1                                  
ram:f000:8f86   7405            JZ          sysgen_success                          
ram:f000:8f88   9ab700f0f8      CALLF       halt_on_error                           ;void halt_on_error(void)
                            sysgen_success:               ;XREF[1,0]:   f000:8f86
ram:f000:8f8d   9a220090fd      CALLF       req_sbd_interrupt                       ;void req_sbd_interrupt(void)
ram:f000:8f92   b8f01f          MOV         AX,0x1ff0                               
ram:f000:8f95   8ed8            MOV         DS,AX                                   
ram:f000:8f97   810ef2000400    OR          word ptr [offset STATE_FLAGS &0xff],0x4 
ram:f000:8f9d   b800c0          MOV         AX,0xc000                               
ram:f000:8fa0   8ed8            MOV         DS,AX                                   
ram:f000:8fa2   c606890000      MOV         byte ptr [PCSR_1_INT1],0x0              
ram:f000:8fa7   b840c0          MOV         AX,0xc040                               
ram:f000:8faa   8ed8            MOV         DS,AX                                   
ram:f000:8fac   c70622000d00    MOV         word ptr [offset INT_CTRL_EOI &0xff],0xd
ram:f000:8fb2   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void halt_on_error(void)
                                                          ;XREF[4,0]:   f000:886b,f000:8f88,f000:908a,f000:c91a
ram:f000:8fb7   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:8fbc   81ec0000        SUB         SP,0x0                                  
ram:f000:8fc0   fa              CLI                                                  
                            LAB_f000_8fc1:                ;XREF[1,0]:   f000:8fc2
ram:f000:8fc1   f4              HLT                                                  
ram:f000:8fc2   ebfd            JMP         LAB_f000_8fc1                           
ram:f000:8fc4   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void FUN_f000_8fc9(void)
                                                          ;XREF[1,0]:   f000:885f
ram:f000:8fc9   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:8fce   81ec0000        SUB         SP,0x0                                  
ram:f000:8fd2   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void FUN_f000_8fd7(void)
                                                          ;XREF[1,0]:   f000:889b
ram:f000:8fd7   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:8fdc   81ec0000        SUB         SP,0x0                                  
ram:f000:8fe0   9ae40000f9      CALLF       find_next_available_job                 ;void find_next_available_job(void)
ram:f000:8fe5   b800c0          MOV         AX,0xc000                               
ram:f000:8fe8   8ed8            MOV         DS,AX                                   
ram:f000:8fea   c606890000      MOV         byte ptr [PCSR_1_INT1],0x0              
ram:f000:8fef   b840c0          MOV         AX,0xc040                               
ram:f000:8ff2   8ed8            MOV         DS,AX                                   
ram:f000:8ff4   c70622000d00    MOV         word ptr [offset INT_CTRL_EOI &0xff],0xd
ram:f000:8ffa   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void int0_express(void)
                                                          ;XREF[1,0]:   f000:888f
ram:f000:8fff   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:9004   81ec0000        SUB         SP,0x0                                  
ram:f000:9008   b8001f          MOV         AX,0x1f00                               
ram:f000:900b   8ed8            MOV         DS,AX                                   
ram:f000:900d   f6060000ff      TEST        byte ptr [0x0]=>express_job_pending,0xff
ram:f000:9012   751f            JNZ         LAB_f000_9033                           
ram:f000:9014   b8001f          MOV         AX,0x1f00                               
ram:f000:9017   8ed8            MOV         DS,AX                                   
ram:f000:9019   ff362400        PUSH        word ptr [offset JOB_Q_CS &0xff]        
ram:f000:901d   ff362200        PUSH        word ptr [offset JOB_Q_IP &0xff]        
ram:f000:9021   9ac40010fd      CALLF       get_express_job                         ;void get_express_job(void)
ram:f000:9026   83c404          ADD         SP,0x4                                  
ram:f000:9029   b8001f          MOV         AX,0x1f00                               
ram:f000:902c   8ed8            MOV         DS,AX                                   
ram:f000:902e   c606000001      MOV         byte ptr [0x0]=>express_job_pending,0x1 
                            LAB_f000_9033:                ;XREF[1,0]:   f000:9012
ram:f000:9033   b800c0          MOV         AX,0xc000                               
ram:f000:9036   8ed8            MOV         DS,AX                                   
ram:f000:9038   c606880000      MOV         byte ptr [PCSR_0_INT0],0x0              
ram:f000:903d   b840c0          MOV         AX,0xc040                               
ram:f000:9040   8ed8            MOV         DS,AX                                   
ram:f000:9042   c70622000c00    MOV         word ptr [offset INT_CTRL_EOI &0xff],0xc
ram:f000:9048   ea7e00e0fd      JMPF        init_vectors::function_return           
ram:f000:904d   90              NOP                                                  
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void FUN_f000_904e(void)
                                                          ;XREF[1,0]:   f000:9093
ram:f000:904e   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:9053   81ec0000        SUB         SP,0x0                                  
ram:f000:9057   8b7e0e          MOV         DI,word ptr [BP + 0xe]                  
                            LAB_f000_905a:                ;XREF[1,0]:   f000:905f
ram:f000:905a   85ff            TEST        DI,DI                                   
ram:f000:905c   7403            JZ          LAB_f000_9061                           
ram:f000:905e   4f              DEC         DI                                      
ram:f000:905f   ebf9            JMP         LAB_f000_905a                           
                            LAB_f000_9061:                ;XREF[1,0]:   f000:905c
ram:f000:9061   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void after_full_job(void)
                                                          ;XREF[1,0]:   f000:883b
ram:f000:9066   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:906b   81ec0000        SUB         SP,0x0                                  
ram:f000:906f   31ff            XOR         DI,DI                                   
                            LAB_f000_9071:                ;XREF[1,0]:   f000:909b
ram:f000:9071   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:9074   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:9077   9a4c0090fd      CALLF       complete_full_job                       ;undefined2 complete_full_job(void)
ram:f000:907c   83c404          ADD         SP,0x4                                  
ram:f000:907f   3d0100          CMP         AX,0x1                                  
ram:f000:9082   7419            JZ          LAB_f000_909d                           
ram:f000:9084   47              INC         DI                                      
ram:f000:9085   83ff64          CMP         DI,0x64                                 
ram:f000:9088   7505            JNZ         LAB_f000_908f                           
ram:f000:908a   9ab700f0f8      CALLF       halt_on_error                           ;void halt_on_error(void)
                            LAB_f000_908f:                ;XREF[1,0]:   f000:9088
ram:f000:908f   b80a00          MOV         AX,0xa                                  
ram:f000:9092   50              PUSH        AX                                      
ram:f000:9093   9a4e0000f9      CALLF       FUN_f000_904e                           ;void FUN_f000_904e(void)
ram:f000:9098   83c402          ADD         SP,0x2                                  
ram:f000:909b   ebd4            JMP         LAB_f000_9071                           
                            LAB_f000_909d:                ;XREF[1,0]:   f000:9082
ram:f000:909d   9a220090fd      CALLF       req_sbd_interrupt                       ;void req_sbd_interrupt(void)
ram:f000:90a2   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void after_express_job(void)
                                                          ;XREF[1,0]:   f000:87ab
ram:f000:90a7   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:90ac   81ec0400        SUB         SP,0x4                                  
ram:f000:90b0   be001f          MOV         SI,0x1f00                               
ram:f000:90b3   8ede            MOV         DS,SI                                   
ram:f000:90b5   c5362200        LDS         SI,[offset JOB_Q_IP &0xff]              
ram:f000:90b9   807c030a        CMP         byte ptr [SI + 0x3],0xa                 
ram:f000:90bd   750d            JNZ         LAB_f000_90cc                           
ram:f000:90bf   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:90c2   c744040040      MOV         word ptr [SI + 0x4],0x4000              
ram:f000:90c7   c744060002      MOV         word ptr [SI + 0x6],0x200               
                            LAB_f000_90cc:                ;XREF[1,0]:   f000:90bd
ram:f000:90cc   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:90cf   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:90d2   9a300020fd      CALLF       complete_express_job                    ;void complete_express_job(void)
ram:f000:90d7   83c404          ADD         SP,0x4                                  
ram:f000:90da   9a220090fd      CALLF       req_sbd_interrupt                       ;void req_sbd_interrupt(void)
ram:f000:90df   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void find_next_available_job(void)
                                                          ;XREF[2,0]:   f000:884e,f000:8fe0
ram:f000:90e4   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:90e9   81ec0000        SUB         SP,0x0                                  
ram:f000:90ed   b8001f          MOV         AX,0x1f00                               
ram:f000:90f0   8ed8            MOV         DS,AX                                   
ram:f000:90f2   f6060100ff      TEST        byte ptr [offset job_pending &0xff],0xff
ram:f000:90f7   753e            JNZ         LAB_f000_9137                           
ram:f000:90f9   31ff            XOR         DI,DI                                   
                            LAB_f000_90fb:                ;XREF[1,0]:   f000:9135
ram:f000:90fb   b8001f          MOV         AX,0x1f00                               
ram:f000:90fe   8ed8            MOV         DS,AX                                   
ram:f000:9100   a03d00          MOV         AL,[offset NUM_REQ_Q &0xff]             
ram:f000:9103   30e4            XOR         AH,AH                                   
ram:f000:9105   3bf8            CMP         DI,AX                                   
ram:f000:9107   732e            JNC         LAB_f000_9137                           
ram:f000:9109   b8001f          MOV         AX,0x1f00                               
ram:f000:910c   8ed8            MOV         DS,AX                                   
ram:f000:910e   ff362400        PUSH        word ptr [offset JOB_Q_CS &0xff]        
ram:f000:9112   ff362200        PUSH        word ptr [offset JOB_Q_IP &0xff]        
ram:f000:9116   b80100          MOV         AX,0x1                                  
ram:f000:9119   50              PUSH        AX                                      
ram:f000:911a   57              PUSH        DI                                      
ram:f000:911b   9a900030fd      CALLF       scan_request_queues_for_job             ;int scan_request_queues_for_job(void)
ram:f000:9120   83c408          ADD         SP,0x8                                  
ram:f000:9123   3d0100          CMP         AX,0x1                                  
ram:f000:9126   750c            JNZ         LAB_f000_9134                           
ram:f000:9128   b8001f          MOV         AX,0x1f00                               
ram:f000:912b   8ed8            MOV         DS,AX                                   
ram:f000:912d   c606010001      MOV         byte ptr [offset job_pending &0xff],0x1 
ram:f000:9132   eb03            JMP         LAB_f000_9137                           
                            LAB_f000_9134:                ;XREF[1,0]:   f000:9126
ram:f000:9134   47              INC         DI                                      
ram:f000:9135   ebc4            JMP         LAB_f000_90fb                           
                            LAB_f000_9137:                ;XREF[3,0]:   f000:90f7,f000:9107,f000:9132
ram:f000:9137   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 scsi_transfer_info(void)
                                                          ;XREF[6,0]:   f000:950c,f000:9661,f000:a0b8,f000:a16c
                                                          ;             f000:a31c,f000:a3ea
ram:f000:913c   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:9141   81ec0200        SUB         SP,0x2                                  
ram:f000:9145   b800c0          MOV         AX,0xc000                               
ram:f000:9148   8ed8            MOV         DS,AX                                   
                            ;SCSI Command: Single Byte + Transfer Info
ram:f000:914a   c606030054      MOV         byte ptr [SCSI_CMD_REG],0x54            
                            LAB_f000_914f:                ;XREF[1,0]:   f000:9161
ram:f000:914f   b800c0          MOV         AX,0xc000                               
ram:f000:9152   8ed8            MOV         DS,AX                                   
ram:f000:9154   a00900          MOV         AL,[SCSI_AUX_STAT_REG]                  
ram:f000:9157   30e4            XOR         AH,AH                                   
ram:f000:9159   258000          AND         AX,0x80                                 
ram:f000:915c   3d8000          CMP         AX,0x80                                 
ram:f000:915f   7402            JZ          LAB_f000_9163                           
ram:f000:9161   ebec            JMP         LAB_f000_914f                           
                            LAB_f000_9163:                ;XREF[1,0]:   f000:915f
ram:f000:9163   b800c0          MOV         AX,0xc000                               
ram:f000:9166   8ed8            MOV         DS,AX                                   
ram:f000:9168   a00100          MOV         AL,[SCSI_DATA_REG]                      
ram:f000:916b   30e4            XOR         AH,AH                                   
ram:f000:916d   8946fe          MOV         word ptr [BP + -0x2],AX                 
ram:f000:9170   8b46fe          MOV         AX,word ptr [BP + -0x2]                 
ram:f000:9173   eb00            JMP         LAB_f000_9175                           
                            LAB_f000_9175:                ;XREF[1,0]:   f000:9173
ram:f000:9175   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void scsi_send_data(void)
                                                          ;XREF[3,0]:   f000:990b,f000:a2ca,f000:a2f4
ram:f000:917a   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:917f   81ec0000        SUB         SP,0x0                                  
ram:f000:9183   b800c0          MOV         AX,0xc000                               
ram:f000:9186   8ed8            MOV         DS,AX                                   
                            ;SCSI Command: Single Byte + Transfer Info
ram:f000:9188   c606030054      MOV         byte ptr [SCSI_CMD_REG],0x54            
                            LAB_f000_918d:                ;XREF[1,0]:   f000:919c
ram:f000:918d   b800c0          MOV         AX,0xc000                               
ram:f000:9190   8ed8            MOV         DS,AX                                   
ram:f000:9192   a00900          MOV         AL,[SCSI_AUX_STAT_REG]                  
ram:f000:9195   30e4            XOR         AH,AH                                   
ram:f000:9197   a98000          TEST        AX,0x80                                 
ram:f000:919a   7402            JZ          LAB_f000_919e                           
ram:f000:919c   ebef            JMP         LAB_f000_918d                           
                            LAB_f000_919e:                ;XREF[1,0]:   f000:919a
ram:f000:919e   b800c0          MOV         AX,0xc000                               
ram:f000:91a1   8ed8            MOV         DS,AX                                   
ram:f000:91a3   8a460e          MOV         AL,byte ptr [BP + 0xe]                  
ram:f000:91a6   a20100          MOV         [SCSI_DATA_REG],AL                      
ram:f000:91a9   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void scsi_dma_setup(void)
                                                          ;XREF[4,0]:   f000:9622,f000:99da,f000:9c6d,f000:9da8
ram:f000:91ae   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:91b3   81ec0c00        SUB         SP,0xc                                  
ram:f000:91b7   be101f          MOV         SI,0x1f10                               
ram:f000:91ba   8ede            MOV         DS,SI                                   
ram:f000:91bc   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:91c0   f74428ffff      TEST        word ptr [SI + 0x28],0xffff             
ram:f000:91c5   7507            JNZ         LAB_f000_91ce                           
ram:f000:91c7   f74426ffff      TEST        word ptr [SI + 0x26],0xffff             
ram:f000:91cc   744f            JZ          LAB_f000_921d                           
                            LAB_f000_91ce:                ;XREF[1,0]:   f000:91c5
ram:f000:91ce   be101f          MOV         SI,0x1f10                               
ram:f000:91d1   8ede            MOV         DS,SI                                   
ram:f000:91d3   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:91d7   8b442a          MOV         AX,word ptr [SI + 0x2a]                 
ram:f000:91da   8b542c          MOV         DX,word ptr [SI + 0x2c]                 
ram:f000:91dd   be101f          MOV         SI,0x1f10                               
ram:f000:91e0   8ede            MOV         DS,SI                                   
ram:f000:91e2   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:91e6   89441a          MOV         word ptr [SI + 0x1a],AX                 
ram:f000:91e9   89541c          MOV         word ptr [SI + 0x1c],DX                 
ram:f000:91ec   be101f          MOV         SI,0x1f10                               
ram:f000:91ef   8ede            MOV         DS,SI                                   
ram:f000:91f1   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:91f5   8b4426          MOV         AX,word ptr [SI + 0x26]                 
ram:f000:91f8   8b5428          MOV         DX,word ptr [SI + 0x28]                 
ram:f000:91fb   be101f          MOV         SI,0x1f10                               
ram:f000:91fe   8ede            MOV         DS,SI                                   
ram:f000:9200   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9204   89441e          MOV         word ptr [SI + 0x1e],AX                 
ram:f000:9207   895420          MOV         word ptr [SI + 0x20],DX                 
ram:f000:920a   be101f          MOV         SI,0x1f10                               
ram:f000:920d   8ede            MOV         DS,SI                                   
ram:f000:920f   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9213   c744260000      MOV         word ptr [SI + 0x26],0x0                
ram:f000:9218   c744280000      MOV         word ptr [SI + 0x28],0x0                
                            LAB_f000_921d:                ;XREF[1,0]:   f000:91cc
ram:f000:921d   be101f          MOV         SI,0x1f10                               
ram:f000:9220   8ede            MOV         DS,SI                                   
ram:f000:9222   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9226   8b441a          MOV         AX,word ptr [SI + 0x1a]                 
ram:f000:9229   8b541c          MOV         DX,word ptr [SI + 0x1c]                 
ram:f000:922c   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:922f   8956fe          MOV         word ptr [BP + -0x2],DX                 
ram:f000:9232   be101f          MOV         SI,0x1f10                               
ram:f000:9235   8ede            MOV         DS,SI                                   
ram:f000:9237   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:923b   8b441e          MOV         AX,word ptr [SI + 0x1e]                 
ram:f000:923e   8b5420          MOV         DX,word ptr [SI + 0x20]                 
ram:f000:9241   8946f8          MOV         word ptr [BP + -0x8],AX                 
ram:f000:9244   8956fa          MOV         word ptr [BP + -0x6],DX                 
ram:f000:9247   b80000          MOV         AX,0x0                                  
ram:f000:924a   ba0200          MOV         DX,0x2                                  
ram:f000:924d   8b4efc          MOV         CX,word ptr [BP + -0x4]                 
ram:f000:9250   8b5efe          MOV         BX,word ptr [BP + -0x2]                 
ram:f000:9253   81e1ffff        AND         CX,0xffff                               
ram:f000:9257   81e30100        AND         BX,0x1                                  
ram:f000:925b   2bc1            SUB         AX,CX                                   
ram:f000:925d   1bd3            SBB         DX,BX                                   
ram:f000:925f   8946f4          MOV         word ptr [BP + -0xc],AX                 
ram:f000:9262   8956f6          MOV         word ptr [BP + -0xa],DX                 
ram:f000:9265   3b56fa          CMP         DX,word ptr [BP + -0x6]                 
ram:f000:9268   7f58            JG          LAB_f000_92c2                           
ram:f000:926a   7c05            JL          LAB_f000_9271                           
ram:f000:926c   3b46f8          CMP         AX,word ptr [BP + -0x8]                 
ram:f000:926f   7351            JNC         LAB_f000_92c2                           
                            LAB_f000_9271:                ;XREF[1,0]:   f000:926a
ram:f000:9271   8b46f8          MOV         AX,word ptr [BP + -0x8]                 
ram:f000:9274   8b56fa          MOV         DX,word ptr [BP + -0x6]                 
ram:f000:9277   2b46f4          SUB         AX,word ptr [BP + -0xc]                 
ram:f000:927a   1b56f6          SBB         DX,word ptr [BP + -0xa]                 
ram:f000:927d   be101f          MOV         SI,0x1f10                               
ram:f000:9280   8ede            MOV         DS,SI                                   
ram:f000:9282   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9286   894426          MOV         word ptr [SI + 0x26],AX                 
ram:f000:9289   895428          MOV         word ptr [SI + 0x28],DX                 
ram:f000:928c   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:928f   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:9292   0346f4          ADD         AX,word ptr [BP + -0xc]                 
ram:f000:9295   1356f6          ADC         DX,word ptr [BP + -0xa]                 
ram:f000:9298   be101f          MOV         SI,0x1f10                               
ram:f000:929b   8ede            MOV         DS,SI                                   
ram:f000:929d   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:92a1   89442a          MOV         word ptr [SI + 0x2a],AX                 
ram:f000:92a4   89542c          MOV         word ptr [SI + 0x2c],DX                 
ram:f000:92a7   8b46f4          MOV         AX,word ptr [BP + -0xc]                 
ram:f000:92aa   8b56f6          MOV         DX,word ptr [BP + -0xa]                 
ram:f000:92ad   8946f8          MOV         word ptr [BP + -0x8],AX                 
ram:f000:92b0   8956fa          MOV         word ptr [BP + -0x6],DX                 
ram:f000:92b3   be101f          MOV         SI,0x1f10                               
ram:f000:92b6   8ede            MOV         DS,SI                                   
ram:f000:92b8   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:92bc   89441e          MOV         word ptr [SI + 0x1e],AX                 
ram:f000:92bf   895420          MOV         word ptr [SI + 0x20],DX                 
                            LAB_f000_92c2:                ;XREF[2,0]:   f000:9268,f000:926f
ram:f000:92c2   be101f          MOV         SI,0x1f10                               
ram:f000:92c5   8ede            MOV         DS,SI                                   
ram:f000:92c7   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:92cb   8b04            MOV         AX,word ptr [SI]                        
ram:f000:92cd   a94000          TEST        AX,0x40                                 
ram:f000:92d0   7503            JNZ         LAB_f000_92d5                           
ram:f000:92d2   e9ff00          JMP         LAB_f000_93d4                           
                            LAB_f000_92d5:                ;XREF[1,0]:   f000:92d0
ram:f000:92d5   8b46f8          MOV         AX,word ptr [BP + -0x8]                 
ram:f000:92d8   8b56fa          MOV         DX,word ptr [BP + -0x6]                 
ram:f000:92db   250100          AND         AX,0x1                                  
ram:f000:92de   81e20000        AND         DX,0x0                                  
ram:f000:92e2   85d2            TEST        DX,DX                                   
ram:f000:92e4   7504            JNZ         LAB_f000_92ea                           
ram:f000:92e6   85c0            TEST        AX,AX                                   
ram:f000:92e8   742e            JZ          LAB_f000_9318                           
                            LAB_f000_92ea:                ;XREF[1,0]:   f000:92e4
ram:f000:92ea   be101f          MOV         SI,0x1f10                               
ram:f000:92ed   8ede            MOV         DS,SI                                   
ram:f000:92ef   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:92f3   810c0001        OR          word ptr [SI],0x100                     
ram:f000:92f7   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:92fa   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:92fd   0346f8          ADD         AX,word ptr [BP + -0x8]                 
ram:f000:9300   1356fa          ADC         DX,word ptr [BP + -0x6]                 
ram:f000:9303   2d0100          SUB         AX,0x1                                  
ram:f000:9306   83da00          SBB         DX,0x0                                  
ram:f000:9309   be101f          MOV         SI,0x1f10                               
ram:f000:930c   8ede            MOV         DS,SI                                   
ram:f000:930e   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9312   89442e          MOV         word ptr [SI + 0x2e],AX                 
ram:f000:9315   895430          MOV         word ptr [SI + 0x30],DX                 
                            LAB_f000_9318:                ;XREF[1,0]:   f000:92e8
ram:f000:9318   837efa00        CMP         word ptr [BP + -0x6],0x0                
ram:f000:931c   7509            JNZ         LAB_f000_9327                           
ram:f000:931e   837ef801        CMP         word ptr [BP + -0x8],0x1                
ram:f000:9322   7503            JNZ         LAB_f000_9327                           
ram:f000:9324   e97401          JMP         LAB_f000_949b                           
                            LAB_f000_9327:                ;XREF[2,0]:   f000:931c,f000:9322
ram:f000:9327   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:932a   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:932d   b91100          MOV         CX,0x11                                 
ram:f000:9330   e306            JCXZ        LAB_f000_9338                           
                            LAB_f000_9332:                ;XREF[1,0]:   f000:9336
ram:f000:9332   d1fa            SAR         DX,1                                    
ram:f000:9334   d1d8            RCR         AX,1                                    
ram:f000:9336   e2fa            LOOP        LAB_f000_9332                           
                            LAB_f000_9338:                ;XREF[1,0]:   f000:9330
ram:f000:9338   ba00c0          MOV         DX,0xc000                               
ram:f000:933b   8eda            MOV         DS,DX                                   
ram:f000:933d   a2a200          MOV         [SCSI_TO_3B2_PAGE],AL                   
ram:f000:9340   b820c0          MOV         AX,0xc020                               
ram:f000:9343   8ed8            MOV         DS,AX                                   
ram:f000:9345   c606980000      MOV         byte ptr [offset DMA_BYTE_REG &0xff],0x0
ram:f000:934a   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:934d   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:9350   d1fa            SAR         DX,1                                    
ram:f000:9352   d1d8            RCR         AX,1                                    
ram:f000:9354   ba20c0          MOV         DX,0xc020                               
ram:f000:9357   8eda            MOV         DS,DX                                   
ram:f000:9359   a28000          MOV         [offset DMA0_ADDRESS &0xff],AL          
ram:f000:935c   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:935f   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:9362   b90900          MOV         CX,0x9                                  
ram:f000:9365   e306            JCXZ        LAB_f000_936d                           
                            LAB_f000_9367:                ;XREF[1,0]:   f000:936b
ram:f000:9367   d1fa            SAR         DX,1                                    
ram:f000:9369   d1d8            RCR         AX,1                                    
ram:f000:936b   e2fa            LOOP        LAB_f000_9367                           
                            LAB_f000_936d:                ;XREF[1,0]:   f000:9365
ram:f000:936d   ba20c0          MOV         DX,0xc020                               
ram:f000:9370   8eda            MOV         DS,DX                                   
ram:f000:9372   a28000          MOV         [offset DMA0_ADDRESS &0xff],AL          
ram:f000:9375   d17efa          SAR         word ptr [BP + -0x6],1                  
ram:f000:9378   d15ef8          RCR         word ptr [BP + -0x8],1                  
ram:f000:937b   836ef801        SUB         word ptr [BP + -0x8],0x1                
ram:f000:937f   835efa00        SBB         word ptr [BP + -0x6],0x0                
ram:f000:9383   b820c0          MOV         AX,0xc020                               
ram:f000:9386   8ed8            MOV         DS,AX                                   
ram:f000:9388   c606980000      MOV         byte ptr [offset DMA_BYTE_REG &0xff],0x0
ram:f000:938d   8a46f8          MOV         AL,byte ptr [BP + -0x8]                 
ram:f000:9390   30e4            XOR         AH,AH                                   
ram:f000:9392   ba20c0          MOV         DX,0xc020                               
ram:f000:9395   8eda            MOV         DS,DX                                   
ram:f000:9397   a28200          MOV         [offset DMA0_CONTROL &0xff],AL          
ram:f000:939a   8b46f8          MOV         AX,word ptr [BP + -0x8]                 
ram:f000:939d   8b56fa          MOV         DX,word ptr [BP + -0x6]                 
ram:f000:93a0   b90800          MOV         CX,0x8                                  
ram:f000:93a3   e306            JCXZ        LAB_f000_93ab                           
                            LAB_f000_93a5:                ;XREF[1,0]:   f000:93a9
ram:f000:93a5   d1fa            SAR         DX,1                                    
ram:f000:93a7   d1d8            RCR         AX,1                                    
ram:f000:93a9   e2fa            LOOP        LAB_f000_93a5                           
                            LAB_f000_93ab:                ;XREF[1,0]:   f000:93a3
ram:f000:93ab   ba20c0          MOV         DX,0xc020                               
ram:f000:93ae   8eda            MOV         DS,DX                                   
ram:f000:93b0   a28200          MOV         [offset DMA0_CONTROL &0xff],AL          
ram:f000:93b3   b820c0          MOV         AX,0xc020                               
ram:f000:93b6   8ed8            MOV         DS,AX                                   
ram:f000:93b8   c606900000      MOV         byte ptr [offset DMA_CSR &0xff],0x0     
ram:f000:93bd   b820c0          MOV         AX,0xc020                               
ram:f000:93c0   8ed8            MOV         DS,AX                                   
ram:f000:93c2   c606960008      MOV         byte ptr [offset DMA_MODE_REG &0xff],0x8
ram:f000:93c7   b820c0          MOV         AX,0xc020                               
ram:f000:93ca   8ed8            MOV         DS,AX                                   
ram:f000:93cc   c606940000      MOV         byte ptr [offset DMA_MASK_REG &0xff],0x0
ram:f000:93d1   e9c700          JMP         LAB_f000_949b                           
                            LAB_f000_93d4:                ;XREF[1,0]:   f000:92d2
ram:f000:93d4   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:93d7   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:93da   b91100          MOV         CX,0x11                                 
ram:f000:93dd   e306            JCXZ        LAB_f000_93e5                           
                            LAB_f000_93df:                ;XREF[1,0]:   f000:93e3
ram:f000:93df   d1fa            SAR         DX,1                                    
ram:f000:93e1   d1d8            RCR         AX,1                                    
ram:f000:93e3   e2fa            LOOP        LAB_f000_93df                           
                            LAB_f000_93e5:                ;XREF[1,0]:   f000:93dd
ram:f000:93e5   ba00c0          MOV         DX,0xc000                               
ram:f000:93e8   8eda            MOV         DS,DX                                   
ram:f000:93ea   a2c200          MOV         [3B2_TO_SCSI_PAGE_REG],AL               
ram:f000:93ed   b820c0          MOV         AX,0xc020                               
ram:f000:93f0   8ed8            MOV         DS,AX                                   
ram:f000:93f2   c606980000      MOV         byte ptr [offset DMA_BYTE_REG &0xff],0x0
ram:f000:93f7   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:93fa   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:93fd   d1fa            SAR         DX,1                                    
ram:f000:93ff   d1d8            RCR         AX,1                                    
ram:f000:9401   ba20c0          MOV         DX,0xc020                               
ram:f000:9404   8eda            MOV         DS,DX                                   
ram:f000:9406   a28400          MOV         [offset DMA1_ADDRESS_REG &0xff],AL      
ram:f000:9409   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:940c   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:940f   b90900          MOV         CX,0x9                                  
ram:f000:9412   e306            JCXZ        LAB_f000_941a                           
                            LAB_f000_9414:                ;XREF[1,0]:   f000:9418
ram:f000:9414   d1fa            SAR         DX,1                                    
ram:f000:9416   d1d8            RCR         AX,1                                    
ram:f000:9418   e2fa            LOOP        LAB_f000_9414                           
                            LAB_f000_941a:                ;XREF[1,0]:   f000:9412
ram:f000:941a   ba20c0          MOV         DX,0xc020                               
ram:f000:941d   8eda            MOV         DS,DX                                   
ram:f000:941f   a28400          MOV         [offset DMA1_ADDRESS_REG &0xff],AL      
ram:f000:9422   8b46f8          MOV         AX,word ptr [BP + -0x8]                 
ram:f000:9425   8b56fa          MOV         DX,word ptr [BP + -0x6]                 
ram:f000:9428   250100          AND         AX,0x1                                  
ram:f000:942b   81e20000        AND         DX,0x0                                  
ram:f000:942f   85d2            TEST        DX,DX                                   
ram:f000:9431   7504            JNZ         LAB_f000_9437                           
ram:f000:9433   85c0            TEST        AX,AX                                   
ram:f000:9435   7408            JZ          LAB_f000_943f                           
                            LAB_f000_9437:                ;XREF[1,0]:   f000:9431
ram:f000:9437   d17efa          SAR         word ptr [BP + -0x6],1                  
ram:f000:943a   d15ef8          RCR         word ptr [BP + -0x8],1                  
ram:f000:943d   eb0e            JMP         LAB_f000_944d                           
                            LAB_f000_943f:                ;XREF[1,0]:   f000:9435
ram:f000:943f   d17efa          SAR         word ptr [BP + -0x6],1                  
ram:f000:9442   d15ef8          RCR         word ptr [BP + -0x8],1                  
ram:f000:9445   836ef801        SUB         word ptr [BP + -0x8],0x1                
ram:f000:9449   835efa00        SBB         word ptr [BP + -0x6],0x0                
                            LAB_f000_944d:                ;XREF[1,0]:   f000:943d
ram:f000:944d   b820c0          MOV         AX,0xc020                               
ram:f000:9450   8ed8            MOV         DS,AX                                   
ram:f000:9452   c606980000      MOV         byte ptr [offset DMA_BYTE_REG &0xff],0x0
ram:f000:9457   8a46f8          MOV         AL,byte ptr [BP + -0x8]                 
ram:f000:945a   30e4            XOR         AH,AH                                   
ram:f000:945c   ba20c0          MOV         DX,0xc020                               
ram:f000:945f   8eda            MOV         DS,DX                                   
ram:f000:9461   a28600          MOV         [offset DMA1_CONTROL_REG &0xff],AL      
ram:f000:9464   8b46f8          MOV         AX,word ptr [BP + -0x8]                 
ram:f000:9467   8b56fa          MOV         DX,word ptr [BP + -0x6]                 
ram:f000:946a   b90800          MOV         CX,0x8                                  
ram:f000:946d   e306            JCXZ        LAB_f000_9475                           
                            LAB_f000_946f:                ;XREF[1,0]:   f000:9473
ram:f000:946f   d1fa            SAR         DX,1                                    
ram:f000:9471   d1d8            RCR         AX,1                                    
ram:f000:9473   e2fa            LOOP        LAB_f000_946f                           
                            LAB_f000_9475:                ;XREF[1,0]:   f000:946d
ram:f000:9475   ba20c0          MOV         DX,0xc020                               
ram:f000:9478   8eda            MOV         DS,DX                                   
ram:f000:947a   a28600          MOV         [offset DMA1_CONTROL_REG &0xff],AL      
ram:f000:947d   b820c0          MOV         AX,0xc020                               
ram:f000:9480   8ed8            MOV         DS,AX                                   
ram:f000:9482   c606900000      MOV         byte ptr [offset DMA_CSR &0xff],0x0     
ram:f000:9487   b820c0          MOV         AX,0xc020                               
ram:f000:948a   8ed8            MOV         DS,AX                                   
ram:f000:948c   c606960005      MOV         byte ptr [offset DMA_MODE_REG &0xff],0x5
ram:f000:9491   b820c0          MOV         AX,0xc020                               
ram:f000:9494   8ed8            MOV         DS,AX                                   
ram:f000:9496   c606940001      MOV         byte ptr [offset DMA_MASK_REG &0xff],0x1
                            LAB_f000_949b:                ;XREF[2,0]:   f000:9324,f000:93d1
ram:f000:949b   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void FUN_f000_94a0(void)
                                                          ;XREF[2,0]:   f000:a0a0,f000:a164
ram:f000:94a0   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:94a5   81ec0600        SUB         SP,0x6                                  
ram:f000:94a9   be101f          MOV         SI,0x1f10                               
ram:f000:94ac   8ede            MOV         DS,SI                                   
ram:f000:94ae   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:94b2   f74424ffff      TEST        word ptr [SI + 0x24],0xffff             
ram:f000:94b7   7532            JNZ         LAB_f000_94eb                           
ram:f000:94b9   f74422ffff      TEST        word ptr [SI + 0x22],0xffff             
ram:f000:94be   752b            JNZ         LAB_f000_94eb                           
ram:f000:94c0   b800c0          MOV         AX,0xc000                               
ram:f000:94c3   8ed8            MOV         DS,AX                                   
ram:f000:94c5   c6061d0000      MOV         byte ptr [SCSI_XFR_LSB],0x0             
ram:f000:94ca   b800c0          MOV         AX,0xc000                               
ram:f000:94cd   8ed8            MOV         DS,AX                                   
ram:f000:94cf   c6061b0002      MOV         byte ptr [SCSI_XFR_MMB],0x2             
ram:f000:94d4   b800c0          MOV         AX,0xc000                               
ram:f000:94d7   8ed8            MOV         DS,AX                                   
ram:f000:94d9   c606190000      MOV         byte ptr [SCSI_XFR_MSB],0x0             ;Transfer 512 bytes
ram:f000:94de   b800c0          MOV         AX,0xc000                               
ram:f000:94e1   8ed8            MOV         DS,AX                                   
                            ;SCSI Command: Transfer Pad
ram:f000:94e3   c606030015      MOV         byte ptr [SCSI_CMD_REG],0x15            
ram:f000:94e8   e92902          JMP         LAB_f000_9714                           
                            LAB_f000_94eb:                ;XREF[2,0]:   f000:94b7,f000:94be
ram:f000:94eb   be101f          MOV         SI,0x1f10                               
ram:f000:94ee   8ede            MOV         DS,SI                                   
ram:f000:94f0   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:94f4   8b441a          MOV         AX,word ptr [SI + 0x1a]                 
ram:f000:94f7   8b541c          MOV         DX,word ptr [SI + 0x1c]                 
ram:f000:94fa   250100          AND         AX,0x1                                  
ram:f000:94fd   81e20000        AND         DX,0x0                                  
ram:f000:9501   85d2            TEST        DX,DX                                   
ram:f000:9503   7507            JNZ         LAB_f000_950c                           
ram:f000:9505   85c0            TEST        AX,AX                                   
ram:f000:9507   7503            JNZ         LAB_f000_950c                           
ram:f000:9509   e9f800          JMP         LAB_f000_9604                           
                            LAB_f000_950c:                ;XREF[2,0]:   f000:9503,f000:9507
ram:f000:950c   9a3c0010f9      CALLF       scsi_transfer_info                      ;undefined2 scsi_transfer_info(void)
ram:f000:9511   8846fb          MOV         byte ptr [BP + -0x5],AL                 
ram:f000:9514   b80100          MOV         AX,0x1                                  
ram:f000:9517   50              PUSH        AX                                      
ram:f000:9518   b80100          MOV         AX,0x1                                  
ram:f000:951b   50              PUSH        AX                                      
ram:f000:951c   be101f          MOV         SI,0x1f10                               
ram:f000:951f   8ede            MOV         DS,SI                                   
ram:f000:9521   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9525   ff741c          PUSH        word ptr [SI + 0x1c]                    
ram:f000:9528   ff741a          PUSH        word ptr [SI + 0x1a]                    
ram:f000:952b   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:952e   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:9531   2c05            SUB         AL,0x5                                  
ram:f000:9533   7303            JNC         LAB_f000_9538                           
ram:f000:9535   83ea10          SUB         DX,0x10                                 
                            LAB_f000_9538:                ;XREF[1,0]:   f000:9533
ram:f000:9538   d1ea            SHR         DX,1                                    
ram:f000:953a   d1ea            SHR         DX,1                                    
ram:f000:953c   d1ea            SHR         DX,1                                    
ram:f000:953e   d1ea            SHR         DX,1                                    
ram:f000:9540   86d4            XCHG        AH,DL                                   
ram:f000:9542   86f2            XCHG        DL,DH                                   
ram:f000:9544   52              PUSH        DX                                      
ram:f000:9545   50              PUSH        AX                                      
ram:f000:9546   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:954b   83c40c          ADD         SP,0xc                                  
ram:f000:954e   be101f          MOV         SI,0x1f10                               
ram:f000:9551   8ede            MOV         DS,SI                                   
ram:f000:9553   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9557   836c2201        SUB         word ptr [SI + 0x22],0x1                
ram:f000:955b   835c2400        SBB         word ptr [SI + 0x24],0x0                
ram:f000:955f   f74424ffff      TEST        word ptr [SI + 0x24],0xffff             
ram:f000:9564   750a            JNZ         LAB_f000_9570                           
ram:f000:9566   f74422ffff      TEST        word ptr [SI + 0x22],0xffff             
ram:f000:956b   7503            JNZ         LAB_f000_9570                           
ram:f000:956d   e9a401          JMP         LAB_f000_9714                           
                            LAB_f000_9570:                ;XREF[2,0]:   f000:9564,f000:956b
ram:f000:9570   be101f          MOV         SI,0x1f10                               
ram:f000:9573   8ede            MOV         DS,SI                                   
ram:f000:9575   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9579   810c0002        OR          word ptr [SI],0x200                     
ram:f000:957d   be101f          MOV         SI,0x1f10                               
ram:f000:9580   8ede            MOV         DS,SI                                   
ram:f000:9582   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9586   83441a01        ADD         word ptr [SI + 0x1a],0x1                
ram:f000:958a   83541c00        ADC         word ptr [SI + 0x1c],0x0                
ram:f000:958e   be101f          MOV         SI,0x1f10                               
ram:f000:9591   8ede            MOV         DS,SI                                   
ram:f000:9593   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9597   836c1e01        SUB         word ptr [SI + 0x1e],0x1                
ram:f000:959b   835c2000        SBB         word ptr [SI + 0x20],0x0                
ram:f000:959f   f74420ffff      TEST        word ptr [SI + 0x20],0xffff             
ram:f000:95a4   755b            JNZ         LAB_f000_9601                           
ram:f000:95a6   f7441effff      TEST        word ptr [SI + 0x1e],0xffff             
ram:f000:95ab   7554            JNZ         LAB_f000_9601                           
ram:f000:95ad   be101f          MOV         SI,0x1f10                               
ram:f000:95b0   8ede            MOV         DS,SI                                   
ram:f000:95b2   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:95b6   c57432          LDS         SI,[SI + 0x32]                          
ram:f000:95b9   8b04            MOV         AX,word ptr [SI]                        
ram:f000:95bb   8b5402          MOV         DX,word ptr [SI + 0x2]                  
ram:f000:95be   be101f          MOV         SI,0x1f10                               
ram:f000:95c1   8ede            MOV         DS,SI                                   
ram:f000:95c3   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:95c7   89441a          MOV         word ptr [SI + 0x1a],AX                 
ram:f000:95ca   89541c          MOV         word ptr [SI + 0x1c],DX                 
ram:f000:95cd   be101f          MOV         SI,0x1f10                               
ram:f000:95d0   8ede            MOV         DS,SI                                   
ram:f000:95d2   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:95d6   c57432          LDS         SI,[SI + 0x32]                          
ram:f000:95d9   8b4404          MOV         AX,word ptr [SI + 0x4]                  
ram:f000:95dc   8b5406          MOV         DX,word ptr [SI + 0x6]                  
ram:f000:95df   be101f          MOV         SI,0x1f10                               
ram:f000:95e2   8ede            MOV         DS,SI                                   
ram:f000:95e4   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:95e8   89441e          MOV         word ptr [SI + 0x1e],AX                 
ram:f000:95eb   895420          MOV         word ptr [SI + 0x20],DX                 
ram:f000:95ee   be101f          MOV         SI,0x1f10                               
ram:f000:95f1   8ede            MOV         DS,SI                                   
ram:f000:95f3   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:95f7   80443208        ADD         byte ptr [SI + 0x32],0x8                
ram:f000:95fb   7304            JNC         LAB_f000_9601                           
ram:f000:95fd   83443410        ADD         word ptr [SI + 0x34],0x10               
                            LAB_f000_9601:                ;XREF[3,0]:   f000:95a4,f000:95ab,f000:95fb
ram:f000:9601   e91001          JMP         LAB_f000_9714                           
                            LAB_f000_9604:                ;XREF[1,0]:   f000:9509
ram:f000:9604   b810c0          MOV         AX,0xc010                               
ram:f000:9607   8ed8            MOV         DS,AX                                   
ram:f000:9609   c606800000      MOV         byte ptr [offset...,0x0                 
ram:f000:960e   b820c0          MOV         AX,0xc020                               
ram:f000:9611   8ed8            MOV         DS,AX                                   
ram:f000:9613   c6069a0000      MOV         byte ptr [offset...,0x0                 
ram:f000:9618   b810c0          MOV         AX,0xc010                               
ram:f000:961b   8ed8            MOV         DS,AX                                   
ram:f000:961d   c606800000      MOV         byte ptr [offset...,0x0                 
ram:f000:9622   9aae0010f9      CALLF       scsi_dma_setup                          ;void scsi_dma_setup(void)
ram:f000:9627   be101f          MOV         SI,0x1f10                               
ram:f000:962a   8ede            MOV         DS,SI                                   
ram:f000:962c   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9630   8b4422          MOV         AX,word ptr [SI + 0x22]                 
ram:f000:9633   8b5424          MOV         DX,word ptr [SI + 0x24]                 
ram:f000:9636   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:9639   8956fe          MOV         word ptr [BP + -0x2],DX                 
ram:f000:963c   be101f          MOV         SI,0x1f10                               
ram:f000:963f   8ede            MOV         DS,SI                                   
ram:f000:9641   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9645   8b04            MOV         AX,word ptr [SI]                        
ram:f000:9647   a90001          TEST        AX,0x100                                
ram:f000:964a   747f            JZ          LAB_f000_96cb                           
ram:f000:964c   be101f          MOV         SI,0x1f10                               
ram:f000:964f   8ede            MOV         DS,SI                                   
ram:f000:9651   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9655   837c2000        CMP         word ptr [SI + 0x20],0x0                
ram:f000:9659   7568            JNZ         LAB_f000_96c3                           
ram:f000:965b   837c1e01        CMP         word ptr [SI + 0x1e],0x1                
ram:f000:965f   7562            JNZ         LAB_f000_96c3                           
ram:f000:9661   9a3c0010f9      CALLF       scsi_transfer_info                      ;undefined2 scsi_transfer_info(void)
ram:f000:9666   8846fb          MOV         byte ptr [BP + -0x5],AL                 
ram:f000:9669   b80100          MOV         AX,0x1                                  
ram:f000:966c   50              PUSH        AX                                      
ram:f000:966d   b80100          MOV         AX,0x1                                  
ram:f000:9670   50              PUSH        AX                                      
ram:f000:9671   be101f          MOV         SI,0x1f10                               
ram:f000:9674   8ede            MOV         DS,SI                                   
ram:f000:9676   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:967a   ff741c          PUSH        word ptr [SI + 0x1c]                    
ram:f000:967d   ff741a          PUSH        word ptr [SI + 0x1a]                    
ram:f000:9680   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:9683   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:9686   2c05            SUB         AL,0x5                                  
ram:f000:9688   7303            JNC         LAB_f000_968d                           
ram:f000:968a   83ea10          SUB         DX,0x10                                 
                            LAB_f000_968d:                ;XREF[1,0]:   f000:9688
ram:f000:968d   d1ea            SHR         DX,1                                    
ram:f000:968f   d1ea            SHR         DX,1                                    
ram:f000:9691   d1ea            SHR         DX,1                                    
ram:f000:9693   d1ea            SHR         DX,1                                    
ram:f000:9695   86d4            XCHG        AH,DL                                   
ram:f000:9697   86f2            XCHG        DL,DH                                   
ram:f000:9699   52              PUSH        DX                                      
ram:f000:969a   50              PUSH        AX                                      
ram:f000:969b   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:96a0   83c40c          ADD         SP,0xc                                  
ram:f000:96a3   be101f          MOV         SI,0x1f10                               
ram:f000:96a6   8ede            MOV         DS,SI                                   
ram:f000:96a8   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:96ac   836c2201        SUB         word ptr [SI + 0x22],0x1                
ram:f000:96b0   835c2400        SBB         word ptr [SI + 0x24],0x0                
ram:f000:96b4   be101f          MOV         SI,0x1f10                               
ram:f000:96b7   8ede            MOV         DS,SI                                   
ram:f000:96b9   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:96bd   8124fffe        AND         word ptr [SI],0xfeff                    
ram:f000:96c1   eb51            JMP         LAB_f000_9714                           
                            LAB_f000_96c3:                ;XREF[2,0]:   f000:9659,f000:965f
ram:f000:96c3   836efc01        SUB         word ptr [BP + -0x4],0x1                
ram:f000:96c7   835efe00        SBB         word ptr [BP + -0x2],0x0                
                            LAB_f000_96cb:                ;XREF[1,0]:   f000:964a
ram:f000:96cb   8a46fc          MOV         AL,byte ptr [BP + -0x4]                 
ram:f000:96ce   30e4            XOR         AH,AH                                   
ram:f000:96d0   ba00c0          MOV         DX,0xc000                               
ram:f000:96d3   8eda            MOV         DS,DX                                   
ram:f000:96d5   a21d00          MOV         [SCSI_XFR_LSB],AL                       
ram:f000:96d8   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:96db   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:96de   b90800          MOV         CX,0x8                                  
ram:f000:96e1   e306            JCXZ        LAB_f000_96e9                           
                            LAB_f000_96e3:                ;XREF[1,0]:   f000:96e7
ram:f000:96e3   d1fa            SAR         DX,1                                    
ram:f000:96e5   d1d8            RCR         AX,1                                    
ram:f000:96e7   e2fa            LOOP        LAB_f000_96e3                           
                            LAB_f000_96e9:                ;XREF[1,0]:   f000:96e1
ram:f000:96e9   ba00c0          MOV         DX,0xc000                               
ram:f000:96ec   8eda            MOV         DS,DX                                   
ram:f000:96ee   a21b00          MOV         [SCSI_XFR_MMB],AL                       
ram:f000:96f1   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:96f4   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:96f7   b91000          MOV         CX,0x10                                 
ram:f000:96fa   e306            JCXZ        LAB_f000_9702                           
                            LAB_f000_96fc:                ;XREF[1,0]:   f000:9700
ram:f000:96fc   d1fa            SAR         DX,1                                    
ram:f000:96fe   d1d8            RCR         AX,1                                    
ram:f000:9700   e2fa            LOOP        LAB_f000_96fc                           
                            LAB_f000_9702:                ;XREF[1,0]:   f000:96fa
ram:f000:9702   ba00c0          MOV         DX,0xc000                               
ram:f000:9705   8eda            MOV         DS,DX                                   
ram:f000:9707   a21900          MOV         [SCSI_XFR_MSB],AL                       
ram:f000:970a   b800c0          MOV         AX,0xc000                               
ram:f000:970d   8ed8            MOV         DS,AX                                   
                            ;SCSI Command: DMA Mode + Transfer Info
ram:f000:970f   c606030094      MOV         byte ptr [SCSI_CMD_REG],0x94            
                            LAB_f000_9714:                ;XREF[4,0]:   f000:94e8,f000:956d,f000:9601,f000:96c1
ram:f000:9714   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void FUN_f000_9719(void)
                                                          ;XREF[1,0]:   f000:a15d
ram:f000:9719   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:971e   81ec0c00        SUB         SP,0xc                                  
ram:f000:9722   be101f          MOV         SI,0x1f10                               
ram:f000:9725   8ede            MOV         DS,SI                                   
ram:f000:9727   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:972b   8b441a          MOV         AX,word ptr [SI + 0x1a]                 
ram:f000:972e   8b541c          MOV         DX,word ptr [SI + 0x1c]                 
ram:f000:9731   8af2            MOV         DH,DL                                   
ram:f000:9733   8ad4            MOV         DL,AH                                   
ram:f000:9735   30e4            XOR         AH,AH                                   
ram:f000:9737   d1e2            SHL         DX,1                                    
ram:f000:9739   d1e2            SHL         DX,1                                    
ram:f000:973b   d1e2            SHL         DX,1                                    
ram:f000:973d   d1e2            SHL         DX,1                                    
ram:f000:973f   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:9742   8956fe          MOV         word ptr [BP + -0x2],DX                 
ram:f000:9745   be101f          MOV         SI,0x1f10                               
ram:f000:9748   8ede            MOV         DS,SI                                   
ram:f000:974a   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:974e   8b441e          MOV         AX,word ptr [SI + 0x1e]                 
ram:f000:9751   8b5420          MOV         DX,word ptr [SI + 0x20]                 
ram:f000:9754   8946f8          MOV         word ptr [BP + -0x8],AX                 
ram:f000:9757   8956fa          MOV         word ptr [BP + -0x6],DX                 
ram:f000:975a   b810c0          MOV         AX,0xc010                               
ram:f000:975d   8ed8            MOV         DS,AX                                   
ram:f000:975f   c606800000      MOV         byte ptr [offset...,0x0                 
ram:f000:9764   b820c0          MOV         AX,0xc020                               
ram:f000:9767   8ed8            MOV         DS,AX                                   
ram:f000:9769   c6069a0000      MOV         byte ptr [offset...,0x0                 
ram:f000:976e   b810c0          MOV         AX,0xc010                               
ram:f000:9771   8ed8            MOV         DS,AX                                   
ram:f000:9773   c606800000      MOV         byte ptr [offset...,0x0                 
ram:f000:9778   8a46f8          MOV         AL,byte ptr [BP + -0x8]                 
ram:f000:977b   30e4            XOR         AH,AH                                   
ram:f000:977d   ba00c0          MOV         DX,0xc000                               
ram:f000:9780   8eda            MOV         DS,DX                                   
ram:f000:9782   a21d00          MOV         [SCSI_XFR_LSB],AL                       
ram:f000:9785   8b46f8          MOV         AX,word ptr [BP + -0x8]                 
ram:f000:9788   8b56fa          MOV         DX,word ptr [BP + -0x6]                 
ram:f000:978b   b90800          MOV         CX,0x8                                  
ram:f000:978e   e306            JCXZ        LAB_f000_9796                           
                            LAB_f000_9790:                ;XREF[1,0]:   f000:9794
ram:f000:9790   d1fa            SAR         DX,1                                    
ram:f000:9792   d1d8            RCR         AX,1                                    
ram:f000:9794   e2fa            LOOP        LAB_f000_9790                           
                            LAB_f000_9796:                ;XREF[1,0]:   f000:978e
ram:f000:9796   ba00c0          MOV         DX,0xc000                               
ram:f000:9799   8eda            MOV         DS,DX                                   
ram:f000:979b   a21b00          MOV         [SCSI_XFR_MMB],AL                       
ram:f000:979e   8b46f8          MOV         AX,word ptr [BP + -0x8]                 
ram:f000:97a1   8b56fa          MOV         DX,word ptr [BP + -0x6]                 
ram:f000:97a4   b91000          MOV         CX,0x10                                 
ram:f000:97a7   e306            JCXZ        LAB_f000_97af                           
                            LAB_f000_97a9:                ;XREF[1,0]:   f000:97ad
ram:f000:97a9   d1fa            SAR         DX,1                                    
ram:f000:97ab   d1d8            RCR         AX,1                                    
ram:f000:97ad   e2fa            LOOP        LAB_f000_97a9                           
                            LAB_f000_97af:                ;XREF[1,0]:   f000:97a7
ram:f000:97af   ba00c0          MOV         DX,0xc000                               
ram:f000:97b2   8eda            MOV         DS,DX                                   
ram:f000:97b4   a21900          MOV         [SCSI_XFR_MSB],AL                       
ram:f000:97b7   b800c0          MOV         AX,0xc000                               
ram:f000:97ba   8ed8            MOV         DS,AX                                   
                            ;SCSI Command: DMA + Transfer Info
ram:f000:97bc   c606030094      MOV         byte ptr [SCSI_CMD_REG],0x94            
                            LAB_f000_97c1:                ;XREF[1,0]:   f000:97fe
ram:f000:97c1   837efa00        CMP         word ptr [BP + -0x6],0x0                
ram:f000:97c5   7c39            JL          LAB_f000_9800                           
ram:f000:97c7   7f06            JG          LAB_f000_97cf                           
ram:f000:97c9   837ef801        CMP         word ptr [BP + -0x8],0x1                
ram:f000:97cd   7631            JBE         LAB_f000_9800                           
                            LAB_f000_97cf:                ;XREF[1,0]:   f000:97c7
ram:f000:97cf   b800c0          MOV         AX,0xc000                               
ram:f000:97d2   8ed8            MOV         DS,AX                                   
ram:f000:97d4   a18400          MOV         AX,[PCSR_ALL]                           
ram:f000:97d7   250003          AND         AX,0x300                                
ram:f000:97da   3d0003          CMP         AX,0x300                                
ram:f000:97dd   751f            JNZ         LAB_f000_97fe                           
ram:f000:97df   b820c0          MOV         AX,0xc020                               
ram:f000:97e2   8ed8            MOV         DS,AX                                   
ram:f000:97e4   a10000          MOV         AX,[0x0]=>3B2_FIFO_WORD                 
ram:f000:97e7   c576fc          LDS         SI,[BP + -0x4]                          
ram:f000:97ea   8904            MOV         word ptr [SI],AX                        
ram:f000:97ec   8046fc02        ADD         byte ptr [BP + -0x4],0x2                
ram:f000:97f0   7304            JNC         LAB_f000_97f6                           
ram:f000:97f2   8346fe10        ADD         word ptr [BP + -0x2],0x10               
                            LAB_f000_97f6:                ;XREF[1,0]:   f000:97f0
ram:f000:97f6   836ef802        SUB         word ptr [BP + -0x8],0x2                
ram:f000:97fa   835efa00        SBB         word ptr [BP + -0x6],0x0                
                            LAB_f000_97fe:                ;XREF[1,0]:   f000:97dd
ram:f000:97fe   ebc1            JMP         LAB_f000_97c1                           
                            LAB_f000_9800:                ;XREF[3,0]:   f000:97c5,f000:97cd,f000:983d
ram:f000:9800   837efa00        CMP         word ptr [BP + -0x6],0x0                
ram:f000:9804   7539            JNZ         LAB_f000_983f                           
ram:f000:9806   837ef801        CMP         word ptr [BP + -0x8],0x1                
ram:f000:980a   7533            JNZ         LAB_f000_983f                           
ram:f000:980c   b800c0          MOV         AX,0xc000                               
ram:f000:980f   8ed8            MOV         DS,AX                                   
ram:f000:9811   a18400          MOV         AX,[PCSR_ALL]                           
ram:f000:9814   a90003          TEST        AX,0x300                                
ram:f000:9817   7424            JZ          LAB_f000_983d                           
ram:f000:9819   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:981c   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:981f   8946f4          MOV         word ptr [BP + -0xc],AX                 
ram:f000:9822   8956f6          MOV         word ptr [BP + -0xa],DX                 
ram:f000:9825   b820c0          MOV         AX,0xc020                               
ram:f000:9828   8ed8            MOV         DS,AX                                   
ram:f000:982a   a10000          MOV         AX,[0x0]=>3B2_FIFO_WORD                 
ram:f000:982d   25ff00          AND         AX,0xff                                 
ram:f000:9830   c576f4          LDS         SI,[BP + -0xc]                          
ram:f000:9833   8804            MOV         byte ptr [SI],AL                        
ram:f000:9835   836ef801        SUB         word ptr [BP + -0x8],0x1                
ram:f000:9839   835efa00        SBB         word ptr [BP + -0x6],0x0                
                            LAB_f000_983d:                ;XREF[1,0]:   f000:9817
ram:f000:983d   ebc1            JMP         LAB_f000_9800                           
                            LAB_f000_983f:                ;XREF[2,0]:   f000:9804,f000:980a
ram:f000:983f   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void FUN_f000_9844(void)
                                                          ;XREF[2,0]:   f000:a01f,f000:a07b
ram:f000:9844   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:9849   81ec0600        SUB         SP,0x6                                  
ram:f000:984d   be101f          MOV         SI,0x1f10                               
ram:f000:9850   8ede            MOV         DS,SI                                   
ram:f000:9852   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9856   f74424ffff      TEST        word ptr [SI + 0x24],0xffff             
ram:f000:985b   754d            JNZ         LAB_f000_98aa                           
ram:f000:985d   f74422ffff      TEST        word ptr [SI + 0x22],0xffff             
ram:f000:9862   7546            JNZ         LAB_f000_98aa                           
ram:f000:9864   b800c0          MOV         AX,0xc000                               
ram:f000:9867   8ed8            MOV         DS,AX                                   
ram:f000:9869   c6061d0000      MOV         byte ptr [SCSI_XFR_LSB],0x0             
ram:f000:986e   b800c0          MOV         AX,0xc000                               
ram:f000:9871   8ed8            MOV         DS,AX                                   
ram:f000:9873   c6061b0002      MOV         byte ptr [SCSI_XFR_MMB],0x2             
ram:f000:9878   b800c0          MOV         AX,0xc000                               
ram:f000:987b   8ed8            MOV         DS,AX                                   
ram:f000:987d   c606190000      MOV         byte ptr [SCSI_XFR_MSB],0x0             
ram:f000:9882   b800c0          MOV         AX,0xc000                               
ram:f000:9885   8ed8            MOV         DS,AX                                   
                            ;SCSI Command: Transfer Pad
ram:f000:9887   c606030015      MOV         byte ptr [SCSI_CMD_REG],0x15            
                            LAB_f000_988c:                ;XREF[1,0]:   f000:989b
ram:f000:988c   b800c0          MOV         AX,0xc000                               
ram:f000:988f   8ed8            MOV         DS,AX                                   
ram:f000:9891   a00900          MOV         AL,[SCSI_AUX_STAT_REG]                  
ram:f000:9894   30e4            XOR         AH,AH                                   
ram:f000:9896   a98000          TEST        AX,0x80                                 
ram:f000:9899   7402            JZ          LAB_f000_989d                           
ram:f000:989b   ebef            JMP         LAB_f000_988c                           
                            LAB_f000_989d:                ;XREF[1,0]:   f000:9899
ram:f000:989d   b800c0          MOV         AX,0xc000                               
ram:f000:98a0   8ed8            MOV         DS,AX                                   
ram:f000:98a2   c606010000      MOV         byte ptr [SCSI_DATA_REG],0x0            
ram:f000:98a7   e99a01          JMP         LAB_f000_9a44                           
                            LAB_f000_98aa:                ;XREF[2,0]:   f000:985b,f000:9862
ram:f000:98aa   be101f          MOV         SI,0x1f10                               
ram:f000:98ad   8ede            MOV         DS,SI                                   
ram:f000:98af   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:98b3   8b441a          MOV         AX,word ptr [SI + 0x1a]                 
ram:f000:98b6   8b541c          MOV         DX,word ptr [SI + 0x1c]                 
ram:f000:98b9   250100          AND         AX,0x1                                  
ram:f000:98bc   81e20000        AND         DX,0x0                                  
ram:f000:98c0   85d2            TEST        DX,DX                                   
ram:f000:98c2   7507            JNZ         LAB_f000_98cb                           
ram:f000:98c4   85c0            TEST        AX,AX                                   
ram:f000:98c6   7503            JNZ         LAB_f000_98cb                           
ram:f000:98c8   e9f100          JMP         LAB_f000_99bc                           
                            LAB_f000_98cb:                ;XREF[2,0]:   f000:98c2,f000:98c6
ram:f000:98cb   b80000          MOV         AX,0x0                                  
ram:f000:98ce   50              PUSH        AX                                      
ram:f000:98cf   b80100          MOV         AX,0x1                                  
ram:f000:98d2   50              PUSH        AX                                      
ram:f000:98d3   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:98d6   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:98d9   2c05            SUB         AL,0x5                                  
ram:f000:98db   7303            JNC         LAB_f000_98e0                           
ram:f000:98dd   83ea10          SUB         DX,0x10                                 
                            LAB_f000_98e0:                ;XREF[1,0]:   f000:98db
ram:f000:98e0   d1ea            SHR         DX,1                                    
ram:f000:98e2   d1ea            SHR         DX,1                                    
ram:f000:98e4   d1ea            SHR         DX,1                                    
ram:f000:98e6   d1ea            SHR         DX,1                                    
ram:f000:98e8   86d4            XCHG        AH,DL                                   
ram:f000:98ea   86f2            XCHG        DL,DH                                   
ram:f000:98ec   52              PUSH        DX                                      
ram:f000:98ed   50              PUSH        AX                                      
ram:f000:98ee   be101f          MOV         SI,0x1f10                               
ram:f000:98f1   8ede            MOV         DS,SI                                   
ram:f000:98f3   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:98f7   ff741c          PUSH        word ptr [SI + 0x1c]                    
ram:f000:98fa   ff741a          PUSH        word ptr [SI + 0x1a]                    
ram:f000:98fd   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:9902   83c40c          ADD         SP,0xc                                  
ram:f000:9905   8a46fb          MOV         AL,byte ptr [BP + -0x5]                 
ram:f000:9908   30e4            XOR         AH,AH                                   
ram:f000:990a   50              PUSH        AX                                      
ram:f000:990b   9a7a0010f9      CALLF       scsi_send_data                          ;void scsi_send_data(void)
ram:f000:9910   83c402          ADD         SP,0x2                                  
ram:f000:9913   be101f          MOV         SI,0x1f10                               
ram:f000:9916   8ede            MOV         DS,SI                                   
ram:f000:9918   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:991c   83441a01        ADD         word ptr [SI + 0x1a],0x1                
ram:f000:9920   83541c00        ADC         word ptr [SI + 0x1c],0x0                
ram:f000:9924   be101f          MOV         SI,0x1f10                               
ram:f000:9927   8ede            MOV         DS,SI                                   
ram:f000:9929   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:992d   836c2201        SUB         word ptr [SI + 0x22],0x1                
ram:f000:9931   835c2400        SBB         word ptr [SI + 0x24],0x0                
ram:f000:9935   f74424ffff      TEST        word ptr [SI + 0x24],0xffff             
ram:f000:993a   750a            JNZ         LAB_f000_9946                           
ram:f000:993c   f74422ffff      TEST        word ptr [SI + 0x22],0xffff             
ram:f000:9941   7503            JNZ         LAB_f000_9946                           
ram:f000:9943   e9fe00          JMP         LAB_f000_9a44                           
                            LAB_f000_9946:                ;XREF[2,0]:   f000:993a,f000:9941
ram:f000:9946   be101f          MOV         SI,0x1f10                               
ram:f000:9949   8ede            MOV         DS,SI                                   
ram:f000:994b   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:994f   836c1e01        SUB         word ptr [SI + 0x1e],0x1                
ram:f000:9953   835c2000        SBB         word ptr [SI + 0x20],0x0                
ram:f000:9957   f74420ffff      TEST        word ptr [SI + 0x20],0xffff             
ram:f000:995c   755b            JNZ         LAB_f000_99b9                           
ram:f000:995e   f7441effff      TEST        word ptr [SI + 0x1e],0xffff             
ram:f000:9963   7554            JNZ         LAB_f000_99b9                           
ram:f000:9965   be101f          MOV         SI,0x1f10                               
ram:f000:9968   8ede            MOV         DS,SI                                   
ram:f000:996a   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:996e   c57432          LDS         SI,[SI + 0x32]                          
ram:f000:9971   8b04            MOV         AX,word ptr [SI]                        
ram:f000:9973   8b5402          MOV         DX,word ptr [SI + 0x2]                  
ram:f000:9976   be101f          MOV         SI,0x1f10                               
ram:f000:9979   8ede            MOV         DS,SI                                   
ram:f000:997b   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:997f   89441a          MOV         word ptr [SI + 0x1a],AX                 
ram:f000:9982   89541c          MOV         word ptr [SI + 0x1c],DX                 
ram:f000:9985   be101f          MOV         SI,0x1f10                               
ram:f000:9988   8ede            MOV         DS,SI                                   
ram:f000:998a   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:998e   c57432          LDS         SI,[SI + 0x32]                          
ram:f000:9991   8b4404          MOV         AX,word ptr [SI + 0x4]                  
ram:f000:9994   8b5406          MOV         DX,word ptr [SI + 0x6]                  
ram:f000:9997   be101f          MOV         SI,0x1f10                               
ram:f000:999a   8ede            MOV         DS,SI                                   
ram:f000:999c   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:99a0   89441e          MOV         word ptr [SI + 0x1e],AX                 
ram:f000:99a3   895420          MOV         word ptr [SI + 0x20],DX                 
ram:f000:99a6   be101f          MOV         SI,0x1f10                               
ram:f000:99a9   8ede            MOV         DS,SI                                   
ram:f000:99ab   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:99af   80443208        ADD         byte ptr [SI + 0x32],0x8                
ram:f000:99b3   7304            JNC         LAB_f000_99b9                           
ram:f000:99b5   83443410        ADD         word ptr [SI + 0x34],0x10               
                            LAB_f000_99b9:                ;XREF[3,0]:   f000:995c,f000:9963,f000:99b3
ram:f000:99b9   e98800          JMP         LAB_f000_9a44                           
                            LAB_f000_99bc:                ;XREF[1,0]:   f000:98c8
ram:f000:99bc   b810c0          MOV         AX,0xc010                               
ram:f000:99bf   8ed8            MOV         DS,AX                                   
ram:f000:99c1   c606800000      MOV         byte ptr [offset...,0x0                 
ram:f000:99c6   b820c0          MOV         AX,0xc020                               
ram:f000:99c9   8ed8            MOV         DS,AX                                   
ram:f000:99cb   c6069a0000      MOV         byte ptr [offset...,0x0                 
ram:f000:99d0   b810c0          MOV         AX,0xc010                               
ram:f000:99d3   8ed8            MOV         DS,AX                                   
ram:f000:99d5   c606000000      MOV         byte ptr [0x0]=>DAT_c000_0100,0x0       
ram:f000:99da   9aae0010f9      CALLF       scsi_dma_setup                          ;void scsi_dma_setup(void)
ram:f000:99df   be101f          MOV         SI,0x1f10                               
ram:f000:99e2   8ede            MOV         DS,SI                                   
ram:f000:99e4   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:99e8   8b4422          MOV         AX,word ptr [SI + 0x22]                 
ram:f000:99eb   8b5424          MOV         DX,word ptr [SI + 0x24]                 
ram:f000:99ee   ba00c0          MOV         DX,0xc000                               
ram:f000:99f1   8eda            MOV         DS,DX                                   
ram:f000:99f3   a21d00          MOV         [SCSI_XFR_LSB],AL                       
ram:f000:99f6   be101f          MOV         SI,0x1f10                               
ram:f000:99f9   8ede            MOV         DS,SI                                   
ram:f000:99fb   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:99ff   8b4422          MOV         AX,word ptr [SI + 0x22]                 
ram:f000:9a02   8b5424          MOV         DX,word ptr [SI + 0x24]                 
ram:f000:9a05   b90800          MOV         CX,0x8                                  
ram:f000:9a08   e306            JCXZ        LAB_f000_9a10                           
                            LAB_f000_9a0a:                ;XREF[1,0]:   f000:9a0e
ram:f000:9a0a   d1fa            SAR         DX,1                                    
ram:f000:9a0c   d1d8            RCR         AX,1                                    
ram:f000:9a0e   e2fa            LOOP        LAB_f000_9a0a                           
                            LAB_f000_9a10:                ;XREF[1,0]:   f000:9a08
ram:f000:9a10   ba00c0          MOV         DX,0xc000                               
ram:f000:9a13   8eda            MOV         DS,DX                                   
ram:f000:9a15   a21b00          MOV         [SCSI_XFR_MMB],AL                       
ram:f000:9a18   be101f          MOV         SI,0x1f10                               
ram:f000:9a1b   8ede            MOV         DS,SI                                   
ram:f000:9a1d   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9a21   8b4422          MOV         AX,word ptr [SI + 0x22]                 
ram:f000:9a24   8b5424          MOV         DX,word ptr [SI + 0x24]                 
ram:f000:9a27   b91000          MOV         CX,0x10                                 
ram:f000:9a2a   e306            JCXZ        LAB_f000_9a32                           
                            LAB_f000_9a2c:                ;XREF[1,0]:   f000:9a30
ram:f000:9a2c   d1fa            SAR         DX,1                                    
ram:f000:9a2e   d1d8            RCR         AX,1                                    
ram:f000:9a30   e2fa            LOOP        LAB_f000_9a2c                           
                            LAB_f000_9a32:                ;XREF[1,0]:   f000:9a2a
ram:f000:9a32   ba00c0          MOV         DX,0xc000                               
ram:f000:9a35   8eda            MOV         DS,DX                                   
ram:f000:9a37   a21900          MOV         [SCSI_XFR_MSB],AL                       
ram:f000:9a3a   b800c0          MOV         AX,0xc000                               
ram:f000:9a3d   8ed8            MOV         DS,AX                                   
ram:f000:9a3f   c606030094      MOV         byte ptr [SCSI_CMD_REG],0x94            
                            LAB_f000_9a44:                ;XREF[3,0]:   f000:98a7,f000:9943,f000:99b9
ram:f000:9a44   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void FUN_f000_9a49(void)
                                                          ;XREF[1,0]:   f000:a074
ram:f000:9a49   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:9a4e   81ec0800        SUB         SP,0x8                                  
ram:f000:9a52   be101f          MOV         SI,0x1f10                               
ram:f000:9a55   8ede            MOV         DS,SI                                   
ram:f000:9a57   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9a5b   8b441a          MOV         AX,word ptr [SI + 0x1a]                 
ram:f000:9a5e   8b541c          MOV         DX,word ptr [SI + 0x1c]                 
ram:f000:9a61   8af2            MOV         DH,DL                                   
ram:f000:9a63   8ad4            MOV         DL,AH                                   
ram:f000:9a65   30e4            XOR         AH,AH                                   
ram:f000:9a67   d1e2            SHL         DX,1                                    
ram:f000:9a69   d1e2            SHL         DX,1                                    
ram:f000:9a6b   d1e2            SHL         DX,1                                    
ram:f000:9a6d   d1e2            SHL         DX,1                                    
ram:f000:9a6f   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:9a72   8956fe          MOV         word ptr [BP + -0x2],DX                 
ram:f000:9a75   be101f          MOV         SI,0x1f10                               
ram:f000:9a78   8ede            MOV         DS,SI                                   
ram:f000:9a7a   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9a7e   8b441e          MOV         AX,word ptr [SI + 0x1e]                 
ram:f000:9a81   8b5420          MOV         DX,word ptr [SI + 0x20]                 
ram:f000:9a84   8946f8          MOV         word ptr [BP + -0x8],AX                 
ram:f000:9a87   8956fa          MOV         word ptr [BP + -0x6],DX                 
ram:f000:9a8a   b810c0          MOV         AX,0xc010                               
ram:f000:9a8d   8ed8            MOV         DS,AX                                   
ram:f000:9a8f   c606800000      MOV         byte ptr [offset...,0x0                 
ram:f000:9a94   b820c0          MOV         AX,0xc020                               
ram:f000:9a97   8ed8            MOV         DS,AX                                   
ram:f000:9a99   c6069a0000      MOV         byte ptr [offset...,0x0                 
ram:f000:9a9e   b810c0          MOV         AX,0xc010                               
ram:f000:9aa1   8ed8            MOV         DS,AX                                   
ram:f000:9aa3   c606000000      MOV         byte ptr [0x0]=>DAT_c000_0100,0x0       
ram:f000:9aa8   8a46f8          MOV         AL,byte ptr [BP + -0x8]                 
ram:f000:9aab   30e4            XOR         AH,AH                                   
ram:f000:9aad   ba00c0          MOV         DX,0xc000                               
ram:f000:9ab0   8eda            MOV         DS,DX                                   
ram:f000:9ab2   a21d00          MOV         [SCSI_XFR_LSB],AL                       
ram:f000:9ab5   8b46f8          MOV         AX,word ptr [BP + -0x8]                 
ram:f000:9ab8   8b56fa          MOV         DX,word ptr [BP + -0x6]                 
ram:f000:9abb   b90800          MOV         CX,0x8                                  
ram:f000:9abe   e306            JCXZ        LAB_f000_9ac6                           
                            LAB_f000_9ac0:                ;XREF[1,0]:   f000:9ac4
ram:f000:9ac0   d1fa            SAR         DX,1                                    
ram:f000:9ac2   d1d8            RCR         AX,1                                    
ram:f000:9ac4   e2fa            LOOP        LAB_f000_9ac0                           
                            LAB_f000_9ac6:                ;XREF[1,0]:   f000:9abe
ram:f000:9ac6   ba00c0          MOV         DX,0xc000                               
ram:f000:9ac9   8eda            MOV         DS,DX                                   
ram:f000:9acb   a21b00          MOV         [SCSI_XFR_MMB],AL                       
ram:f000:9ace   8b46f8          MOV         AX,word ptr [BP + -0x8]                 
ram:f000:9ad1   8b56fa          MOV         DX,word ptr [BP + -0x6]                 
ram:f000:9ad4   b91000          MOV         CX,0x10                                 
ram:f000:9ad7   e306            JCXZ        LAB_f000_9adf                           
                            LAB_f000_9ad9:                ;XREF[1,0]:   f000:9add
ram:f000:9ad9   d1fa            SAR         DX,1                                    
ram:f000:9adb   d1d8            RCR         AX,1                                    
ram:f000:9add   e2fa            LOOP        LAB_f000_9ad9                           
                            LAB_f000_9adf:                ;XREF[1,0]:   f000:9ad7
ram:f000:9adf   ba00c0          MOV         DX,0xc000                               
ram:f000:9ae2   8eda            MOV         DS,DX                                   
ram:f000:9ae4   a21900          MOV         [SCSI_XFR_MSB],AL                       
ram:f000:9ae7   b800c0          MOV         AX,0xc000                               
ram:f000:9aea   8ed8            MOV         DS,AX                                   
ram:f000:9aec   c606030094      MOV         byte ptr [SCSI_CMD_REG],0x94            
                            LAB_f000_9af1:                ;XREF[1,0]:   f000:9b30
ram:f000:9af1   f746faffff      TEST        word ptr [BP + -0x6],0xffff             
ram:f000:9af6   7c3a            JL          LAB_f000_9b32                           
ram:f000:9af8   7f07            JG          LAB_f000_9b01                           
ram:f000:9afa   f746f8ffff      TEST        word ptr [BP + -0x8],0xffff             
ram:f000:9aff   7631            JBE         LAB_f000_9b32                           
                            LAB_f000_9b01:                ;XREF[1,0]:   f000:9af8
ram:f000:9b01   b800c0          MOV         AX,0xc000                               
ram:f000:9b04   8ed8            MOV         DS,AX                                   
ram:f000:9b06   a18400          MOV         AX,[PCSR_ALL]                           
ram:f000:9b09   25000c          AND         AX,0xc00                                
ram:f000:9b0c   3d000c          CMP         AX,0xc00                                
ram:f000:9b0f   751f            JNZ         LAB_f000_9b30                           
ram:f000:9b11   c576fc          LDS         SI,[BP + -0x4]                          
ram:f000:9b14   8b04            MOV         AX,word ptr [SI]                        
ram:f000:9b16   ba20c0          MOV         DX,0xc020                               
ram:f000:9b19   8eda            MOV         DS,DX                                   
ram:f000:9b1b   a30000          MOV         [0x0]=>3B2_FIFO_WORD,AX                 
ram:f000:9b1e   8046fc02        ADD         byte ptr [BP + -0x4],0x2                
ram:f000:9b22   7304            JNC         LAB_f000_9b28                           
ram:f000:9b24   8346fe10        ADD         word ptr [BP + -0x2],0x10               
                            LAB_f000_9b28:                ;XREF[1,0]:   f000:9b22
ram:f000:9b28   836ef802        SUB         word ptr [BP + -0x8],0x2                
ram:f000:9b2c   835efa00        SBB         word ptr [BP + -0x6],0x0                
                            LAB_f000_9b30:                ;XREF[1,0]:   f000:9b0f
ram:f000:9b30   ebbf            JMP         LAB_f000_9af1                           
                            LAB_f000_9b32:                ;XREF[2,0]:   f000:9af6,f000:9aff
ram:f000:9b32   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void FUN_f000_9b37(void)
                                                          ;XREF[1,0]:   f000:9ffa
ram:f000:9b37   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:9b3c   81ec0800        SUB         SP,0x8                                  
ram:f000:9b40   b8101f          MOV         AX,0x1f10                               
ram:f000:9b43   8ed8            MOV         DS,AX                                   
ram:f000:9b45   a1b400          MOV         AX,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9b48   8b16b600        MOV         DX,word ptr [offset SCSI_CMD_PTR_SEG ...
ram:f000:9b4c   0406            ADD         AL,0x6                                  
ram:f000:9b4e   7303            JNC         LAB_f000_9b53                           
ram:f000:9b50   83c210          ADD         DX,0x10                                 
                            LAB_f000_9b53:                ;XREF[1,0]:   f000:9b4e
ram:f000:9b53   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:9b56   8956fe          MOV         word ptr [BP + -0x2],DX                 
ram:f000:9b59   be101f          MOV         SI,0x1f10                               
ram:f000:9b5c   8ede            MOV         DS,SI                                   
ram:f000:9b5e   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9b62   8b4416          MOV         AX,word ptr [SI + 0x16]                 
ram:f000:9b65   8b5418          MOV         DX,word ptr [SI + 0x18]                 
ram:f000:9b68   8946f8          MOV         word ptr [BP + -0x8],AX                 
ram:f000:9b6b   8956fa          MOV         word ptr [BP + -0x6],DX                 
ram:f000:9b6e   b810c0          MOV         AX,0xc010                               
ram:f000:9b71   8ed8            MOV         DS,AX                                   
ram:f000:9b73   c606800000      MOV         byte ptr [offset...,0x0                 
ram:f000:9b78   b820c0          MOV         AX,0xc020                               
ram:f000:9b7b   8ed8            MOV         DS,AX                                   
ram:f000:9b7d   c6069a0000      MOV         byte ptr [offset...,0x0                 
ram:f000:9b82   b810c0          MOV         AX,0xc010                               
ram:f000:9b85   8ed8            MOV         DS,AX                                   
ram:f000:9b87   c606000000      MOV         byte ptr [0x0]=>DAT_c000_0100,0x0       
ram:f000:9b8c   8a46f8          MOV         AL,byte ptr [BP + -0x8]                 
ram:f000:9b8f   30e4            XOR         AH,AH                                   
ram:f000:9b91   ba00c0          MOV         DX,0xc000                               
ram:f000:9b94   8eda            MOV         DS,DX                                   
ram:f000:9b96   a21d00          MOV         [SCSI_XFR_LSB],AL                       
ram:f000:9b99   8b46f8          MOV         AX,word ptr [BP + -0x8]                 
ram:f000:9b9c   8b56fa          MOV         DX,word ptr [BP + -0x6]                 
ram:f000:9b9f   b90800          MOV         CX,0x8                                  
ram:f000:9ba2   e306            JCXZ        LAB_f000_9baa                           
                            LAB_f000_9ba4:                ;XREF[1,0]:   f000:9ba8
ram:f000:9ba4   d1fa            SAR         DX,1                                    
ram:f000:9ba6   d1d8            RCR         AX,1                                    
ram:f000:9ba8   e2fa            LOOP        LAB_f000_9ba4                           
                            LAB_f000_9baa:                ;XREF[1,0]:   f000:9ba2
ram:f000:9baa   ba00c0          MOV         DX,0xc000                               
ram:f000:9bad   8eda            MOV         DS,DX                                   
ram:f000:9baf   a21b00          MOV         [SCSI_XFR_MMB],AL                       
ram:f000:9bb2   8b46f8          MOV         AX,word ptr [BP + -0x8]                 
ram:f000:9bb5   8b56fa          MOV         DX,word ptr [BP + -0x6]                 
ram:f000:9bb8   b91000          MOV         CX,0x10                                 
ram:f000:9bbb   e306            JCXZ        LAB_f000_9bc3                           
                            LAB_f000_9bbd:                ;XREF[1,0]:   f000:9bc1
ram:f000:9bbd   d1fa            SAR         DX,1                                    
ram:f000:9bbf   d1d8            RCR         AX,1                                    
ram:f000:9bc1   e2fa            LOOP        LAB_f000_9bbd                           
                            LAB_f000_9bc3:                ;XREF[1,0]:   f000:9bbb
ram:f000:9bc3   ba00c0          MOV         DX,0xc000                               
ram:f000:9bc6   8eda            MOV         DS,DX                                   
ram:f000:9bc8   a21900          MOV         [SCSI_XFR_MSB],AL                       
ram:f000:9bcb   b800c0          MOV         AX,0xc000                               
ram:f000:9bce   8ed8            MOV         DS,AX                                   
ram:f000:9bd0   c606030094      MOV         byte ptr [SCSI_CMD_REG],0x94            
                            LAB_f000_9bd5:                ;XREF[1,0]:   f000:9c14
ram:f000:9bd5   f746faffff      TEST        word ptr [BP + -0x6],0xffff             
ram:f000:9bda   7c3a            JL          LAB_f000_9c16                           
ram:f000:9bdc   7f07            JG          LAB_f000_9be5                           
ram:f000:9bde   f746f8ffff      TEST        word ptr [BP + -0x8],0xffff             
ram:f000:9be3   7631            JBE         LAB_f000_9c16                           
                            LAB_f000_9be5:                ;XREF[1,0]:   f000:9bdc
ram:f000:9be5   b800c0          MOV         AX,0xc000                               
ram:f000:9be8   8ed8            MOV         DS,AX                                   
ram:f000:9bea   a18400          MOV         AX,[PCSR_ALL]                           
ram:f000:9bed   25000c          AND         AX,0xc00                                
ram:f000:9bf0   3d000c          CMP         AX,0xc00                                
ram:f000:9bf3   751f            JNZ         LAB_f000_9c14                           
ram:f000:9bf5   c576fc          LDS         SI,[BP + -0x4]                          
ram:f000:9bf8   8b04            MOV         AX,word ptr [SI]                        
ram:f000:9bfa   ba20c0          MOV         DX,0xc020                               
ram:f000:9bfd   8eda            MOV         DS,DX                                   
ram:f000:9bff   a30000          MOV         [0x0]=>3B2_FIFO_WORD,AX                 
ram:f000:9c02   8046fc02        ADD         byte ptr [BP + -0x4],0x2                
ram:f000:9c06   7304            JNC         LAB_f000_9c0c                           
ram:f000:9c08   8346fe10        ADD         word ptr [BP + -0x2],0x10               
                            LAB_f000_9c0c:                ;XREF[1,0]:   f000:9c06
ram:f000:9c0c   836ef802        SUB         word ptr [BP + -0x8],0x2                
ram:f000:9c10   835efa00        SBB         word ptr [BP + -0x6],0x0                
                            LAB_f000_9c14:                ;XREF[1,0]:   f000:9bf3
ram:f000:9c14   ebbf            JMP         LAB_f000_9bd5                           
                            LAB_f000_9c16:                ;XREF[2,0]:   f000:9bda,f000:9be3
ram:f000:9c16   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void dma_end_interrupt_handler(void)
                                                          ;XREF[1,0]:   f000:88b3
ram:f000:9c1b   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:9c20   81ec0800        SUB         SP,0x8                                  
ram:f000:9c24   b800c0          MOV         AX,0xc000                               
ram:f000:9c27   8ed8            MOV         DS,AX                                   
ram:f000:9c29   c6068b0000      MOV         byte ptr [PCSR_3_INT3],0x0              
ram:f000:9c2e   b800c0          MOV         AX,0xc000                               
ram:f000:9c31   8ed8            MOV         DS,AX                                   
ram:f000:9c33   c6068c0000      MOV         byte ptr [PCSR_4_INT3],0x0              
ram:f000:9c38   b840c0          MOV         AX,0xc040                               
ram:f000:9c3b   8ed8            MOV         DS,AX                                   
ram:f000:9c3d   c70622000f00    MOV         word ptr [offset INT_CTRL_EOI &0xff],0xf
ram:f000:9c43   be101f          MOV         SI,0x1f10                               
ram:f000:9c46   8ede            MOV         DS,SI                                   
ram:f000:9c48   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9c4c   8b04            MOV         AX,word ptr [SI]                        
ram:f000:9c4e   a98000          TEST        AX,0x80                                 
ram:f000:9c51   7503            JNZ         LAB_f000_9c56                           
ram:f000:9c53   e95901          JMP         LAB_f000_9daf                           
                            LAB_f000_9c56:                ;XREF[1,0]:   f000:9c51
ram:f000:9c56   be101f          MOV         SI,0x1f10                               
ram:f000:9c59   8ede            MOV         DS,SI                                   
ram:f000:9c5b   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9c5f   f74428ffff      TEST        word ptr [SI + 0x28],0xffff             
ram:f000:9c64   7507            JNZ         LAB_f000_9c6d                           
ram:f000:9c66   f74426ffff      TEST        word ptr [SI + 0x26],0xffff             
ram:f000:9c6b   7408            JZ          LAB_f000_9c75                           
                            LAB_f000_9c6d:                ;XREF[1,0]:   f000:9c64
ram:f000:9c6d   9aae0010f9      CALLF       scsi_dma_setup                          ;void scsi_dma_setup(void)
ram:f000:9c72   e93a01          JMP         LAB_f000_9daf                           
                            LAB_f000_9c75:                ;XREF[1,0]:   f000:9c6b
ram:f000:9c75   be101f          MOV         SI,0x1f10                               
ram:f000:9c78   8ede            MOV         DS,SI                                   
ram:f000:9c7a   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9c7e   8b04            MOV         AX,word ptr [SI]                        
ram:f000:9c80   a90004          TEST        AX,0x400                                
ram:f000:9c83   7503            JNZ         LAB_f000_9c88                           
ram:f000:9c85   e92701          JMP         LAB_f000_9daf                           
                            LAB_f000_9c88:                ;XREF[1,0]:   f000:9c83
ram:f000:9c88   be101f          MOV         SI,0x1f10                               
ram:f000:9c8b   8ede            MOV         DS,SI                                   
ram:f000:9c8d   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9c91   c57432          LDS         SI,[SI + 0x32]                          
ram:f000:9c94   f74406ffff      TEST        word ptr [SI + 0x6],0xffff              
ram:f000:9c99   750a            JNZ         LAB_f000_9ca5                           
ram:f000:9c9b   f74404ffff      TEST        word ptr [SI + 0x4],0xffff              
ram:f000:9ca0   7503            JNZ         LAB_f000_9ca5                           
ram:f000:9ca2   e90a01          JMP         LAB_f000_9daf                           
                            LAB_f000_9ca5:                ;XREF[2,0]:   f000:9c99,f000:9ca0
ram:f000:9ca5   be101f          MOV         SI,0x1f10                               
ram:f000:9ca8   8ede            MOV         DS,SI                                   
ram:f000:9caa   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9cae   c57432          LDS         SI,[SI + 0x32]                          
ram:f000:9cb1   8b04            MOV         AX,word ptr [SI]                        
ram:f000:9cb3   8b5402          MOV         DX,word ptr [SI + 0x2]                  
ram:f000:9cb6   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:9cb9   8956fe          MOV         word ptr [BP + -0x2],DX                 
ram:f000:9cbc   be101f          MOV         SI,0x1f10                               
ram:f000:9cbf   8ede            MOV         DS,SI                                   
ram:f000:9cc1   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9cc5   c57432          LDS         SI,[SI + 0x32]                          
ram:f000:9cc8   8b4404          MOV         AX,word ptr [SI + 0x4]                  
ram:f000:9ccb   8b5406          MOV         DX,word ptr [SI + 0x6]                  
ram:f000:9cce   8946f8          MOV         word ptr [BP + -0x8],AX                 
ram:f000:9cd1   8956fa          MOV         word ptr [BP + -0x6],DX                 
ram:f000:9cd4   be101f          MOV         SI,0x1f10                               
ram:f000:9cd7   8ede            MOV         DS,SI                                   
ram:f000:9cd9   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9cdd   80443208        ADD         byte ptr [SI + 0x32],0x8                
ram:f000:9ce1   7304            JNC         LAB_f000_9ce7                           
ram:f000:9ce3   83443410        ADD         word ptr [SI + 0x34],0x10               
                            LAB_f000_9ce7:                ;XREF[1,0]:   f000:9ce1
ram:f000:9ce7   f746faffff      TEST        word ptr [BP + -0x6],0xffff             
ram:f000:9cec   7e03            JLE         LAB_f000_9cf1                           
ram:f000:9cee   e98d00          JMP         LAB_f000_9d7e                           
                            LAB_f000_9cf1:                ;XREF[1,0]:   f000:9cec
ram:f000:9cf1   7c0a            JL          LAB_f000_9cfd                           
ram:f000:9cf3   f746f8ffff      TEST        word ptr [BP + -0x8],0xffff             
ram:f000:9cf8   7203            JC          LAB_f000_9cfd                           
ram:f000:9cfa   e98100          JMP         LAB_f000_9d7e                           
                            LAB_f000_9cfd:                ;XREF[2,0]:   f000:9cf1,f000:9cf8
ram:f000:9cfd   8b46f8          MOV         AX,word ptr [BP + -0x8]                 
ram:f000:9d00   8b56fa          MOV         DX,word ptr [BP + -0x6]                 
ram:f000:9d03   f7d0            NOT         AX                                      
ram:f000:9d05   f7d2            NOT         DX                                      
ram:f000:9d07   050100          ADD         AX,0x1                                  
ram:f000:9d0a   83d200          ADC         DX,0x0                                  
ram:f000:9d0d   52              PUSH        DX                                      
ram:f000:9d0e   50              PUSH        AX                                      
ram:f000:9d0f   b8101f          MOV         AX,0x1f10                               
ram:f000:9d12   8ed8            MOV         DS,AX                                   
ram:f000:9d14   a1b400          MOV         AX,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9d17   8b16b600        MOV         DX,word ptr [offset SCSI_CMD_PTR_SEG ...
ram:f000:9d1b   0436            ADD         AL,0x36                                 
ram:f000:9d1d   7303            JNC         LAB_f000_9d22                           
ram:f000:9d1f   83c210          ADD         DX,0x10                                 
                            LAB_f000_9d22:                ;XREF[1,0]:   f000:9d1d
ram:f000:9d22   52              PUSH        DX                                      
ram:f000:9d23   50              PUSH        AX                                      
ram:f000:9d24   ff76fe          PUSH        word ptr [BP + -0x2]                    
ram:f000:9d27   ff76fc          PUSH        word ptr [BP + -0x4]                    
ram:f000:9d2a   9ac800f0fa      CALLF       FUN_f000_afc8                           ;undefined FUN_f000_afc8()
ram:f000:9d2f   83c40c          ADD         SP,0xc                                  
ram:f000:9d32   be101f          MOV         SI,0x1f10                               
ram:f000:9d35   8ede            MOV         DS,SI                                   
ram:f000:9d37   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9d3b   8b4436          MOV         AX,word ptr [SI + 0x36]                 
ram:f000:9d3e   8b5438          MOV         DX,word ptr [SI + 0x38]                 
ram:f000:9d41   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:9d44   8956fe          MOV         word ptr [BP + -0x2],DX                 
ram:f000:9d47   be101f          MOV         SI,0x1f10                               
ram:f000:9d4a   8ede            MOV         DS,SI                                   
ram:f000:9d4c   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9d50   8b443a          MOV         AX,word ptr [SI + 0x3a]                 
ram:f000:9d53   8b543c          MOV         DX,word ptr [SI + 0x3c]                 
ram:f000:9d56   8946f8          MOV         word ptr [BP + -0x8],AX                 
ram:f000:9d59   8956fa          MOV         word ptr [BP + -0x6],DX                 
ram:f000:9d5c   b8101f          MOV         AX,0x1f10                               
ram:f000:9d5f   8ed8            MOV         DS,AX                                   
ram:f000:9d61   a1b400          MOV         AX,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9d64   8b16b600        MOV         DX,word ptr [offset SCSI_CMD_PTR_SEG ...
ram:f000:9d68   043e            ADD         AL,0x3e                                 
ram:f000:9d6a   7303            JNC         LAB_f000_9d6f                           
ram:f000:9d6c   83c210          ADD         DX,0x10                                 
                            LAB_f000_9d6f:                ;XREF[1,0]:   f000:9d6a
ram:f000:9d6f   be101f          MOV         SI,0x1f10                               
ram:f000:9d72   8ede            MOV         DS,SI                                   
ram:f000:9d74   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9d78   894432          MOV         word ptr [SI + 0x32],AX                 
ram:f000:9d7b   895434          MOV         word ptr [SI + 0x34],DX                 
                            LAB_f000_9d7e:                ;XREF[2,0]:   f000:9cee,f000:9cfa
ram:f000:9d7e   be101f          MOV         SI,0x1f10                               
ram:f000:9d81   8ede            MOV         DS,SI                                   
ram:f000:9d83   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9d87   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:9d8a   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:9d8d   89441a          MOV         word ptr [SI + 0x1a],AX                 
ram:f000:9d90   89541c          MOV         word ptr [SI + 0x1c],DX                 
ram:f000:9d93   be101f          MOV         SI,0x1f10                               
ram:f000:9d96   8ede            MOV         DS,SI                                   
ram:f000:9d98   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9d9c   8b46f8          MOV         AX,word ptr [BP + -0x8]                 
ram:f000:9d9f   8b56fa          MOV         DX,word ptr [BP + -0x6]                 
ram:f000:9da2   89441e          MOV         word ptr [SI + 0x1e],AX                 
ram:f000:9da5   895420          MOV         word ptr [SI + 0x20],DX                 
ram:f000:9da8   9aae0010f9      CALLF       scsi_dma_setup                          ;void scsi_dma_setup(void)
ram:f000:9dad   eb00            JMP         LAB_f000_9daf                           
                            LAB_f000_9daf:                ;XREF[5,0]:   f000:9c53,f000:9c72,f000:9c85,f000:9ca2
                                                          ;             f000:9dad
ram:f000:9daf   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void scsi_select_with_attn(void)
                                                          ;XREF[15,0]:  f000:a92e,f000:aa30,f000:ac01,f000:ad29
                                                          ;             f000:b27c,f000:bb93,f000:bdc9,f000:be91
                                                          ;             f000:bfb9,f000:c00b,f000:c0e0,f000:c1a6
                                                          ;             f000:c2d2,f000:c476,f000:d0df
ram:f000:9db4   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:9db9   81ec0000        SUB         SP,0x0                                  
ram:f000:9dbd   b8f01f          MOV         AX,0x1ff0                               
ram:f000:9dc0   8ed8            MOV         DS,AX                                   
ram:f000:9dc2   a1f200          MOV         AX,[offset STATE_FLAGS &0xff]           
ram:f000:9dc5   a900f0          TEST        AX,0xf000                               
ram:f000:9dc8   7402            JZ          LAB_f000_9dcc                           
ram:f000:9dca   eb48            JMP         LAB_f000_9e14                           
                            LAB_f000_9dcc:                ;XREF[1,0]:   f000:9dc8
ram:f000:9dcc   b800c0          MOV         AX,0xc000                               
ram:f000:9dcf   8ed8            MOV         DS,AX                                   
ram:f000:9dd1   c606050002      MOV         byte ptr [SCSI_CTRL_REG],0x2            
ram:f000:9dd6   b800c0          MOV         AX,0xc000                               
ram:f000:9dd9   8ed8            MOV         DS,AX                                   
ram:f000:9ddb   c606190000      MOV         byte ptr [SCSI_XFR_MSB],0x0             
ram:f000:9de0   b800c0          MOV         AX,0xc000                               
ram:f000:9de3   8ed8            MOV         DS,AX                                   
ram:f000:9de5   c6061b0007      MOV         byte ptr [SCSI_XFR_MMB],0x7             
ram:f000:9dea   b800c0          MOV         AX,0xc000                               
ram:f000:9ded   8ed8            MOV         DS,AX                                   
ram:f000:9def   c6061d00a1      MOV         byte ptr [SCSI_XFR_LSB],0xa1            
ram:f000:9df4   be101f          MOV         SI,0x1f10                               
ram:f000:9df7   8ede            MOV         DS,SI                                   
ram:f000:9df9   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9dfd   8a4404          MOV         AL,byte ptr [SI + 0x4]                  
ram:f000:9e00   30e4            XOR         AH,AH                                   
ram:f000:9e02   ba00c0          MOV         DX,0xc000                               
ram:f000:9e05   8eda            MOV         DS,DX                                   
ram:f000:9e07   a20700          MOV         [SCSI_DEST_ID],AL                       
ram:f000:9e0a   b800c0          MOV         AX,0xc000                               
ram:f000:9e0d   8ed8            MOV         DS,AX                                   
                            ;SCSI Command: Select with Attention
ram:f000:9e0f   c606030008      MOV         byte ptr [SCSI_CMD_REG],0x8             
                            LAB_f000_9e14:                ;XREF[1,0]:   f000:9dca
ram:f000:9e14   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 FUN_f000_9e19(void)
                                                          ;XREF[15,0]:  f000:a93b,f000:aa3d,f000:ac0e,f000:ad36
                                                          ;             f000:b28e,f000:bba0,f000:bdd6,f000:be9e
                                                          ;             f000:bfc6,f000:c018,f000:c0ed,f000:c1b3
                                                          ;             f000:c2df,f000:c483,f000:d0f1
ram:f000:9e19   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:9e1e   81ec0000        SUB         SP,0x0                                  
ram:f000:9e22   b8f01f          MOV         AX,0x1ff0                               
ram:f000:9e25   8ed8            MOV         DS,AX                                   
ram:f000:9e27   a1f200          MOV         AX,[offset STATE_FLAGS &0xff]           
ram:f000:9e2a   a900f0          TEST        AX,0xf000                               
ram:f000:9e2d   7406            JZ          LAB_f000_9e35                           
ram:f000:9e2f   b8ffff          MOV         AX,0xffff                               
ram:f000:9e32   e9b200          JMP         LAB_f000_9ee7                           
                            LAB_f000_9e35:                ;XREF[1,0]:   f000:9e2d
ram:f000:9e35   fa              CLI                                                  
ram:f000:9e36   b80000          MOV         AX,0x0                                  
ram:f000:9e39   50              PUSH        AX                                      
ram:f000:9e3a   b81900          MOV         AX,0x19                                 
ram:f000:9e3d   50              PUSH        AX                                      
ram:f000:9e3e   8b460e          MOV         AX,word ptr [BP + 0xe]                  
ram:f000:9e41   8b5610          MOV         DX,word ptr [BP + 0x10]                 
ram:f000:9e44   051800          ADD         AX,0x18                                 
ram:f000:9e47   83d200          ADC         DX,0x0                                  
ram:f000:9e4a   52              PUSH        DX                                      
ram:f000:9e4b   50              PUSH        AX                                      
ram:f000:9e4c   9aff00c0fd      CALLF       FUN_f000_dcff                           ;uint FUN_f000_dcff(uint param_1, uin...
ram:f000:9e51   83c408          ADD         SP,0x8                                  
ram:f000:9e54   baf01f          MOV         DX,0x1ff0                               
ram:f000:9e57   8eda            MOV         DS,DX                                   
ram:f000:9e59   a3f000          MOV         [offset DAT_1000_fff0 &0xff],AX         
ram:f000:9e5c   b8f01f          MOV         AX,0x1ff0                               
ram:f000:9e5f   8ed8            MOV         DS,AX                                   
ram:f000:9e61   8126f200f7ff    AND         word ptr [offset...,0xfff7              
ram:f000:9e67   fb              STI                                                  
                            LAB_f000_9e68:                ;XREF[1,0]:   f000:9ea8
ram:f000:9e68   be101f          MOV         SI,0x1f10                               
ram:f000:9e6b   8ede            MOV         DS,SI                                   
ram:f000:9e6d   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9e71   8b04            MOV         AX,word ptr [SI]                        
ram:f000:9e73   a90200          TEST        AX,0x2                                  
ram:f000:9e76   7402            JZ          LAB_f000_9e7a                           
ram:f000:9e78   eb30            JMP         LAB_f000_9eaa                           
                            LAB_f000_9e7a:                ;XREF[1,0]:   f000:9e76
ram:f000:9e7a   be101f          MOV         SI,0x1f10                               
ram:f000:9e7d   8ede            MOV         DS,SI                                   
ram:f000:9e7f   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9e83   8b04            MOV         AX,word ptr [SI]                        
ram:f000:9e85   a90400          TEST        AX,0x4                                  
ram:f000:9e88   7405            JZ          LAB_f000_9e8f                           
ram:f000:9e8a   b8ffff          MOV         AX,0xffff                               
ram:f000:9e8d   eb58            JMP         LAB_f000_9ee7                           
                            LAB_f000_9e8f:                ;XREF[1,0]:   f000:9e88
ram:f000:9e8f   b8f01f          MOV         AX,0x1ff0                               
ram:f000:9e92   8ed8            MOV         DS,AX                                   
ram:f000:9e94   a1f200          MOV         AX,[offset STATE_FLAGS &0xff]           
ram:f000:9e97   a90800          TEST        AX,0x8                                  
ram:f000:9e9a   740c            JZ          LAB_f000_9ea8                           
ram:f000:9e9c   fa              CLI                                                  
ram:f000:9e9d   9a350050fa      CALLF       scsi_reset_bus                          ;void scsi_reset_bus(void)
ram:f000:9ea2   fb              STI                                                  
ram:f000:9ea3   b8ffff          MOV         AX,0xffff                               
ram:f000:9ea6   eb3f            JMP         LAB_f000_9ee7                           
                            LAB_f000_9ea8:                ;XREF[1,0]:   f000:9e9a
ram:f000:9ea8   ebbe            JMP         LAB_f000_9e68                           
                            LAB_f000_9eaa:                ;XREF[2,0]:   f000:9e78,f000:9ecc
ram:f000:9eaa   be101f          MOV         SI,0x1f10                               
ram:f000:9ead   8ede            MOV         DS,SI                                   
ram:f000:9eaf   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9eb3   8b04            MOV         AX,word ptr [SI]                        
ram:f000:9eb5   a90100          TEST        AX,0x1                                  
ram:f000:9eb8   7514            JNZ         LAB_f000_9ece                           
ram:f000:9eba   b8f01f          MOV         AX,0x1ff0                               
ram:f000:9ebd   8ed8            MOV         DS,AX                                   
ram:f000:9ebf   a1f200          MOV         AX,[offset STATE_FLAGS &0xff]           
ram:f000:9ec2   a90800          TEST        AX,0x8                                  
ram:f000:9ec5   7405            JZ          LAB_f000_9ecc                           
ram:f000:9ec7   b8feff          MOV         AX,0xfffe                               
ram:f000:9eca   eb1b            JMP         LAB_f000_9ee7                           
                            LAB_f000_9ecc:                ;XREF[1,0]:   f000:9ec5
ram:f000:9ecc   ebdc            JMP         LAB_f000_9eaa                           
                            LAB_f000_9ece:                ;XREF[1,0]:   f000:9eb8
ram:f000:9ece   be101f          MOV         SI,0x1f10                               
ram:f000:9ed1   8ede            MOV         DS,SI                                   
ram:f000:9ed3   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9ed7   f64402ff        TEST        byte ptr [SI + 0x2],0xff                
ram:f000:9edb   7505            JNZ         LAB_f000_9ee2                           
ram:f000:9edd   b80000          MOV         AX,0x0                                  
ram:f000:9ee0   eb03            JMP         LAB_f000_9ee5                           
                            LAB_f000_9ee2:                ;XREF[1,0]:   f000:9edb
ram:f000:9ee2   b8fdff          MOV         AX,0xfffd                               
                            LAB_f000_9ee5:                ;XREF[1,0]:   f000:9ee0
ram:f000:9ee5   eb00            JMP         LAB_f000_9ee7                           
                            LAB_f000_9ee7:                ;XREF[5,0]:   f000:9e32,f000:9e8d,f000:9ea6,f000:9eca
                                                          ;             f000:9ee5
ram:f000:9ee7   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*  This is the main handler for SCSI command                                                   *
                            ;*  completion handling. All SCSI commands that                                                 *
                            ;*  result in an interrupt will come here.                                                      *
                            ;************************************************************************************************
                            ;void scsi_interrupt_handler(void)
                                                          ;XREF[1,0]:   f000:88a7
ram:f000:9eec   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:9ef1   81ec1400        SUB         SP,0x14                                 
ram:f000:9ef5   b800c0          MOV         AX,0xc000                               
ram:f000:9ef8   8ed8            MOV         DS,AX                                   
ram:f000:9efa   a18400          MOV         AX,[PCSR_ALL]                           
ram:f000:9efd   8946fa          MOV         word ptr [BP + -0x6],AX                 
ram:f000:9f00   250400          AND         AX,0x4                                  
ram:f000:9f03   3d0400          CMP         AX,0x4                                  
ram:f000:9f06   7561            JNZ         not_scsi_reset                          
                            ;Come here if the SCSI BUS RESET flag is set in the PCSR
ram:f000:9f08   b800c0          MOV         AX,0xc000                               
ram:f000:9f0b   8ed8            MOV         DS,AX                                   
ram:f000:9f0d   c606030000      MOV         byte ptr [SCSI_CMD_REG],0x0             
ram:f000:9f12   b800c0          MOV         AX,0xc000                               
ram:f000:9f15   8ed8            MOV         DS,AX                                   
ram:f000:9f17   c6068a0000      MOV         byte ptr [PCSR_2_INT2],0x0              
ram:f000:9f1c   b840c0          MOV         AX,0xc040                               
ram:f000:9f1f   8ed8            MOV         DS,AX                                   
ram:f000:9f21   c70622000e00    MOV         word ptr [offset INT_CTRL_EOI &0xff],0xe
ram:f000:9f27   b800c0          MOV         AX,0xc000                               
ram:f000:9f2a   8ed8            MOV         DS,AX                                   
ram:f000:9f2c   a18400          MOV         AX,[PCSR_ALL]                           
ram:f000:9f2f   8946fa          MOV         word ptr [BP + -0x6],AX                 
ram:f000:9f32   250400          AND         AX,0x4                                  
ram:f000:9f35   3d0400          CMP         AX,0x4                                  
ram:f000:9f38   7516            JNZ         LAB_f000_9f50                           
ram:f000:9f3a   b8f01f          MOV         AX,0x1ff0                               
ram:f000:9f3d   8ed8            MOV         DS,AX                                   
ram:f000:9f3f   810ef2000020    OR          word ptr [offset...,0x2000              
ram:f000:9f45   b840c0          MOV         AX,0xc040                               
ram:f000:9f48   8ed8            MOV         DS,AX                                   
ram:f000:9f4a   810e3c000800    OR          word ptr [offset INT2_CTRL &0xff],0x8   
                            LAB_f000_9f50:                ;XREF[1,0]:   f000:9f38
ram:f000:9f50   b8f01f          MOV         AX,0x1ff0                               
ram:f000:9f53   8ed8            MOV         DS,AX                                   
ram:f000:9f55   c706f0009001    MOV         word ptr [offset...,0x190               
ram:f000:9f5b   b8f01f          MOV         AX,0x1ff0                               
ram:f000:9f5e   8ed8            MOV         DS,AX                                   
ram:f000:9f60   8126f400feff    AND         word ptr [offset...,0xfffe              
ram:f000:9f66   e9c705          JMP         LAB_f000_a530                           
                            ;Come here if the SCSI BUS RESET bit in the
                            ;PCSR was NOT set.
                            not_scsi_reset:               ;XREF[1,0]:   f000:9f06
ram:f000:9f69   b800c0          MOV         AX,0xc000                               
ram:f000:9f6c   8ed8            MOV         DS,AX                                   
ram:f000:9f6e   a00900          MOV         AL,[SCSI_AUX_STAT_REG]                  
ram:f000:9f71   30e4            XOR         AH,AH                                   
ram:f000:9f73   8846ff          MOV         byte ptr [BP + -0x1],AL                 
ram:f000:9f76   b800c0          MOV         AX,0xc000                               
ram:f000:9f79   8ed8            MOV         DS,AX                                   
ram:f000:9f7b   a00d00          MOV         AL,[SCSI_INTERRUPT_REG]                 
ram:f000:9f7e   30e4            XOR         AH,AH                                   
ram:f000:9f80   257f00          AND         AX,0x7f                                 
ram:f000:9f83   8846fe          MOV         byte ptr [BP + -0x2],AL                 
ram:f000:9f86   8a46fe          MOV         AL,byte ptr [BP + -0x2]                 
ram:f000:9f89   30e4            XOR         AH,AH                                   
ram:f000:9f8b   e96705          JMP         LAB_f000_a4f5                           
                            scsi_function_complete:       ;XREF[1,0]:   f000:a4fa
ram:f000:9f8e   be101f          MOV         SI,0x1f10                               
ram:f000:9f91   8ede            MOV         DS,SI                                   
ram:f000:9f93   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9f97   8b04            MOV         AX,word ptr [SI]                        
ram:f000:9f99   a90800          TEST        AX,0x8                                  
ram:f000:9f9c   7434            JZ          LAB_f000_9fd2                           
ram:f000:9f9e   be101f          MOV         SI,0x1f10                               
ram:f000:9fa1   8ede            MOV         DS,SI                                   
ram:f000:9fa3   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9fa7   8b04            MOV         AX,word ptr [SI]                        
ram:f000:9fa9   a90008          TEST        AX,0x800                                
ram:f000:9fac   740a            JZ          set_atn_not_needed                      
ram:f000:9fae   b800c0          MOV         AX,0xc000                               
ram:f000:9fb1   8ed8            MOV         DS,AX                                   
                            ;SCSI COMMAND: Set ATN
ram:f000:9fb3   c606030003      MOV         byte ptr [SCSI_CMD_REG],0x3             
                            set_atn_not_needed:           ;XREF[1,0]:   f000:9fac
ram:f000:9fb8   b800c0          MOV         AX,0xc000                               
ram:f000:9fbb   8ed8            MOV         DS,AX                                   
                            ;SCSI COMMAND: Message Accepted
ram:f000:9fbd   c606030004      MOV         byte ptr [SCSI_CMD_REG],0x4             
ram:f000:9fc2   be101f          MOV         SI,0x1f10                               
ram:f000:9fc5   8ede            MOV         DS,SI                                   
ram:f000:9fc7   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9fcb   8124f7ff        AND         word ptr [SI],0xfff7                    
ram:f000:9fcf   e94905          JMP         LAB_f000_a51b                           
                            LAB_f000_9fd2:                ;XREF[1,0]:   f000:9f9c
ram:f000:9fd2   be101f          MOV         SI,0x1f10                               
ram:f000:9fd5   8ede            MOV         DS,SI                                   
ram:f000:9fd7   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9fdb   810c0200        OR          word ptr [SI],0x2                       
ram:f000:9fdf   e93905          JMP         LAB_f000_a51b                           
                            LAB_f000_9fe2:                ;XREF[1,0]:   f000:a502
ram:f000:9fe2   8a46ff          MOV         AL,byte ptr [BP + -0x1]                 
ram:f000:9fe5   30e4            XOR         AH,AH                                   
ram:f000:9fe7   253800          AND         AX,0x38                                 
ram:f000:9fea   e98504          JMP         LAB_f000_a472                           
                            LAB_f000_9fed:                ;XREF[1,0]:   f000:a487
ram:f000:9fed   be101f          MOV         SI,0x1f10                               
ram:f000:9ff0   8ede            MOV         DS,SI                                   
ram:f000:9ff2   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:9ff6   81247fff        AND         word ptr [SI],0xff7f                    
ram:f000:9ffa   9a3700b0f9      CALLF       FUN_f000_9b37                           ;void FUN_f000_9b37(void)
ram:f000:9fff   e9a004          JMP         LAB_f000_a4a2                           
                            LAB_f000_a002:                ;XREF[1,0]:   f000:a477
ram:f000:a002   be101f          MOV         SI,0x1f10                               
ram:f000:a005   8ede            MOV         DS,SI                                   
ram:f000:a007   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a00b   8b04            MOV         AX,word ptr [SI]                        
ram:f000:a00d   a90002          TEST        AX,0x200                                
ram:f000:a010   7415            JZ          LAB_f000_a027                           
ram:f000:a012   be101f          MOV         SI,0x1f10                               
ram:f000:a015   8ede            MOV         DS,SI                                   
ram:f000:a017   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a01b   8124fffd        AND         word ptr [SI],0xfdff                    
ram:f000:a01f   9a440080f9      CALLF       FUN_f000_9844                           ;void FUN_f000_9844(void)
ram:f000:a024   e97b04          JMP         LAB_f000_a4a2                           
                            LAB_f000_a027:                ;XREF[1,0]:   f000:a010
ram:f000:a027   be101f          MOV         SI,0x1f10                               
ram:f000:a02a   8ede            MOV         DS,SI                                   
ram:f000:a02c   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a030   8b04            MOV         AX,word ptr [SI]                        
ram:f000:a032   a98000          TEST        AX,0x80                                 
ram:f000:a035   7413            JZ          LAB_f000_a04a                           
ram:f000:a037   be101f          MOV         SI,0x1f10                               
ram:f000:a03a   8ede            MOV         DS,SI                                   
ram:f000:a03c   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a040   c744220000      MOV         word ptr [SI + 0x22],0x0                
ram:f000:a045   c744240000      MOV         word ptr [SI + 0x24],0x0                
                            LAB_f000_a04a:                ;XREF[1,0]:   f000:a035
ram:f000:a04a   be101f          MOV         SI,0x1f10                               
ram:f000:a04d   8ede            MOV         DS,SI                                   
ram:f000:a04f   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a053   8124bfff        AND         word ptr [SI],0xffbf                    
ram:f000:a057   be101f          MOV         SI,0x1f10                               
ram:f000:a05a   8ede            MOV         DS,SI                                   
ram:f000:a05c   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a060   810c8000        OR          word ptr [SI],0x80                      
ram:f000:a064   be101f          MOV         SI,0x1f10                               
ram:f000:a067   8ede            MOV         DS,SI                                   
ram:f000:a069   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a06d   8b04            MOV         AX,word ptr [SI]                        
ram:f000:a06f   a92000          TEST        AX,0x20                                 
ram:f000:a072   7407            JZ          LAB_f000_a07b                           
ram:f000:a074   9a4900a0f9      CALLF       FUN_f000_9a49                           ;void FUN_f000_9a49(void)
ram:f000:a079   eb05            JMP         LAB_f000_a080                           
                            LAB_f000_a07b:                ;XREF[1,0]:   f000:a072
ram:f000:a07b   9a440080f9      CALLF       FUN_f000_9844                           ;void FUN_f000_9844(void)
                            LAB_f000_a080:                ;XREF[1,0]:   f000:a079
ram:f000:a080   e91f04          JMP         LAB_f000_a4a2                           
                            LAB_f000_a083:                ;XREF[1,0]:   f000:a47f
ram:f000:a083   be101f          MOV         SI,0x1f10                               
ram:f000:a086   8ede            MOV         DS,SI                                   
ram:f000:a088   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a08c   8b04            MOV         AX,word ptr [SI]                        
ram:f000:a08e   a90002          TEST        AX,0x200                                
ram:f000:a091   7415            JZ          LAB_f000_a0a8                           
ram:f000:a093   be101f          MOV         SI,0x1f10                               
ram:f000:a096   8ede            MOV         DS,SI                                   
ram:f000:a098   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a09c   8124fffd        AND         word ptr [SI],0xfdff                    
ram:f000:a0a0   9aa00040f9      CALLF       FUN_f000_94a0                           ;void FUN_f000_94a0(void)
ram:f000:a0a5   e9fa03          JMP         LAB_f000_a4a2                           
                            LAB_f000_a0a8:                ;XREF[1,0]:   f000:a091
ram:f000:a0a8   be101f          MOV         SI,0x1f10                               
ram:f000:a0ab   8ede            MOV         DS,SI                                   
ram:f000:a0ad   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a0b1   8b04            MOV         AX,word ptr [SI]                        
ram:f000:a0b3   a90001          TEST        AX,0x100                                
ram:f000:a0b6   7465            JZ          LAB_f000_a11d                           
ram:f000:a0b8   9a3c0010f9      CALLF       scsi_transfer_info                      ;undefined2 scsi_transfer_info(void)
ram:f000:a0bd   8846f9          MOV         byte ptr [BP + -0x7],AL                 
ram:f000:a0c0   b80100          MOV         AX,0x1                                  
ram:f000:a0c3   50              PUSH        AX                                      
ram:f000:a0c4   b80100          MOV         AX,0x1                                  
ram:f000:a0c7   50              PUSH        AX                                      
ram:f000:a0c8   be101f          MOV         SI,0x1f10                               
ram:f000:a0cb   8ede            MOV         DS,SI                                   
ram:f000:a0cd   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a0d1   ff7430          PUSH        word ptr [SI + 0x30]                    
ram:f000:a0d4   ff742e          PUSH        word ptr [SI + 0x2e]                    
ram:f000:a0d7   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:a0da   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:a0dd   2c07            SUB         AL,0x7                                  
ram:f000:a0df   7303            JNC         LAB_f000_a0e4                           
ram:f000:a0e1   83ea10          SUB         DX,0x10                                 
                            LAB_f000_a0e4:                ;XREF[1,0]:   f000:a0df
ram:f000:a0e4   d1ea            SHR         DX,1                                    
ram:f000:a0e6   d1ea            SHR         DX,1                                    
ram:f000:a0e8   d1ea            SHR         DX,1                                    
ram:f000:a0ea   d1ea            SHR         DX,1                                    
ram:f000:a0ec   86d4            XCHG        AH,DL                                   
ram:f000:a0ee   86f2            XCHG        DL,DH                                   
ram:f000:a0f0   52              PUSH        DX                                      
ram:f000:a0f1   50              PUSH        AX                                      
ram:f000:a0f2   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:a0f7   83c40c          ADD         SP,0xc                                  
ram:f000:a0fa   be101f          MOV         SI,0x1f10                               
ram:f000:a0fd   8ede            MOV         DS,SI                                   
ram:f000:a0ff   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a103   c744220000      MOV         word ptr [SI + 0x22],0x0                
ram:f000:a108   c744240000      MOV         word ptr [SI + 0x24],0x0                
ram:f000:a10d   be101f          MOV         SI,0x1f10                               
ram:f000:a110   8ede            MOV         DS,SI                                   
ram:f000:a112   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a116   8124fffe        AND         word ptr [SI],0xfeff                    
ram:f000:a11a   e98503          JMP         LAB_f000_a4a2                           
                            LAB_f000_a11d:                ;XREF[1,0]:   f000:a0b6
ram:f000:a11d   be101f          MOV         SI,0x1f10                               
ram:f000:a120   8ede            MOV         DS,SI                                   
ram:f000:a122   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a126   8b04            MOV         AX,word ptr [SI]                        
ram:f000:a128   a98000          TEST        AX,0x80                                 
ram:f000:a12b   7413            JZ          LAB_f000_a140                           
ram:f000:a12d   be101f          MOV         SI,0x1f10                               
ram:f000:a130   8ede            MOV         DS,SI                                   
ram:f000:a132   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a136   c744220000      MOV         word ptr [SI + 0x22],0x0                
ram:f000:a13b   c744240000      MOV         word ptr [SI + 0x24],0x0                
                            LAB_f000_a140:                ;XREF[1,0]:   f000:a12b
ram:f000:a140   be101f          MOV         SI,0x1f10                               
ram:f000:a143   8ede            MOV         DS,SI                                   
ram:f000:a145   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a149   810cc000        OR          word ptr [SI],0xc0                      
ram:f000:a14d   be101f          MOV         SI,0x1f10                               
ram:f000:a150   8ede            MOV         DS,SI                                   
ram:f000:a152   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a156   8b04            MOV         AX,word ptr [SI]                        
ram:f000:a158   a92000          TEST        AX,0x20                                 
ram:f000:a15b   7407            JZ          LAB_f000_a164                           
ram:f000:a15d   9a190070f9      CALLF       FUN_f000_9719                           ;void FUN_f000_9719(void)
ram:f000:a162   eb05            JMP         LAB_f000_a169                           
                            LAB_f000_a164:                ;XREF[1,0]:   f000:a15b
ram:f000:a164   9aa00040f9      CALLF       FUN_f000_94a0                           ;void FUN_f000_94a0(void)
                            LAB_f000_a169:                ;XREF[1,0]:   f000:a162
ram:f000:a169   e93603          JMP         LAB_f000_a4a2                           
                            LAB_f000_a16c:                ;XREF[1,0]:   f000:a48f
ram:f000:a16c   9a3c0010f9      CALLF       scsi_transfer_info                      ;undefined2 scsi_transfer_info(void)
ram:f000:a171   be101f          MOV         SI,0x1f10                               
ram:f000:a174   8ede            MOV         DS,SI                                   
ram:f000:a176   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a17a   884402          MOV         byte ptr [SI + 0x2],AL                  
ram:f000:a17d   85c0            TEST        AX,AX                                   
ram:f000:a17f   7503            JNZ         LAB_f000_a184                           
ram:f000:a181   e92f01          JMP         LAB_f000_a2b3                           
                            LAB_f000_a184:                ;XREF[1,0]:   f000:a17f
ram:f000:a184   b800c0          MOV         AX,0xc000                               
ram:f000:a187   8ed8            MOV         DS,AX                                   
ram:f000:a189   a01d00          MOV         AL,[SCSI_XFR_LSB]                       
ram:f000:a18c   30e4            XOR         AH,AH                                   
ram:f000:a18e   a90100          TEST        AX,0x1                                  
ram:f000:a191   7503            JNZ         LAB_f000_a196                           
ram:f000:a193   e91d01          JMP         LAB_f000_a2b3                           
                            LAB_f000_a196:                ;XREF[1,0]:   f000:a191
ram:f000:a196   b800c0          MOV         AX,0xc000                               
ram:f000:a199   8ed8            MOV         DS,AX                                   
ram:f000:a19b   a01900          MOV         AL,[SCSI_XFR_MSB]                       
ram:f000:a19e   30e4            XOR         AH,AH                                   
ram:f000:a1a0   99              CWD                                                  
ram:f000:a1a1   8946f6          MOV         word ptr [BP + -0xa],AX                 
ram:f000:a1a4   8956f8          MOV         word ptr [BP + -0x8],DX                 
ram:f000:a1a7   b90800          MOV         CX,0x8                                  
ram:f000:a1aa   e308            JCXZ        LAB_f000_a1b4                           
                            LAB_f000_a1ac:                ;XREF[1,0]:   f000:a1b2
ram:f000:a1ac   d166f6          SHL         word ptr [BP + -0xa],1                  
ram:f000:a1af   d156f8          RCL         word ptr [BP + -0x8],1                  
ram:f000:a1b2   e2f8            LOOP        LAB_f000_a1ac                           
                            LAB_f000_a1b4:                ;XREF[1,0]:   f000:a1aa
ram:f000:a1b4   b800c0          MOV         AX,0xc000                               
ram:f000:a1b7   8ed8            MOV         DS,AX                                   
ram:f000:a1b9   a01b00          MOV         AL,[SCSI_XFR_MMB]                       
ram:f000:a1bc   30e4            XOR         AH,AH                                   
ram:f000:a1be   99              CWD                                                  
ram:f000:a1bf   0946f6          OR          word ptr [BP + -0xa],AX                 
ram:f000:a1c2   0956f8          OR          word ptr [BP + -0x8],DX                 
ram:f000:a1c5   b90800          MOV         CX,0x8                                  
ram:f000:a1c8   e308            JCXZ        LAB_f000_a1d2                           
                            LAB_f000_a1ca:                ;XREF[1,0]:   f000:a1d0
ram:f000:a1ca   d166f6          SHL         word ptr [BP + -0xa],1                  
ram:f000:a1cd   d156f8          RCL         word ptr [BP + -0x8],1                  
ram:f000:a1d0   e2f8            LOOP        LAB_f000_a1ca                           
                            LAB_f000_a1d2:                ;XREF[1,0]:   f000:a1c8
ram:f000:a1d2   b800c0          MOV         AX,0xc000                               
ram:f000:a1d5   8ed8            MOV         DS,AX                                   
ram:f000:a1d7   a01d00          MOV         AL,[SCSI_XFR_LSB]                       
ram:f000:a1da   30e4            XOR         AH,AH                                   
ram:f000:a1dc   99              CWD                                                  
ram:f000:a1dd   0946f6          OR          word ptr [BP + -0xa],AX                 
ram:f000:a1e0   0956f8          OR          word ptr [BP + -0x8],DX                 
ram:f000:a1e3   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:a1e6   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:a1e9   2c0b            SUB         AL,0xb                                  
ram:f000:a1eb   7303            JNC         LAB_f000_a1f0                           
ram:f000:a1ed   83ea10          SUB         DX,0x10                                 
                            LAB_f000_a1f0:                ;XREF[1,0]:   f000:a1eb
ram:f000:a1f0   d1ea            SHR         DX,1                                    
ram:f000:a1f2   d1ea            SHR         DX,1                                    
ram:f000:a1f4   d1ea            SHR         DX,1                                    
ram:f000:a1f6   d1ea            SHR         DX,1                                    
ram:f000:a1f8   86d4            XCHG        AH,DL                                   
ram:f000:a1fa   86f2            XCHG        DL,DH                                   
ram:f000:a1fc   8946f0          MOV         word ptr [BP + -0x10],AX                
ram:f000:a1ff   8956f2          MOV         word ptr [BP + -0xe],DX                 
ram:f000:a202   be101f          MOV         SI,0x1f10                               
ram:f000:a205   8ede            MOV         DS,SI                                   
ram:f000:a207   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a20b   8b04            MOV         AX,word ptr [SI]                        
ram:f000:a20d   a90001          TEST        AX,0x100                                
ram:f000:a210   7436            JZ          LAB_f000_a248                           
ram:f000:a212   be101f          MOV         SI,0x1f10                               
ram:f000:a215   8ede            MOV         DS,SI                                   
ram:f000:a217   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a21b   8b441a          MOV         AX,word ptr [SI + 0x1a]                 
ram:f000:a21e   8b541c          MOV         DX,word ptr [SI + 0x1c]                 
ram:f000:a221   be101f          MOV         SI,0x1f10                               
ram:f000:a224   8ede            MOV         DS,SI                                   
ram:f000:a226   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a22a   8b4c1e          MOV         CX,word ptr [SI + 0x1e]                 
ram:f000:a22d   8b5c20          MOV         BX,word ptr [SI + 0x20]                 
ram:f000:a230   2b4ef6          SUB         CX,word ptr [BP + -0xa]                 
ram:f000:a233   1b5ef8          SBB         BX,word ptr [BP + -0x8]                 
ram:f000:a236   03c1            ADD         AX,CX                                   
ram:f000:a238   13d3            ADC         DX,BX                                   
ram:f000:a23a   2d0200          SUB         AX,0x2                                  
ram:f000:a23d   83da00          SBB         DX,0x0                                  
ram:f000:a240   8946ec          MOV         word ptr [BP + -0x14],AX                
ram:f000:a243   8956ee          MOV         word ptr [BP + -0x12],DX                
ram:f000:a246   eb34            JMP         LAB_f000_a27c                           
                            LAB_f000_a248:                ;XREF[1,0]:   f000:a210
ram:f000:a248   be101f          MOV         SI,0x1f10                               
ram:f000:a24b   8ede            MOV         DS,SI                                   
ram:f000:a24d   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a251   8b441a          MOV         AX,word ptr [SI + 0x1a]                 
ram:f000:a254   8b541c          MOV         DX,word ptr [SI + 0x1c]                 
ram:f000:a257   be101f          MOV         SI,0x1f10                               
ram:f000:a25a   8ede            MOV         DS,SI                                   
ram:f000:a25c   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a260   8b4c1e          MOV         CX,word ptr [SI + 0x1e]                 
ram:f000:a263   8b5c20          MOV         BX,word ptr [SI + 0x20]                 
ram:f000:a266   2b4ef6          SUB         CX,word ptr [BP + -0xa]                 
ram:f000:a269   1b5ef8          SBB         BX,word ptr [BP + -0x8]                 
ram:f000:a26c   03c1            ADD         AX,CX                                   
ram:f000:a26e   13d3            ADC         DX,BX                                   
ram:f000:a270   2d0100          SUB         AX,0x1                                  
ram:f000:a273   83da00          SBB         DX,0x0                                  
ram:f000:a276   8946ec          MOV         word ptr [BP + -0x14],AX                
ram:f000:a279   8956ee          MOV         word ptr [BP + -0x12],DX                
                            LAB_f000_a27c:                ;XREF[1,0]:   f000:a246
ram:f000:a27c   b800c0          MOV         AX,0xc000                               
ram:f000:a27f   8ed8            MOV         DS,AX                                   
ram:f000:a281   a18400          MOV         AX,[PCSR_ALL]                           
ram:f000:a284   a90001          TEST        AX,0x100                                
ram:f000:a287   742a            JZ          LAB_f000_a2b3                           
ram:f000:a289   b820c0          MOV         AX,0xc020                               
ram:f000:a28c   8ed8            MOV         DS,AX                                   
ram:f000:a28e   a10000          MOV         AX,[0x0]=>3B2_FIFO_WORD                 
ram:f000:a291   25ff00          AND         AX,0xff                                 
ram:f000:a294   8846f5          MOV         byte ptr [BP + -0xb],AL                 
ram:f000:a297   b80100          MOV         AX,0x1                                  
ram:f000:a29a   50              PUSH        AX                                      
ram:f000:a29b   b80100          MOV         AX,0x1                                  
ram:f000:a29e   50              PUSH        AX                                      
ram:f000:a29f   ff76ee          PUSH        word ptr [BP + -0x12]                   
ram:f000:a2a2   ff76ec          PUSH        word ptr [BP + -0x14]                   
ram:f000:a2a5   ff76f2          PUSH        word ptr [BP + -0xe]                    
ram:f000:a2a8   ff76f0          PUSH        word ptr [BP + -0x10]                   
ram:f000:a2ab   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:a2b0   83c40c          ADD         SP,0xc                                  
                            LAB_f000_a2b3:                ;XREF[3,0]:   f000:a181,f000:a193,f000:a287
ram:f000:a2b3   e9ec01          JMP         LAB_f000_a4a2                           
                            LAB_f000_a2b6:                ;XREF[1,0]:   f000:a497
ram:f000:a2b6   be101f          MOV         SI,0x1f10                               
ram:f000:a2b9   8ede            MOV         DS,SI                                   
ram:f000:a2bb   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a2bf   8b04            MOV         AX,word ptr [SI]                        
ram:f000:a2c1   a90008          TEST        AX,0x800                                
ram:f000:a2c4   741c            JZ          LAB_f000_a2e2                           
ram:f000:a2c6   b80700          MOV         AX,0x7                                  
ram:f000:a2c9   50              PUSH        AX                                      
ram:f000:a2ca   9a7a0010f9      CALLF       scsi_send_data                          ;void scsi_send_data(void)
ram:f000:a2cf   83c402          ADD         SP,0x2                                  
ram:f000:a2d2   be101f          MOV         SI,0x1f10                               
ram:f000:a2d5   8ede            MOV         DS,SI                                   
ram:f000:a2d7   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a2db   8124fff7        AND         word ptr [SI],0xf7ff                    
ram:f000:a2df   e9c001          JMP         LAB_f000_a4a2                           
                            LAB_f000_a2e2:                ;XREF[1,0]:   f000:a2c4
ram:f000:a2e2   be101f          MOV         SI,0x1f10                               
ram:f000:a2e5   8ede            MOV         DS,SI                                   
ram:f000:a2e7   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a2eb   8a4405          MOV         AL,byte ptr [SI + 0x5]                  
ram:f000:a2ee   30e4            XOR         AH,AH                                   
ram:f000:a2f0   0d8000          OR          AX,0x80                                 
ram:f000:a2f3   50              PUSH        AX                                      
ram:f000:a2f4   9a7a0010f9      CALLF       scsi_send_data                          ;void scsi_send_data(void)
ram:f000:a2f9   83c402          ADD         SP,0x2                                  
ram:f000:a2fc   e9a301          JMP         LAB_f000_a4a2                           
                            LAB_f000_a2ff:                ;XREF[1,0]:   f000:a49f
ram:f000:a2ff   be101f          MOV         SI,0x1f10                               
ram:f000:a302   8ede            MOV         DS,SI                                   
ram:f000:a304   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a308   810c0800        OR          word ptr [SI],0x8                       
ram:f000:a30c   be101f          MOV         SI,0x1f10                               
ram:f000:a30f   8ede            MOV         DS,SI                                   
ram:f000:a311   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a315   8b04            MOV         AX,word ptr [SI]                        
ram:f000:a317   a90010          TEST        AX,0x1000                               
ram:f000:a31a   7442            JZ          LAB_f000_a35e                           
ram:f000:a31c   9a3c0010f9      CALLF       scsi_transfer_info                      ;undefined2 scsi_transfer_info(void)
ram:f000:a321   ba101f          MOV         DX,0x1f10                               
ram:f000:a324   8eda            MOV         DS,DX                                   
ram:f000:a326   a3b800          MOV         [offset DAT_1000_f1b8 &0xff],AX         
ram:f000:a329   b8101f          MOV         AX,0x1f10                               
ram:f000:a32c   8ed8            MOV         DS,AX                                   
ram:f000:a32e   f706b800ffff    TEST        word ptr [offset...,0xffff              
ram:f000:a334   750b            JNZ         LAB_f000_a341                           
ram:f000:a336   b8101f          MOV         AX,0x1f10                               
ram:f000:a339   8ed8            MOV         DS,AX                                   
ram:f000:a33b   c706b8000001    MOV         word ptr [offset...,0x100               
                            LAB_f000_a341:                ;XREF[1,0]:   f000:a334
ram:f000:a341   be101f          MOV         SI,0x1f10                               
ram:f000:a344   8ede            MOV         DS,SI                                   
ram:f000:a346   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a34a   8124ffef        AND         word ptr [SI],0xefff                    
ram:f000:a34e   be101f          MOV         SI,0x1f10                               
ram:f000:a351   8ede            MOV         DS,SI                                   
ram:f000:a353   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a357   810c0020        OR          word ptr [SI],0x2000                    
ram:f000:a35b   e94401          JMP         LAB_f000_a4a2                           
                            LAB_f000_a35e:                ;XREF[1,0]:   f000:a31a
ram:f000:a35e   be101f          MOV         SI,0x1f10                               
ram:f000:a361   8ede            MOV         DS,SI                                   
ram:f000:a363   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a367   8b04            MOV         AX,word ptr [SI]                        
ram:f000:a369   a90020          TEST        AX,0x2000                               
ram:f000:a36c   747c            JZ          LAB_f000_a3ea                           
ram:f000:a36e   b8101f          MOV         AX,0x1f10                               
ram:f000:a371   8ed8            MOV         DS,AX                                   
ram:f000:a373   a1b800          MOV         AX,[offset DAT_1000_f1b8 &0xff]         
ram:f000:a376   ba00c0          MOV         DX,0xc000                               
ram:f000:a379   8eda            MOV         DS,DX                                   
ram:f000:a37b   a21d00          MOV         [SCSI_XFR_LSB],AL                       
ram:f000:a37e   b8101f          MOV         AX,0x1f10                               
ram:f000:a381   8ed8            MOV         DS,AX                                   
ram:f000:a383   a1b800          MOV         AX,[offset DAT_1000_f1b8 &0xff]         
ram:f000:a386   b90800          MOV         CX,0x8                                  
ram:f000:a389   d3f8            SAR         AX,CL                                   
ram:f000:a38b   ba00c0          MOV         DX,0xc000                               
ram:f000:a38e   8eda            MOV         DS,DX                                   
ram:f000:a390   a21b00          MOV         [SCSI_XFR_MMB],AL                       
ram:f000:a393   b800c0          MOV         AX,0xc000                               
ram:f000:a396   8ed8            MOV         DS,AX                                   
ram:f000:a398   c606190000      MOV         byte ptr [SCSI_XFR_MSB],0x0             
ram:f000:a39d   b800c0          MOV         AX,0xc000                               
ram:f000:a3a0   8ed8            MOV         DS,AX                                   
                            ;SCSI COMMAND: "Receive Command"
ram:f000:a3a2   c606030014      MOV         byte ptr [SCSI_CMD_REG],0x14            
                            LAB_f000_a3a7:                ;XREF[1,0]:   f000:a3d8
ram:f000:a3a7   b8101f          MOV         AX,0x1f10                               
ram:f000:a3aa   8ed8            MOV         DS,AX                                   
ram:f000:a3ac   a1b800          MOV         AX,[offset DAT_1000_f1b8 &0xff]         
ram:f000:a3af   ff0eb800        DEC         word ptr [offset DAT_1000_f1b8 &0xff]   
ram:f000:a3b3   85c0            TEST        AX,AX                                   
ram:f000:a3b5   7423            JZ          LAB_f000_a3da                           
                            LAB_f000_a3b7:                ;XREF[1,0]:   f000:a3c9
ram:f000:a3b7   b800c0          MOV         AX,0xc000                               
ram:f000:a3ba   8ed8            MOV         DS,AX                                   
ram:f000:a3bc   a00900          MOV         AL,[SCSI_AUX_STAT_REG]                  
ram:f000:a3bf   30e4            XOR         AH,AH                                   
ram:f000:a3c1   258000          AND         AX,0x80                                 
ram:f000:a3c4   3d8000          CMP         AX,0x80                                 
ram:f000:a3c7   7402            JZ          LAB_f000_a3cb                           
ram:f000:a3c9   ebec            JMP         LAB_f000_a3b7                           
                            LAB_f000_a3cb:                ;XREF[1,0]:   f000:a3c7
ram:f000:a3cb   b800c0          MOV         AX,0xc000                               
ram:f000:a3ce   8ed8            MOV         DS,AX                                   
ram:f000:a3d0   a00100          MOV         AL,[SCSI_DATA_REG]                      
ram:f000:a3d3   30e4            XOR         AH,AH                                   
ram:f000:a3d5   8846fd          MOV         byte ptr [BP + -0x3],AL                 
ram:f000:a3d8   ebcd            JMP         LAB_f000_a3a7                           
                            LAB_f000_a3da:                ;XREF[1,0]:   f000:a3b5
ram:f000:a3da   be101f          MOV         SI,0x1f10                               
ram:f000:a3dd   8ede            MOV         DS,SI                                   
ram:f000:a3df   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a3e3   8124ffdf        AND         word ptr [SI],0xdfff                    
ram:f000:a3e7   e9b800          JMP         LAB_f000_a4a2                           
                            LAB_f000_a3ea:                ;XREF[1,0]:   f000:a36c
ram:f000:a3ea   9a3c0010f9      CALLF       scsi_transfer_info                      ;undefined2 scsi_transfer_info(void)
ram:f000:a3ef   8846fd          MOV         byte ptr [BP + -0x3],AL                 
ram:f000:a3f2   8a46fd          MOV         AL,byte ptr [BP + -0x3]                 
ram:f000:a3f5   30e4            XOR         AH,AH                                   
ram:f000:a3f7   eb5c            JMP         LAB_f000_a455                           
                            LAB_f000_a3f9:                ;XREF[1,0]:   f000:a46c
ram:f000:a3f9   eb75            JMP         LAB_f000_a470                           
                            LAB_f000_a3fb:                ;XREF[1,0]:   f000:a458
ram:f000:a3fb   eb73            JMP         LAB_f000_a470                           
                            LAB_f000_a3fd:                ;XREF[1,0]:   f000:a45d
ram:f000:a3fd   be101f          MOV         SI,0x1f10                               
ram:f000:a400   8ede            MOV         DS,SI                                   
ram:f000:a402   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a406   810c0010        OR          word ptr [SI],0x1000                    
ram:f000:a40a   eb64            JMP         LAB_f000_a470                           
                            LAB_f000_a40c:                ;XREF[1,0]:   f000:a462
ram:f000:a40c   be101f          MOV         SI,0x1f10                               
ram:f000:a40f   8ede            MOV         DS,SI                                   
ram:f000:a411   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a415   810c0008        OR          word ptr [SI],0x800                     
ram:f000:a419   eb55            JMP         LAB_f000_a470                           
                            LAB_f000_a41b:                ;XREF[1,0]:   f000:a467
ram:f000:a41b   be101f          MOV         SI,0x1f10                               
ram:f000:a41e   8ede            MOV         DS,SI                                   
ram:f000:a420   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a424   810c0008        OR          word ptr [SI],0x800                     
ram:f000:a428   be101f          MOV         SI,0x1f10                               
ram:f000:a42b   8ede            MOV         DS,SI                                   
ram:f000:a42d   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a431   810c1000        OR          word ptr [SI],0x10                      
ram:f000:a435   eb39            JMP         LAB_f000_a470                           
                            LAB_f000_a437:                ;XREF[1,0]:   f000:a46e
ram:f000:a437   8a46fd          MOV         AL,byte ptr [BP + -0x3]                 
ram:f000:a43a   30e4            XOR         AH,AH                                   
ram:f000:a43c   25f8ff          AND         AX,0xfff8                               
ram:f000:a43f   3d8000          CMP         AX,0x80                                 
ram:f000:a442   7502            JNZ         LAB_f000_a446                           
ram:f000:a444   eb2a            JMP         LAB_f000_a470                           
                            LAB_f000_a446:                ;XREF[1,0]:   f000:a442
ram:f000:a446   be101f          MOV         SI,0x1f10                               
ram:f000:a449   8ede            MOV         DS,SI                                   
ram:f000:a44b   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a44f   810c0008        OR          word ptr [SI],0x800                     
ram:f000:a453   eb1b            JMP         LAB_f000_a470                           
                            LAB_f000_a455:                ;XREF[1,0]:   f000:a3f7
ram:f000:a455   3d0000          CMP         AX,0x0                                  
ram:f000:a458   74a1            JZ          LAB_f000_a3fb                           
ram:f000:a45a   3d0100          CMP         AX,0x1                                  
ram:f000:a45d   749e            JZ          LAB_f000_a3fd                           
ram:f000:a45f   3d0200          CMP         AX,0x2                                  
ram:f000:a462   74a8            JZ          LAB_f000_a40c                           
ram:f000:a464   3d0400          CMP         AX,0x4                                  
ram:f000:a467   74b2            JZ          LAB_f000_a41b                           
ram:f000:a469   3d0700          CMP         AX,0x7                                  
ram:f000:a46c   748b            JZ          LAB_f000_a3f9                           
ram:f000:a46e   ebc7            JMP         LAB_f000_a437                           
                            LAB_f000_a470:                ;XREF[7,0]:   f000:a3f9,f000:a3fb,f000:a40a,f000:a419
                                                          ;             f000:a435,f000:a444,f000:a453
ram:f000:a470   eb30            JMP         LAB_f000_a4a2                           
                            LAB_f000_a472:                ;XREF[1,0]:   f000:9fea
ram:f000:a472   3d0000          CMP         AX,0x0                                  
ram:f000:a475   7503            JNZ         LAB_f000_a47a                           
ram:f000:a477   e988fb          JMP         LAB_f000_a002                           
                            LAB_f000_a47a:                ;XREF[1,0]:   f000:a475
ram:f000:a47a   3d0800          CMP         AX,0x8                                  
ram:f000:a47d   7503            JNZ         LAB_f000_a482                           
ram:f000:a47f   e901fc          JMP         LAB_f000_a083                           
                            LAB_f000_a482:                ;XREF[1,0]:   f000:a47d
ram:f000:a482   3d1000          CMP         AX,0x10                                 
ram:f000:a485   7503            JNZ         LAB_f000_a48a                           
ram:f000:a487   e963fb          JMP         LAB_f000_9fed                           
                            LAB_f000_a48a:                ;XREF[1,0]:   f000:a485
ram:f000:a48a   3d1800          CMP         AX,0x18                                 
ram:f000:a48d   7503            JNZ         LAB_f000_a492                           
ram:f000:a48f   e9dafc          JMP         LAB_f000_a16c                           
                            LAB_f000_a492:                ;XREF[1,0]:   f000:a48d
ram:f000:a492   3d3000          CMP         AX,0x30                                 
ram:f000:a495   7503            JNZ         LAB_f000_a49a                           
ram:f000:a497   e91cfe          JMP         LAB_f000_a2b6                           
                            LAB_f000_a49a:                ;XREF[1,0]:   f000:a495
ram:f000:a49a   3d3800          CMP         AX,0x38                                 
ram:f000:a49d   7503            JNZ         LAB_f000_a4a2                           
ram:f000:a49f   e95dfe          JMP         LAB_f000_a2ff                           
                            LAB_f000_a4a2:                ;XREF[13,0]:  f000:9fff,f000:a024,f000:a080,f000:a0a5
                                                          ;             f000:a11a,f000:a169,f000:a2b3,f000:a2df
                                                          ;             f000:a2fc,f000:a35b,f000:a3e7,f000:a470
                                                          ;             f000:a49d
ram:f000:a4a2   eb77            JMP         LAB_f000_a51b                           
                            LAB_f000_a4a4:                ;XREF[1,0]:   f000:a508
ram:f000:a4a4   be101f          MOV         SI,0x1f10                               
ram:f000:a4a7   8ede            MOV         DS,SI                                   
ram:f000:a4a9   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a4ad   8b04            MOV         AX,word ptr [SI]                        
ram:f000:a4af   a90200          TEST        AX,0x2                                  
ram:f000:a4b2   7421            JZ          LAB_f000_a4d5                           
ram:f000:a4b4   be101f          MOV         SI,0x1f10                               
ram:f000:a4b7   8ede            MOV         DS,SI                                   
ram:f000:a4b9   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a4bd   8b04            MOV         AX,word ptr [SI]                        
ram:f000:a4bf   a91000          TEST        AX,0x10                                 
ram:f000:a4c2   7402            JZ          LAB_f000_a4c6                           
ram:f000:a4c4   eb55            JMP         LAB_f000_a51b                           
                            LAB_f000_a4c6:                ;XREF[1,0]:   f000:a4c2
ram:f000:a4c6   be101f          MOV         SI,0x1f10                               
ram:f000:a4c9   8ede            MOV         DS,SI                                   
ram:f000:a4cb   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a4cf   810c0100        OR          word ptr [SI],0x1                       
ram:f000:a4d3   eb0d            JMP         LAB_f000_a4e2                           
                            LAB_f000_a4d5:                ;XREF[1,0]:   f000:a4b2
ram:f000:a4d5   be101f          MOV         SI,0x1f10                               
ram:f000:a4d8   8ede            MOV         DS,SI                                   
ram:f000:a4da   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a4de   810c0400        OR          word ptr [SI],0x4                       
                            LAB_f000_a4e2:                ;XREF[1,0]:   f000:a4d3
ram:f000:a4e2   eb37            JMP         LAB_f000_a51b                           
                            LAB_f000_a4e4:                ;XREF[1,0]:   f000:a512
ram:f000:a4e4   be101f          MOV         SI,0x1f10                               
ram:f000:a4e7   8ede            MOV         DS,SI                                   
ram:f000:a4e9   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a4ed   8124efff        AND         word ptr [SI],0xffef                    
ram:f000:a4f1   eb28            JMP         LAB_f000_a51b                           
                            LAB_f000_a4f3:                ;XREF[3,0]:   f000:a50d,f000:a517,f000:a519
ram:f000:a4f3   eb26            JMP         LAB_f000_a51b                           
                            LAB_f000_a4f5:                ;XREF[1,0]:   f000:9f8b
ram:f000:a4f5   3d0100          CMP         AX,0x1                                  
ram:f000:a4f8   7503            JNZ         LAB_f000_a4fd                           
ram:f000:a4fa   e991fa          JMP         scsi_function_complete                  
                            LAB_f000_a4fd:                ;XREF[1,0]:   f000:a4f8
ram:f000:a4fd   3d0200          CMP         AX,0x2                                  
ram:f000:a500   7503            JNZ         LAB_f000_a505                           
ram:f000:a502   e9ddfa          JMP         LAB_f000_9fe2                           
                            LAB_f000_a505:                ;XREF[1,0]:   f000:a500
ram:f000:a505   3d0400          CMP         AX,0x4                                  
ram:f000:a508   749a            JZ          LAB_f000_a4a4                           
ram:f000:a50a   3d0800          CMP         AX,0x8                                  
ram:f000:a50d   74e4            JZ          LAB_f000_a4f3                           
ram:f000:a50f   3d1000          CMP         AX,0x10                                 
ram:f000:a512   74d0            JZ          LAB_f000_a4e4                           
ram:f000:a514   3d4000          CMP         AX,0x40                                 
ram:f000:a517   74da            JZ          LAB_f000_a4f3                           
ram:f000:a519   ebd8            JMP         LAB_f000_a4f3                           
                            LAB_f000_a51b:                ;XREF[7,0]:   f000:9fcf,f000:9fdf,f000:a4a2,f000:a4c4
                                                          ;             f000:a4e2,f000:a4f1,f000:a4f3
ram:f000:a51b   b800c0          MOV         AX,0xc000                               
ram:f000:a51e   8ed8            MOV         DS,AX                                   
ram:f000:a520   c6068a0000      MOV         byte ptr [PCSR_2_INT2],0x0              
ram:f000:a525   b840c0          MOV         AX,0xc040                               
ram:f000:a528   8ed8            MOV         DS,AX                                   
ram:f000:a52a   c70622000e00    MOV         word ptr [offset INT_CTRL_EOI &0xff],0xe
                            LAB_f000_a530:                ;XREF[1,0]:   f000:9f66
ram:f000:a530   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void scsi_reset_bus(void)
                                                          ;XREF[5,0]:   f000:898f,f000:9e9d,f000:b2a6,f000:cbb2
                                                          ;             f000:d106
ram:f000:a535   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:a53a   81ec0400        SUB         SP,0x4                                  
ram:f000:a53e   b800c0          MOV         AX,0xc000                               
ram:f000:a541   8ed8            MOV         DS,AX                                   
ram:f000:a543   c606860001      MOV         byte ptr [SCSI_BUS_RESET],0x1           
ram:f000:a548   c746fc0000      MOV         word ptr [BP + -0x4],0x0                
ram:f000:a54d   c746fe0000      MOV         word ptr [BP + -0x2],0x0                
                            LAB_f000_a552:                ;XREF[1,0]:   f000:a569
ram:f000:a552   837efe00        CMP         word ptr [BP + -0x2],0x0                
ram:f000:a556   7f13            JG          LAB_f000_a56b                           
ram:f000:a558   7c07            JL          LAB_f000_a561                           
ram:f000:a55a   817efc8813      CMP         word ptr [BP + -0x4],0x1388             
ram:f000:a55f   730a            JNC         LAB_f000_a56b                           
                            LAB_f000_a561:                ;XREF[1,0]:   f000:a558
ram:f000:a561   8346fc01        ADD         word ptr [BP + -0x4],0x1                
ram:f000:a565   8356fe00        ADC         word ptr [BP + -0x2],0x0                
ram:f000:a569   ebe7            JMP         LAB_f000_a552                           
                            LAB_f000_a56b:                ;XREF[2,0]:   f000:a556,f000:a55f
ram:f000:a56b   b800c0          MOV         AX,0xc000                               
ram:f000:a56e   8ed8            MOV         DS,AX                                   
ram:f000:a570   c606860000      MOV         byte ptr [SCSI_BUS_RESET],0x0           
ram:f000:a575   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void scsi_init(void)
                                                          ;XREF[1,0]:   f000:81cc
ram:f000:a57a   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:a57f   81ec0400        SUB         SP,0x4                                  
ram:f000:a583   b820c0          MOV         AX,0xc020                               
ram:f000:a586   8ed8            MOV         DS,AX                                   
ram:f000:a588   a09000          MOV         AL,[offset DMA_CSR &0xff]               
ram:f000:a58b   30e4            XOR         AH,AH                                   
ram:f000:a58d   250400          AND         AX,0x4                                  
ram:f000:a590   a29000          MOV         [offset DMA_CSR &0xff],AL               
ram:f000:a593   b820c0          MOV         AX,0xc020                               
ram:f000:a596   8ed8            MOV         DS,AX                                   
ram:f000:a598   c606980000      MOV         byte ptr [offset DMA_BYTE_REG &0xff],0x0
ram:f000:a59d   b820c0          MOV         AX,0xc020                               
ram:f000:a5a0   8ed8            MOV         DS,AX                                   
ram:f000:a5a2   c606960000      MOV         byte ptr [offset DMA_MODE_REG &0xff],0x0
ram:f000:a5a7   b820c0          MOV         AX,0xc020                               
ram:f000:a5aa   8ed8            MOV         DS,AX                                   
ram:f000:a5ac   c606960001      MOV         byte ptr [offset DMA_MODE_REG &0xff],0x1
ram:f000:a5b1   b820c0          MOV         AX,0xc020                               
ram:f000:a5b4   8ed8            MOV         DS,AX                                   
ram:f000:a5b6   c606960002      MOV         byte ptr [offset DMA_MODE_REG &0xff],0x2
ram:f000:a5bb   b820c0          MOV         AX,0xc020                               
ram:f000:a5be   8ed8            MOV         DS,AX                                   
ram:f000:a5c0   c606960003      MOV         byte ptr [offset DMA_MODE_REG &0xff],0x3
ram:f000:a5c5   b810c0          MOV         AX,0xc010                               
ram:f000:a5c8   8ed8            MOV         DS,AX                                   
ram:f000:a5ca   c606000000      MOV         byte ptr [0x0]=>DAT_c000_0100,0x0       
ram:f000:a5cf   b810c0          MOV         AX,0xc010                               
ram:f000:a5d2   8ed8            MOV         DS,AX                                   
ram:f000:a5d4   c606800000      MOV         byte ptr [offset...,0x0                 
ram:f000:a5d9   b800c0          MOV         AX,0xc000                               
ram:f000:a5dc   8ed8            MOV         DS,AX                                   
ram:f000:a5de   803e130080      CMP         byte ptr [DAT_c000_0013],0x80           
ram:f000:a5e3   7427            JZ          LAB_f000_a60c                           
ram:f000:a5e5   b800c0          MOV         AX,0xc000                               
ram:f000:a5e8   8ed8            MOV         DS,AX                                   
ram:f000:a5ea   c606030000      MOV         byte ptr [SCSI_CMD_REG],0x0             
ram:f000:a5ef   b800c0          MOV         AX,0xc000                               
ram:f000:a5f2   8ed8            MOV         DS,AX                                   
ram:f000:a5f4   a01300          MOV         AL,[DAT_c000_0013]                      
ram:f000:a5f7   30e4            XOR         AH,AH                                   
ram:f000:a5f9   8846fd          MOV         byte ptr [BP + -0x3],AL                 
ram:f000:a5fc   3d8000          CMP         AX,0x80                                 
ram:f000:a5ff   740b            JZ          LAB_f000_a60c                           
ram:f000:a601   b8f01f          MOV         AX,0x1ff0                               
ram:f000:a604   8ed8            MOV         DS,AX                                   
ram:f000:a606   810ef2000010    OR          word ptr [offset...,0x1000              
                            LAB_f000_a60c:                ;XREF[2,0]:   f000:a5e3,f000:a5ff
ram:f000:a60c   b800c0          MOV         AX,0xc000                               
ram:f000:a60f   8ed8            MOV         DS,AX                                   
ram:f000:a611   c6068a0000      MOV         byte ptr [PCSR_2_INT2],0x0              
ram:f000:a616   b840c0          MOV         AX,0xc040                               
ram:f000:a619   8ed8            MOV         DS,AX                                   
ram:f000:a61b   c70622000e00    MOV         word ptr [offset INT_CTRL_EOI &0xff],0xe
ram:f000:a621   b840c0          MOV         AX,0xc040                               
ram:f000:a624   8ed8            MOV         DS,AX                                   
ram:f000:a626   81263c00f7ff    AND         word ptr [offset INT2_CTRL &0xff],0xfff7
ram:f000:a62c   b840c0          MOV         AX,0xc040                               
ram:f000:a62f   8ed8            MOV         DS,AX                                   
ram:f000:a631   81263e00f7ff    AND         word ptr [offset INT3_CTRL &0xff],0xfff7
ram:f000:a637   b800c0          MOV         AX,0xc000                               
ram:f000:a63a   8ed8            MOV         DS,AX                                   
ram:f000:a63c   a18400          MOV         AX,[PCSR_ALL]                           
ram:f000:a63f   8946fe          MOV         word ptr [BP + -0x2],AX                 
ram:f000:a642   250400          AND         AX,0x4                                  
ram:f000:a645   3d0400          CMP         AX,0x4                                  
ram:f000:a648   7520            JNZ         LAB_f000_a66a                           
ram:f000:a64a   b8f01f          MOV         AX,0x1ff0                               
ram:f000:a64d   8ed8            MOV         DS,AX                                   
ram:f000:a64f   810ef2000020    OR          word ptr [offset...,0x2000              
ram:f000:a655   b800c0          MOV         AX,0xc000                               
ram:f000:a658   8ed8            MOV         DS,AX                                   
                            ;SCSI Command: Chip Reset
ram:f000:a65a   c606030000      MOV         byte ptr [SCSI_CMD_REG],0x0             
ram:f000:a65f   b840c0          MOV         AX,0xc040                               
ram:f000:a662   8ed8            MOV         DS,AX                                   
ram:f000:a664   810e3c000800    OR          word ptr [offset INT2_CTRL &0xff],0x8   
                            LAB_f000_a66a:                ;XREF[1,0]:   f000:a648
ram:f000:a66a   b8101f          MOV         AX,0x1f10                               
ram:f000:a66d   8ed8            MOV         DS,AX                                   
ram:f000:a66f   c706b4007e00    MOV         word ptr [offset...,0x7e                
ram:f000:a675   c706b600001f    MOV         word ptr [offset...,0x1f00              
ram:f000:a67b   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void FUN_f000_a680(void)
                                                          ;XREF[14,0]:  f000:a876,f000:a99e,f000:ab6d,f000:ac95
                                                          ;             f000:bb8b,f000:bcf0,f000:bda9,f000:be89
                                                          ;             f000:bfb1,f000:c0d8,f000:c19e,f000:c2ca
                                                          ;             f000:c3e5,f000:c456
ram:f000:a680   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:a685   81ec0800        SUB         SP,0x8                                  
ram:f000:a689   8b7e12          MOV         DI,word ptr [BP + 0x12]                 
ram:f000:a68c   8b460e          MOV         AX,word ptr [BP + 0xe]                  
ram:f000:a68f   8b5610          MOV         DX,word ptr [BP + 0x10]                 
ram:f000:a692   0406            ADD         AL,0x6                                  
ram:f000:a694   7303            JNC         LAB_f000_a699                           
ram:f000:a696   83c210          ADD         DX,0x10                                 
                            LAB_f000_a699:                ;XREF[1,0]:   f000:a694
ram:f000:a699   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:a69c   8956fe          MOV         word ptr [BP + -0x2],DX                 
ram:f000:a69f   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:a6a2   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:a6a5   0414            ADD         AL,0x14                                 
ram:f000:a6a7   7303            JNC         LAB_f000_a6ac                           
ram:f000:a6a9   83c210          ADD         DX,0x10                                 
                            LAB_f000_a6ac:                ;XREF[1,0]:   f000:a6a7
ram:f000:a6ac   8946f8          MOV         word ptr [BP + -0x8],AX                 
ram:f000:a6af   8956fa          MOV         word ptr [BP + -0x6],DX                 
ram:f000:a6b2   8bc7            MOV         AX,DI                                   
ram:f000:a6b4   99              CWD                                                  
ram:f000:a6b5   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:a6b8   894416          MOV         word ptr [SI + 0x16],AX                 
ram:f000:a6bb   895418          MOV         word ptr [SI + 0x18],DX                 
                            LAB_f000_a6be:                ;XREF[1,0]:   f000:a6e3
ram:f000:a6be   8bc7            MOV         AX,DI                                   
ram:f000:a6c0   4f              DEC         DI                                      
ram:f000:a6c1   85c0            TEST        AX,AX                                   
ram:f000:a6c3   7420            JZ          LAB_f000_a6e5                           
ram:f000:a6c5   c576f8          LDS         SI,[BP + -0x8]                          
ram:f000:a6c8   8046f802        ADD         byte ptr [BP + -0x8],0x2                
ram:f000:a6cc   7304            JNC         LAB_f000_a6d2                           
ram:f000:a6ce   8346fa10        ADD         word ptr [BP + -0x6],0x10               
                            LAB_f000_a6d2:                ;XREF[1,0]:   f000:a6cc
ram:f000:a6d2   8b04            MOV         AX,word ptr [SI]                        
ram:f000:a6d4   c576fc          LDS         SI,[BP + -0x4]                          
ram:f000:a6d7   8046fc01        ADD         byte ptr [BP + -0x4],0x1                
ram:f000:a6db   7304            JNC         LAB_f000_a6e1                           
ram:f000:a6dd   8346fe10        ADD         word ptr [BP + -0x2],0x10               
                            LAB_f000_a6e1:                ;XREF[1,0]:   f000:a6db
ram:f000:a6e1   8804            MOV         byte ptr [SI],AL                        
ram:f000:a6e3   ebd9            JMP         LAB_f000_a6be                           
                            LAB_f000_a6e5:                ;XREF[1,0]:   f000:a6c3
ram:f000:a6e5   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*  I believe that this function enumerates the SCSI                                            *
                            ;*  bus and builds up, in memory, detailed metadata                                             *
                            ;*  about each target.                                                                          *
                            ;************************************************************************************************
                            ;void enumerate_scsi_bus(void)
                                                          ;XREF[3,0]:   f000:8c43,f000:b3a9,f000:b75c
ram:f000:a6ea   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:a6ef   81ec2800        SUB         SP,0x28                                 
ram:f000:a6f3   c746fc0000      MOV         word ptr [BP + -0x4],0x0                
ram:f000:a6f8   c746fee01f      MOV         word ptr [BP + -0x2],0x1fe0             
ram:f000:a6fd   c576fc          LDS         SI,[BP + -0x4]                          
ram:f000:a700   c7040000        MOV         word ptr [SI],0x0                       
ram:f000:a704   c744020000      MOV         word ptr [SI + 0x2],0x0                 
ram:f000:a709   c746de0000      MOV         word ptr [BP + -0x22],0x0               
                            LAB_f000_a70e:                ;XREF[1,0]:   f000:a7ee
ram:f000:a70e   837ede08        CMP         word ptr [BP + -0x22],0x8               
ram:f000:a712   7c03            JL          LAB_f000_a717                           
ram:f000:a714   e9da00          JMP         LAB_f000_a7f1                           
                            LAB_f000_a717:                ;XREF[1,0]:   f000:a712
ram:f000:a717   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:a71a   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:a71d   0404            ADD         AL,0x4                                  
ram:f000:a71f   7303            JNC         LAB_f000_a724                           
ram:f000:a721   83c210          ADD         DX,0x10                                 
                            LAB_f000_a724:                ;XREF[1,0]:   f000:a71f
ram:f000:a724   8b4ede          MOV         CX,word ptr [BP + -0x22]                
ram:f000:a727   02c1            ADD         AL,CL                                   
ram:f000:a729   7303            JNC         LAB_f000_a72e                           
ram:f000:a72b   83c210          ADD         DX,0x10                                 
                            LAB_f000_a72e:                ;XREF[1,0]:   f000:a729
ram:f000:a72e   30c9            XOR         CL,CL                                   
ram:f000:a730   d1f9            SAR         CX,1                                    
ram:f000:a732   d1f9            SAR         CX,1                                    
ram:f000:a734   d1f9            SAR         CX,1                                    
ram:f000:a736   d1f9            SAR         CX,1                                    
ram:f000:a738   03d1            ADD         DX,CX                                   
ram:f000:a73a   8bf0            MOV         SI,AX                                   
ram:f000:a73c   8eda            MOV         DS,DX                                   
ram:f000:a73e   c60400          MOV         byte ptr [SI],0x0                       
ram:f000:a741   c746dc0000      MOV         word ptr [BP + -0x24],0x0               
                            LAB_f000_a746:                ;XREF[1,0]:   f000:a7e8
ram:f000:a746   837edc08        CMP         word ptr [BP + -0x24],0x8               
ram:f000:a74a   7c03            JL          LAB_f000_a74f                           
ram:f000:a74c   e99c00          JMP         LAB_f000_a7eb                           
                            LAB_f000_a74f:                ;XREF[1,0]:   f000:a74a
ram:f000:a74f   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:a752   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:a755   040c            ADD         AL,0xc                                  
ram:f000:a757   7303            JNC         LAB_f000_a75c                           
ram:f000:a759   83c210          ADD         DX,0x10                                 
                            LAB_f000_a75c:                ;XREF[1,0]:   f000:a757
ram:f000:a75c   8b4ede          MOV         CX,word ptr [BP + -0x22]                
ram:f000:a75f   be0300          MOV         SI,0x3                                  
ram:f000:a762   87ce            XCHG        SI,CX                                   
ram:f000:a764   d3e6            SHL         SI,CL                                   
ram:f000:a766   87ce            XCHG        SI,CX                                   
ram:f000:a768   02c1            ADD         AL,CL                                   
ram:f000:a76a   7303            JNC         LAB_f000_a76f                           
ram:f000:a76c   83c210          ADD         DX,0x10                                 
                            LAB_f000_a76f:                ;XREF[1,0]:   f000:a76a
ram:f000:a76f   30c9            XOR         CL,CL                                   
ram:f000:a771   d1f9            SAR         CX,1                                    
ram:f000:a773   d1f9            SAR         CX,1                                    
ram:f000:a775   d1f9            SAR         CX,1                                    
ram:f000:a777   d1f9            SAR         CX,1                                    
ram:f000:a779   03d1            ADD         DX,CX                                   
ram:f000:a77b   8b4edc          MOV         CX,word ptr [BP + -0x24]                
ram:f000:a77e   02c1            ADD         AL,CL                                   
ram:f000:a780   7303            JNC         LAB_f000_a785                           
ram:f000:a782   83c210          ADD         DX,0x10                                 
                            LAB_f000_a785:                ;XREF[1,0]:   f000:a780
ram:f000:a785   30c9            XOR         CL,CL                                   
ram:f000:a787   d1f9            SAR         CX,1                                    
ram:f000:a789   d1f9            SAR         CX,1                                    
ram:f000:a78b   d1f9            SAR         CX,1                                    
ram:f000:a78d   d1f9            SAR         CX,1                                    
ram:f000:a78f   03d1            ADD         DX,CX                                   
ram:f000:a791   8bf0            MOV         SI,AX                                   
ram:f000:a793   8eda            MOV         DS,DX                                   
ram:f000:a795   c60400          MOV         byte ptr [SI],0x0                       
ram:f000:a798   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:a79b   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:a79e   044c            ADD         AL,0x4c                                 
ram:f000:a7a0   7303            JNC         LAB_f000_a7a5                           
ram:f000:a7a2   83c210          ADD         DX,0x10                                 
                            LAB_f000_a7a5:                ;XREF[1,0]:   f000:a7a0
ram:f000:a7a5   8b4ede          MOV         CX,word ptr [BP + -0x22]                
ram:f000:a7a8   be0500          MOV         SI,0x5                                  
ram:f000:a7ab   87ce            XCHG        SI,CX                                   
ram:f000:a7ad   d3e6            SHL         SI,CL                                   
ram:f000:a7af   87ce            XCHG        SI,CX                                   
ram:f000:a7b1   02c1            ADD         AL,CL                                   
ram:f000:a7b3   7303            JNC         LAB_f000_a7b8                           
ram:f000:a7b5   83c210          ADD         DX,0x10                                 
                            LAB_f000_a7b8:                ;XREF[1,0]:   f000:a7b3
ram:f000:a7b8   30c9            XOR         CL,CL                                   
ram:f000:a7ba   d1f9            SAR         CX,1                                    
ram:f000:a7bc   d1f9            SAR         CX,1                                    
ram:f000:a7be   d1f9            SAR         CX,1                                    
ram:f000:a7c0   d1f9            SAR         CX,1                                    
ram:f000:a7c2   03d1            ADD         DX,CX                                   
ram:f000:a7c4   8b4edc          MOV         CX,word ptr [BP + -0x24]                
ram:f000:a7c7   d1e1            SHL         CX,1                                    
ram:f000:a7c9   d1e1            SHL         CX,1                                    
ram:f000:a7cb   02c1            ADD         AL,CL                                   
ram:f000:a7cd   7303            JNC         LAB_f000_a7d2                           
ram:f000:a7cf   83c210          ADD         DX,0x10                                 
                            LAB_f000_a7d2:                ;XREF[1,0]:   f000:a7cd
ram:f000:a7d2   30c9            XOR         CL,CL                                   
ram:f000:a7d4   d1f9            SAR         CX,1                                    
ram:f000:a7d6   d1f9            SAR         CX,1                                    
ram:f000:a7d8   d1f9            SAR         CX,1                                    
ram:f000:a7da   d1f9            SAR         CX,1                                    
ram:f000:a7dc   03d1            ADD         DX,CX                                   
ram:f000:a7de   8bf0            MOV         SI,AX                                   
ram:f000:a7e0   8eda            MOV         DS,DX                                   
ram:f000:a7e2   c604ff          MOV         byte ptr [SI],0xff                      
ram:f000:a7e5   ff46dc          INC         word ptr [BP + -0x24]                   
ram:f000:a7e8   e95bff          JMP         LAB_f000_a746                           
                            LAB_f000_a7eb:                ;XREF[1,0]:   f000:a74c
ram:f000:a7eb   ff46de          INC         word ptr [BP + -0x22]                   
ram:f000:a7ee   e91dff          JMP         LAB_f000_a70e                           
                            LAB_f000_a7f1:                ;XREF[1,0]:   f000:a714
ram:f000:a7f1   b8f01f          MOV         AX,0x1ff0                               
ram:f000:a7f4   8ed8            MOV         DS,AX                                   
ram:f000:a7f6   a1f400          MOV         AX,[offset DAT_1000_fff4 &0xff]         
ram:f000:a7f9   a90100          TEST        AX,0x1                                  
ram:f000:a7fc   752c            JNZ         LAB_f000_a82a                           
                            LAB_f000_a7fe:                ;XREF[1,0]:   f000:a828
ram:f000:a7fe   b8f01f          MOV         AX,0x1ff0                               
ram:f000:a801   8ed8            MOV         DS,AX                                   
ram:f000:a803   a1f200          MOV         AX,[offset STATE_FLAGS &0xff]           
ram:f000:a806   85460e          TEST        word ptr [BP + 0xe],AX                  
ram:f000:a809   7403            JZ          LAB_f000_a80e                           
ram:f000:a80b   e93006          JMP         LAB_f000_ae3e                           
                            LAB_f000_a80e:                ;XREF[1,0]:   f000:a809
ram:f000:a80e   b8f01f          MOV         AX,0x1ff0                               
ram:f000:a811   8ed8            MOV         DS,AX                                   
ram:f000:a813   f706f000ffff    TEST        word ptr [offset...,0xffff              
ram:f000:a819   750d            JNZ         LAB_f000_a828                           
ram:f000:a81b   b8f01f          MOV         AX,0x1ff0                               
ram:f000:a81e   8ed8            MOV         DS,AX                                   
ram:f000:a820   810ef4000100    OR          word ptr [offset...,0x1                 
ram:f000:a826   eb02            JMP         LAB_f000_a82a                           
                            LAB_f000_a828:                ;XREF[1,0]:   f000:a819
ram:f000:a828   ebd4            JMP         LAB_f000_a7fe                           
                            LAB_f000_a82a:                ;XREF[2,0]:   f000:a7fc,f000:a826
ram:f000:a82a   c746de0000      MOV         word ptr [BP + -0x22],0x0               
                            LAB_f000_a82f:                ;XREF[1,0]:   f000:aa99
ram:f000:a82f   837ede08        CMP         word ptr [BP + -0x22],0x8               
ram:f000:a833   7c03            JL          LAB_f000_a838                           
ram:f000:a835   e96402          JMP         LAB_f000_aa9c                           
                            LAB_f000_a838:                ;XREF[1,0]:   f000:a833
ram:f000:a838   c746da0000      MOV         word ptr [BP + -0x26],0x0               
                            LAB_f000_a83d:                ;XREF[1,0]:   f000:aa73
ram:f000:a83d   b8f01f          MOV         AX,0x1ff0                               
ram:f000:a840   8ed8            MOV         DS,AX                                   
ram:f000:a842   a1f200          MOV         AX,[offset STATE_FLAGS &0xff]           
ram:f000:a845   85460e          TEST        word ptr [BP + 0xe],AX                  
ram:f000:a848   7403            JZ          LAB_f000_a84d                           
ram:f000:a84a   e9f105          JMP         LAB_f000_ae3e                           
                            LAB_f000_a84d:                ;XREF[1,0]:   f000:a848
ram:f000:a84d   b80000          MOV         AX,0x0                                  
ram:f000:a850   50              PUSH        AX                                      
ram:f000:a851   b80400          MOV         AX,0x4                                  
ram:f000:a854   50              PUSH        AX                                      
ram:f000:a855   b80000          MOV         AX,0x0                                  
ram:f000:a858   50              PUSH        AX                                      
ram:f000:a859   b80000          MOV         AX,0x0                                  
ram:f000:a85c   50              PUSH        AX                                      
ram:f000:a85d   b80000          MOV         AX,0x0                                  
ram:f000:a860   50              PUSH        AX                                      
ram:f000:a861   b81200          MOV         AX,0x12                                 
ram:f000:a864   50              PUSH        AX                                      
ram:f000:a865   b80600          MOV         AX,0x6                                  
ram:f000:a868   50              PUSH        AX                                      
ram:f000:a869   b8101f          MOV         AX,0x1f10                               
ram:f000:a86c   8ed8            MOV         DS,AX                                   
ram:f000:a86e   ff36b600        PUSH        word ptr [offset SCSI_CMD_PTR_SEG &0xff]
ram:f000:a872   ff36b400        PUSH        word ptr [offset SCSI_CMD_PTR &0xff]    
ram:f000:a876   9a800060fa      CALLF       FUN_f000_a680                           ;void FUN_f000_a680(void)
ram:f000:a87b   83c412          ADD         SP,0x12                                 
ram:f000:a87e   be101f          MOV         SI,0x1f10                               
ram:f000:a881   8ede            MOV         DS,SI                                   
ram:f000:a883   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a887   8a46de          MOV         AL,byte ptr [BP + -0x22]                
ram:f000:a88a   884404          MOV         byte ptr [SI + 0x4],AL                  
ram:f000:a88d   be101f          MOV         SI,0x1f10                               
ram:f000:a890   8ede            MOV         DS,SI                                   
ram:f000:a892   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a896   c6440500        MOV         byte ptr [SI + 0x5],0x0                 
ram:f000:a89a   be101f          MOV         SI,0x1f10                               
ram:f000:a89d   8ede            MOV         DS,SI                                   
ram:f000:a89f   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a8a3   c744260000      MOV         word ptr [SI + 0x26],0x0                
ram:f000:a8a8   c744280000      MOV         word ptr [SI + 0x28],0x0                
ram:f000:a8ad   be101f          MOV         SI,0x1f10                               
ram:f000:a8b0   8ede            MOV         DS,SI                                   
ram:f000:a8b2   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a8b6   c744220400      MOV         word ptr [SI + 0x22],0x4                
ram:f000:a8bb   c744240000      MOV         word ptr [SI + 0x24],0x0                
ram:f000:a8c0   be101f          MOV         SI,0x1f10                               
ram:f000:a8c3   8ede            MOV         DS,SI                                   
ram:f000:a8c5   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a8c9   c7441e0400      MOV         word ptr [SI + 0x1e],0x4                
ram:f000:a8ce   c744200000      MOV         word ptr [SI + 0x20],0x0                
ram:f000:a8d3   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:a8d6   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:a8d9   044c            ADD         AL,0x4c                                 
ram:f000:a8db   7303            JNC         LAB_f000_a8e0                           
ram:f000:a8dd   83c210          ADD         DX,0x10                                 
                            LAB_f000_a8e0:                ;XREF[1,0]:   f000:a8db
ram:f000:a8e0   8b4ede          MOV         CX,word ptr [BP + -0x22]                
ram:f000:a8e3   be0500          MOV         SI,0x5                                  
ram:f000:a8e6   87ce            XCHG        SI,CX                                   
ram:f000:a8e8   d3e6            SHL         SI,CL                                   
ram:f000:a8ea   87ce            XCHG        SI,CX                                   
ram:f000:a8ec   02c1            ADD         AL,CL                                   
ram:f000:a8ee   7303            JNC         LAB_f000_a8f3                           
ram:f000:a8f0   83c210          ADD         DX,0x10                                 
                            LAB_f000_a8f3:                ;XREF[1,0]:   f000:a8ee
ram:f000:a8f3   30c9            XOR         CL,CL                                   
ram:f000:a8f5   d1f9            SAR         CX,1                                    
ram:f000:a8f7   d1f9            SAR         CX,1                                    
ram:f000:a8f9   d1f9            SAR         CX,1                                    
ram:f000:a8fb   d1f9            SAR         CX,1                                    
ram:f000:a8fd   03d1            ADD         DX,CX                                   
ram:f000:a8ff   0400            ADD         AL,0x0                                  
ram:f000:a901   7303            JNC         LAB_f000_a906                           
ram:f000:a903   83c210          ADD         DX,0x10                                 
                            LAB_f000_a906:                ;XREF[1,0]:   f000:a901
ram:f000:a906   d1ea            SHR         DX,1                                    
ram:f000:a908   d1ea            SHR         DX,1                                    
ram:f000:a90a   d1ea            SHR         DX,1                                    
ram:f000:a90c   d1ea            SHR         DX,1                                    
ram:f000:a90e   86d4            XCHG        AH,DL                                   
ram:f000:a910   86f2            XCHG        DL,DH                                   
ram:f000:a912   be101f          MOV         SI,0x1f10                               
ram:f000:a915   8ede            MOV         DS,SI                                   
ram:f000:a917   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a91b   89441a          MOV         word ptr [SI + 0x1a],AX                 
ram:f000:a91e   89541c          MOV         word ptr [SI + 0x1c],DX                 
ram:f000:a921   be101f          MOV         SI,0x1f10                               
ram:f000:a924   8ede            MOV         DS,SI                                   
ram:f000:a926   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a92a   c7042000        MOV         word ptr [SI],0x20                      
ram:f000:a92e   9ab400d0f9      CALLF       scsi_select_with_attn                   ;void scsi_select_with_attn(void)
ram:f000:a933   b80000          MOV         AX,0x0                                  
ram:f000:a936   50              PUSH        AX                                      
ram:f000:a937   b8e803          MOV         AX,0x3e8                                
ram:f000:a93a   50              PUSH        AX                                      
ram:f000:a93b   9a1900e0f9      CALLF       FUN_f000_9e19                           ;undefined2 FUN_f000_9e19(void)
ram:f000:a940   83c404          ADD         SP,0x4                                  
ram:f000:a943   8bf8            MOV         DI,AX                                   
ram:f000:a945   e92e01          JMP         LAB_f000_aa76                           
                            LAB_f000_a948:                ;XREF[1,0]:   f000:aa93
ram:f000:a948   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:a94b   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:a94e   0404            ADD         AL,0x4                                  
ram:f000:a950   7303            JNC         LAB_f000_a955                           
ram:f000:a952   83c210          ADD         DX,0x10                                 
                            LAB_f000_a955:                ;XREF[1,0]:   f000:a950
ram:f000:a955   8b4ede          MOV         CX,word ptr [BP + -0x22]                
ram:f000:a958   02c1            ADD         AL,CL                                   
ram:f000:a95a   7303            JNC         LAB_f000_a95f                           
ram:f000:a95c   83c210          ADD         DX,0x10                                 
                            LAB_f000_a95f:                ;XREF[1,0]:   f000:a95a
ram:f000:a95f   30c9            XOR         CL,CL                                   
ram:f000:a961   d1f9            SAR         CX,1                                    
ram:f000:a963   d1f9            SAR         CX,1                                    
ram:f000:a965   d1f9            SAR         CX,1                                    
ram:f000:a967   d1f9            SAR         CX,1                                    
ram:f000:a969   03d1            ADD         DX,CX                                   
ram:f000:a96b   8bf0            MOV         SI,AX                                   
ram:f000:a96d   8eda            MOV         DS,DX                                   
ram:f000:a96f   c60401          MOV         byte ptr [SI],0x1                       
                            LAB_f000_a972:                ;XREF[2,0]:   f000:aa83,f000:aa8b
ram:f000:a972   e92101          JMP         LAB_f000_aa96                           
                            LAB_f000_a975:                ;XREF[1,0]:   f000:aa7b
ram:f000:a975   b80000          MOV         AX,0x0                                  
ram:f000:a978   50              PUSH        AX                                      
ram:f000:a979   b80400          MOV         AX,0x4                                  
ram:f000:a97c   50              PUSH        AX                                      
ram:f000:a97d   b80000          MOV         AX,0x0                                  
ram:f000:a980   50              PUSH        AX                                      
ram:f000:a981   b80000          MOV         AX,0x0                                  
ram:f000:a984   50              PUSH        AX                                      
ram:f000:a985   b80000          MOV         AX,0x0                                  
ram:f000:a988   50              PUSH        AX                                      
ram:f000:a989   b80300          MOV         AX,0x3                                  
ram:f000:a98c   50              PUSH        AX                                      
ram:f000:a98d   b80600          MOV         AX,0x6                                  
ram:f000:a990   50              PUSH        AX                                      
ram:f000:a991   b8101f          MOV         AX,0x1f10                               
ram:f000:a994   8ed8            MOV         DS,AX                                   
ram:f000:a996   ff36b600        PUSH        word ptr [offset SCSI_CMD_PTR_SEG &0xff]
ram:f000:a99a   ff36b400        PUSH        word ptr [offset SCSI_CMD_PTR &0xff]    
ram:f000:a99e   9a800060fa      CALLF       FUN_f000_a680                           ;void FUN_f000_a680(void)
ram:f000:a9a3   83c412          ADD         SP,0x12                                 
ram:f000:a9a6   be101f          MOV         SI,0x1f10                               
ram:f000:a9a9   8ede            MOV         DS,SI                                   
ram:f000:a9ab   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a9af   8a46de          MOV         AL,byte ptr [BP + -0x22]                
ram:f000:a9b2   884404          MOV         byte ptr [SI + 0x4],AL                  
ram:f000:a9b5   be101f          MOV         SI,0x1f10                               
ram:f000:a9b8   8ede            MOV         DS,SI                                   
ram:f000:a9ba   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a9be   c6440500        MOV         byte ptr [SI + 0x5],0x0                 
ram:f000:a9c2   be101f          MOV         SI,0x1f10                               
ram:f000:a9c5   8ede            MOV         DS,SI                                   
ram:f000:a9c7   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a9cb   c744260000      MOV         word ptr [SI + 0x26],0x0                
ram:f000:a9d0   c744280000      MOV         word ptr [SI + 0x28],0x0                
ram:f000:a9d5   be101f          MOV         SI,0x1f10                               
ram:f000:a9d8   8ede            MOV         DS,SI                                   
ram:f000:a9da   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a9de   c744220400      MOV         word ptr [SI + 0x22],0x4                
ram:f000:a9e3   c744240000      MOV         word ptr [SI + 0x24],0x0                
ram:f000:a9e8   be101f          MOV         SI,0x1f10                               
ram:f000:a9eb   8ede            MOV         DS,SI                                   
ram:f000:a9ed   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:a9f1   c7441e0400      MOV         word ptr [SI + 0x1e],0x4                
ram:f000:a9f6   c744200000      MOV         word ptr [SI + 0x20],0x0                
ram:f000:a9fb   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:a9fe   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:aa01   2c16            SUB         AL,0x16                                 
ram:f000:aa03   7303            JNC         LAB_f000_aa08                           
ram:f000:aa05   83ea10          SUB         DX,0x10                                 
                            LAB_f000_aa08:                ;XREF[1,0]:   f000:aa03
ram:f000:aa08   d1ea            SHR         DX,1                                    
ram:f000:aa0a   d1ea            SHR         DX,1                                    
ram:f000:aa0c   d1ea            SHR         DX,1                                    
ram:f000:aa0e   d1ea            SHR         DX,1                                    
ram:f000:aa10   86d4            XCHG        AH,DL                                   
ram:f000:aa12   86f2            XCHG        DL,DH                                   
ram:f000:aa14   be101f          MOV         SI,0x1f10                               
ram:f000:aa17   8ede            MOV         DS,SI                                   
ram:f000:aa19   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:aa1d   89441a          MOV         word ptr [SI + 0x1a],AX                 
ram:f000:aa20   89541c          MOV         word ptr [SI + 0x1c],DX                 
ram:f000:aa23   be101f          MOV         SI,0x1f10                               
ram:f000:aa26   8ede            MOV         DS,SI                                   
ram:f000:aa28   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:aa2c   c7042000        MOV         word ptr [SI],0x20                      
ram:f000:aa30   9ab400d0f9      CALLF       scsi_select_with_attn                   ;void scsi_select_with_attn(void)
ram:f000:aa35   b80000          MOV         AX,0x0                                  
ram:f000:aa38   50              PUSH        AX                                      
ram:f000:aa39   b8e803          MOV         AX,0x3e8                                
ram:f000:aa3c   50              PUSH        AX                                      
ram:f000:aa3d   9a1900e0f9      CALLF       FUN_f000_9e19                           ;undefined2 FUN_f000_9e19(void)
ram:f000:aa42   83c404          ADD         SP,0x4                                  
ram:f000:aa45   85c0            TEST        AX,AX                                   
ram:f000:aa47   7402            JZ          LAB_f000_aa4b                           
ram:f000:aa49   eb4b            JMP         LAB_f000_aa96                           
                            LAB_f000_aa4b:                ;XREF[1,0]:   f000:aa47
ram:f000:aa4b   8a46ea          MOV         AL,byte ptr [BP + -0x16]                
ram:f000:aa4e   30e4            XOR         AH,AH                                   
ram:f000:aa50   257f00          AND         AX,0x7f                                 
ram:f000:aa53   3d7000          CMP         AX,0x70                                 
ram:f000:aa56   750d            JNZ         LAB_f000_aa65                           
ram:f000:aa58   8a46ec          MOV         AL,byte ptr [BP + -0x14]                
ram:f000:aa5b   30e4            XOR         AH,AH                                   
ram:f000:aa5d   250f00          AND         AX,0xf                                  
ram:f000:aa60   3d0600          CMP         AX,0x6                                  
ram:f000:aa63   7402            JZ          LAB_f000_aa67                           
                            LAB_f000_aa65:                ;XREF[1,0]:   f000:aa56
ram:f000:aa65   eb2f            JMP         LAB_f000_aa96                           
                            LAB_f000_aa67:                ;XREF[1,0]:   f000:aa63
ram:f000:aa67   8b46da          MOV         AX,word ptr [BP + -0x26]                
ram:f000:aa6a   ff46da          INC         word ptr [BP + -0x26]                   
ram:f000:aa6d   85c0            TEST        AX,AX                                   
ram:f000:aa6f   7402            JZ          LAB_f000_aa73                           
ram:f000:aa71   eb23            JMP         LAB_f000_aa96                           
                            LAB_f000_aa73:                ;XREF[1,0]:   f000:aa6f
ram:f000:aa73   e9c7fd          JMP         LAB_f000_a83d                           
                            LAB_f000_aa76:                ;XREF[1,0]:   f000:a945
ram:f000:aa76   3dfdff          CMP         AX,0xfffd                               
ram:f000:aa79   7503            JNZ         LAB_f000_aa7e                           
ram:f000:aa7b   e9f7fe          JMP         LAB_f000_a975                           
                            LAB_f000_aa7e:                ;XREF[1,0]:   f000:aa79
ram:f000:aa7e   3dfeff          CMP         AX,0xfffe                               
ram:f000:aa81   7503            JNZ         LAB_f000_aa86                           
ram:f000:aa83   e9ecfe          JMP         LAB_f000_a972                           
                            LAB_f000_aa86:                ;XREF[1,0]:   f000:aa81
ram:f000:aa86   3dffff          CMP         AX,0xffff                               
ram:f000:aa89   7503            JNZ         LAB_f000_aa8e                           
ram:f000:aa8b   e9e4fe          JMP         LAB_f000_a972                           
                            LAB_f000_aa8e:                ;XREF[1,0]:   f000:aa89
ram:f000:aa8e   3d0000          CMP         AX,0x0                                  
ram:f000:aa91   7503            JNZ         LAB_f000_aa96                           
ram:f000:aa93   e9b2fe          JMP         LAB_f000_a948                           
                            LAB_f000_aa96:                ;XREF[5,0]:   f000:a972,f000:aa49,f000:aa65,f000:aa71
                                                          ;             f000:aa91
ram:f000:aa96   ff46de          INC         word ptr [BP + -0x22]                   
ram:f000:aa99   e993fd          JMP         LAB_f000_a82f                           
                            LAB_f000_aa9c:                ;XREF[1,0]:   f000:a835
ram:f000:aa9c   c746de0000      MOV         word ptr [BP + -0x22],0x0               
                            LAB_f000_aaa1:                ;XREF[1,0]:   f000:ae2f
ram:f000:aaa1   837ede08        CMP         word ptr [BP + -0x22],0x8               
ram:f000:aaa5   7c03            JL          LAB_f000_aaaa                           
ram:f000:aaa7   e98803          JMP         LAB_f000_ae32                           
                            LAB_f000_aaaa:                ;XREF[1,0]:   f000:aaa5
ram:f000:aaaa   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:aaad   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:aab0   0404            ADD         AL,0x4                                  
ram:f000:aab2   7303            JNC         LAB_f000_aab7                           
ram:f000:aab4   83c210          ADD         DX,0x10                                 
                            LAB_f000_aab7:                ;XREF[1,0]:   f000:aab2
ram:f000:aab7   8b4ede          MOV         CX,word ptr [BP + -0x22]                
ram:f000:aaba   02c1            ADD         AL,CL                                   
ram:f000:aabc   7303            JNC         LAB_f000_aac1                           
ram:f000:aabe   83c210          ADD         DX,0x10                                 
                            LAB_f000_aac1:                ;XREF[1,0]:   f000:aabc
ram:f000:aac1   30c9            XOR         CL,CL                                   
ram:f000:aac3   d1f9            SAR         CX,1                                    
ram:f000:aac5   d1f9            SAR         CX,1                                    
ram:f000:aac7   d1f9            SAR         CX,1                                    
ram:f000:aac9   d1f9            SAR         CX,1                                    
ram:f000:aacb   03d1            ADD         DX,CX                                   
ram:f000:aacd   8bf0            MOV         SI,AX                                   
ram:f000:aacf   8eda            MOV         DS,DX                                   
ram:f000:aad1   803c01          CMP         byte ptr [SI],0x1                       
ram:f000:aad4   7403            JZ          LAB_f000_aad9                           
ram:f000:aad6   e95303          JMP         LAB_f000_ae2c                           
                            LAB_f000_aad9:                ;XREF[1,0]:   f000:aad4
ram:f000:aad9   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:aadc   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:aadf   044c            ADD         AL,0x4c                                 
ram:f000:aae1   7303            JNC         LAB_f000_aae6                           
ram:f000:aae3   83c210          ADD         DX,0x10                                 
                            LAB_f000_aae6:                ;XREF[1,0]:   f000:aae1
ram:f000:aae6   8b4ede          MOV         CX,word ptr [BP + -0x22]                
ram:f000:aae9   be0500          MOV         SI,0x5                                  
ram:f000:aaec   87ce            XCHG        SI,CX                                   
ram:f000:aaee   d3e6            SHL         SI,CL                                   
ram:f000:aaf0   87ce            XCHG        SI,CX                                   
ram:f000:aaf2   02c1            ADD         AL,CL                                   
ram:f000:aaf4   7303            JNC         LAB_f000_aaf9                           
ram:f000:aaf6   83c210          ADD         DX,0x10                                 
                            LAB_f000_aaf9:                ;XREF[1,0]:   f000:aaf4
ram:f000:aaf9   30c9            XOR         CL,CL                                   
ram:f000:aafb   d1f9            SAR         CX,1                                    
ram:f000:aafd   d1f9            SAR         CX,1                                    
ram:f000:aaff   d1f9            SAR         CX,1                                    
ram:f000:ab01   d1f9            SAR         CX,1                                    
ram:f000:ab03   03d1            ADD         DX,CX                                   
ram:f000:ab05   8bf0            MOV         SI,AX                                   
ram:f000:ab07   8eda            MOV         DS,DX                                   
ram:f000:ab09   803c01          CMP         byte ptr [SI],0x1                       
ram:f000:ab0c   7506            JNZ         LAB_f000_ab14                           
ram:f000:ab0e   c646d901        MOV         byte ptr [BP + -0x27],0x1               
ram:f000:ab12   eb04            JMP         LAB_f000_ab18                           
                            LAB_f000_ab14:                ;XREF[1,0]:   f000:ab0c
ram:f000:ab14   c646d904        MOV         byte ptr [BP + -0x27],0x4               
                            LAB_f000_ab18:                ;XREF[1,0]:   f000:ab12
ram:f000:ab18   c746dc0000      MOV         word ptr [BP + -0x24],0x0               
                            LAB_f000_ab1d:                ;XREF[1,0]:   f000:ae29
ram:f000:ab1d   8a46d9          MOV         AL,byte ptr [BP + -0x27]                
ram:f000:ab20   30e4            XOR         AH,AH                                   
ram:f000:ab22   3946dc          CMP         word ptr [BP + -0x24],AX                
ram:f000:ab25   7203            JC          LAB_f000_ab2a                           
ram:f000:ab27   e90203          JMP         LAB_f000_ae2c                           
                            LAB_f000_ab2a:                ;XREF[1,0]:   f000:ab25
ram:f000:ab2a   b8f01f          MOV         AX,0x1ff0                               
ram:f000:ab2d   8ed8            MOV         DS,AX                                   
ram:f000:ab2f   a1f200          MOV         AX,[offset STATE_FLAGS &0xff]           
ram:f000:ab32   85460e          TEST        word ptr [BP + 0xe],AX                  
ram:f000:ab35   7403            JZ          LAB_f000_ab3a                           
ram:f000:ab37   e90403          JMP         LAB_f000_ae3e                           
                            LAB_f000_ab3a:                ;XREF[1,0]:   f000:ab35
ram:f000:ab3a   c746da0000      MOV         word ptr [BP + -0x26],0x0               
                            LAB_f000_ab3f:                ;XREF[1,0]:   f000:ad6d
ram:f000:ab3f   b80000          MOV         AX,0x0                                  
ram:f000:ab42   50              PUSH        AX                                      
ram:f000:ab43   b80000          MOV         AX,0x0                                  
ram:f000:ab46   50              PUSH        AX                                      
ram:f000:ab47   b80000          MOV         AX,0x0                                  
ram:f000:ab4a   50              PUSH        AX                                      
ram:f000:ab4b   b80000          MOV         AX,0x0                                  
ram:f000:ab4e   50              PUSH        AX                                      
ram:f000:ab4f   8b46dc          MOV         AX,word ptr [BP + -0x24]                
ram:f000:ab52   b90500          MOV         CX,0x5                                  
ram:f000:ab55   d3e0            SHL         AX,CL                                   
ram:f000:ab57   50              PUSH        AX                                      
ram:f000:ab58   b80000          MOV         AX,0x0                                  
ram:f000:ab5b   50              PUSH        AX                                      
ram:f000:ab5c   b80600          MOV         AX,0x6                                  
ram:f000:ab5f   50              PUSH        AX                                      
ram:f000:ab60   b8101f          MOV         AX,0x1f10                               
ram:f000:ab63   8ed8            MOV         DS,AX                                   
ram:f000:ab65   ff36b600        PUSH        word ptr [offset SCSI_CMD_PTR_SEG &0xff]
ram:f000:ab69   ff36b400        PUSH        word ptr [offset SCSI_CMD_PTR &0xff]    
ram:f000:ab6d   9a800060fa      CALLF       FUN_f000_a680                           ;void FUN_f000_a680(void)
ram:f000:ab72   83c412          ADD         SP,0x12                                 
ram:f000:ab75   be101f          MOV         SI,0x1f10                               
ram:f000:ab78   8ede            MOV         DS,SI                                   
ram:f000:ab7a   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:ab7e   8a46de          MOV         AL,byte ptr [BP + -0x22]                
ram:f000:ab81   884404          MOV         byte ptr [SI + 0x4],AL                  
ram:f000:ab84   be101f          MOV         SI,0x1f10                               
ram:f000:ab87   8ede            MOV         DS,SI                                   
ram:f000:ab89   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:ab8d   8a46dc          MOV         AL,byte ptr [BP + -0x24]                
ram:f000:ab90   884405          MOV         byte ptr [SI + 0x5],AL                  
ram:f000:ab93   be101f          MOV         SI,0x1f10                               
ram:f000:ab96   8ede            MOV         DS,SI                                   
ram:f000:ab98   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:ab9c   c744260000      MOV         word ptr [SI + 0x26],0x0                
ram:f000:aba1   c744280000      MOV         word ptr [SI + 0x28],0x0                
ram:f000:aba6   be101f          MOV         SI,0x1f10                               
ram:f000:aba9   8ede            MOV         DS,SI                                   
ram:f000:abab   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:abaf   c744220000      MOV         word ptr [SI + 0x22],0x0                
ram:f000:abb4   c744240000      MOV         word ptr [SI + 0x24],0x0                
ram:f000:abb9   be101f          MOV         SI,0x1f10                               
ram:f000:abbc   8ede            MOV         DS,SI                                   
ram:f000:abbe   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:abc2   c7441e0000      MOV         word ptr [SI + 0x1e],0x0                
ram:f000:abc7   c744200000      MOV         word ptr [SI + 0x20],0x0                
ram:f000:abcc   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:abcf   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:abd2   2c20            SUB         AL,0x20                                 
ram:f000:abd4   7303            JNC         LAB_f000_abd9                           
ram:f000:abd6   83ea10          SUB         DX,0x10                                 
                            LAB_f000_abd9:                ;XREF[1,0]:   f000:abd4
ram:f000:abd9   d1ea            SHR         DX,1                                    
ram:f000:abdb   d1ea            SHR         DX,1                                    
ram:f000:abdd   d1ea            SHR         DX,1                                    
ram:f000:abdf   d1ea            SHR         DX,1                                    
ram:f000:abe1   86d4            XCHG        AH,DL                                   
ram:f000:abe3   86f2            XCHG        DL,DH                                   
ram:f000:abe5   be101f          MOV         SI,0x1f10                               
ram:f000:abe8   8ede            MOV         DS,SI                                   
ram:f000:abea   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:abee   89441a          MOV         word ptr [SI + 0x1a],AX                 
ram:f000:abf1   89541c          MOV         word ptr [SI + 0x1c],DX                 
ram:f000:abf4   be101f          MOV         SI,0x1f10                               
ram:f000:abf7   8ede            MOV         DS,SI                                   
ram:f000:abf9   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:abfd   c7042000        MOV         word ptr [SI],0x20                      
ram:f000:ac01   9ab400d0f9      CALLF       scsi_select_with_attn                   ;void scsi_select_with_attn(void)
ram:f000:ac06   b80000          MOV         AX,0x0                                  
ram:f000:ac09   50              PUSH        AX                                      
ram:f000:ac0a   b8e803          MOV         AX,0x3e8                                
ram:f000:ac0d   50              PUSH        AX                                      
ram:f000:ac0e   9a1900e0f9      CALLF       FUN_f000_9e19                           ;undefined2 FUN_f000_9e19(void)
ram:f000:ac13   83c404          ADD         SP,0x4                                  
ram:f000:ac16   8bf8            MOV         DI,AX                                   
ram:f000:ac18   e9eb01          JMP         LAB_f000_ae06                           
                            LAB_f000_ac1b:                ;XREF[1,0]:   f000:ae23
ram:f000:ac1b   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:ac1e   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:ac21   040c            ADD         AL,0xc                                  
ram:f000:ac23   7303            JNC         LAB_f000_ac28                           
ram:f000:ac25   83c210          ADD         DX,0x10                                 
                            LAB_f000_ac28:                ;XREF[1,0]:   f000:ac23
ram:f000:ac28   8b4ede          MOV         CX,word ptr [BP + -0x22]                
ram:f000:ac2b   be0300          MOV         SI,0x3                                  
ram:f000:ac2e   87ce            XCHG        SI,CX                                   
ram:f000:ac30   d3e6            SHL         SI,CL                                   
ram:f000:ac32   87ce            XCHG        SI,CX                                   
ram:f000:ac34   02c1            ADD         AL,CL                                   
ram:f000:ac36   7303            JNC         LAB_f000_ac3b                           
ram:f000:ac38   83c210          ADD         DX,0x10                                 
                            LAB_f000_ac3b:                ;XREF[1,0]:   f000:ac36
ram:f000:ac3b   30c9            XOR         CL,CL                                   
ram:f000:ac3d   d1f9            SAR         CX,1                                    
ram:f000:ac3f   d1f9            SAR         CX,1                                    
ram:f000:ac41   d1f9            SAR         CX,1                                    
ram:f000:ac43   d1f9            SAR         CX,1                                    
ram:f000:ac45   03d1            ADD         DX,CX                                   
ram:f000:ac47   8b4edc          MOV         CX,word ptr [BP + -0x24]                
ram:f000:ac4a   02c1            ADD         AL,CL                                   
ram:f000:ac4c   7303            JNC         LAB_f000_ac51                           
ram:f000:ac4e   83c210          ADD         DX,0x10                                 
                            LAB_f000_ac51:                ;XREF[1,0]:   f000:ac4c
ram:f000:ac51   30c9            XOR         CL,CL                                   
ram:f000:ac53   d1f9            SAR         CX,1                                    
ram:f000:ac55   d1f9            SAR         CX,1                                    
ram:f000:ac57   d1f9            SAR         CX,1                                    
ram:f000:ac59   d1f9            SAR         CX,1                                    
ram:f000:ac5b   03d1            ADD         DX,CX                                   
ram:f000:ac5d   8bf0            MOV         SI,AX                                   
ram:f000:ac5f   8eda            MOV         DS,DX                                   
ram:f000:ac61   c60401          MOV         byte ptr [SI],0x1                       
                            LAB_f000_ac64:                ;XREF[2,0]:   f000:ae13,f000:ae1b
ram:f000:ac64   e9bf01          JMP         LAB_f000_ae26                           
                            LAB_f000_ac67:                ;XREF[1,0]:   f000:ae0b
ram:f000:ac67   b80000          MOV         AX,0x0                                  
ram:f000:ac6a   50              PUSH        AX                                      
ram:f000:ac6b   b80400          MOV         AX,0x4                                  
ram:f000:ac6e   50              PUSH        AX                                      
ram:f000:ac6f   b80000          MOV         AX,0x0                                  
ram:f000:ac72   50              PUSH        AX                                      
ram:f000:ac73   b80000          MOV         AX,0x0                                  
ram:f000:ac76   50              PUSH        AX                                      
ram:f000:ac77   8b46dc          MOV         AX,word ptr [BP + -0x24]                
ram:f000:ac7a   b90500          MOV         CX,0x5                                  
ram:f000:ac7d   d3e0            SHL         AX,CL                                   
ram:f000:ac7f   50              PUSH        AX                                      
ram:f000:ac80   b80300          MOV         AX,0x3                                  
ram:f000:ac83   50              PUSH        AX                                      
ram:f000:ac84   b80600          MOV         AX,0x6                                  
ram:f000:ac87   50              PUSH        AX                                      
ram:f000:ac88   b8101f          MOV         AX,0x1f10                               
ram:f000:ac8b   8ed8            MOV         DS,AX                                   
ram:f000:ac8d   ff36b600        PUSH        word ptr [offset SCSI_CMD_PTR_SEG &0xff]
ram:f000:ac91   ff36b400        PUSH        word ptr [offset SCSI_CMD_PTR &0xff]    
ram:f000:ac95   9a800060fa      CALLF       FUN_f000_a680                           ;void FUN_f000_a680(void)
ram:f000:ac9a   83c412          ADD         SP,0x12                                 
ram:f000:ac9d   be101f          MOV         SI,0x1f10                               
ram:f000:aca0   8ede            MOV         DS,SI                                   
ram:f000:aca2   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:aca6   8a46de          MOV         AL,byte ptr [BP + -0x22]                
ram:f000:aca9   884404          MOV         byte ptr [SI + 0x4],AL                  
ram:f000:acac   be101f          MOV         SI,0x1f10                               
ram:f000:acaf   8ede            MOV         DS,SI                                   
ram:f000:acb1   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:acb5   8a46dc          MOV         AL,byte ptr [BP + -0x24]                
ram:f000:acb8   884405          MOV         byte ptr [SI + 0x5],AL                  
ram:f000:acbb   be101f          MOV         SI,0x1f10                               
ram:f000:acbe   8ede            MOV         DS,SI                                   
ram:f000:acc0   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:acc4   c744260000      MOV         word ptr [SI + 0x26],0x0                
ram:f000:acc9   c744280000      MOV         word ptr [SI + 0x28],0x0                
ram:f000:acce   be101f          MOV         SI,0x1f10                               
ram:f000:acd1   8ede            MOV         DS,SI                                   
ram:f000:acd3   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:acd7   c744220400      MOV         word ptr [SI + 0x22],0x4                
ram:f000:acdc   c744240000      MOV         word ptr [SI + 0x24],0x0                
ram:f000:ace1   be101f          MOV         SI,0x1f10                               
ram:f000:ace4   8ede            MOV         DS,SI                                   
ram:f000:ace6   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:acea   c7441e0400      MOV         word ptr [SI + 0x1e],0x4                
ram:f000:acef   c744200000      MOV         word ptr [SI + 0x20],0x0                
ram:f000:acf4   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:acf7   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:acfa   2c16            SUB         AL,0x16                                 
ram:f000:acfc   7303            JNC         LAB_f000_ad01                           
ram:f000:acfe   83ea10          SUB         DX,0x10                                 
                            LAB_f000_ad01:                ;XREF[1,0]:   f000:acfc
ram:f000:ad01   d1ea            SHR         DX,1                                    
ram:f000:ad03   d1ea            SHR         DX,1                                    
ram:f000:ad05   d1ea            SHR         DX,1                                    
ram:f000:ad07   d1ea            SHR         DX,1                                    
ram:f000:ad09   86d4            XCHG        AH,DL                                   
ram:f000:ad0b   86f2            XCHG        DL,DH                                   
ram:f000:ad0d   be101f          MOV         SI,0x1f10                               
ram:f000:ad10   8ede            MOV         DS,SI                                   
ram:f000:ad12   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:ad16   89441a          MOV         word ptr [SI + 0x1a],AX                 
ram:f000:ad19   89541c          MOV         word ptr [SI + 0x1c],DX                 
ram:f000:ad1c   be101f          MOV         SI,0x1f10                               
ram:f000:ad1f   8ede            MOV         DS,SI                                   
ram:f000:ad21   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:ad25   c7042000        MOV         word ptr [SI],0x20                      
ram:f000:ad29   9ab400d0f9      CALLF       scsi_select_with_attn                   ;void scsi_select_with_attn(void)
ram:f000:ad2e   b80000          MOV         AX,0x0                                  
ram:f000:ad31   50              PUSH        AX                                      
ram:f000:ad32   b8e803          MOV         AX,0x3e8                                
ram:f000:ad35   50              PUSH        AX                                      
ram:f000:ad36   9a1900e0f9      CALLF       FUN_f000_9e19                           ;undefined2 FUN_f000_9e19(void)
ram:f000:ad3b   83c404          ADD         SP,0x4                                  
ram:f000:ad3e   85c0            TEST        AX,AX                                   
ram:f000:ad40   7403            JZ          LAB_f000_ad45                           
ram:f000:ad42   e9e100          JMP         LAB_f000_ae26                           
                            LAB_f000_ad45:                ;XREF[1,0]:   f000:ad40
ram:f000:ad45   8a46ea          MOV         AL,byte ptr [BP + -0x16]                
ram:f000:ad48   30e4            XOR         AH,AH                                   
ram:f000:ad4a   257f00          AND         AX,0x7f                                 
ram:f000:ad4d   3d7000          CMP         AX,0x70                                 
ram:f000:ad50   7403            JZ          LAB_f000_ad55                           
ram:f000:ad52   e9d100          JMP         LAB_f000_ae26                           
                            LAB_f000_ad55:                ;XREF[1,0]:   f000:ad50
ram:f000:ad55   8a46ec          MOV         AL,byte ptr [BP + -0x14]                
ram:f000:ad58   30e4            XOR         AH,AH                                   
ram:f000:ad5a   250f00          AND         AX,0xf                                  
ram:f000:ad5d   e99000          JMP         LAB_f000_adf0                           
                            LAB_f000_ad60:                ;XREF[1,0]:   f000:adf5
ram:f000:ad60   8b46da          MOV         AX,word ptr [BP + -0x26]                
ram:f000:ad63   ff46da          INC         word ptr [BP + -0x26]                   
ram:f000:ad66   85c0            TEST        AX,AX                                   
ram:f000:ad68   7403            JZ          LAB_f000_ad6d                           
ram:f000:ad6a   e9b900          JMP         LAB_f000_ae26                           
                            LAB_f000_ad6d:                ;XREF[1,0]:   f000:ad68
ram:f000:ad6d   e9cffd          JMP         LAB_f000_ab3f                           
                            LAB_f000_ad70:                ;XREF[1,0]:   f000:adff
ram:f000:ad70   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:ad73   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:ad76   044c            ADD         AL,0x4c                                 
ram:f000:ad78   7303            JNC         LAB_f000_ad7d                           
ram:f000:ad7a   83c210          ADD         DX,0x10                                 
                            LAB_f000_ad7d:                ;XREF[1,0]:   f000:ad78
ram:f000:ad7d   8b4ede          MOV         CX,word ptr [BP + -0x22]                
ram:f000:ad80   be0500          MOV         SI,0x5                                  
ram:f000:ad83   87ce            XCHG        SI,CX                                   
ram:f000:ad85   d3e6            SHL         SI,CL                                   
ram:f000:ad87   87ce            XCHG        SI,CX                                   
ram:f000:ad89   02c1            ADD         AL,CL                                   
ram:f000:ad8b   7303            JNC         LAB_f000_ad90                           
ram:f000:ad8d   83c210          ADD         DX,0x10                                 
                            LAB_f000_ad90:                ;XREF[1,0]:   f000:ad8b
ram:f000:ad90   30c9            XOR         CL,CL                                   
ram:f000:ad92   d1f9            SAR         CX,1                                    
ram:f000:ad94   d1f9            SAR         CX,1                                    
ram:f000:ad96   d1f9            SAR         CX,1                                    
ram:f000:ad98   d1f9            SAR         CX,1                                    
ram:f000:ad9a   03d1            ADD         DX,CX                                   
ram:f000:ad9c   8bf0            MOV         SI,AX                                   
ram:f000:ad9e   8eda            MOV         DS,DX                                   
ram:f000:ada0   803c01          CMP         byte ptr [SI],0x1                       
ram:f000:ada3   7549            JNZ         LAB_f000_adee                           
ram:f000:ada5   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:ada8   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:adab   040c            ADD         AL,0xc                                  
ram:f000:adad   7303            JNC         LAB_f000_adb2                           
ram:f000:adaf   83c210          ADD         DX,0x10                                 
                            LAB_f000_adb2:                ;XREF[1,0]:   f000:adad
ram:f000:adb2   8b4ede          MOV         CX,word ptr [BP + -0x22]                
ram:f000:adb5   be0300          MOV         SI,0x3                                  
ram:f000:adb8   87ce            XCHG        SI,CX                                   
ram:f000:adba   d3e6            SHL         SI,CL                                   
ram:f000:adbc   87ce            XCHG        SI,CX                                   
ram:f000:adbe   02c1            ADD         AL,CL                                   
ram:f000:adc0   7303            JNC         LAB_f000_adc5                           
ram:f000:adc2   83c210          ADD         DX,0x10                                 
                            LAB_f000_adc5:                ;XREF[1,0]:   f000:adc0
ram:f000:adc5   30c9            XOR         CL,CL                                   
ram:f000:adc7   d1f9            SAR         CX,1                                    
ram:f000:adc9   d1f9            SAR         CX,1                                    
ram:f000:adcb   d1f9            SAR         CX,1                                    
ram:f000:adcd   d1f9            SAR         CX,1                                    
ram:f000:adcf   03d1            ADD         DX,CX                                   
ram:f000:add1   8b4edc          MOV         CX,word ptr [BP + -0x24]                
ram:f000:add4   02c1            ADD         AL,CL                                   
ram:f000:add6   7303            JNC         LAB_f000_addb                           
ram:f000:add8   83c210          ADD         DX,0x10                                 
                            LAB_f000_addb:                ;XREF[1,0]:   f000:add6
ram:f000:addb   30c9            XOR         CL,CL                                   
ram:f000:addd   d1f9            SAR         CX,1                                    
ram:f000:addf   d1f9            SAR         CX,1                                    
ram:f000:ade1   d1f9            SAR         CX,1                                    
ram:f000:ade3   d1f9            SAR         CX,1                                    
ram:f000:ade5   03d1            ADD         DX,CX                                   
ram:f000:ade7   8bf0            MOV         SI,AX                                   
ram:f000:ade9   8eda            MOV         DS,DX                                   
ram:f000:adeb   c60401          MOV         byte ptr [SI],0x1                       
                            LAB_f000_adee:                ;XREF[3,0]:   f000:ada3,f000:adf8,f000:ae02
ram:f000:adee   eb36            JMP         LAB_f000_ae26                           
                            LAB_f000_adf0:                ;XREF[1,0]:   f000:ad5d
ram:f000:adf0   3d0600          CMP         AX,0x6                                  
ram:f000:adf3   7503            JNZ         LAB_f000_adf8                           
ram:f000:adf5   e968ff          JMP         LAB_f000_ad60                           
                            LAB_f000_adf8:                ;XREF[1,0]:   f000:adf3
ram:f000:adf8   7ff4            JG          LAB_f000_adee                           
ram:f000:adfa   3d0200          CMP         AX,0x2                                  
ram:f000:adfd   7503            JNZ         LAB_f000_ae02                           
ram:f000:adff   e96eff          JMP         LAB_f000_ad70                           
                            LAB_f000_ae02:                ;XREF[1,0]:   f000:adfd
ram:f000:ae02   ebea            JMP         LAB_f000_adee                           
ram:f000:ae04   eb              ??          EBh                                     
ram:f000:ae05   e8              ??          E8h                                     
                            LAB_f000_ae06:                ;XREF[1,0]:   f000:ac18
ram:f000:ae06   3dfdff          CMP         AX,0xfffd                               
ram:f000:ae09   7503            JNZ         LAB_f000_ae0e                           
ram:f000:ae0b   e959fe          JMP         LAB_f000_ac67                           
                            LAB_f000_ae0e:                ;XREF[1,0]:   f000:ae09
ram:f000:ae0e   3dfeff          CMP         AX,0xfffe                               
ram:f000:ae11   7503            JNZ         LAB_f000_ae16                           
ram:f000:ae13   e94efe          JMP         LAB_f000_ac64                           
                            LAB_f000_ae16:                ;XREF[1,0]:   f000:ae11
ram:f000:ae16   3dffff          CMP         AX,0xffff                               
ram:f000:ae19   7503            JNZ         LAB_f000_ae1e                           
ram:f000:ae1b   e946fe          JMP         LAB_f000_ac64                           
                            LAB_f000_ae1e:                ;XREF[1,0]:   f000:ae19
ram:f000:ae1e   3d0000          CMP         AX,0x0                                  
ram:f000:ae21   7503            JNZ         LAB_f000_ae26                           
ram:f000:ae23   e9f5fd          JMP         LAB_f000_ac1b                           
                            LAB_f000_ae26:                ;XREF[6,0]:   f000:ac64,f000:ad42,f000:ad52,f000:ad6a
                                                          ;             f000:adee,f000:ae21
ram:f000:ae26   ff46dc          INC         word ptr [BP + -0x24]                   
ram:f000:ae29   e9f1fc          JMP         LAB_f000_ab1d                           
                            LAB_f000_ae2c:                ;XREF[2,0]:   f000:aad6,f000:ab27
ram:f000:ae2c   ff46de          INC         word ptr [BP + -0x22]                   
ram:f000:ae2f   e96ffc          JMP         LAB_f000_aaa1                           
                            LAB_f000_ae32:                ;XREF[1,0]:   f000:aaa7
ram:f000:ae32   c576fc          LDS         SI,[BP + -0x4]                          
ram:f000:ae35   c7040d50        MOV         word ptr [SI],0x500d                    
ram:f000:ae39   c744020d50      MOV         word ptr [SI + 0x2],0x500d              
                            LAB_f000_ae3e:                ;XREF[3,0]:   f000:a80b,f000:a84a,f000:ab37
ram:f000:ae3e   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                         Fetch the SCSI Control job from host memory.                         *
                            ;************************************************************************************************
                            ;void scsi_control_fetch_job(void)
                                                          ;XREF[1,0]:   f000:b0c8
ram:f000:ae43   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:ae48   81ec0c00        SUB         SP,0xc                                  
ram:f000:ae4c   b8101f          MOV         AX,0x1f10                               
ram:f000:ae4f   8ed8            MOV         DS,AX                                   
ram:f000:ae51   a1b400          MOV         AX,[offset SCSI_CMD_PTR &0xff]          
ram:f000:ae54   8b16b600        MOV         DX,word ptr [offset SCSI_CMD_PTR_SEG ...
ram:f000:ae58   0406            ADD         AL,0x6                                  
ram:f000:ae5a   7303            JNC         LAB_f000_ae5f                           
ram:f000:ae5c   83c210          ADD         DX,0x10                                 
                            LAB_f000_ae5f:                ;XREF[1,0]:   f000:ae5a
ram:f000:ae5f   8946fc          MOV         word ptr [BP + -0x4],AX                 ;BP + -0x4 := SCSI_VARS_PTR
ram:f000:ae62   8956fe          MOV         word ptr [BP + -0x2],DX                 ;BP + -0x2 := SCSI_VARS_PTR_SEG
ram:f000:ae65   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:ae68   8b4404          MOV         AX,word ptr [SI + 0x4]                  ;AX,DX gets address from QUEUE job
ram:f000:ae6b   8b5406          MOV         DX,word ptr [SI + 0x6]                  
ram:f000:ae6e   8946f8          MOV         word ptr [BP + -0x8],AX                 ;BP + -0x8 := ADDR_HI
ram:f000:ae71   8956fa          MOV         word ptr [BP + -0x6],DX                 ;BP + -0x6 := ADDR_LOW
ram:f000:ae74   b8ba00          MOV         AX,0xba                                 
ram:f000:ae77   ba101f          MOV         DX,0x1f10                               
ram:f000:ae7a   d1ea            SHR         DX,1                                    
ram:f000:ae7c   d1ea            SHR         DX,1                                    
ram:f000:ae7e   d1ea            SHR         DX,1                                    
ram:f000:ae80   d1ea            SHR         DX,1                                    
ram:f000:ae82   86d4            XCHG        AH,DL                                   
ram:f000:ae84   86f2            XCHG        DL,DH                                   
ram:f000:ae86   8946f4          MOV         word ptr [BP + -0xc],AX                 
ram:f000:ae89   8956f6          MOV         word ptr [BP + -0xa],DX                 
ram:f000:ae8c   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:ae8f   8b04            MOV         AX,word ptr [SI]                        
ram:f000:ae91   8bf8            MOV         DI,AX                                   
ram:f000:ae93   b80000          MOV         AX,0x0                                  
ram:f000:ae96   50              PUSH        AX                                      
ram:f000:ae97   57              PUSH        DI                                      
ram:f000:ae98   ff76f6          PUSH        word ptr [BP + -0xa]                    
ram:f000:ae9b   ff76f4          PUSH        word ptr [BP + -0xc]                    
ram:f000:ae9e   ff76fa          PUSH        word ptr [BP + -0x6]                    
ram:f000:aea1   ff76f8          PUSH        word ptr [BP + -0x8]                    
ram:f000:aea4   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:aea9   83c40c          ADD         SP,0xc                                  
ram:f000:aeac   b8101f          MOV         AX,0x1f10                               
ram:f000:aeaf   8ed8            MOV         DS,AX                                   
ram:f000:aeb1   ff36bc00        PUSH        word ptr [offset DAT_1000_f1bc &0xff]   
ram:f000:aeb5   ff36ba00        PUSH        word ptr [offset DAT_1000_f1ba &0xff]   
ram:f000:aeb9   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:aebe   83c404          ADD         SP,0x4                                  
ram:f000:aec1   b9101f          MOV         CX,0x1f10                               
ram:f000:aec4   8ed9            MOV         DS,CX                                   
ram:f000:aec6   a3ba00          MOV         [offset DAT_1000_f1ba &0xff],AX         
ram:f000:aec9   8916bc00        MOV         word ptr [offset DAT_1000_f1bc &0xff],DX
ram:f000:aecd   b8101f          MOV         AX,0x1f10                               
ram:f000:aed0   8ed8            MOV         DS,AX                                   
ram:f000:aed2   ff36c000        PUSH        word ptr [offset DAT_1000_f1c0 &0xff]   
ram:f000:aed6   ff36be00        PUSH        word ptr [offset DAT_1000_f1be &0xff]   
ram:f000:aeda   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:aedf   83c404          ADD         SP,0x4                                  
ram:f000:aee2   b9101f          MOV         CX,0x1f10                               
ram:f000:aee5   8ed9            MOV         DS,CX                                   
ram:f000:aee7   a3be00          MOV         [offset DAT_1000_f1be &0xff],AX         
ram:f000:aeea   8916c000        MOV         word ptr [offset DAT_1000_f1c0 &0xff],DX
ram:f000:aeee   b8101f          MOV         AX,0x1f10                               
ram:f000:aef1   8ed8            MOV         DS,AX                                   
ram:f000:aef3   ff36c400        PUSH        word ptr [offset SCSI_CMD_SRC_ARGS &0...
ram:f000:aef7   ff36c200        PUSH        word ptr [offset DAT_1000_f1c2 &0xff]   
ram:f000:aefb   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:af00   83c404          ADD         SP,0x4                                  
ram:f000:af03   b9101f          MOV         CX,0x1f10                               
ram:f000:af06   8ed9            MOV         DS,CX                                   
ram:f000:af08   a3c200          MOV         [offset DAT_1000_f1c2 &0xff],AX         
ram:f000:af0b   8916c400        MOV         word ptr [offset...,DX                  
ram:f000:af0f   b8101f          MOV         AX,0x1f10                               
ram:f000:af12   8ed8            MOV         DS,AX                                   
ram:f000:af14   ff36c800        PUSH        word ptr [offset SCSI_CMD_DST_PTR_LO ...
ram:f000:af18   ff36c600        PUSH        word ptr [offset SCSI_CMD_DST_PTR_HI ...
ram:f000:af1c   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:af21   83c404          ADD         SP,0x4                                  
ram:f000:af24   b9101f          MOV         CX,0x1f10                               
ram:f000:af27   8ed9            MOV         DS,CX                                   
ram:f000:af29   a3c600          MOV         [offset SCSI_CMD_DST_PTR_HI &0xff],AX   
ram:f000:af2c   8916c800        MOV         word ptr [offset...,DX                  
ram:f000:af30   b8101f          MOV         AX,0x1f10                               
ram:f000:af33   8ed8            MOV         DS,AX                                   
ram:f000:af35   ff36cc00        PUSH        word ptr [offset SCSI_CMD_DST_BYTECNT...
ram:f000:af39   ff36ca00        PUSH        word ptr [offset SCSI_CMD_DST_BYTECNT...
ram:f000:af3d   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:af42   83c404          ADD         SP,0x4                                  
ram:f000:af45   b9101f          MOV         CX,0x1f10                               
ram:f000:af48   8ed9            MOV         DS,CX                                   
ram:f000:af4a   a3ca00          MOV         [offset SCSI_CMD...,AX                  
ram:f000:af4d   8916cc00        MOV         word ptr [offset...,DX                  
ram:f000:af51   b8101f          MOV         AX,0x1f10                               
ram:f000:af54   8ed8            MOV         DS,AX                                   
ram:f000:af56   ff36d400        PUSH        word ptr [offset DAT_1000_f1d4 &0xff]   
ram:f000:af5a   ff36d200        PUSH        word ptr [offset DAT_1000_f1d2 &0xff]   
ram:f000:af5e   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:af63   83c404          ADD         SP,0x4                                  
ram:f000:af66   b9101f          MOV         CX,0x1f10                               
ram:f000:af69   8ed9            MOV         DS,CX                                   
ram:f000:af6b   a3d200          MOV         [offset DAT_1000_f1d2 &0xff],AX         
ram:f000:af6e   8916d400        MOV         word ptr [offset DAT_1000_f1d4 &0xff],DX
ram:f000:af72   b8101f          MOV         AX,0x1f10                               
ram:f000:af75   8ed8            MOV         DS,AX                                   
ram:f000:af77   a1ba00          MOV         AX,[offset DAT_1000_f1ba &0xff]         
ram:f000:af7a   8b16bc00        MOV         DX,word ptr [offset DAT_1000_f1bc &0xff]
ram:f000:af7e   8946f8          MOV         word ptr [BP + -0x8],AX                 
ram:f000:af81   8956fa          MOV         word ptr [BP + -0x6],DX                 
ram:f000:af84   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:af87   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:af8a   d1ea            SHR         DX,1                                    
ram:f000:af8c   d1ea            SHR         DX,1                                    
ram:f000:af8e   d1ea            SHR         DX,1                                    
ram:f000:af90   d1ea            SHR         DX,1                                    
ram:f000:af92   86d4            XCHG        AH,DL                                   
ram:f000:af94   86f2            XCHG        DL,DH                                   
ram:f000:af96   8946f4          MOV         word ptr [BP + -0xc],AX                 
ram:f000:af99   8956f6          MOV         word ptr [BP + -0xa],DX                 
ram:f000:af9c   b8101f          MOV         AX,0x1f10                               
ram:f000:af9f   8ed8            MOV         DS,AX                                   
ram:f000:afa1   a1be00          MOV         AX,[offset DAT_1000_f1be &0xff]         
ram:f000:afa4   8b16c000        MOV         DX,word ptr [offset DAT_1000_f1c0 &0xff]
ram:f000:afa8   8bf8            MOV         DI,AX                                   
ram:f000:afaa   b80000          MOV         AX,0x0                                  
ram:f000:afad   50              PUSH        AX                                      
ram:f000:afae   57              PUSH        DI                                      
ram:f000:afaf   ff76f6          PUSH        word ptr [BP + -0xa]                    
ram:f000:afb2   ff76f4          PUSH        word ptr [BP + -0xc]                    
ram:f000:afb5   ff76fa          PUSH        word ptr [BP + -0x6]                    
ram:f000:afb8   ff76f8          PUSH        word ptr [BP + -0x8]                    
                            ;Read the job request out of the source pointer
                            ;and store it in SCSI_CMD_PTR structure
ram:f000:afbb   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:afc0   83c40c          ADD         SP,0xc                                  
ram:f000:afc3   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined FUN_f000_afc8()
                                                          ;XREF[3,0]:   f000:9d2a,f000:b1a5,f000:d00c
ram:f000:afc8   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:afcd   81ec0800        SUB         SP,0x8                                  
ram:f000:afd1   b80000          MOV         AX,0x0                                  
ram:f000:afd4   50              PUSH        AX                                      
ram:f000:afd5   b80800          MOV         AX,0x8                                  
ram:f000:afd8   50              PUSH        AX                                      
ram:f000:afd9   ff7618          PUSH        word ptr [BP + 0x18]                    
ram:f000:afdc   ff7616          PUSH        word ptr [BP + 0x16]                    
ram:f000:afdf   9aff00c0fd      CALLF       FUN_f000_dcff                           ;uint FUN_f000_dcff(uint param_1, uin...
ram:f000:afe4   83c408          ADD         SP,0x8                                  
ram:f000:afe7   b90300          MOV         CX,0x3                                  
ram:f000:afea   e306            JCXZ        LAB_f000_aff2                           
                            LAB_f000_afec:                ;XREF[1,0]:   f000:aff0
ram:f000:afec   d1e0            SHL         AX,1                                    
ram:f000:afee   d1d2            RCL         DX,1                                    
ram:f000:aff0   e2fa            LOOP        LAB_f000_afec                           
                            LAB_f000_aff2:                ;XREF[1,0]:   f000:afea
ram:f000:aff2   8986f8ff        MOV         word ptr [BP + 0xfff8],AX               
ram:f000:aff6   8996faff        MOV         word ptr [BP + 0xfffa],DX               
ram:f000:affa   8b4612          MOV         AX,word ptr [BP + 0x12]                 
ram:f000:affd   8b5614          MOV         DX,word ptr [BP + 0x14]                 
ram:f000:b000   0286f8ff        ADD         AL,byte ptr [BP + 0xfff8]               
ram:f000:b004   7303            JNC         LAB_f000_b009                           
ram:f000:b006   83c210          ADD         DX,0x10                                 
                            LAB_f000_b009:                ;XREF[1,0]:   f000:b004
ram:f000:b009   8a8ef9ff        MOV         CL,byte ptr [BP + 0xfff9]               
ram:f000:b00d   8aaefaff        MOV         CH,byte ptr [BP + 0xfffa]               
ram:f000:b011   d1e1            SHL         CX,1                                    
ram:f000:b013   d1e1            SHL         CX,1                                    
ram:f000:b015   d1e1            SHL         CX,1                                    
ram:f000:b017   d1e1            SHL         CX,1                                    
ram:f000:b019   03d1            ADD         DX,CX                                   
ram:f000:b01b   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:b01e   8956fe          MOV         word ptr [BP + -0x2],DX                 
ram:f000:b021   b80000          MOV         AX,0x0                                  
ram:f000:b024   50              PUSH        AX                                      
ram:f000:b025   ff7616          PUSH        word ptr [BP + 0x16]                    
ram:f000:b028   8b4612          MOV         AX,word ptr [BP + 0x12]                 
ram:f000:b02b   8b5614          MOV         DX,word ptr [BP + 0x14]                 
ram:f000:b02e   d1ea            SHR         DX,1                                    
ram:f000:b030   d1ea            SHR         DX,1                                    
ram:f000:b032   d1ea            SHR         DX,1                                    
ram:f000:b034   d1ea            SHR         DX,1                                    
ram:f000:b036   86d4            XCHG        AH,DL                                   
ram:f000:b038   86f2            XCHG        DL,DH                                   
ram:f000:b03a   52              PUSH        DX                                      
ram:f000:b03b   50              PUSH        AX                                      
ram:f000:b03c   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:b03f   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:b042   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:b047   83c40c          ADD         SP,0xc                                  
                            LAB_f000_b04a:                ;XREF[2,0]:   f000:b092,f000:b099
ram:f000:b04a   c57612          LDS         SI,[BP + 0x12]                          
ram:f000:b04d   ff7402          PUSH        word ptr [SI + 0x2]                     
ram:f000:b050   ff34            PUSH        word ptr [SI]                           
ram:f000:b052   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:b057   83c404          ADD         SP,0x4                                  
ram:f000:b05a   c57612          LDS         SI,[BP + 0x12]                          
ram:f000:b05d   8904            MOV         word ptr [SI],AX                        
ram:f000:b05f   895402          MOV         word ptr [SI + 0x2],DX                  
ram:f000:b062   c57612          LDS         SI,[BP + 0x12]                          
ram:f000:b065   ff7406          PUSH        word ptr [SI + 0x6]                     
ram:f000:b068   ff7404          PUSH        word ptr [SI + 0x4]                     
ram:f000:b06b   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:b070   83c404          ADD         SP,0x4                                  
ram:f000:b073   c57612          LDS         SI,[BP + 0x12]                          
ram:f000:b076   894404          MOV         word ptr [SI + 0x4],AX                  
ram:f000:b079   895406          MOV         word ptr [SI + 0x6],DX                  
ram:f000:b07c   8b4612          MOV         AX,word ptr [BP + 0x12]                 
ram:f000:b07f   8b5614          MOV         DX,word ptr [BP + 0x14]                 
ram:f000:b082   0408            ADD         AL,0x8                                  
ram:f000:b084   7303            JNC         LAB_f000_b089                           
ram:f000:b086   83c210          ADD         DX,0x10                                 
                            LAB_f000_b089:                ;XREF[1,0]:   f000:b084
ram:f000:b089   894612          MOV         word ptr [BP + 0x12],AX                 
ram:f000:b08c   895614          MOV         word ptr [BP + 0x14],DX                 
ram:f000:b08f   3b56fe          CMP         DX,word ptr [BP + -0x2]                 
ram:f000:b092   72b6            JC          LAB_f000_b04a                           
ram:f000:b094   7705            JA          LAB_f000_b09b                           
ram:f000:b096   3b46fc          CMP         AX,word ptr [BP + -0x4]                 
ram:f000:b099   72af            JC          LAB_f000_b04a                           
                            LAB_f000_b09b:                ;XREF[1,0]:   f000:b094
ram:f000:b09b   c57612          LDS         SI,[BP + 0x12]                          
ram:f000:b09e   c7040000        MOV         word ptr [SI],0x0                       
ram:f000:b0a2   c744020000      MOV         word ptr [SI + 0x2],0x0                 
ram:f000:b0a7   c57612          LDS         SI,[BP + 0x12]                          
ram:f000:b0aa   c744040000      MOV         word ptr [SI + 0x4],0x0                 
ram:f000:b0af   c744060000      MOV         word ptr [SI + 0x6],0x0                 
ram:f000:b0b4   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 scsi_control(void)
                                                          ;XREF[1,0]:   f000:8983
ram:f000:b0b9   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:b0be   81ec1000        SUB         SP,0x10                                 
ram:f000:b0c2   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:b0c5   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:b0c8   9a4300e0fa      CALLF       scsi_control_fetch_job                  ;void scsi_control_fetch_job(void)
ram:f000:b0cd   83c404          ADD         SP,0x4                                  
ram:f000:b0d0   b8101f          MOV         AX,0x1f10                               
ram:f000:b0d3   8ed8            MOV         DS,AX                                   
ram:f000:b0d5   a1c600          MOV         AX,[offset SCSI_CMD_DST_PTR_HI &0xff]   
ram:f000:b0d8   8b16c800        MOV         DX,word ptr [offset SCSI_CMD_DST_PTR_...
ram:f000:b0dc   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:b0df   8956fe          MOV         word ptr [BP + -0x2],DX                 
ram:f000:b0e2   b8101f          MOV         AX,0x1f10                               
ram:f000:b0e5   8ed8            MOV         DS,AX                                   
ram:f000:b0e7   a1ca00          MOV         AX,[offset SCSI_CMD_DST_BYTECNT_HI &0...
ram:f000:b0ea   8b16cc00        MOV         DX,word ptr [offset SCSI_CMD_DST_BYTE...
ram:f000:b0ee   8946f8          MOV         word ptr [BP + -0x8],AX                 
ram:f000:b0f1   8956fa          MOV         word ptr [BP + -0x6],DX                 
ram:f000:b0f4   be101f          MOV         SI,0x1f10                               
ram:f000:b0f7   8ede            MOV         DS,SI                                   
ram:f000:b0f9   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:b0fd   c744260000      MOV         word ptr [SI + 0x26],0x0                
ram:f000:b102   c744280000      MOV         word ptr [SI + 0x28],0x0                
ram:f000:b107   be101f          MOV         SI,0x1f10                               
ram:f000:b10a   8ede            MOV         DS,SI                                   
ram:f000:b10c   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:b110   8b46f8          MOV         AX,word ptr [BP + -0x8]                 
ram:f000:b113   8b56fa          MOV         DX,word ptr [BP + -0x6]                 
ram:f000:b116   894422          MOV         word ptr [SI + 0x22],AX                 
ram:f000:b119   895424          MOV         word ptr [SI + 0x24],DX                 
ram:f000:b11c   be101f          MOV         SI,0x1f10                               
ram:f000:b11f   8ede            MOV         DS,SI                                   
ram:f000:b121   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:b125   c7040000        MOV         word ptr [SI],0x0                       
ram:f000:b129   b8101f          MOV         AX,0x1f10                               
ram:f000:b12c   8ed8            MOV         DS,AX                                   
ram:f000:b12e   a1be00          MOV         AX,[offset DAT_1000_f1be &0xff]         
ram:f000:b131   8b16c000        MOV         DX,word ptr [offset DAT_1000_f1c0 &0xff]
ram:f000:b135   be101f          MOV         SI,0x1f10                               
ram:f000:b138   8ede            MOV         DS,SI                                   
ram:f000:b13a   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:b13e   894416          MOV         word ptr [SI + 0x16],AX                 
ram:f000:b141   895418          MOV         word ptr [SI + 0x18],DX                 
ram:f000:b144   b8101f          MOV         AX,0x1f10                               
ram:f000:b147   8ed8            MOV         DS,AX                                   
ram:f000:b149   f706c400ffff    TEST        word ptr [offset...,0xffff              
ram:f000:b14f   7d03            JGE         LAB_f000_b154                           
ram:f000:b151   e9c600          JMP         LAB_f000_b21a                           
                            LAB_f000_b154:                ;XREF[1,0]:   f000:b14f
ram:f000:b154   7f0b            JG          LAB_f000_b161                           
ram:f000:b156   f706c200ffff    TEST        word ptr [offset...,0xffff              
ram:f000:b15c   7703            JA          LAB_f000_b161                           
ram:f000:b15e   e9b900          JMP         LAB_f000_b21a                           
                            LAB_f000_b161:                ;XREF[2,0]:   f000:b154,f000:b15c
ram:f000:b161   b8101f          MOV         AX,0x1f10                               
ram:f000:b164   8ed8            MOV         DS,AX                                   
ram:f000:b166   833ec40000      CMP         word ptr [offset...,0x0                 
ram:f000:b16b   7c10            JL          LAB_f000_b17d                           
ram:f000:b16d   7f08            JG          LAB_f000_b177                           
ram:f000:b16f   813ec2000001    CMP         word ptr [offset...,0x100               
ram:f000:b175   7606            JBE         LAB_f000_b17d                           
                            LAB_f000_b177:                ;XREF[1,0]:   f000:b16d
ram:f000:b177   b8bd00          MOV         AX,0xbd                                 
ram:f000:b17a   e90002          JMP         LAB_f000_b37d                           
                            LAB_f000_b17d:                ;XREF[2,0]:   f000:b16b,f000:b175
ram:f000:b17d   b8101f          MOV         AX,0x1f10                               
ram:f000:b180   8ed8            MOV         DS,AX                                   
ram:f000:b182   ff36c400        PUSH        word ptr [offset SCSI_CMD_SRC_ARGS &0...
ram:f000:b186   ff36c200        PUSH        word ptr [offset DAT_1000_f1c2 &0xff]   
ram:f000:b18a   b8101f          MOV         AX,0x1f10                               
ram:f000:b18d   8ed8            MOV         DS,AX                                   
ram:f000:b18f   a1b400          MOV         AX,[offset SCSI_CMD_PTR &0xff]          
ram:f000:b192   8b16b600        MOV         DX,word ptr [offset SCSI_CMD_PTR_SEG ...
ram:f000:b196   0436            ADD         AL,0x36                                 
ram:f000:b198   7303            JNC         LAB_f000_b19d                           
ram:f000:b19a   83c210          ADD         DX,0x10                                 
                            LAB_f000_b19d:                ;XREF[1,0]:   f000:b198
ram:f000:b19d   52              PUSH        DX                                      
ram:f000:b19e   50              PUSH        AX                                      
ram:f000:b19f   ff76fe          PUSH        word ptr [BP + -0x2]                    
ram:f000:b1a2   ff76fc          PUSH        word ptr [BP + -0x4]                    
ram:f000:b1a5   9ac800f0fa      CALLF       FUN_f000_afc8                           ;undefined FUN_f000_afc8()
ram:f000:b1aa   83c40c          ADD         SP,0xc                                  
ram:f000:b1ad   be101f          MOV         SI,0x1f10                               
ram:f000:b1b0   8ede            MOV         DS,SI                                   
ram:f000:b1b2   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:b1b6   8b4436          MOV         AX,word ptr [SI + 0x36]                 
ram:f000:b1b9   8b5438          MOV         DX,word ptr [SI + 0x38]                 
ram:f000:b1bc   be101f          MOV         SI,0x1f10                               
ram:f000:b1bf   8ede            MOV         DS,SI                                   
ram:f000:b1c1   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:b1c5   89441a          MOV         word ptr [SI + 0x1a],AX                 
ram:f000:b1c8   89541c          MOV         word ptr [SI + 0x1c],DX                 
ram:f000:b1cb   be101f          MOV         SI,0x1f10                               
ram:f000:b1ce   8ede            MOV         DS,SI                                   
ram:f000:b1d0   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:b1d4   8b443a          MOV         AX,word ptr [SI + 0x3a]                 
ram:f000:b1d7   8b543c          MOV         DX,word ptr [SI + 0x3c]                 
ram:f000:b1da   be101f          MOV         SI,0x1f10                               
ram:f000:b1dd   8ede            MOV         DS,SI                                   
ram:f000:b1df   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:b1e3   89441e          MOV         word ptr [SI + 0x1e],AX                 
ram:f000:b1e6   895420          MOV         word ptr [SI + 0x20],DX                 
ram:f000:b1e9   b8101f          MOV         AX,0x1f10                               
ram:f000:b1ec   8ed8            MOV         DS,AX                                   
ram:f000:b1ee   a1b400          MOV         AX,[offset SCSI_CMD_PTR &0xff]          
ram:f000:b1f1   8b16b600        MOV         DX,word ptr [offset SCSI_CMD_PTR_SEG ...
ram:f000:b1f5   043e            ADD         AL,0x3e                                 
ram:f000:b1f7   7303            JNC         LAB_f000_b1fc                           
ram:f000:b1f9   83c210          ADD         DX,0x10                                 
                            LAB_f000_b1fc:                ;XREF[1,0]:   f000:b1f7
ram:f000:b1fc   be101f          MOV         SI,0x1f10                               
ram:f000:b1ff   8ede            MOV         DS,SI                                   
ram:f000:b201   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:b205   894432          MOV         word ptr [SI + 0x32],AX                 
ram:f000:b208   895434          MOV         word ptr [SI + 0x34],DX                 
ram:f000:b20b   be101f          MOV         SI,0x1f10                               
ram:f000:b20e   8ede            MOV         DS,SI                                   
ram:f000:b210   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:b214   810c0004        OR          word ptr [SI],0x400                     
ram:f000:b218   eb2a            JMP         LAB_f000_b244                           
                            LAB_f000_b21a:                ;XREF[2,0]:   f000:b151,f000:b15e
ram:f000:b21a   be101f          MOV         SI,0x1f10                               
ram:f000:b21d   8ede            MOV         DS,SI                                   
ram:f000:b21f   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:b223   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:b226   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:b229   89441a          MOV         word ptr [SI + 0x1a],AX                 
ram:f000:b22c   89541c          MOV         word ptr [SI + 0x1c],DX                 
ram:f000:b22f   be101f          MOV         SI,0x1f10                               
ram:f000:b232   8ede            MOV         DS,SI                                   
ram:f000:b234   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:b238   8b46f8          MOV         AX,word ptr [BP + -0x8]                 
ram:f000:b23b   8b56fa          MOV         DX,word ptr [BP + -0x6]                 
ram:f000:b23e   89441e          MOV         word ptr [SI + 0x1e],AX                 
ram:f000:b241   895420          MOV         word ptr [SI + 0x20],DX                 
                            LAB_f000_b244:                ;XREF[1,0]:   f000:b218
ram:f000:b244   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:b247   8b4402          MOV         AX,word ptr [SI + 0x2]                  
ram:f000:b24a   253f00          AND         AX,0x3f                                 
ram:f000:b24d   253800          AND         AX,0x38                                 
ram:f000:b250   b90300          MOV         CX,0x3                                  
ram:f000:b253   d3e8            SHR         AX,CL                                   
ram:f000:b255   250700          AND         AX,0x7                                  
ram:f000:b258   be101f          MOV         SI,0x1f10                               
ram:f000:b25b   8ede            MOV         DS,SI                                   
ram:f000:b25d   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:b261   884404          MOV         byte ptr [SI + 0x4],AL                  
ram:f000:b264   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:b267   8b4402          MOV         AX,word ptr [SI + 0x2]                  
ram:f000:b26a   253f00          AND         AX,0x3f                                 
ram:f000:b26d   250700          AND         AX,0x7                                  
ram:f000:b270   be101f          MOV         SI,0x1f10                               
ram:f000:b273   8ede            MOV         DS,SI                                   
ram:f000:b275   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:b279   884405          MOV         byte ptr [SI + 0x5],AL                  
ram:f000:b27c   9ab400d0f9      CALLF       scsi_select_with_attn                   ;void scsi_select_with_attn(void)
ram:f000:b281   b8101f          MOV         AX,0x1f10                               
ram:f000:b284   8ed8            MOV         DS,AX                                   
ram:f000:b286   ff36d400        PUSH        word ptr [offset DAT_1000_f1d4 &0xff]   
ram:f000:b28a   ff36d200        PUSH        word ptr [offset DAT_1000_f1d2 &0xff]   
ram:f000:b28e   9a1900e0f9      CALLF       FUN_f000_9e19                           ;undefined2 FUN_f000_9e19(void)
ram:f000:b293   83c404          ADD         SP,0x4                                  
ram:f000:b296   e9c100          JMP         LAB_f000_b35a                           
                            LAB_f000_b299:                ;XREF[1,0]:   f000:b377
ram:f000:b299   b80000          MOV         AX,0x0                                  
ram:f000:b29c   e9de00          JMP         LAB_f000_b37d                           
                            LAB_f000_b29f:                ;XREF[1,0]:   f000:b36f
ram:f000:b29f   b86500          MOV         AX,0x65                                 
ram:f000:b2a2   e9d800          JMP         LAB_f000_b37d                           
                            LAB_f000_b2a5:                ;XREF[1,0]:   f000:b367
ram:f000:b2a5   fa              CLI                                                  
ram:f000:b2a6   9a350050fa      CALLF       scsi_reset_bus                          ;void scsi_reset_bus(void)
ram:f000:b2ab   fb              STI                                                  
                            LAB_f000_b2ac:                ;XREF[1,0]:   f000:b2c6
ram:f000:b2ac   b8f01f          MOV         AX,0x1ff0                               
ram:f000:b2af   8ed8            MOV         DS,AX                                   
ram:f000:b2b1   f706f000ffff    TEST        word ptr [offset...,0xffff              
ram:f000:b2b7   750d            JNZ         LAB_f000_b2c6                           
ram:f000:b2b9   b8f01f          MOV         AX,0x1ff0                               
ram:f000:b2bc   8ed8            MOV         DS,AX                                   
ram:f000:b2be   810ef4000100    OR          word ptr [offset...,0x1                 
ram:f000:b2c4   eb02            JMP         LAB_f000_b2c8                           
                            LAB_f000_b2c6:                ;XREF[1,0]:   f000:b2b7
ram:f000:b2c6   ebe4            JMP         LAB_f000_b2ac                           
                            LAB_f000_b2c8:                ;XREF[1,0]:   f000:b2c4
ram:f000:b2c8   b86300          MOV         AX,0x63                                 
ram:f000:b2cb   e9af00          JMP         LAB_f000_b37d                           
                            LAB_f000_b2ce:                ;XREF[2,0]:   f000:b35f,f000:b37a
ram:f000:b2ce   c746f00000      MOV         word ptr [BP + -0x10],0x0               
ram:f000:b2d3   c746f20000      MOV         word ptr [BP + -0xe],0x0                
ram:f000:b2d8   8b46f0          MOV         AX,word ptr [BP + -0x10]                
ram:f000:b2db   8b56f2          MOV         DX,word ptr [BP + -0xe]                 
ram:f000:b2de   8af2            MOV         DH,DL                                   
ram:f000:b2e0   8ad4            MOV         DL,AH                                   
ram:f000:b2e2   30e4            XOR         AH,AH                                   
ram:f000:b2e4   d1e2            SHL         DX,1                                    
ram:f000:b2e6   d1e2            SHL         DX,1                                    
ram:f000:b2e8   d1e2            SHL         DX,1                                    
ram:f000:b2ea   d1e2            SHL         DX,1                                    
ram:f000:b2ec   0414            ADD         AL,0x14                                 
ram:f000:b2ee   7303            JNC         LAB_f000_b2f3                           
ram:f000:b2f0   83c210          ADD         DX,0x10                                 
                            LAB_f000_b2f3:                ;XREF[1,0]:   f000:b2ee
ram:f000:b2f3   d1ea            SHR         DX,1                                    
ram:f000:b2f5   d1ea            SHR         DX,1                                    
ram:f000:b2f7   d1ea            SHR         DX,1                                    
ram:f000:b2f9   d1ea            SHR         DX,1                                    
ram:f000:b2fb   86d4            XCHG        AH,DL                                   
ram:f000:b2fd   86f2            XCHG        DL,DH                                   
ram:f000:b2ff   8946f0          MOV         word ptr [BP + -0x10],AX                
ram:f000:b302   8956f2          MOV         word ptr [BP + -0xe],DX                 
ram:f000:b305   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:b308   8b4404          MOV         AX,word ptr [SI + 0x4]                  
ram:f000:b30b   8b5406          MOV         DX,word ptr [SI + 0x6]                  
ram:f000:b30e   0146f0          ADD         word ptr [BP + -0x10],AX                
ram:f000:b311   1156f2          ADC         word ptr [BP + -0xe],DX                 
ram:f000:b314   b8101f          MOV         AX,0x1f10                               
ram:f000:b317   8ed8            MOV         DS,AX                                   
ram:f000:b319   a1b400          MOV         AX,[offset SCSI_CMD_PTR &0xff]          
ram:f000:b31c   8b16b600        MOV         DX,word ptr [offset SCSI_CMD_PTR_SEG ...
ram:f000:b320   0402            ADD         AL,0x2                                  
ram:f000:b322   7303            JNC         LAB_f000_b327                           
ram:f000:b324   83c210          ADD         DX,0x10                                 
                            LAB_f000_b327:                ;XREF[1,0]:   f000:b322
ram:f000:b327   d1ea            SHR         DX,1                                    
ram:f000:b329   d1ea            SHR         DX,1                                    
ram:f000:b32b   d1ea            SHR         DX,1                                    
ram:f000:b32d   d1ea            SHR         DX,1                                    
ram:f000:b32f   86d4            XCHG        AH,DL                                   
ram:f000:b331   86f2            XCHG        DL,DH                                   
ram:f000:b333   8946f4          MOV         word ptr [BP + -0xc],AX                 
ram:f000:b336   8956f6          MOV         word ptr [BP + -0xa],DX                 
ram:f000:b339   b80100          MOV         AX,0x1                                  
ram:f000:b33c   50              PUSH        AX                                      
ram:f000:b33d   b80100          MOV         AX,0x1                                  
ram:f000:b340   50              PUSH        AX                                      
ram:f000:b341   ff76f2          PUSH        word ptr [BP + -0xe]                    
ram:f000:b344   ff76f0          PUSH        word ptr [BP + -0x10]                   
ram:f000:b347   ff76f6          PUSH        word ptr [BP + -0xa]                    
ram:f000:b34a   ff76f4          PUSH        word ptr [BP + -0xc]                    
ram:f000:b34d   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:b352   83c40c          ADD         SP,0xc                                  
ram:f000:b355   b86000          MOV         AX,0x60                                 
ram:f000:b358   eb23            JMP         LAB_f000_b37d                           
                            LAB_f000_b35a:                ;XREF[1,0]:   f000:b296
ram:f000:b35a   3dfdff          CMP         AX,0xfffd                               
ram:f000:b35d   7503            JNZ         LAB_f000_b362                           
ram:f000:b35f   e96cff          JMP         LAB_f000_b2ce                           
                            LAB_f000_b362:                ;XREF[1,0]:   f000:b35d
ram:f000:b362   3dfeff          CMP         AX,0xfffe                               
ram:f000:b365   7503            JNZ         LAB_f000_b36a                           
ram:f000:b367   e93bff          JMP         LAB_f000_b2a5                           
                            LAB_f000_b36a:                ;XREF[1,0]:   f000:b365
ram:f000:b36a   3dffff          CMP         AX,0xffff                               
ram:f000:b36d   7503            JNZ         LAB_f000_b372                           
ram:f000:b36f   e92dff          JMP         LAB_f000_b29f                           
                            LAB_f000_b372:                ;XREF[1,0]:   f000:b36d
ram:f000:b372   3d0000          CMP         AX,0x0                                  
ram:f000:b375   7503            JNZ         LAB_f000_b37a                           
ram:f000:b377   e91fff          JMP         LAB_f000_b299                           
                            LAB_f000_b37a:                ;XREF[1,0]:   f000:b375
ram:f000:b37a   e951ff          JMP         LAB_f000_b2ce                           
                            LAB_f000_b37d:                ;XREF[5,0]:   f000:b17a,f000:b29c,f000:b2a2,f000:b2cb
                                                          ;             f000:b358
ram:f000:b37d   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 scsi_extended_dsd(void)
                                                          ;XREF[1,0]:   f000:89b3
ram:f000:b382   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:b387   81ec1000        SUB         SP,0x10                                 
ram:f000:b38b   c746fc0000      MOV         word ptr [BP + -0x4],0x0                
ram:f000:b390   c746fee01f      MOV         word ptr [BP + -0x2],0x1fe0             
ram:f000:b395   c576fc          LDS         SI,[BP + -0x4]                          
ram:f000:b398   817c020d50      CMP         word ptr [SI + 0x2],0x500d              
ram:f000:b39d   7506            JNZ         enumerate_scsi_bus                      
ram:f000:b39f   813c0d50        CMP         word ptr [SI],0x500d                    
ram:f000:b3a3   740c            JZ          LAB_f000_b3b1                           
                            ;If we haven't yet enumerated the SCSI bus, do so now.
                            enumerate_scsi_bus:           ;XREF[1,0]:   f000:b39d
ram:f000:b3a5   b80000          MOV         AX,0x0                                  
ram:f000:b3a8   50              PUSH        AX                                      
ram:f000:b3a9   9aea0060fa      CALLF       enumerate_scsi_bus                      ;void enumerate_scsi_bus(void)
ram:f000:b3ae   83c402          ADD         SP,0x2                                  
                            LAB_f000_b3b1:                ;XREF[1,0]:   f000:b3a3
ram:f000:b3b1   b800c0          MOV         AX,0xc000                               
ram:f000:b3b4   8ed8            MOV         DS,AX                                   
ram:f000:b3b6   a00b00          MOV         AL,[SCSI_ID_REG]                        
ram:f000:b3b9   30e4            XOR         AH,AH                                   
ram:f000:b3bb   8846fb          MOV         byte ptr [BP + -0x5],AL                 
ram:f000:b3be   31ff            XOR         DI,DI                                   
                            ;This loop will loop from target 0 to target 7
                            scan_next_target:             ;XREF[1,0]:   f000:b464
ram:f000:b3c0   83ff08          CMP         DI,0x8                                  
ram:f000:b3c3   7c03            JL          do_next_target                          
ram:f000:b3c5   e99f00          JMP         scan_done                               
                            do_next_target:               ;XREF[1,0]:   f000:b3c3
ram:f000:b3c8   c643f300        MOV         byte ptr [BP + DI + -0xd],0x0           
ram:f000:b3cc   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:b3cf   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:b3d2   0404            ADD         AL,0x4                                  
ram:f000:b3d4   7303            JNC         LAB_f000_b3d9                           
ram:f000:b3d6   83c210          ADD         DX,0x10                                 
                            LAB_f000_b3d9:                ;XREF[1,0]:   f000:b3d4
ram:f000:b3d9   8bcf            MOV         CX,DI                                   
ram:f000:b3db   02c1            ADD         AL,CL                                   
ram:f000:b3dd   7303            JNC         LAB_f000_b3e2                           
ram:f000:b3df   83c210          ADD         DX,0x10                                 
                            LAB_f000_b3e2:                ;XREF[1,0]:   f000:b3dd
ram:f000:b3e2   30c9            XOR         CL,CL                                   
ram:f000:b3e4   d1f9            SAR         CX,1                                    
ram:f000:b3e6   d1f9            SAR         CX,1                                    
ram:f000:b3e8   d1f9            SAR         CX,1                                    
ram:f000:b3ea   d1f9            SAR         CX,1                                    
ram:f000:b3ec   03d1            ADD         DX,CX                                   
ram:f000:b3ee   8bf0            MOV         SI,AX                                   
ram:f000:b3f0   8eda            MOV         DS,DX                                   
ram:f000:b3f2   803c01          CMP         byte ptr [SI],0x1                       
ram:f000:b3f5   756c            JNZ         done_scanning_luns                      
ram:f000:b3f7   c746f00000      MOV         word ptr [BP + -0x10],0x0               
                            scan_next_lun:                ;XREF[1,0]:   f000:b461
ram:f000:b3fc   837ef008        CMP         word ptr [BP + -0x10],0x8               
ram:f000:b400   7d61            JGE         done_scanning_luns                      
                            ;I believe this loop builds info for each lun
                            ;on each target.
ram:f000:b402   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:b405   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:b408   040c            ADD         AL,0xc                                  
ram:f000:b40a   7303            JNC         LAB_f000_b40f                           
ram:f000:b40c   83c210          ADD         DX,0x10                                 
                            LAB_f000_b40f:                ;XREF[1,0]:   f000:b40a
ram:f000:b40f   8bcf            MOV         CX,DI                                   
ram:f000:b411   be0300          MOV         SI,0x3                                  
ram:f000:b414   87ce            XCHG        SI,CX                                   
ram:f000:b416   d3e6            SHL         SI,CL                                   
ram:f000:b418   87ce            XCHG        SI,CX                                   
ram:f000:b41a   02c1            ADD         AL,CL                                   
ram:f000:b41c   7303            JNC         LAB_f000_b421                           
ram:f000:b41e   83c210          ADD         DX,0x10                                 
                            LAB_f000_b421:                ;XREF[1,0]:   f000:b41c
ram:f000:b421   30c9            XOR         CL,CL                                   
ram:f000:b423   d1f9            SAR         CX,1                                    
ram:f000:b425   d1f9            SAR         CX,1                                    
ram:f000:b427   d1f9            SAR         CX,1                                    
ram:f000:b429   d1f9            SAR         CX,1                                    
ram:f000:b42b   03d1            ADD         DX,CX                                   
ram:f000:b42d   8b4ef0          MOV         CX,word ptr [BP + -0x10]                
ram:f000:b430   02c1            ADD         AL,CL                                   
ram:f000:b432   7303            JNC         LAB_f000_b437                           
ram:f000:b434   83c210          ADD         DX,0x10                                 
                            LAB_f000_b437:                ;XREF[1,0]:   f000:b432
ram:f000:b437   30c9            XOR         CL,CL                                   
ram:f000:b439   d1f9            SAR         CX,1                                    
ram:f000:b43b   d1f9            SAR         CX,1                                    
ram:f000:b43d   d1f9            SAR         CX,1                                    
ram:f000:b43f   d1f9            SAR         CX,1                                    
ram:f000:b441   03d1            ADD         DX,CX                                   
ram:f000:b443   8bf0            MOV         SI,AX                                   
ram:f000:b445   8eda            MOV         DS,DX                                   
ram:f000:b447   803c01          CMP         byte ptr [SI],0x1                       
ram:f000:b44a   7512            JNZ         LAB_f000_b45e                           
ram:f000:b44c   b80100          MOV         AX,0x1                                  
ram:f000:b44f   8b4ef0          MOV         CX,word ptr [BP + -0x10]                
ram:f000:b452   d3e0            SHL         AX,CL                                   
ram:f000:b454   8a53f3          MOV         DL,byte ptr [BP + DI + -0xd]            
ram:f000:b457   30f6            XOR         DH,DH                                   
ram:f000:b459   0bd0            OR          DX,AX                                   
ram:f000:b45b   8853f3          MOV         byte ptr [BP + DI + -0xd],DL            
                            LAB_f000_b45e:                ;XREF[1,0]:   f000:b44a
ram:f000:b45e   ff46f0          INC         word ptr [BP + -0x10]                   
ram:f000:b461   eb99            JMP         scan_next_lun                           
                            done_scanning_luns:           ;XREF[2,0]:   f000:b3f5,f000:b400
ram:f000:b463   47              INC         DI                                      
ram:f000:b464   e959ff          JMP         scan_next_target                        
                            scan_done:                    ;XREF[1,0]:   f000:b3c5
ram:f000:b467   b80100          MOV         AX,0x1                                  
ram:f000:b46a   50              PUSH        AX                                      
ram:f000:b46b   b80900          MOV         AX,0x9                                  
ram:f000:b46e   50              PUSH        AX                                      
ram:f000:b46f   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:b472   ff7406          PUSH        word ptr [SI + 0x6]                     
ram:f000:b475   ff7404          PUSH        word ptr [SI + 0x4]                     
ram:f000:b478   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:b47b   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:b47e   2c0d            SUB         AL,0xd                                  
ram:f000:b480   7303            JNC         LAB_f000_b485                           
ram:f000:b482   83ea10          SUB         DX,0x10                                 
                            LAB_f000_b485:                ;XREF[1,0]:   f000:b480
ram:f000:b485   d1ea            SHR         DX,1                                    
ram:f000:b487   d1ea            SHR         DX,1                                    
ram:f000:b489   d1ea            SHR         DX,1                                    
ram:f000:b48b   d1ea            SHR         DX,1                                    
ram:f000:b48d   86d4            XCHG        AH,DL                                   
ram:f000:b48f   86f2            XCHG        DL,DH                                   
ram:f000:b491   52              PUSH        DX                                      
ram:f000:b492   50              PUSH        AX                                      
                            ;Write 9 bytes of information to the memory pointed at by
                            ;the ADDRESS field of the job entry.
ram:f000:b493   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:b498   83c40c          ADD         SP,0xc                                  
ram:f000:b49b   b80000          MOV         AX,0x0                                  
ram:f000:b49e   eb00            JMP         LAB_f000_b4a0                           
                            LAB_f000_b4a0:                ;XREF[1,0]:   f000:b49e
ram:f000:b4a0   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void FUN_f000_b4a5(void)
                                                          ;XREF[1,0]:   f000:8972
ram:f000:b4a5   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:b4aa   81ec1600        SUB         SP,0x16                                 
ram:f000:b4ae   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:b4b1   8b4402          MOV         AX,word ptr [SI + 0x2]                  
ram:f000:b4b4   253f00          AND         AX,0x3f                                 
ram:f000:b4b7   8946fe          MOV         word ptr [BP + -0x2],AX                 
ram:f000:b4ba   c746fa0000      MOV         word ptr [BP + -0x6],0x0                
ram:f000:b4bf   c746fce01f      MOV         word ptr [BP + -0x4],0x1fe0             
ram:f000:b4c4   b8001f          MOV         AX,0x1f00                               
ram:f000:b4c7   8ed8            MOV         DS,AX                                   
ram:f000:b4c9   f7067c00ffff    TEST        word ptr [offset...,0xffff              
ram:f000:b4cf   742d            JZ          LAB_f000_b4fe                           
ram:f000:b4d1   8b76fe          MOV         SI,word ptr [BP + -0x2]                 
ram:f000:b4d4   d1e6            SHL         SI,1                                    
ram:f000:b4d6   b8e0fd          MOV         AX,0xfde0                               
ram:f000:b4d9   8ed8            MOV         DS,AX                                   
ram:f000:b4db   8a848b00        MOV         AL,byte ptr [SI + 0x8b]                 
ram:f000:b4df   30e4            XOR         AH,AH                                   
ram:f000:b4e1   8946ea          MOV         word ptr [BP + -0x16],AX                
ram:f000:b4e4   8b76fe          MOV         SI,word ptr [BP + -0x2]                 
ram:f000:b4e7   d1e6            SHL         SI,1                                    
ram:f000:b4e9   b8e0fd          MOV         AX,0xfde0                               
ram:f000:b4ec   8ed8            MOV         DS,AX                                   
ram:f000:b4ee   8a848a00        MOV         AL,byte ptr [SI + 0x8a]                 
ram:f000:b4f2   30e4            XOR         AH,AH                                   
ram:f000:b4f4   b90300          MOV         CX,0x3                                  
ram:f000:b4f7   d3e0            SHL         AX,CL                                   
ram:f000:b4f9   0946ea          OR          word ptr [BP + -0x16],AX                
ram:f000:b4fc   eb51            JMP         LAB_f000_b54f                           
                            LAB_f000_b4fe:                ;XREF[1,0]:   f000:b4cf
ram:f000:b4fe   c746ea0000      MOV         word ptr [BP + -0x16],0x0               
ram:f000:b503   31ff            XOR         DI,DI                                   
                            LAB_f000_b505:                ;XREF[1,0]:   f000:b54d
ram:f000:b505   83ff08          CMP         DI,0x8                                  
ram:f000:b508   7d45            JGE         LAB_f000_b54f                           
ram:f000:b50a   8b46fa          MOV         AX,word ptr [BP + -0x6]                 
ram:f000:b50d   8b56fc          MOV         DX,word ptr [BP + -0x4]                 
ram:f000:b510   0404            ADD         AL,0x4                                  
ram:f000:b512   7303            JNC         LAB_f000_b517                           
ram:f000:b514   83c210          ADD         DX,0x10                                 
                            LAB_f000_b517:                ;XREF[1,0]:   f000:b512
ram:f000:b517   8bcf            MOV         CX,DI                                   
ram:f000:b519   02c1            ADD         AL,CL                                   
ram:f000:b51b   7303            JNC         LAB_f000_b520                           
ram:f000:b51d   83c210          ADD         DX,0x10                                 
                            LAB_f000_b520:                ;XREF[1,0]:   f000:b51b
ram:f000:b520   30c9            XOR         CL,CL                                   
ram:f000:b522   d1f9            SAR         CX,1                                    
ram:f000:b524   d1f9            SAR         CX,1                                    
ram:f000:b526   d1f9            SAR         CX,1                                    
ram:f000:b528   d1f9            SAR         CX,1                                    
ram:f000:b52a   03d1            ADD         DX,CX                                   
ram:f000:b52c   8bf0            MOV         SI,AX                                   
ram:f000:b52e   8eda            MOV         DS,DX                                   
ram:f000:b530   803c01          CMP         byte ptr [SI],0x1                       
ram:f000:b533   7517            JNZ         LAB_f000_b54c                           
ram:f000:b535   8b46ea          MOV         AX,word ptr [BP + -0x16]                
ram:f000:b538   3b46fe          CMP         AX,word ptr [BP + -0x2]                 
ram:f000:b53b   750c            JNZ         LAB_f000_b549                           
ram:f000:b53d   8bc7            MOV         AX,DI                                   
ram:f000:b53f   b90300          MOV         CX,0x3                                  
ram:f000:b542   d3e0            SHL         AX,CL                                   
ram:f000:b544   8946ea          MOV         word ptr [BP + -0x16],AX                
ram:f000:b547   eb06            JMP         LAB_f000_b54f                           
                            LAB_f000_b549:                ;XREF[1,0]:   f000:b53b
ram:f000:b549   ff46ea          INC         word ptr [BP + -0x16]                   
                            LAB_f000_b54c:                ;XREF[1,0]:   f000:b533
ram:f000:b54c   47              INC         DI                                      
ram:f000:b54d   ebb6            JMP         LAB_f000_b505                           
                            LAB_f000_b54f:                ;XREF[3,0]:   f000:b4fc,f000:b508,f000:b547
ram:f000:b54f   b80000          MOV         AX,0x0                                  
ram:f000:b552   50              PUSH        AX                                      
ram:f000:b553   b80400          MOV         AX,0x4                                  
ram:f000:b556   50              PUSH        AX                                      
ram:f000:b557   b8d600          MOV         AX,0xd6                                 
ram:f000:b55a   ba101f          MOV         DX,0x1f10                               
ram:f000:b55d   d1ea            SHR         DX,1                                    
ram:f000:b55f   d1ea            SHR         DX,1                                    
ram:f000:b561   d1ea            SHR         DX,1                                    
ram:f000:b563   d1ea            SHR         DX,1                                    
ram:f000:b565   86d4            XCHG        AH,DL                                   
ram:f000:b567   86f2            XCHG        DL,DH                                   
ram:f000:b569   52              PUSH        DX                                      
ram:f000:b56a   50              PUSH        AX                                      
ram:f000:b56b   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:b56e   ff7406          PUSH        word ptr [SI + 0x6]                     
ram:f000:b571   ff7404          PUSH        word ptr [SI + 0x4]                     
ram:f000:b574   9a200070fd      CALLF       transfer_words                          ;undefined transfer_words()
ram:f000:b579   83c40c          ADD         SP,0xc                                  
ram:f000:b57c   c746ec0000      MOV         word ptr [BP + -0x14],0x0               
ram:f000:b581   b8101f          MOV         AX,0x1f10                               
ram:f000:b584   8ed8            MOV         DS,AX                                   
ram:f000:b586   ff36dc00        PUSH        word ptr [offset DAT_1000_f1dc &0xff]   
ram:f000:b58a   ff36da00        PUSH        word ptr [offset DAT_1000_f1da &0xff]   
ram:f000:b58e   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:b593   83c404          ADD         SP,0x4                                  
ram:f000:b596   8946ee          MOV         word ptr [BP + -0x12],AX                
ram:f000:b599   8956f0          MOV         word ptr [BP + -0x10],DX                
ram:f000:b59c   b8101f          MOV         AX,0x1f10                               
ram:f000:b59f   8ed8            MOV         DS,AX                                   
ram:f000:b5a1   ff36d800        PUSH        word ptr [offset DAT_1000_f1d8 &0xff]   
ram:f000:b5a5   ff36d600        PUSH        word ptr [offset DAT_1000_f1d6 &0xff]   
ram:f000:b5a9   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:b5ae   83c404          ADD         SP,0x4                                  
ram:f000:b5b1   8946f2          MOV         word ptr [BP + -0xe],AX                 
ram:f000:b5b4   8956f4          MOV         word ptr [BP + -0xc],DX                 
ram:f000:b5b7   c746f60002      MOV         word ptr [BP + -0xa],0x200              
ram:f000:b5bc   c746f80000      MOV         word ptr [BP + -0x8],0x0                
ram:f000:b5c1   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:b5c4   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:b5c7   2c14            SUB         AL,0x14                                 
ram:f000:b5c9   7303            JNC         LAB_f000_b5ce                           
ram:f000:b5cb   83ea10          SUB         DX,0x10                                 
                            LAB_f000_b5ce:                ;XREF[1,0]:   f000:b5c9
ram:f000:b5ce   52              PUSH        DX                                      
ram:f000:b5cf   50              PUSH        AX                                      
ram:f000:b5d0   ff76ea          PUSH        word ptr [BP + -0x16]                   
ram:f000:b5d3   9ace0090fb      CALLF       scsi_do_next_block_transfer             ;undefined2 scsi_do_next_block_transf...
ram:f000:b5d8   83c406          ADD         SP,0x6                                  
ram:f000:b5db   eb00            JMP         LAB_f000_b5dd                           
                            LAB_f000_b5dd:                ;XREF[1,0]:   f000:b5db
ram:f000:b5dd   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*  Current hypothesis:                                                                         *
                            ;*                                                                                              *
                            ;*  This function seems to take the next unread block                                           *
                            ;*  (starting at block 3) and transfer it to the host                                           *
                            ;*  beginning at 0x02200200                                                                     *
                            ;************************************************************************************************
                            ;void scsi_next_block(void)
          ;unaff_BP      int                 BP                      
          ;unaff_SS      undefined2          SS                      
          ;uVar8         uint                DI                      ;XREF[1,0]:   f000:b640
          ;bVar5         byte                AL                      ;XREF[1,0]:   f000:b64d
          ;iVar8         int                 DX                      ;XREF[1,0]:   f000:b651
          ;uVar6         undefined2          DX                      ;XREF[1,0]:   f000:b6a4
          ;iVar7         int                 SI                      
          ;uVar9         undefined2          DS                      ;XREF[1,0]:   f000:b6a8
          ;rq_ptr        long           HASH...                      
          ;puVar1        uint *         HASH...                      
          ;uVar3         uint           HASH...                      
          ;piVar2        int *          HASH...                      
                                                          ;XREF[1,0]:   f000:8960
ram:f000:b5e2   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:b5e7   81ec1600        SUB         SP,0x16                                 
ram:f000:b5eb   c5760e          LDS         SI,[unaff_BP + 0xe]                     
                            ;AX := Subdevice
ram:f000:b5ee   8b4402          MOV         AX,word ptr [SI + 0x2]                  
ram:f000:b5f1   253f00          AND         AX,0x3f                                 
                            ;local_2 := Subdevice
ram:f000:b5f4   8946fe          MOV         word ptr [unaff_BP + -0x2],AX           
                            ;local_6 := 0
ram:f000:b5f7   c746fa0000      MOV         word ptr [unaff_BP + -0x6],0x0          
                            ;local_4 = 0x1fe0
ram:f000:b5fc   c746fce01f      MOV         word ptr [unaff_BP + -0x4],0x1fe0       
ram:f000:b601   b8001f          MOV         AX,0x1f00                               
ram:f000:b604   8ed8            MOV         DS,AX                                   
ram:f000:b606   f7067c00ffff    TEST        word ptr [offset...,0xffff              
ram:f000:b60c   742d            JZ          LAB_f000_b63b                           
ram:f000:b60e   8b76fe          MOV         SI,word ptr [unaff_BP + -0x2]           
ram:f000:b611   d1e6            SHL         SI,1                                    
ram:f000:b613   b8e0fd          MOV         AX,0xfde0                               
ram:f000:b616   8ed8            MOV         DS,AX                                   
ram:f000:b618   8a848b00        MOV         AL,byte ptr [SI + 0x8b]                 
ram:f000:b61c   30e4            XOR         AH,AH                                   
ram:f000:b61e   8946ea          MOV         word ptr [unaff_BP + -0x16],AX          
ram:f000:b621   8b76fe          MOV         SI,word ptr [unaff_BP + -0x2]           
ram:f000:b624   d1e6            SHL         SI,1                                    
ram:f000:b626   b8e0fd          MOV         AX,0xfde0                               
ram:f000:b629   8ed8            MOV         DS,AX                                   
ram:f000:b62b   8a848a00        MOV         AL,byte ptr [SI + 0x8a]                 
ram:f000:b62f   30e4            XOR         AH,AH                                   
ram:f000:b631   b90300          MOV         CX,0x3                                  
ram:f000:b634   d3e0            SHL         AX,CL                                   
ram:f000:b636   0946ea          OR          word ptr [unaff_BP + -0x16],AX          
ram:f000:b639   eb51            JMP         LAB_f000_b68c                           
                            LAB_f000_b63b:                ;XREF[1,0]:   f000:b60c
ram:f000:b63b   c746ea0000      MOV         word ptr [unaff_BP + -0x16],0x0         
ram:f000:b640   31ff            XOR         uVar8,uVar8                             
                            LAB_f000_b642:                ;XREF[1,0]:   f000:b68a
ram:f000:b642   83ff08          CMP         uVar8,0x8                               
ram:f000:b645   7d45            JGE         LAB_f000_b68c                           
ram:f000:b647   8b46fa          MOV         AX,word ptr [unaff_BP + -0x6]           
ram:f000:b64a   8b56fc          MOV         DX,word ptr [unaff_BP + -0x4]           
ram:f000:b64d   0404            ADD         bVar5,0x4                               
ram:f000:b64f   7303            JNC         LAB_f000_b654                           
ram:f000:b651   83c210          ADD         iVar8,0x10                              
                            LAB_f000_b654:                ;XREF[1,0]:   f000:b64f
ram:f000:b654   8bcf            MOV         CX,uVar8                                
ram:f000:b656   02c1            ADD         bVar5,CL                                
ram:f000:b658   7303            JNC         LAB_f000_b65d                           
ram:f000:b65a   83c210          ADD         iVar8,0x10                              
                            LAB_f000_b65d:                ;XREF[1,0]:   f000:b658
ram:f000:b65d   30c9            XOR         CL,CL                                   
ram:f000:b65f   d1f9            SAR         CX,1                                    
ram:f000:b661   d1f9            SAR         CX,1                                    
ram:f000:b663   d1f9            SAR         CX,1                                    
ram:f000:b665   d1f9            SAR         CX,1                                    
ram:f000:b667   03d1            ADD         iVar8,CX                                
ram:f000:b669   8bf0            MOV         SI,bVar5                                
ram:f000:b66b   8eda            MOV         DS,iVar8                                
ram:f000:b66d   803c01          CMP         byte ptr [SI],0x1                       
ram:f000:b670   7517            JNZ         LAB_f000_b689                           
ram:f000:b672   8b46ea          MOV         bVar5,word ptr [unaff_BP + -0x16]       
ram:f000:b675   3b46fe          CMP         bVar5,word ptr [unaff_BP + -0x2]        
ram:f000:b678   750c            JNZ         LAB_f000_b686                           
ram:f000:b67a   8bc7            MOV         bVar5,uVar8                             
ram:f000:b67c   b90300          MOV         CX,0x3                                  
ram:f000:b67f   d3e0            SHL         bVar5,CL                                
ram:f000:b681   8946ea          MOV         word ptr [unaff_BP + -0x16],bVar5       
ram:f000:b684   eb06            JMP         LAB_f000_b68c                           
                            LAB_f000_b686:                ;XREF[1,0]:   f000:b678
ram:f000:b686   ff46ea          INC         word ptr [unaff_BP + -0x16]             
                            LAB_f000_b689:                ;XREF[1,0]:   f000:b670
ram:f000:b689   47              INC         uVar8                                   
ram:f000:b68a   ebb6            JMP         LAB_f000_b642                           
                            LAB_f000_b68c:                ;XREF[3,0]:   f000:b639,f000:b645,f000:b684
ram:f000:b68c   b80000          MOV         bVar5,0x0                               
ram:f000:b68f   50              PUSH        bVar5                                   
ram:f000:b690   b80400          MOV         bVar5,0x4                               
ram:f000:b693   50              PUSH        bVar5                                   
ram:f000:b694   b8d600          MOV         bVar5,0xd6                              
ram:f000:b697   ba101f          MOV         iVar8,0x1f10                            
ram:f000:b69a   d1ea            SHR         iVar8,1                                 
ram:f000:b69c   d1ea            SHR         iVar8,1                                 
ram:f000:b69e   d1ea            SHR         iVar8,1                                 
ram:f000:b6a0   d1ea            SHR         iVar8,1                                 
ram:f000:b6a2   86d4            XCHG        AH,iVar8                                
ram:f000:b6a4   86f2            XCHG        uVar6,uVar6                             
ram:f000:b6a6   52              PUSH        uVar6                                   
ram:f000:b6a7   50              PUSH        bVar5                                   
ram:f000:b6a8   c5760e          LDS         iVar7,[unaff_BP + 0xe]                  
ram:f000:b6ab   ff7406          PUSH        word ptr [iVar7 + 0x6]                  
ram:f000:b6ae   ff7404          PUSH        word ptr [iVar7 + 0x4]                  
ram:f000:b6b1   9a200070fd      CALLF       transfer_words                          ;undefined transfer_words()
ram:f000:b6b6   83c40c          ADD         SP,0xc                                  
ram:f000:b6b9   c746ec0100      MOV         word ptr [unaff_BP + -0x14],0x1         
ram:f000:b6be   b8101f          MOV         bVar5,0x1f10                            
ram:f000:b6c1   8ed8            MOV         uVar9,bVar5                             
ram:f000:b6c3   ff36d800        PUSH        word ptr [offset DAT_1000_f1d8 &0xff]   
ram:f000:b6c7   ff36d600        PUSH        word ptr [offset DAT_1000_f1d6 &0xff]   
ram:f000:b6cb   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:b6d0   83c404          ADD         SP,0x4                                  
ram:f000:b6d3   8946ee          MOV         word ptr [unaff_BP + -0x12],bVar5       
ram:f000:b6d6   8956f0          MOV         word ptr [unaff_BP + -0x10],uVar6       
ram:f000:b6d9   b8101f          MOV         bVar5,0x1f10                            
ram:f000:b6dc   8ed8            MOV         uVar9,bVar5                             
ram:f000:b6de   ff36dc00        PUSH        word ptr [offset DAT_1000_f1dc &0xff]   
ram:f000:b6e2   ff36da00        PUSH        word ptr [offset DAT_1000_f1da &0xff]   
ram:f000:b6e6   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:b6eb   83c404          ADD         SP,0x4                                  
ram:f000:b6ee   8946f2          MOV         word ptr [unaff_BP + -0xe],bVar5        
ram:f000:b6f1   8956f4          MOV         word ptr [unaff_BP + -0xc],uVar6        
ram:f000:b6f4   c746f60002      MOV         word ptr [unaff_BP + -0xa],0x200        
ram:f000:b6f9   c746f80000      MOV         word ptr [unaff_BP + -0x8],0x0          
ram:f000:b6fe   8b4600          MOV         bVar5,word ptr [unaff_BP + 0x0]         
ram:f000:b701   8b5602          MOV         uVar6,word ptr [unaff_BP + 0x2]         
ram:f000:b704   2c14            SUB         bVar5,0x14                              
ram:f000:b706   7303            JNC         LAB_f000_b70b                           
ram:f000:b708   83ea10          SUB         uVar6,0x10                              
                            LAB_f000_b70b:                ;XREF[1,0]:   f000:b706
ram:f000:b70b   52              PUSH        uVar6                                   
ram:f000:b70c   50              PUSH        bVar5                                   
ram:f000:b70d   ff76ea          PUSH        word ptr [unaff_BP + -0x16]             
ram:f000:b710   9ace0090fb      CALLF       scsi_do_next_block_transfer             ;undefined2 scsi_do_next_block_transf...
ram:f000:b715   83c406          ADD         SP,0x6                                  
ram:f000:b718   eb00            JMP         LAB_f000_b71a                           
                            LAB_f000_b71a:                ;XREF[1,0]:   f000:b718
ram:f000:b71a   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 scsi_boot(void)
                                                          ;XREF[1,0]:   f000:894e
ram:f000:b71f   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:b724   81ec1c00        SUB         SP,0x1c                                 
ram:f000:b728   c746fc0000      MOV         word ptr [BP + -0x4],0x0                
ram:f000:b72d   c746fee01f      MOV         word ptr [BP + -0x2],0x1fe0             
ram:f000:b732   c746f8de00      MOV         word ptr [BP + -0x8],0xde               
ram:f000:b737   c746fa101f      MOV         word ptr [BP + -0x6],0x1f10             
ram:f000:b73c   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:b73f   8b4402          MOV         AX,word ptr [SI + 0x2]                  
ram:f000:b742   253f00          AND         AX,0x3f                                 
ram:f000:b745   8946f6          MOV         word ptr [BP + -0xa],AX                 
ram:f000:b748   c576fc          LDS         SI,[BP + -0x4]                          
ram:f000:b74b   817c020d50      CMP         word ptr [SI + 0x2],0x500d              
ram:f000:b750   7506            JNZ         LAB_f000_b758                           
ram:f000:b752   813c0d50        CMP         word ptr [SI],0x500d                    
ram:f000:b756   740c            JZ          LAB_f000_b764                           
                            LAB_f000_b758:                ;XREF[1,0]:   f000:b750
ram:f000:b758   b80000          MOV         AX,0x0                                  
ram:f000:b75b   50              PUSH        AX                                      
ram:f000:b75c   9aea0060fa      CALLF       enumerate_scsi_bus                      ;void enumerate_scsi_bus(void)
ram:f000:b761   83c402          ADD         SP,0x2                                  
                            LAB_f000_b764:                ;XREF[1,0]:   f000:b756
ram:f000:b764   b8001f          MOV         AX,0x1f00                               
ram:f000:b767   8ed8            MOV         DS,AX                                   
ram:f000:b769   f7067c00ffff    TEST        word ptr [offset...,0xffff              
ram:f000:b76f   7430            JZ          LAB_f000_b7a1                           
ram:f000:b771   8b76f6          MOV         SI,word ptr [BP + -0xa]                 
ram:f000:b774   d1e6            SHL         SI,1                                    
ram:f000:b776   b8e0fd          MOV         AX,0xfde0                               
ram:f000:b779   8ed8            MOV         DS,AX                                   
ram:f000:b77b   8a848b00        MOV         AL,byte ptr [SI + 0x8b]                 
ram:f000:b77f   30e4            XOR         AH,AH                                   
ram:f000:b781   8b76f6          MOV         SI,word ptr [BP + -0xa]                 
ram:f000:b784   d1e6            SHL         SI,1                                    
ram:f000:b786   bae0fd          MOV         DX,0xfde0                               
ram:f000:b789   8eda            MOV         DS,DX                                   
ram:f000:b78b   8a948a00        MOV         DL,byte ptr [SI + 0x8a]                 
ram:f000:b78f   30f6            XOR         DH,DH                                   
ram:f000:b791   b90300          MOV         CX,0x3                                  
ram:f000:b794   d3e2            SHL         DX,CL                                   
ram:f000:b796   81e23800        AND         DX,0x38                                 
ram:f000:b79a   0bc2            OR          AX,DX                                   
ram:f000:b79c   8946e6          MOV         word ptr [BP + -0x1a],AX                
ram:f000:b79f   eb51            JMP         LAB_f000_b7f2                           
                            LAB_f000_b7a1:                ;XREF[1,0]:   f000:b76f
ram:f000:b7a1   c746e60000      MOV         word ptr [BP + -0x1a],0x0               
ram:f000:b7a6   31ff            XOR         DI,DI                                   
                            LAB_f000_b7a8:                ;XREF[1,0]:   f000:b7f0
ram:f000:b7a8   83ff08          CMP         DI,0x8                                  
ram:f000:b7ab   7d45            JGE         LAB_f000_b7f2                           
ram:f000:b7ad   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:b7b0   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:b7b3   0404            ADD         AL,0x4                                  
ram:f000:b7b5   7303            JNC         LAB_f000_b7ba                           
ram:f000:b7b7   83c210          ADD         DX,0x10                                 
                            LAB_f000_b7ba:                ;XREF[1,0]:   f000:b7b5
ram:f000:b7ba   8bcf            MOV         CX,DI                                   
ram:f000:b7bc   02c1            ADD         AL,CL                                   
ram:f000:b7be   7303            JNC         LAB_f000_b7c3                           
ram:f000:b7c0   83c210          ADD         DX,0x10                                 
                            LAB_f000_b7c3:                ;XREF[1,0]:   f000:b7be
ram:f000:b7c3   30c9            XOR         CL,CL                                   
ram:f000:b7c5   d1f9            SAR         CX,1                                    
ram:f000:b7c7   d1f9            SAR         CX,1                                    
ram:f000:b7c9   d1f9            SAR         CX,1                                    
ram:f000:b7cb   d1f9            SAR         CX,1                                    
ram:f000:b7cd   03d1            ADD         DX,CX                                   
ram:f000:b7cf   8bf0            MOV         SI,AX                                   
ram:f000:b7d1   8eda            MOV         DS,DX                                   
ram:f000:b7d3   803c01          CMP         byte ptr [SI],0x1                       
ram:f000:b7d6   7517            JNZ         LAB_f000_b7ef                           
ram:f000:b7d8   8b46e6          MOV         AX,word ptr [BP + -0x1a]                
ram:f000:b7db   3b46f6          CMP         AX,word ptr [BP + -0xa]                 
ram:f000:b7de   750c            JNZ         LAB_f000_b7ec                           
ram:f000:b7e0   8bc7            MOV         AX,DI                                   
ram:f000:b7e2   b90300          MOV         CX,0x3                                  
ram:f000:b7e5   d3e0            SHL         AX,CL                                   
ram:f000:b7e7   8946e6          MOV         word ptr [BP + -0x1a],AX                
ram:f000:b7ea   eb06            JMP         LAB_f000_b7f2                           
                            LAB_f000_b7ec:                ;XREF[1,0]:   f000:b7de
ram:f000:b7ec   ff46e6          INC         word ptr [BP + -0x1a]                   
                            LAB_f000_b7ef:                ;XREF[1,0]:   f000:b7d6
ram:f000:b7ef   47              INC         DI                                      
ram:f000:b7f0   ebb6            JMP         LAB_f000_b7a8                           
                            LAB_f000_b7f2:                ;XREF[3,0]:   f000:b79f,f000:b7ab,f000:b7ea
ram:f000:b7f2   b8001f          MOV         AX,0x1f00                               
ram:f000:b7f5   8ed8            MOV         DS,AX                                   
ram:f000:b7f7   c7062a000040    MOV         word ptr [offset...,0x4000              
ram:f000:b7fd   c7062c000002    MOV         word ptr [offset...,0x200               
ram:f000:b803   ff76e6          PUSH        word ptr [BP + -0x1a]                   
ram:f000:b806   9aef0080fb      CALLF       FUN_f000_b8ef                           ;undefined2 FUN_f000_b8ef(void)
ram:f000:b80b   83c402          ADD         SP,0x2                                  
ram:f000:b80e   8946e4          MOV         word ptr [BP + -0x1c],AX                
ram:f000:b811   85c0            TEST        AX,AX                                   
ram:f000:b813   7406            JZ          LAB_f000_b81b                           
ram:f000:b815   8b46e4          MOV         AX,word ptr [BP + -0x1c]                
ram:f000:b818   e9cf00          JMP         LAB_f000_b8ea                           
                            LAB_f000_b81b:                ;XREF[1,0]:   f000:b813
ram:f000:b81b   c746e80300      MOV         word ptr [BP + -0x18],0x3               
ram:f000:b820   c746ea0000      MOV         word ptr [BP + -0x16],0x0               
ram:f000:b825   c746ec0000      MOV         word ptr [BP + -0x14],0x0               
ram:f000:b82a   b8de00          MOV         AX,0xde                                 
ram:f000:b82d   ba101f          MOV         DX,0x1f10                               
ram:f000:b830   d1ea            SHR         DX,1                                    
ram:f000:b832   d1ea            SHR         DX,1                                    
ram:f000:b834   d1ea            SHR         DX,1                                    
ram:f000:b836   d1ea            SHR         DX,1                                    
ram:f000:b838   86d4            XCHG        AH,DL                                   
ram:f000:b83a   86f2            XCHG        DL,DH                                   
ram:f000:b83c   8946ee          MOV         word ptr [BP + -0x12],AX                
ram:f000:b83f   8956f0          MOV         word ptr [BP + -0x10],DX                
ram:f000:b842   c746f20002      MOV         word ptr [BP + -0xe],0x200              
ram:f000:b847   c746f40000      MOV         word ptr [BP + -0xc],0x0                
ram:f000:b84c   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:b84f   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:b852   2c18            SUB         AL,0x18                                 
ram:f000:b854   7303            JNC         LAB_f000_b859                           
ram:f000:b856   83ea10          SUB         DX,0x10                                 
                            LAB_f000_b859:                ;XREF[1,0]:   f000:b854
ram:f000:b859   52              PUSH        DX                                      
ram:f000:b85a   50              PUSH        AX                                      
ram:f000:b85b   ff76e6          PUSH        word ptr [BP + -0x1a]                   
ram:f000:b85e   9ace0090fb      CALLF       scsi_do_next_block_transfer             ;undefined2 scsi_do_next_block_transf...
ram:f000:b863   83c406          ADD         SP,0x6                                  
ram:f000:b866   8946e4          MOV         word ptr [BP + -0x1c],AX                
ram:f000:b869   85c0            TEST        AX,AX                                   
ram:f000:b86b   7405            JZ          XFER_BOOT_TO_HOST                       
ram:f000:b86d   8b46e4          MOV         AX,word ptr [BP + -0x1c]                
ram:f000:b870   eb78            JMP         LAB_f000_b8ea                           
                            XFER_BOOT_TO_HOST:            ;XREF[1,0]:   f000:b86b
ram:f000:b872   b80100          MOV         AX,0x1                                  
ram:f000:b875   50              PUSH        AX                                      
ram:f000:b876   b80001          MOV         AX,0x100                                
ram:f000:b879   50              PUSH        AX                                      
ram:f000:b87a   b80002          MOV         AX,0x200                                
ram:f000:b87d   50              PUSH        AX                                      
ram:f000:b87e   b80044          MOV         AX,0x4400                               
ram:f000:b881   50              PUSH        AX                                      
ram:f000:b882   b8de00          MOV         AX,0xde                                 
ram:f000:b885   ba101f          MOV         DX,0x1f10                               
ram:f000:b888   d1ea            SHR         DX,1                                    
ram:f000:b88a   d1ea            SHR         DX,1                                    
ram:f000:b88c   d1ea            SHR         DX,1                                    
ram:f000:b88e   d1ea            SHR         DX,1                                    
ram:f000:b890   86d4            XCHG        AH,DL                                   
ram:f000:b892   86f2            XCHG        DL,DH                                   
ram:f000:b894   52              PUSH        DX                                      
ram:f000:b895   50              PUSH        AX                                      
ram:f000:b896   9a200070fd      CALLF       transfer_words                          ;undefined transfer_words()
ram:f000:b89b   83c40c          ADD         SP,0xc                                  
ram:f000:b89e   c746e80100      MOV         word ptr [BP + -0x18],0x1               
ram:f000:b8a3   c576f8          LDS         SI,[BP + -0x8]                          
ram:f000:b8a6   ff742a          PUSH        word ptr [SI + 0x2a]                    
ram:f000:b8a9   ff7428          PUSH        word ptr [SI + 0x28]                    
ram:f000:b8ac   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:b8b1   83c404          ADD         SP,0x4                                  
ram:f000:b8b4   8946ea          MOV         word ptr [BP + -0x16],AX                
ram:f000:b8b7   8956ec          MOV         word ptr [BP + -0x14],DX                
ram:f000:b8ba   c746ee0040      MOV         word ptr [BP + -0x12],0x4000            
ram:f000:b8bf   c746f00002      MOV         word ptr [BP + -0x10],0x200             
ram:f000:b8c4   c746f20002      MOV         word ptr [BP + -0xe],0x200              
ram:f000:b8c9   c746f40000      MOV         word ptr [BP + -0xc],0x0                
ram:f000:b8ce   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:b8d1   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:b8d4   2c18            SUB         AL,0x18                                 
ram:f000:b8d6   7303            JNC         LAB_f000_b8db                           
ram:f000:b8d8   83ea10          SUB         DX,0x10                                 
                            LAB_f000_b8db:                ;XREF[1,0]:   f000:b8d6
ram:f000:b8db   52              PUSH        DX                                      
ram:f000:b8dc   50              PUSH        AX                                      
ram:f000:b8dd   ff76e6          PUSH        word ptr [BP + -0x1a]                   
ram:f000:b8e0   9ace0090fb      CALLF       scsi_do_next_block_transfer             ;undefined2 scsi_do_next_block_transf...
ram:f000:b8e5   83c406          ADD         SP,0x6                                  
ram:f000:b8e8   eb00            JMP         LAB_f000_b8ea                           
                            LAB_f000_b8ea:                ;XREF[3,0]:   f000:b818,f000:b870,f000:b8e8
ram:f000:b8ea   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 FUN_f000_b8ef(void)
                                                          ;XREF[1,0]:   f000:b806
ram:f000:b8ef   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:b8f4   81ec0a00        SUB         SP,0xa                                  
ram:f000:b8f8   8b7e0e          MOV         DI,word ptr [BP + 0xe]                  
ram:f000:b8fb   c746fc0000      MOV         word ptr [BP + -0x4],0x0                
ram:f000:b900   c746fee01f      MOV         word ptr [BP + -0x2],0x1fe0             
ram:f000:b905   8bc7            MOV         AX,DI                                   
ram:f000:b907   b90300          MOV         CX,0x3                                  
ram:f000:b90a   d3f8            SAR         AX,CL                                   
ram:f000:b90c   8946fa          MOV         word ptr [BP + -0x6],AX                 
ram:f000:b90f   8bc7            MOV         AX,DI                                   
ram:f000:b911   250300          AND         AX,0x3                                  
ram:f000:b914   8946f8          MOV         word ptr [BP + -0x8],AX                 
ram:f000:b917   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:b91a   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:b91d   044c            ADD         AL,0x4c                                 
ram:f000:b91f   7303            JNC         LAB_f000_b924                           
ram:f000:b921   83c210          ADD         DX,0x10                                 
                            LAB_f000_b924:                ;XREF[1,0]:   f000:b91f
ram:f000:b924   8b4efa          MOV         CX,word ptr [BP + -0x6]                 
ram:f000:b927   be0500          MOV         SI,0x5                                  
ram:f000:b92a   87ce            XCHG        SI,CX                                   
ram:f000:b92c   d3e6            SHL         SI,CL                                   
ram:f000:b92e   87ce            XCHG        SI,CX                                   
ram:f000:b930   02c1            ADD         AL,CL                                   
ram:f000:b932   7303            JNC         LAB_f000_b937                           
ram:f000:b934   83c210          ADD         DX,0x10                                 
                            LAB_f000_b937:                ;XREF[1,0]:   f000:b932
ram:f000:b937   30c9            XOR         CL,CL                                   
ram:f000:b939   d1f9            SAR         CX,1                                    
ram:f000:b93b   d1f9            SAR         CX,1                                    
ram:f000:b93d   d1f9            SAR         CX,1                                    
ram:f000:b93f   d1f9            SAR         CX,1                                    
ram:f000:b941   03d1            ADD         DX,CX                                   
ram:f000:b943   8bf0            MOV         SI,AX                                   
ram:f000:b945   8eda            MOV         DS,DX                                   
ram:f000:b947   8a04            MOV         AL,byte ptr [SI]                        
ram:f000:b949   30e4            XOR         AH,AH                                   
ram:f000:b94b   eb28            JMP         LAB_f000_b975                           
                            LAB_f000_b94d:                ;XREF[1,0]:   f000:b978
ram:f000:b94d   57              PUSH        DI                                      
ram:f000:b94e   9ab900a0fb      CALLF       FUN_f000_bab9                           ;void FUN_f000_bab9(void)
ram:f000:b953   83c402          ADD         SP,0x2                                  
ram:f000:b956   8946f6          MOV         word ptr [BP + -0xa],AX                 
ram:f000:b959   eb3a            JMP         LAB_f000_b995                           
                            LAB_f000_b95b:                ;XREF[1,0]:   f000:b97d
ram:f000:b95b   57              PUSH        DI                                      
ram:f000:b95c   9ae000e0fb      CALLF       FUN_f000_bee0                           ;uint FUN_f000_bee0(void)
ram:f000:b961   83c402          ADD         SP,0x2                                  
ram:f000:b964   8946f6          MOV         word ptr [BP + -0xa],AX                 
ram:f000:b967   eb2c            JMP         LAB_f000_b995                           
                            LAB_f000_b969:                ;XREF[4,0]:   f000:b982,f000:b987,f000:b98c,f000:b991
ram:f000:b969   c746f6fcff      MOV         word ptr [BP + -0xa],0xfffc             
ram:f000:b96e   eb25            JMP         LAB_f000_b995                           
                            LAB_f000_b970:                ;XREF[1,0]:   f000:b993
ram:f000:b970   b80200          MOV         AX,0x2                                  
ram:f000:b973   eb54            JMP         LAB_f000_b9c9                           
                            LAB_f000_b975:                ;XREF[1,0]:   f000:b94b
ram:f000:b975   3d0000          CMP         AX,0x0                                  
ram:f000:b978   74d3            JZ          LAB_f000_b94d                           
ram:f000:b97a   3d0100          CMP         AX,0x1                                  
ram:f000:b97d   74dc            JZ          LAB_f000_b95b                           
ram:f000:b97f   3d0200          CMP         AX,0x2                                  
ram:f000:b982   74e5            JZ          LAB_f000_b969                           
ram:f000:b984   3d0300          CMP         AX,0x3                                  
ram:f000:b987   74e0            JZ          LAB_f000_b969                           
ram:f000:b989   3d0400          CMP         AX,0x4                                  
ram:f000:b98c   74db            JZ          LAB_f000_b969                           
ram:f000:b98e   3d0500          CMP         AX,0x5                                  
ram:f000:b991   74d6            JZ          LAB_f000_b969                           
ram:f000:b993   ebdb            JMP         LAB_f000_b970                           
                            LAB_f000_b995:                ;XREF[3,0]:   f000:b959,f000:b967,f000:b96e
ram:f000:b995   8b46f6          MOV         AX,word ptr [BP + -0xa]                 
ram:f000:b998   eb14            JMP         LAB_f000_b9ae                           
                            LAB_f000_b99a:                ;XREF[1,0]:   f000:b9c5
ram:f000:b99a   b80000          MOV         AX,0x0                                  
ram:f000:b99d   eb2a            JMP         LAB_f000_b9c9                           
                            LAB_f000_b99f:                ;XREF[1,0]:   f000:b9b6
ram:f000:b99f   b86000          MOV         AX,0x60                                 
ram:f000:b9a2   eb25            JMP         LAB_f000_b9c9                           
                            LAB_f000_b9a4:                ;XREF[1,0]:   f000:b9b1
ram:f000:b9a4   b88000          MOV         AX,0x80                                 
ram:f000:b9a7   eb20            JMP         LAB_f000_b9c9                           
                            LAB_f000_b9a9:                ;XREF[3,0]:   f000:b9bb,f000:b9c0,f000:b9c7
ram:f000:b9a9   b80200          MOV         AX,0x2                                  
ram:f000:b9ac   eb1b            JMP         LAB_f000_b9c9                           
                            LAB_f000_b9ae:                ;XREF[1,0]:   f000:b998
ram:f000:b9ae   3dfcff          CMP         AX,0xfffc                               
ram:f000:b9b1   74f1            JZ          LAB_f000_b9a4                           
ram:f000:b9b3   3dfdff          CMP         AX,0xfffd                               
ram:f000:b9b6   74e7            JZ          LAB_f000_b99f                           
ram:f000:b9b8   3dfeff          CMP         AX,0xfffe                               
ram:f000:b9bb   74ec            JZ          LAB_f000_b9a9                           
ram:f000:b9bd   3dffff          CMP         AX,0xffff                               
ram:f000:b9c0   74e7            JZ          LAB_f000_b9a9                           
ram:f000:b9c2   3d0000          CMP         AX,0x0                                  
ram:f000:b9c5   74d3            JZ          LAB_f000_b99a                           
ram:f000:b9c7   ebe0            JMP         LAB_f000_b9a9                           
                            LAB_f000_b9c9:                ;XREF[5,0]:   f000:b973,f000:b99d,f000:b9a2,f000:b9a7
                                                          ;             f000:b9ac
ram:f000:b9c9   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 scsi_do_next_block_transfer(void)
                                                          ;XREF[4,0]:   f000:b5d3,f000:b710,f000:b85e,f000:b8e0
ram:f000:b9ce   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:b9d3   81ec0a00        SUB         SP,0xa                                  
ram:f000:b9d7   8b7e0e          MOV         DI,word ptr [BP + 0xe]                  
ram:f000:b9da   c746fc0000      MOV         word ptr [BP + -0x4],0x0                
ram:f000:b9df   c746fee01f      MOV         word ptr [BP + -0x2],0x1fe0             
ram:f000:b9e4   8bc7            MOV         AX,DI                                   
ram:f000:b9e6   b90300          MOV         CX,0x3                                  
ram:f000:b9e9   d3f8            SAR         AX,CL                                   
ram:f000:b9eb   8946fa          MOV         word ptr [BP + -0x6],AX                 
ram:f000:b9ee   8bc7            MOV         AX,DI                                   
ram:f000:b9f0   250300          AND         AX,0x3                                  
ram:f000:b9f3   8946f8          MOV         word ptr [BP + -0x8],AX                 
ram:f000:b9f6   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:b9f9   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:b9fc   044c            ADD         AL,0x4c                                 
ram:f000:b9fe   7303            JNC         LAB_f000_ba03                           
ram:f000:ba00   83c210          ADD         DX,0x10                                 
                            LAB_f000_ba03:                ;XREF[1,0]:   f000:b9fe
ram:f000:ba03   8b4efa          MOV         CX,word ptr [BP + -0x6]                 
ram:f000:ba06   be0500          MOV         SI,0x5                                  
ram:f000:ba09   87ce            XCHG        SI,CX                                   
ram:f000:ba0b   d3e6            SHL         SI,CL                                   
ram:f000:ba0d   87ce            XCHG        SI,CX                                   
ram:f000:ba0f   02c1            ADD         AL,CL                                   
ram:f000:ba11   7303            JNC         LAB_f000_ba16                           
ram:f000:ba13   83c210          ADD         DX,0x10                                 
                            LAB_f000_ba16:                ;XREF[1,0]:   f000:ba11
ram:f000:ba16   30c9            XOR         CL,CL                                   
ram:f000:ba18   d1f9            SAR         CX,1                                    
ram:f000:ba1a   d1f9            SAR         CX,1                                    
ram:f000:ba1c   d1f9            SAR         CX,1                                    
ram:f000:ba1e   d1f9            SAR         CX,1                                    
ram:f000:ba20   03d1            ADD         DX,CX                                   
ram:f000:ba22   8bf0            MOV         SI,AX                                   
ram:f000:ba24   8eda            MOV         DS,DX                                   
ram:f000:ba26   8a04            MOV         AL,byte ptr [SI]                        
ram:f000:ba28   30e4            XOR         AH,AH                                   
ram:f000:ba2a   eb34            JMP         LAB_f000_ba60                           
                            LAB_f000_ba2c:                ;XREF[1,0]:   f000:ba63
ram:f000:ba2c   ff7612          PUSH        word ptr [BP + 0x12]                    
ram:f000:ba2f   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:ba32   57              PUSH        DI                                      
ram:f000:ba33   9aaf00b0fb      CALLF       FUN_f000_bbaf                           ;uint FUN_f000_bbaf(void)
ram:f000:ba38   83c406          ADD         SP,0x6                                  
ram:f000:ba3b   8946f6          MOV         word ptr [BP + -0xa],AX                 
ram:f000:ba3e   eb40            JMP         LAB_f000_ba80                           
                            LAB_f000_ba40:                ;XREF[1,0]:   f000:ba68
ram:f000:ba40   ff7612          PUSH        word ptr [BP + 0x12]                    
ram:f000:ba43   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:ba46   57              PUSH        DI                                      
ram:f000:ba47   9aee0020fc      CALLF       FUN_f000_c2ee                           ;undefined2 FUN_f000_c2ee(void)
ram:f000:ba4c   83c406          ADD         SP,0x6                                  
ram:f000:ba4f   8946f6          MOV         word ptr [BP + -0xa],AX                 
ram:f000:ba52   eb2c            JMP         LAB_f000_ba80                           
                            LAB_f000_ba54:                ;XREF[4,0]:   f000:ba6d,f000:ba72,f000:ba77,f000:ba7c
ram:f000:ba54   c746f6fcff      MOV         word ptr [BP + -0xa],0xfffc             
ram:f000:ba59   eb25            JMP         LAB_f000_ba80                           
                            LAB_f000_ba5b:                ;XREF[1,0]:   f000:ba7e
ram:f000:ba5b   b80200          MOV         AX,0x2                                  
ram:f000:ba5e   eb54            JMP         LAB_f000_bab4                           
                            LAB_f000_ba60:                ;XREF[1,0]:   f000:ba2a
ram:f000:ba60   3d0000          CMP         AX,0x0                                  
ram:f000:ba63   74c7            JZ          LAB_f000_ba2c                           
ram:f000:ba65   3d0100          CMP         AX,0x1                                  
ram:f000:ba68   74d6            JZ          LAB_f000_ba40                           
ram:f000:ba6a   3d0200          CMP         AX,0x2                                  
ram:f000:ba6d   74e5            JZ          LAB_f000_ba54                           
ram:f000:ba6f   3d0300          CMP         AX,0x3                                  
ram:f000:ba72   74e0            JZ          LAB_f000_ba54                           
ram:f000:ba74   3d0400          CMP         AX,0x4                                  
ram:f000:ba77   74db            JZ          LAB_f000_ba54                           
ram:f000:ba79   3d0500          CMP         AX,0x5                                  
ram:f000:ba7c   74d6            JZ          LAB_f000_ba54                           
ram:f000:ba7e   ebdb            JMP         LAB_f000_ba5b                           
                            LAB_f000_ba80:                ;XREF[3,0]:   f000:ba3e,f000:ba52,f000:ba59
ram:f000:ba80   8b46f6          MOV         AX,word ptr [BP + -0xa]                 
ram:f000:ba83   eb14            JMP         LAB_f000_ba99                           
                            LAB_f000_ba85:                ;XREF[1,0]:   f000:bab0
ram:f000:ba85   b80000          MOV         AX,0x0                                  
ram:f000:ba88   eb2a            JMP         LAB_f000_bab4                           
                            LAB_f000_ba8a:                ;XREF[1,0]:   f000:baa1
ram:f000:ba8a   b86000          MOV         AX,0x60                                 
ram:f000:ba8d   eb25            JMP         LAB_f000_bab4                           
                            LAB_f000_ba8f:                ;XREF[1,0]:   f000:ba9c
ram:f000:ba8f   b88000          MOV         AX,0x80                                 
ram:f000:ba92   eb20            JMP         LAB_f000_bab4                           
                            LAB_f000_ba94:                ;XREF[3,0]:   f000:baa6,f000:baab,f000:bab2
ram:f000:ba94   b80200          MOV         AX,0x2                                  
ram:f000:ba97   eb1b            JMP         LAB_f000_bab4                           
                            LAB_f000_ba99:                ;XREF[1,0]:   f000:ba83
ram:f000:ba99   3dfcff          CMP         AX,0xfffc                               
ram:f000:ba9c   74f1            JZ          LAB_f000_ba8f                           
ram:f000:ba9e   3dfdff          CMP         AX,0xfffd                               
ram:f000:baa1   74e7            JZ          LAB_f000_ba8a                           
ram:f000:baa3   3dfeff          CMP         AX,0xfffe                               
ram:f000:baa6   74ec            JZ          LAB_f000_ba94                           
ram:f000:baa8   3dffff          CMP         AX,0xffff                               
ram:f000:baab   74e7            JZ          LAB_f000_ba94                           
ram:f000:baad   3d0000          CMP         AX,0x0                                  
ram:f000:bab0   74d3            JZ          LAB_f000_ba85                           
ram:f000:bab2   ebe0            JMP         LAB_f000_ba94                           
                            LAB_f000_bab4:                ;XREF[5,0]:   f000:ba5e,f000:ba88,f000:ba8d,f000:ba92
                                                          ;             f000:ba97
ram:f000:bab4   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void FUN_f000_bab9(void)
                                                          ;XREF[1,0]:   f000:b94e
ram:f000:bab9   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:babe   81ec1000        SUB         SP,0x10                                 
ram:f000:bac2   8b7e0e          MOV         DI,word ptr [BP + 0xe]                  
ram:f000:bac5   8bc7            MOV         AX,DI                                   
ram:f000:bac7   b90300          MOV         CX,0x3                                  
ram:f000:baca   d3f8            SAR         AX,CL                                   
ram:f000:bacc   8946fe          MOV         word ptr [BP + -0x2],AX                 
ram:f000:bacf   be101f          MOV         SI,0x1f10                               
ram:f000:bad2   8ede            MOV         DS,SI                                   
ram:f000:bad4   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:bad8   884404          MOV         byte ptr [SI + 0x4],AL                  
ram:f000:badb   8bc7            MOV         AX,DI                                   
ram:f000:badd   250300          AND         AX,0x3                                  
ram:f000:bae0   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:bae3   be101f          MOV         SI,0x1f10                               
ram:f000:bae6   8ede            MOV         DS,SI                                   
ram:f000:bae8   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:baec   884405          MOV         byte ptr [SI + 0x5],AL                  
ram:f000:baef   be101f          MOV         SI,0x1f10                               
ram:f000:baf2   8ede            MOV         DS,SI                                   
ram:f000:baf4   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:baf8   c744260000      MOV         word ptr [SI + 0x26],0x0                
ram:f000:bafd   c744280000      MOV         word ptr [SI + 0x28],0x0                
ram:f000:bb02   be101f          MOV         SI,0x1f10                               
ram:f000:bb05   8ede            MOV         DS,SI                                   
ram:f000:bb07   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:bb0b   c744220000      MOV         word ptr [SI + 0x22],0x0                
ram:f000:bb10   c744240000      MOV         word ptr [SI + 0x24],0x0                
ram:f000:bb15   be101f          MOV         SI,0x1f10                               
ram:f000:bb18   8ede            MOV         DS,SI                                   
ram:f000:bb1a   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:bb1e   c7441e0000      MOV         word ptr [SI + 0x1e],0x0                
ram:f000:bb23   c744200000      MOV         word ptr [SI + 0x20],0x0                
ram:f000:bb28   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:bb2b   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:bb2e   2c10            SUB         AL,0x10                                 
ram:f000:bb30   7303            JNC         LAB_f000_bb35                           
ram:f000:bb32   83ea10          SUB         DX,0x10                                 
                            LAB_f000_bb35:                ;XREF[1,0]:   f000:bb30
ram:f000:bb35   d1ea            SHR         DX,1                                    
ram:f000:bb37   d1ea            SHR         DX,1                                    
ram:f000:bb39   d1ea            SHR         DX,1                                    
ram:f000:bb3b   d1ea            SHR         DX,1                                    
ram:f000:bb3d   86d4            XCHG        AH,DL                                   
ram:f000:bb3f   86f2            XCHG        DL,DH                                   
ram:f000:bb41   be101f          MOV         SI,0x1f10                               
ram:f000:bb44   8ede            MOV         DS,SI                                   
ram:f000:bb46   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:bb4a   89441a          MOV         word ptr [SI + 0x1a],AX                 
ram:f000:bb4d   89541c          MOV         word ptr [SI + 0x1c],DX                 
ram:f000:bb50   be101f          MOV         SI,0x1f10                               
ram:f000:bb53   8ede            MOV         DS,SI                                   
ram:f000:bb55   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:bb59   c7042000        MOV         word ptr [SI],0x20                      
ram:f000:bb5d   b80000          MOV         AX,0x0                                  
ram:f000:bb60   50              PUSH        AX                                      
ram:f000:bb61   b80000          MOV         AX,0x0                                  
ram:f000:bb64   50              PUSH        AX                                      
ram:f000:bb65   b80000          MOV         AX,0x0                                  
ram:f000:bb68   50              PUSH        AX                                      
ram:f000:bb69   b80000          MOV         AX,0x0                                  
ram:f000:bb6c   50              PUSH        AX                                      
ram:f000:bb6d   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:bb70   b90500          MOV         CX,0x5                                  
ram:f000:bb73   d3e0            SHL         AX,CL                                   
ram:f000:bb75   50              PUSH        AX                                      
ram:f000:bb76   b80000          MOV         AX,0x0                                  
ram:f000:bb79   50              PUSH        AX                                      
ram:f000:bb7a   b80600          MOV         AX,0x6                                  
ram:f000:bb7d   50              PUSH        AX                                      
ram:f000:bb7e   b8101f          MOV         AX,0x1f10                               
ram:f000:bb81   8ed8            MOV         DS,AX                                   
ram:f000:bb83   ff36b600        PUSH        word ptr [offset SCSI_CMD_PTR_SEG &0xff]
ram:f000:bb87   ff36b400        PUSH        word ptr [offset SCSI_CMD_PTR &0xff]    
ram:f000:bb8b   9a800060fa      CALLF       FUN_f000_a680                           ;void FUN_f000_a680(void)
ram:f000:bb90   83c412          ADD         SP,0x12                                 
ram:f000:bb93   9ab400d0f9      CALLF       scsi_select_with_attn                   ;void scsi_select_with_attn(void)
ram:f000:bb98   b80000          MOV         AX,0x0                                  
ram:f000:bb9b   50              PUSH        AX                                      
ram:f000:bb9c   b8e803          MOV         AX,0x3e8                                
ram:f000:bb9f   50              PUSH        AX                                      
ram:f000:bba0   9a1900e0f9      CALLF       FUN_f000_9e19                           ;undefined2 FUN_f000_9e19(void)
ram:f000:bba5   83c404          ADD         SP,0x4                                  
ram:f000:bba8   eb00            JMP         LAB_f000_bbaa                           
                            LAB_f000_bbaa:                ;XREF[1,0]:   f000:bba8
ram:f000:bbaa   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;uint FUN_f000_bbaf(void)
                                                          ;XREF[1,0]:   f000:ba33
ram:f000:bbaf   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:bbb4   81ec2800        SUB         SP,0x28                                 
ram:f000:bbb8   8b460e          MOV         AX,word ptr [BP + 0xe]                  
ram:f000:bbbb   b90300          MOV         CX,0x3                                  
ram:f000:bbbe   d3f8            SAR         AX,CL                                   
ram:f000:bbc0   8946fe          MOV         word ptr [BP + -0x2],AX                 
ram:f000:bbc3   be101f          MOV         SI,0x1f10                               
ram:f000:bbc6   8ede            MOV         DS,SI                                   
ram:f000:bbc8   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:bbcc   884404          MOV         byte ptr [SI + 0x4],AL                  
ram:f000:bbcf   8b460e          MOV         AX,word ptr [BP + 0xe]                  
ram:f000:bbd2   250300          AND         AX,0x3                                  
ram:f000:bbd5   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:bbd8   be101f          MOV         SI,0x1f10                               
ram:f000:bbdb   8ede            MOV         DS,SI                                   
ram:f000:bbdd   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:bbe1   884405          MOV         byte ptr [SI + 0x5],AL                  
ram:f000:bbe4   be101f          MOV         SI,0x1f10                               
ram:f000:bbe7   8ede            MOV         DS,SI                                   
ram:f000:bbe9   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:bbed   c744260000      MOV         word ptr [SI + 0x26],0x0                
ram:f000:bbf2   c744280000      MOV         word ptr [SI + 0x28],0x0                
ram:f000:bbf7   c57610          LDS         SI,[BP + 0x10]                          
ram:f000:bbfa   8b440a          MOV         AX,word ptr [SI + 0xa]                  
ram:f000:bbfd   8b540c          MOV         DX,word ptr [SI + 0xc]                  
ram:f000:bc00   be101f          MOV         SI,0x1f10                               
ram:f000:bc03   8ede            MOV         DS,SI                                   
ram:f000:bc05   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:bc09   894422          MOV         word ptr [SI + 0x22],AX                 
ram:f000:bc0c   895424          MOV         word ptr [SI + 0x24],DX                 
ram:f000:bc0f   c57610          LDS         SI,[BP + 0x10]                          
ram:f000:bc12   8b440a          MOV         AX,word ptr [SI + 0xa]                  
ram:f000:bc15   8b540c          MOV         DX,word ptr [SI + 0xc]                  
ram:f000:bc18   be101f          MOV         SI,0x1f10                               
ram:f000:bc1b   8ede            MOV         DS,SI                                   
ram:f000:bc1d   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:bc21   89441e          MOV         word ptr [SI + 0x1e],AX                 
ram:f000:bc24   895420          MOV         word ptr [SI + 0x20],DX                 
ram:f000:bc27   c57610          LDS         SI,[BP + 0x10]                          
ram:f000:bc2a   8b04            MOV         AX,word ptr [SI]                        
ram:f000:bc2c   a90200          TEST        AX,0x2                                  
ram:f000:bc2f   740f            JZ          LAB_f000_bc40                           
ram:f000:bc31   be101f          MOV         SI,0x1f10                               
ram:f000:bc34   8ede            MOV         DS,SI                                   
ram:f000:bc36   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:bc3a   c7042000        MOV         word ptr [SI],0x20                      
ram:f000:bc3e   eb0d            JMP         LAB_f000_bc4d                           
                            LAB_f000_bc40:                ;XREF[1,0]:   f000:bc2f
ram:f000:bc40   be101f          MOV         SI,0x1f10                               
ram:f000:bc43   8ede            MOV         DS,SI                                   
ram:f000:bc45   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:bc49   c7040000        MOV         word ptr [SI],0x0                       
                            LAB_f000_bc4d:                ;XREF[1,0]:   f000:bc3e
ram:f000:bc4d   c57610          LDS         SI,[BP + 0x10]                          
ram:f000:bc50   8b04            MOV         AX,word ptr [SI]                        
ram:f000:bc52   a90100          TEST        AX,0x1                                  
ram:f000:bc55   7503            JNZ         LAB_f000_bc5a                           
ram:f000:bc57   e9b900          JMP         LAB_f000_bd13                           
                            LAB_f000_bc5a:                ;XREF[1,0]:   f000:bc55
ram:f000:bc5a   b80000          MOV         AX,0x0                                  
ram:f000:bc5d   50              PUSH        AX                                      
ram:f000:bc5e   b80000          MOV         AX,0x0                                  
ram:f000:bc61   50              PUSH        AX                                      
ram:f000:bc62   b80002          MOV         AX,0x200                                
ram:f000:bc65   50              PUSH        AX                                      
ram:f000:bc66   c57610          LDS         SI,[BP + 0x10]                          
ram:f000:bc69   8b440a          MOV         AX,word ptr [SI + 0xa]                  
ram:f000:bc6c   8b540c          MOV         DX,word ptr [SI + 0xc]                  
ram:f000:bc6f   05ff01          ADD         AX,0x1ff                                
ram:f000:bc72   83d200          ADC         DX,0x0                                  
ram:f000:bc75   52              PUSH        DX                                      
ram:f000:bc76   50              PUSH        AX                                      
ram:f000:bc77   9aff00c0fd      CALLF       FUN_f000_dcff                           ;uint FUN_f000_dcff(uint param_1, uin...
ram:f000:bc7c   83c408          ADD         SP,0x8                                  
ram:f000:bc7f   50              PUSH        AX                                      
ram:f000:bc80   c57610          LDS         SI,[BP + 0x10]                          
ram:f000:bc83   8b4402          MOV         AX,word ptr [SI + 0x2]                  
ram:f000:bc86   8b5404          MOV         DX,word ptr [SI + 0x4]                  
ram:f000:bc89   25ff00          AND         AX,0xff                                 
ram:f000:bc8c   81e20000        AND         DX,0x0                                  
ram:f000:bc90   50              PUSH        AX                                      
ram:f000:bc91   c57610          LDS         SI,[BP + 0x10]                          
ram:f000:bc94   8b4402          MOV         AX,word ptr [SI + 0x2]                  
ram:f000:bc97   8b5404          MOV         DX,word ptr [SI + 0x4]                  
ram:f000:bc9a   b90800          MOV         CX,0x8                                  
ram:f000:bc9d   e306            JCXZ        LAB_f000_bca5                           
                            LAB_f000_bc9f:                ;XREF[1,0]:   f000:bca3
ram:f000:bc9f   d1fa            SAR         DX,1                                    
ram:f000:bca1   d1d8            RCR         AX,1                                    
ram:f000:bca3   e2fa            LOOP        LAB_f000_bc9f                           
                            LAB_f000_bca5:                ;XREF[1,0]:   f000:bc9d
ram:f000:bca5   25ff00          AND         AX,0xff                                 
ram:f000:bca8   81e20000        AND         DX,0x0                                  
ram:f000:bcac   50              PUSH        AX                                      
ram:f000:bcad   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:bcb0   b90500          MOV         CX,0x5                                  
ram:f000:bcb3   d3e0            SHL         AX,CL                                   
ram:f000:bcb5   99              CWD                                                  
ram:f000:bcb6   c57610          LDS         SI,[BP + 0x10]                          
ram:f000:bcb9   8b4c02          MOV         CX,word ptr [SI + 0x2]                  
ram:f000:bcbc   8b5c04          MOV         BX,word ptr [SI + 0x4]                  
ram:f000:bcbf   be1000          MOV         SI,0x10                                 
ram:f000:bcc2   87ce            XCHG        SI,CX                                   
ram:f000:bcc4   e306            JCXZ        LAB_f000_bccc                           
                            LAB_f000_bcc6:                ;XREF[1,0]:   f000:bcca
ram:f000:bcc6   d1fb            SAR         BX,1                                    
ram:f000:bcc8   d1de            RCR         SI,1                                    
ram:f000:bcca   e2fa            LOOP        LAB_f000_bcc6                           
                            LAB_f000_bccc:                ;XREF[1,0]:   f000:bcc4
ram:f000:bccc   87ce            XCHG        SI,CX                                   
ram:f000:bcce   81e11f00        AND         CX,0x1f                                 
ram:f000:bcd2   81e30000        AND         BX,0x0                                  
ram:f000:bcd6   0bc1            OR          AX,CX                                   
ram:f000:bcd8   0bd3            OR          DX,BX                                   
ram:f000:bcda   50              PUSH        AX                                      
ram:f000:bcdb   b80800          MOV         AX,0x8                                  
ram:f000:bcde   50              PUSH        AX                                      
ram:f000:bcdf   b80600          MOV         AX,0x6                                  
ram:f000:bce2   50              PUSH        AX                                      
ram:f000:bce3   b8101f          MOV         AX,0x1f10                               
ram:f000:bce6   8ed8            MOV         DS,AX                                   
ram:f000:bce8   ff36b600        PUSH        word ptr [offset SCSI_CMD_PTR_SEG &0xff]
ram:f000:bcec   ff36b400        PUSH        word ptr [offset SCSI_CMD_PTR &0xff]    
ram:f000:bcf0   9a800060fa      CALLF       FUN_f000_a680                           ;void FUN_f000_a680(void)
ram:f000:bcf5   83c412          ADD         SP,0x12                                 
ram:f000:bcf8   c57610          LDS         SI,[BP + 0x10]                          
ram:f000:bcfb   8b4406          MOV         AX,word ptr [SI + 0x6]                  
ram:f000:bcfe   8b5408          MOV         DX,word ptr [SI + 0x8]                  
ram:f000:bd01   be101f          MOV         SI,0x1f10                               
ram:f000:bd04   8ede            MOV         DS,SI                                   
ram:f000:bd06   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:bd0a   89441a          MOV         word ptr [SI + 0x1a],AX                 
ram:f000:bd0d   89541c          MOV         word ptr [SI + 0x1c],DX                 
ram:f000:bd10   e9b600          JMP         LAB_f000_bdc9                           
                            LAB_f000_bd13:                ;XREF[1,0]:   f000:bc57
ram:f000:bd13   b80000          MOV         AX,0x0                                  
ram:f000:bd16   50              PUSH        AX                                      
ram:f000:bd17   b80000          MOV         AX,0x0                                  
ram:f000:bd1a   50              PUSH        AX                                      
ram:f000:bd1b   b80002          MOV         AX,0x200                                
ram:f000:bd1e   50              PUSH        AX                                      
ram:f000:bd1f   c57610          LDS         SI,[BP + 0x10]                          
ram:f000:bd22   8b440a          MOV         AX,word ptr [SI + 0xa]                  
ram:f000:bd25   8b540c          MOV         DX,word ptr [SI + 0xc]                  
ram:f000:bd28   05ff01          ADD         AX,0x1ff                                
ram:f000:bd2b   83d200          ADC         DX,0x0                                  
ram:f000:bd2e   52              PUSH        DX                                      
ram:f000:bd2f   50              PUSH        AX                                      
ram:f000:bd30   9aff00c0fd      CALLF       FUN_f000_dcff                           ;uint FUN_f000_dcff(uint param_1, uin...
ram:f000:bd35   83c408          ADD         SP,0x8                                  
ram:f000:bd38   50              PUSH        AX                                      
ram:f000:bd39   c57610          LDS         SI,[BP + 0x10]                          
ram:f000:bd3c   8b4406          MOV         AX,word ptr [SI + 0x6]                  
ram:f000:bd3f   8b5408          MOV         DX,word ptr [SI + 0x8]                  
ram:f000:bd42   25ff00          AND         AX,0xff                                 
ram:f000:bd45   81e20000        AND         DX,0x0                                  
ram:f000:bd49   50              PUSH        AX                                      
ram:f000:bd4a   c57610          LDS         SI,[BP + 0x10]                          
ram:f000:bd4d   8b4406          MOV         AX,word ptr [SI + 0x6]                  
ram:f000:bd50   8b5408          MOV         DX,word ptr [SI + 0x8]                  
ram:f000:bd53   b90800          MOV         CX,0x8                                  
ram:f000:bd56   e306            JCXZ        LAB_f000_bd5e                           
                            LAB_f000_bd58:                ;XREF[1,0]:   f000:bd5c
ram:f000:bd58   d1fa            SAR         DX,1                                    
ram:f000:bd5a   d1d8            RCR         AX,1                                    
ram:f000:bd5c   e2fa            LOOP        LAB_f000_bd58                           
                            LAB_f000_bd5e:                ;XREF[1,0]:   f000:bd56
ram:f000:bd5e   25ff00          AND         AX,0xff                                 
ram:f000:bd61   81e20000        AND         DX,0x0                                  
ram:f000:bd65   50              PUSH        AX                                      
ram:f000:bd66   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:bd69   b90500          MOV         CX,0x5                                  
ram:f000:bd6c   d3e0            SHL         AX,CL                                   
ram:f000:bd6e   99              CWD                                                  
ram:f000:bd6f   c57610          LDS         SI,[BP + 0x10]                          
ram:f000:bd72   8b4c06          MOV         CX,word ptr [SI + 0x6]                  
ram:f000:bd75   8b5c08          MOV         BX,word ptr [SI + 0x8]                  
ram:f000:bd78   be1000          MOV         SI,0x10                                 
ram:f000:bd7b   87ce            XCHG        SI,CX                                   
ram:f000:bd7d   e306            JCXZ        LAB_f000_bd85                           
                            LAB_f000_bd7f:                ;XREF[1,0]:   f000:bd83
ram:f000:bd7f   d1fb            SAR         BX,1                                    
ram:f000:bd81   d1de            RCR         SI,1                                    
ram:f000:bd83   e2fa            LOOP        LAB_f000_bd7f                           
                            LAB_f000_bd85:                ;XREF[1,0]:   f000:bd7d
ram:f000:bd85   87ce            XCHG        SI,CX                                   
ram:f000:bd87   81e11f00        AND         CX,0x1f                                 
ram:f000:bd8b   81e30000        AND         BX,0x0                                  
ram:f000:bd8f   0bc1            OR          AX,CX                                   
ram:f000:bd91   0bd3            OR          DX,BX                                   
ram:f000:bd93   50              PUSH        AX                                      
ram:f000:bd94   b80a00          MOV         AX,0xa                                  
ram:f000:bd97   50              PUSH        AX                                      
ram:f000:bd98   b80600          MOV         AX,0x6                                  
ram:f000:bd9b   50              PUSH        AX                                      
ram:f000:bd9c   b8101f          MOV         AX,0x1f10                               
ram:f000:bd9f   8ed8            MOV         DS,AX                                   
ram:f000:bda1   ff36b600        PUSH        word ptr [offset SCSI_CMD_PTR_SEG &0xff]
ram:f000:bda5   ff36b400        PUSH        word ptr [offset SCSI_CMD_PTR &0xff]    
ram:f000:bda9   9a800060fa      CALLF       FUN_f000_a680                           ;void FUN_f000_a680(void)
ram:f000:bdae   83c412          ADD         SP,0x12                                 
ram:f000:bdb1   c57610          LDS         SI,[BP + 0x10]                          
ram:f000:bdb4   8b4402          MOV         AX,word ptr [SI + 0x2]                  
ram:f000:bdb7   8b5404          MOV         DX,word ptr [SI + 0x4]                  
ram:f000:bdba   be101f          MOV         SI,0x1f10                               
ram:f000:bdbd   8ede            MOV         DS,SI                                   
ram:f000:bdbf   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:bdc3   89441a          MOV         word ptr [SI + 0x1a],AX                 
ram:f000:bdc6   89541c          MOV         word ptr [SI + 0x1c],DX                 
                            LAB_f000_bdc9:                ;XREF[1,0]:   f000:bd10
ram:f000:bdc9   9ab400d0f9      CALLF       scsi_select_with_attn                   ;void scsi_select_with_attn(void)
ram:f000:bdce   b80000          MOV         AX,0x0                                  
ram:f000:bdd1   50              PUSH        AX                                      
ram:f000:bdd2   b8e803          MOV         AX,0x3e8                                
ram:f000:bdd5   50              PUSH        AX                                      
ram:f000:bdd6   9a1900e0f9      CALLF       FUN_f000_9e19                           ;undefined2 FUN_f000_9e19(void)
ram:f000:bddb   83c404          ADD         SP,0x4                                  
ram:f000:bdde   8946fa          MOV         word ptr [BP + -0x6],AX                 
ram:f000:bde1   3dfdff          CMP         AX,0xfffd                               
ram:f000:bde4   7403            JZ          LAB_f000_bde9                           
ram:f000:bde6   e9ed00          JMP         LAB_f000_bed6                           
                            LAB_f000_bde9:                ;XREF[1,0]:   f000:bde4
ram:f000:bde9   c746d80800      MOV         word ptr [BP + -0x28],0x8               
ram:f000:bdee   be101f          MOV         SI,0x1f10                               
ram:f000:bdf1   8ede            MOV         DS,SI                                   
ram:f000:bdf3   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:bdf7   c744260000      MOV         word ptr [SI + 0x26],0x0                
ram:f000:bdfc   c744280000      MOV         word ptr [SI + 0x28],0x0                
ram:f000:be01   8b46d8          MOV         AX,word ptr [BP + -0x28]                
ram:f000:be04   99              CWD                                                  
ram:f000:be05   be101f          MOV         SI,0x1f10                               
ram:f000:be08   8ede            MOV         DS,SI                                   
ram:f000:be0a   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:be0e   894422          MOV         word ptr [SI + 0x22],AX                 
ram:f000:be11   895424          MOV         word ptr [SI + 0x24],DX                 
ram:f000:be14   8b46d8          MOV         AX,word ptr [BP + -0x28]                
ram:f000:be17   99              CWD                                                  
ram:f000:be18   be101f          MOV         SI,0x1f10                               
ram:f000:be1b   8ede            MOV         DS,SI                                   
ram:f000:be1d   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:be21   89441e          MOV         word ptr [SI + 0x1e],AX                 
ram:f000:be24   895420          MOV         word ptr [SI + 0x20],DX                 
ram:f000:be27   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:be2a   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:be2d   2c26            SUB         AL,0x26                                 
ram:f000:be2f   7303            JNC         LAB_f000_be34                           
ram:f000:be31   83ea10          SUB         DX,0x10                                 
                            LAB_f000_be34:                ;XREF[1,0]:   f000:be2f
ram:f000:be34   d1ea            SHR         DX,1                                    
ram:f000:be36   d1ea            SHR         DX,1                                    
ram:f000:be38   d1ea            SHR         DX,1                                    
ram:f000:be3a   d1ea            SHR         DX,1                                    
ram:f000:be3c   86d4            XCHG        AH,DL                                   
ram:f000:be3e   86f2            XCHG        DL,DH                                   
ram:f000:be40   be101f          MOV         SI,0x1f10                               
ram:f000:be43   8ede            MOV         DS,SI                                   
ram:f000:be45   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:be49   89441a          MOV         word ptr [SI + 0x1a],AX                 
ram:f000:be4c   89541c          MOV         word ptr [SI + 0x1c],DX                 
ram:f000:be4f   be101f          MOV         SI,0x1f10                               
ram:f000:be52   8ede            MOV         DS,SI                                   
ram:f000:be54   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:be58   c7042000        MOV         word ptr [SI],0x20                      
ram:f000:be5c   b80000          MOV         AX,0x0                                  
ram:f000:be5f   50              PUSH        AX                                      
ram:f000:be60   ff76d8          PUSH        word ptr [BP + -0x28]                   
ram:f000:be63   b80000          MOV         AX,0x0                                  
ram:f000:be66   50              PUSH        AX                                      
ram:f000:be67   b80000          MOV         AX,0x0                                  
ram:f000:be6a   50              PUSH        AX                                      
ram:f000:be6b   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:be6e   b90500          MOV         CX,0x5                                  
ram:f000:be71   d3e0            SHL         AX,CL                                   
ram:f000:be73   50              PUSH        AX                                      
ram:f000:be74   b80300          MOV         AX,0x3                                  
ram:f000:be77   50              PUSH        AX                                      
ram:f000:be78   b80600          MOV         AX,0x6                                  
ram:f000:be7b   50              PUSH        AX                                      
ram:f000:be7c   b8101f          MOV         AX,0x1f10                               
ram:f000:be7f   8ed8            MOV         DS,AX                                   
ram:f000:be81   ff36b600        PUSH        word ptr [offset SCSI_CMD_PTR_SEG &0xff]
ram:f000:be85   ff36b400        PUSH        word ptr [offset SCSI_CMD_PTR &0xff]    
ram:f000:be89   9a800060fa      CALLF       FUN_f000_a680                           ;void FUN_f000_a680(void)
ram:f000:be8e   83c412          ADD         SP,0x12                                 
ram:f000:be91   9ab400d0f9      CALLF       scsi_select_with_attn                   ;void scsi_select_with_attn(void)
ram:f000:be96   b80000          MOV         AX,0x0                                  
ram:f000:be99   50              PUSH        AX                                      
ram:f000:be9a   b8e803          MOV         AX,0x3e8                                
ram:f000:be9d   50              PUSH        AX                                      
ram:f000:be9e   9a1900e0f9      CALLF       FUN_f000_9e19                           ;undefined2 FUN_f000_9e19(void)
ram:f000:bea3   83c404          ADD         SP,0x4                                  
ram:f000:bea6   8946fa          MOV         word ptr [BP + -0x6],AX                 
ram:f000:bea9   85c0            TEST        AX,AX                                   
ram:f000:beab   7405            JZ          LAB_f000_beb2                           
ram:f000:bead   8b46fa          MOV         AX,word ptr [BP + -0x6]                 
ram:f000:beb0   eb29            JMP         LAB_f000_bedb                           
                            LAB_f000_beb2:                ;XREF[1,0]:   f000:beab
ram:f000:beb2   8a46da          MOV         AL,byte ptr [BP + -0x26]                
ram:f000:beb5   30e4            XOR         AH,AH                                   
ram:f000:beb7   257f00          AND         AX,0x7f                                 
ram:f000:beba   3d7000          CMP         AX,0x70                                 
ram:f000:bebd   7512            JNZ         LAB_f000_bed1                           
ram:f000:bebf   8a46dc          MOV         AL,byte ptr [BP + -0x24]                
ram:f000:bec2   30e4            XOR         AH,AH                                   
ram:f000:bec4   250f00          AND         AX,0xf                                  
ram:f000:bec7   3d0100          CMP         AX,0x1                                  
ram:f000:beca   7505            JNZ         LAB_f000_bed1                           
ram:f000:becc   b80000          MOV         AX,0x0                                  
ram:f000:becf   eb0a            JMP         LAB_f000_bedb                           
                            LAB_f000_bed1:                ;XREF[2,0]:   f000:bebd,f000:beca
ram:f000:bed1   b8fdff          MOV         AX,0xfffd                               
ram:f000:bed4   eb05            JMP         LAB_f000_bedb                           
                            LAB_f000_bed6:                ;XREF[1,0]:   f000:bde6
ram:f000:bed6   8b46fa          MOV         AX,word ptr [BP + -0x6]                 
ram:f000:bed9   eb00            JMP         LAB_f000_bedb                           
                            LAB_f000_bedb:                ;XREF[4,0]:   f000:beb0,f000:becf,f000:bed4,f000:bed9
ram:f000:bedb   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;uint FUN_f000_bee0(void)
                                                          ;XREF[1,0]:   f000:b95c
ram:f000:bee0   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:bee5   81ec1400        SUB         SP,0x14                                 
ram:f000:bee9   8b460e          MOV         AX,word ptr [BP + 0xe]                  
ram:f000:beec   b90300          MOV         CX,0x3                                  
ram:f000:beef   d3f8            SAR         AX,CL                                   
ram:f000:bef1   8946fe          MOV         word ptr [BP + -0x2],AX                 
ram:f000:bef4   be101f          MOV         SI,0x1f10                               
ram:f000:bef7   8ede            MOV         DS,SI                                   
ram:f000:bef9   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:befd   884404          MOV         byte ptr [SI + 0x4],AL                  
ram:f000:bf00   8b460e          MOV         AX,word ptr [BP + 0xe]                  
ram:f000:bf03   250300          AND         AX,0x3                                  
ram:f000:bf06   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:bf09   be101f          MOV         SI,0x1f10                               
ram:f000:bf0c   8ede            MOV         DS,SI                                   
ram:f000:bf0e   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:bf12   884405          MOV         byte ptr [SI + 0x5],AL                  
ram:f000:bf15   be101f          MOV         SI,0x1f10                               
ram:f000:bf18   8ede            MOV         DS,SI                                   
ram:f000:bf1a   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:bf1e   c744260000      MOV         word ptr [SI + 0x26],0x0                
ram:f000:bf23   c744280000      MOV         word ptr [SI + 0x28],0x0                
ram:f000:bf28   be101f          MOV         SI,0x1f10                               
ram:f000:bf2b   8ede            MOV         DS,SI                                   
ram:f000:bf2d   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:bf31   c744220000      MOV         word ptr [SI + 0x22],0x0                
ram:f000:bf36   c744240000      MOV         word ptr [SI + 0x24],0x0                
ram:f000:bf3b   be101f          MOV         SI,0x1f10                               
ram:f000:bf3e   8ede            MOV         DS,SI                                   
ram:f000:bf40   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:bf44   c7441e0000      MOV         word ptr [SI + 0x1e],0x0                
ram:f000:bf49   c744200000      MOV         word ptr [SI + 0x20],0x0                
ram:f000:bf4e   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:bf51   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:bf54   2c14            SUB         AL,0x14                                 
ram:f000:bf56   7303            JNC         LAB_f000_bf5b                           
ram:f000:bf58   83ea10          SUB         DX,0x10                                 
                            LAB_f000_bf5b:                ;XREF[1,0]:   f000:bf56
ram:f000:bf5b   d1ea            SHR         DX,1                                    
ram:f000:bf5d   d1ea            SHR         DX,1                                    
ram:f000:bf5f   d1ea            SHR         DX,1                                    
ram:f000:bf61   d1ea            SHR         DX,1                                    
ram:f000:bf63   86d4            XCHG        AH,DL                                   
ram:f000:bf65   86f2            XCHG        DL,DH                                   
ram:f000:bf67   be101f          MOV         SI,0x1f10                               
ram:f000:bf6a   8ede            MOV         DS,SI                                   
ram:f000:bf6c   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:bf70   89441a          MOV         word ptr [SI + 0x1a],AX                 
ram:f000:bf73   89541c          MOV         word ptr [SI + 0x1c],DX                 
ram:f000:bf76   be101f          MOV         SI,0x1f10                               
ram:f000:bf79   8ede            MOV         DS,SI                                   
ram:f000:bf7b   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:bf7f   c7042000        MOV         word ptr [SI],0x20                      
ram:f000:bf83   b80000          MOV         AX,0x0                                  
ram:f000:bf86   50              PUSH        AX                                      
ram:f000:bf87   b80000          MOV         AX,0x0                                  
ram:f000:bf8a   50              PUSH        AX                                      
ram:f000:bf8b   b80000          MOV         AX,0x0                                  
ram:f000:bf8e   50              PUSH        AX                                      
ram:f000:bf8f   b80000          MOV         AX,0x0                                  
ram:f000:bf92   50              PUSH        AX                                      
ram:f000:bf93   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:bf96   b90500          MOV         CX,0x5                                  
ram:f000:bf99   d3e0            SHL         AX,CL                                   
ram:f000:bf9b   50              PUSH        AX                                      
ram:f000:bf9c   b80000          MOV         AX,0x0                                  
ram:f000:bf9f   50              PUSH        AX                                      
ram:f000:bfa0   b80600          MOV         AX,0x6                                  
ram:f000:bfa3   50              PUSH        AX                                      
ram:f000:bfa4   b8101f          MOV         AX,0x1f10                               
ram:f000:bfa7   8ed8            MOV         DS,AX                                   
ram:f000:bfa9   ff36b600        PUSH        word ptr [offset SCSI_CMD_PTR_SEG &0xff]
ram:f000:bfad   ff36b400        PUSH        word ptr [offset SCSI_CMD_PTR &0xff]    
ram:f000:bfb1   9a800060fa      CALLF       FUN_f000_a680                           ;void FUN_f000_a680(void)
ram:f000:bfb6   83c412          ADD         SP,0x12                                 
ram:f000:bfb9   9ab400d0f9      CALLF       scsi_select_with_attn                   ;void scsi_select_with_attn(void)
ram:f000:bfbe   b80000          MOV         AX,0x0                                  
ram:f000:bfc1   50              PUSH        AX                                      
ram:f000:bfc2   b8e803          MOV         AX,0x3e8                                
ram:f000:bfc5   50              PUSH        AX                                      
ram:f000:bfc6   9a1900e0f9      CALLF       FUN_f000_9e19                           ;undefined2 FUN_f000_9e19(void)
ram:f000:bfcb   83c404          ADD         SP,0x4                                  
ram:f000:bfce   8946fa          MOV         word ptr [BP + -0x6],AX                 
ram:f000:bfd1   3dfdff          CMP         AX,0xfffd                               
ram:f000:bfd4   7559            JNZ         LAB_f000_c02f                           
ram:f000:bfd6   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:bfd9   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:bfdc   2c14            SUB         AL,0x14                                 
ram:f000:bfde   7303            JNC         LAB_f000_bfe3                           
ram:f000:bfe0   83ea10          SUB         DX,0x10                                 
                            LAB_f000_bfe3:                ;XREF[1,0]:   f000:bfde
ram:f000:bfe3   d1ea            SHR         DX,1                                    
ram:f000:bfe5   d1ea            SHR         DX,1                                    
ram:f000:bfe7   d1ea            SHR         DX,1                                    
ram:f000:bfe9   d1ea            SHR         DX,1                                    
ram:f000:bfeb   86d4            XCHG        AH,DL                                   
ram:f000:bfed   86f2            XCHG        DL,DH                                   
ram:f000:bfef   be101f          MOV         SI,0x1f10                               
ram:f000:bff2   8ede            MOV         DS,SI                                   
ram:f000:bff4   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:bff8   89441a          MOV         word ptr [SI + 0x1a],AX                 
ram:f000:bffb   89541c          MOV         word ptr [SI + 0x1c],DX                 
ram:f000:bffe   be101f          MOV         SI,0x1f10                               
ram:f000:c001   8ede            MOV         DS,SI                                   
ram:f000:c003   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c007   c7042000        MOV         word ptr [SI],0x20                      
ram:f000:c00b   9ab400d0f9      CALLF       scsi_select_with_attn                   ;void scsi_select_with_attn(void)
ram:f000:c010   b80000          MOV         AX,0x0                                  
ram:f000:c013   50              PUSH        AX                                      
ram:f000:c014   b8e803          MOV         AX,0x3e8                                
ram:f000:c017   50              PUSH        AX                                      
ram:f000:c018   9a1900e0f9      CALLF       FUN_f000_9e19                           ;undefined2 FUN_f000_9e19(void)
ram:f000:c01d   83c404          ADD         SP,0x4                                  
ram:f000:c020   8946fa          MOV         word ptr [BP + -0x6],AX                 
ram:f000:c023   85c0            TEST        AX,AX                                   
ram:f000:c025   7406            JZ          LAB_f000_c02d                           
ram:f000:c027   8b46fa          MOV         AX,word ptr [BP + -0x6]                 
ram:f000:c02a   e9bc02          JMP         LAB_f000_c2e9                           
                            LAB_f000_c02d:                ;XREF[1,0]:   f000:c025
ram:f000:c02d   eb0d            JMP         LAB_f000_c03c                           
                            LAB_f000_c02f:                ;XREF[1,0]:   f000:bfd4
ram:f000:c02f   f746faffff      TEST        word ptr [BP + -0x6],0xffff             
ram:f000:c034   7406            JZ          LAB_f000_c03c                           
ram:f000:c036   8b46fa          MOV         AX,word ptr [BP + -0x6]                 
ram:f000:c039   e9ad02          JMP         LAB_f000_c2e9                           
                            LAB_f000_c03c:                ;XREF[2,0]:   f000:c02d,f000:c034
ram:f000:c03c   be101f          MOV         SI,0x1f10                               
ram:f000:c03f   8ede            MOV         DS,SI                                   
ram:f000:c041   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c045   c744260000      MOV         word ptr [SI + 0x26],0x0                
ram:f000:c04a   c744280000      MOV         word ptr [SI + 0x28],0x0                
ram:f000:c04f   be101f          MOV         SI,0x1f10                               
ram:f000:c052   8ede            MOV         DS,SI                                   
ram:f000:c054   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c058   c744220000      MOV         word ptr [SI + 0x22],0x0                
ram:f000:c05d   c744240000      MOV         word ptr [SI + 0x24],0x0                
ram:f000:c062   be101f          MOV         SI,0x1f10                               
ram:f000:c065   8ede            MOV         DS,SI                                   
ram:f000:c067   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c06b   c7441e0000      MOV         word ptr [SI + 0x1e],0x0                
ram:f000:c070   c744200000      MOV         word ptr [SI + 0x20],0x0                
ram:f000:c075   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:c078   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:c07b   2c14            SUB         AL,0x14                                 
ram:f000:c07d   7303            JNC         LAB_f000_c082                           
ram:f000:c07f   83ea10          SUB         DX,0x10                                 
                            LAB_f000_c082:                ;XREF[1,0]:   f000:c07d
ram:f000:c082   d1ea            SHR         DX,1                                    
ram:f000:c084   d1ea            SHR         DX,1                                    
ram:f000:c086   d1ea            SHR         DX,1                                    
ram:f000:c088   d1ea            SHR         DX,1                                    
ram:f000:c08a   86d4            XCHG        AH,DL                                   
ram:f000:c08c   86f2            XCHG        DL,DH                                   
ram:f000:c08e   be101f          MOV         SI,0x1f10                               
ram:f000:c091   8ede            MOV         DS,SI                                   
ram:f000:c093   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c097   89441a          MOV         word ptr [SI + 0x1a],AX                 
ram:f000:c09a   89541c          MOV         word ptr [SI + 0x1c],DX                 
ram:f000:c09d   be101f          MOV         SI,0x1f10                               
ram:f000:c0a0   8ede            MOV         DS,SI                                   
ram:f000:c0a2   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c0a6   c7042000        MOV         word ptr [SI],0x20                      
ram:f000:c0aa   b80000          MOV         AX,0x0                                  
ram:f000:c0ad   50              PUSH        AX                                      
ram:f000:c0ae   b80000          MOV         AX,0x0                                  
ram:f000:c0b1   50              PUSH        AX                                      
ram:f000:c0b2   b80000          MOV         AX,0x0                                  
ram:f000:c0b5   50              PUSH        AX                                      
ram:f000:c0b6   b80000          MOV         AX,0x0                                  
ram:f000:c0b9   50              PUSH        AX                                      
ram:f000:c0ba   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:c0bd   b90500          MOV         CX,0x5                                  
ram:f000:c0c0   d3e0            SHL         AX,CL                                   
ram:f000:c0c2   50              PUSH        AX                                      
ram:f000:c0c3   b80100          MOV         AX,0x1                                  
ram:f000:c0c6   50              PUSH        AX                                      
ram:f000:c0c7   b80600          MOV         AX,0x6                                  
ram:f000:c0ca   50              PUSH        AX                                      
ram:f000:c0cb   b8101f          MOV         AX,0x1f10                               
ram:f000:c0ce   8ed8            MOV         DS,AX                                   
ram:f000:c0d0   ff36b600        PUSH        word ptr [offset SCSI_CMD_PTR_SEG &0xff]
ram:f000:c0d4   ff36b400        PUSH        word ptr [offset SCSI_CMD_PTR &0xff]    
ram:f000:c0d8   9a800060fa      CALLF       FUN_f000_a680                           ;void FUN_f000_a680(void)
ram:f000:c0dd   83c412          ADD         SP,0x12                                 
ram:f000:c0e0   9ab400d0f9      CALLF       scsi_select_with_attn                   ;void scsi_select_with_attn(void)
ram:f000:c0e5   b80400          MOV         AX,0x4                                  
ram:f000:c0e8   50              PUSH        AX                                      
ram:f000:c0e9   b8e093          MOV         AX,0x93e0                               
ram:f000:c0ec   50              PUSH        AX                                      
ram:f000:c0ed   9a1900e0f9      CALLF       FUN_f000_9e19                           ;undefined2 FUN_f000_9e19(void)
ram:f000:c0f2   83c404          ADD         SP,0x4                                  
ram:f000:c0f5   8946fa          MOV         word ptr [BP + -0x6],AX                 
ram:f000:c0f8   85c0            TEST        AX,AX                                   
ram:f000:c0fa   7406            JZ          LAB_f000_c102                           
ram:f000:c0fc   8b46fa          MOV         AX,word ptr [BP + -0x6]                 
ram:f000:c0ff   e9e701          JMP         LAB_f000_c2e9                           
                            LAB_f000_c102:                ;XREF[1,0]:   f000:c0fa
ram:f000:c102   be101f          MOV         SI,0x1f10                               
ram:f000:c105   8ede            MOV         DS,SI                                   
ram:f000:c107   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c10b   c744260000      MOV         word ptr [SI + 0x26],0x0                
ram:f000:c110   c744280000      MOV         word ptr [SI + 0x28],0x0                
ram:f000:c115   be101f          MOV         SI,0x1f10                               
ram:f000:c118   8ede            MOV         DS,SI                                   
ram:f000:c11a   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c11e   c744220c00      MOV         word ptr [SI + 0x22],0xc                
ram:f000:c123   c744240000      MOV         word ptr [SI + 0x24],0x0                
ram:f000:c128   be101f          MOV         SI,0x1f10                               
ram:f000:c12b   8ede            MOV         DS,SI                                   
ram:f000:c12d   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c131   c7441e0c00      MOV         word ptr [SI + 0x1e],0xc                
ram:f000:c136   c744200000      MOV         word ptr [SI + 0x20],0x0                
ram:f000:c13b   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:c13e   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:c141   2c14            SUB         AL,0x14                                 
ram:f000:c143   7303            JNC         LAB_f000_c148                           
ram:f000:c145   83ea10          SUB         DX,0x10                                 
                            LAB_f000_c148:                ;XREF[1,0]:   f000:c143
ram:f000:c148   d1ea            SHR         DX,1                                    
ram:f000:c14a   d1ea            SHR         DX,1                                    
ram:f000:c14c   d1ea            SHR         DX,1                                    
ram:f000:c14e   d1ea            SHR         DX,1                                    
ram:f000:c150   86d4            XCHG        AH,DL                                   
ram:f000:c152   86f2            XCHG        DL,DH                                   
ram:f000:c154   be101f          MOV         SI,0x1f10                               
ram:f000:c157   8ede            MOV         DS,SI                                   
ram:f000:c159   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c15d   89441a          MOV         word ptr [SI + 0x1a],AX                 
ram:f000:c160   89541c          MOV         word ptr [SI + 0x1c],DX                 
ram:f000:c163   be101f          MOV         SI,0x1f10                               
ram:f000:c166   8ede            MOV         DS,SI                                   
ram:f000:c168   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c16c   c7042000        MOV         word ptr [SI],0x20                      
ram:f000:c170   b80000          MOV         AX,0x0                                  
ram:f000:c173   50              PUSH        AX                                      
ram:f000:c174   b80c00          MOV         AX,0xc                                  
ram:f000:c177   50              PUSH        AX                                      
ram:f000:c178   b80000          MOV         AX,0x0                                  
ram:f000:c17b   50              PUSH        AX                                      
ram:f000:c17c   b80000          MOV         AX,0x0                                  
ram:f000:c17f   50              PUSH        AX                                      
ram:f000:c180   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:c183   b90500          MOV         CX,0x5                                  
ram:f000:c186   d3e0            SHL         AX,CL                                   
ram:f000:c188   50              PUSH        AX                                      
ram:f000:c189   b81a00          MOV         AX,0x1a                                 
ram:f000:c18c   50              PUSH        AX                                      
ram:f000:c18d   b80600          MOV         AX,0x6                                  
ram:f000:c190   50              PUSH        AX                                      
ram:f000:c191   b8101f          MOV         AX,0x1f10                               
ram:f000:c194   8ed8            MOV         DS,AX                                   
ram:f000:c196   ff36b600        PUSH        word ptr [offset SCSI_CMD_PTR_SEG &0xff]
ram:f000:c19a   ff36b400        PUSH        word ptr [offset SCSI_CMD_PTR &0xff]    
ram:f000:c19e   9a800060fa      CALLF       FUN_f000_a680                           ;void FUN_f000_a680(void)
ram:f000:c1a3   83c412          ADD         SP,0x12                                 
ram:f000:c1a6   9ab400d0f9      CALLF       scsi_select_with_attn                   ;void scsi_select_with_attn(void)
ram:f000:c1ab   b80000          MOV         AX,0x0                                  
ram:f000:c1ae   50              PUSH        AX                                      
ram:f000:c1af   b8e803          MOV         AX,0x3e8                                
ram:f000:c1b2   50              PUSH        AX                                      
ram:f000:c1b3   9a1900e0f9      CALLF       FUN_f000_9e19                           ;undefined2 FUN_f000_9e19(void)
ram:f000:c1b8   83c404          ADD         SP,0x4                                  
ram:f000:c1bb   8946fa          MOV         word ptr [BP + -0x6],AX                 
ram:f000:c1be   85c0            TEST        AX,AX                                   
ram:f000:c1c0   7406            JZ          LAB_f000_c1c8                           
ram:f000:c1c2   8b46fa          MOV         AX,word ptr [BP + -0x6]                 
ram:f000:c1c5   e92101          JMP         LAB_f000_c2e9                           
                            LAB_f000_c1c8:                ;XREF[1,0]:   f000:c1c0
ram:f000:c1c8   c646ec00        MOV         byte ptr [BP + -0x14],0x0               
ram:f000:c1cc   c646ed00        MOV         byte ptr [BP + -0x13],0x0               
ram:f000:c1d0   8a46ee          MOV         AL,byte ptr [BP + -0x12]                
ram:f000:c1d3   30e4            XOR         AH,AH                                   
ram:f000:c1d5   250fff          AND         AX,0xff0f                               
ram:f000:c1d8   8846ee          MOV         byte ptr [BP + -0x12],AL                
ram:f000:c1db   c646f100        MOV         byte ptr [BP + -0xf],0x0                
ram:f000:c1df   c646f200        MOV         byte ptr [BP + -0xe],0x0                
ram:f000:c1e3   c646f300        MOV         byte ptr [BP + -0xd],0x0                
ram:f000:c1e7   c646f400        MOV         byte ptr [BP + -0xc],0x0                
ram:f000:c1eb   c646f500        MOV         byte ptr [BP + -0xb],0x0                
ram:f000:c1ef   c646f602        MOV         byte ptr [BP + -0xa],0x2                
ram:f000:c1f3   c646f700        MOV         byte ptr [BP + -0x9],0x0                
ram:f000:c1f7   f646efff        TEST        byte ptr [BP + -0x11],0xff              
ram:f000:c1fb   742d            JZ          LAB_f000_c22a                           
ram:f000:c1fd   be101f          MOV         SI,0x1f10                               
ram:f000:c200   8ede            MOV         DS,SI                                   
ram:f000:c202   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c206   c744220c00      MOV         word ptr [SI + 0x22],0xc                
ram:f000:c20b   c744240000      MOV         word ptr [SI + 0x24],0x0                
ram:f000:c210   be101f          MOV         SI,0x1f10                               
ram:f000:c213   8ede            MOV         DS,SI                                   
ram:f000:c215   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c219   c7441e0c00      MOV         word ptr [SI + 0x1e],0xc                
ram:f000:c21e   c744200000      MOV         word ptr [SI + 0x20],0x0                
ram:f000:c223   c746f80c00      MOV         word ptr [BP + -0x8],0xc                
ram:f000:c228   eb2b            JMP         LAB_f000_c255                           
                            LAB_f000_c22a:                ;XREF[1,0]:   f000:c1fb
ram:f000:c22a   be101f          MOV         SI,0x1f10                               
ram:f000:c22d   8ede            MOV         DS,SI                                   
ram:f000:c22f   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c233   c744220400      MOV         word ptr [SI + 0x22],0x4                
ram:f000:c238   c744240000      MOV         word ptr [SI + 0x24],0x0                
ram:f000:c23d   be101f          MOV         SI,0x1f10                               
ram:f000:c240   8ede            MOV         DS,SI                                   
ram:f000:c242   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c246   c7441e0400      MOV         word ptr [SI + 0x1e],0x4                
ram:f000:c24b   c744200000      MOV         word ptr [SI + 0x20],0x0                
ram:f000:c250   c746f80400      MOV         word ptr [BP + -0x8],0x4                
                            LAB_f000_c255:                ;XREF[1,0]:   f000:c228
ram:f000:c255   be101f          MOV         SI,0x1f10                               
ram:f000:c258   8ede            MOV         DS,SI                                   
ram:f000:c25a   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c25e   c744260000      MOV         word ptr [SI + 0x26],0x0                
ram:f000:c263   c744280000      MOV         word ptr [SI + 0x28],0x0                
ram:f000:c268   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:c26b   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:c26e   2c14            SUB         AL,0x14                                 
ram:f000:c270   7303            JNC         LAB_f000_c275                           
ram:f000:c272   83ea10          SUB         DX,0x10                                 
                            LAB_f000_c275:                ;XREF[1,0]:   f000:c270
ram:f000:c275   d1ea            SHR         DX,1                                    
ram:f000:c277   d1ea            SHR         DX,1                                    
ram:f000:c279   d1ea            SHR         DX,1                                    
ram:f000:c27b   d1ea            SHR         DX,1                                    
ram:f000:c27d   86d4            XCHG        AH,DL                                   
ram:f000:c27f   86f2            XCHG        DL,DH                                   
ram:f000:c281   be101f          MOV         SI,0x1f10                               
ram:f000:c284   8ede            MOV         DS,SI                                   
ram:f000:c286   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c28a   89441a          MOV         word ptr [SI + 0x1a],AX                 
ram:f000:c28d   89541c          MOV         word ptr [SI + 0x1c],DX                 
ram:f000:c290   be101f          MOV         SI,0x1f10                               
ram:f000:c293   8ede            MOV         DS,SI                                   
ram:f000:c295   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c299   c7042000        MOV         word ptr [SI],0x20                      
ram:f000:c29d   b80000          MOV         AX,0x0                                  
ram:f000:c2a0   50              PUSH        AX                                      
ram:f000:c2a1   ff76f8          PUSH        word ptr [BP + -0x8]                    
ram:f000:c2a4   b80000          MOV         AX,0x0                                  
ram:f000:c2a7   50              PUSH        AX                                      
ram:f000:c2a8   b80000          MOV         AX,0x0                                  
ram:f000:c2ab   50              PUSH        AX                                      
ram:f000:c2ac   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:c2af   b90500          MOV         CX,0x5                                  
ram:f000:c2b2   d3e0            SHL         AX,CL                                   
ram:f000:c2b4   50              PUSH        AX                                      
ram:f000:c2b5   b81500          MOV         AX,0x15                                 
ram:f000:c2b8   50              PUSH        AX                                      
ram:f000:c2b9   b80600          MOV         AX,0x6                                  
ram:f000:c2bc   50              PUSH        AX                                      
ram:f000:c2bd   b8101f          MOV         AX,0x1f10                               
ram:f000:c2c0   8ed8            MOV         DS,AX                                   
ram:f000:c2c2   ff36b600        PUSH        word ptr [offset SCSI_CMD_PTR_SEG &0xff]
ram:f000:c2c6   ff36b400        PUSH        word ptr [offset SCSI_CMD_PTR &0xff]    
ram:f000:c2ca   9a800060fa      CALLF       FUN_f000_a680                           ;void FUN_f000_a680(void)
ram:f000:c2cf   83c412          ADD         SP,0x12                                 
ram:f000:c2d2   9ab400d0f9      CALLF       scsi_select_with_attn                   ;void scsi_select_with_attn(void)
ram:f000:c2d7   b80000          MOV         AX,0x0                                  
ram:f000:c2da   50              PUSH        AX                                      
ram:f000:c2db   b8e803          MOV         AX,0x3e8                                
ram:f000:c2de   50              PUSH        AX                                      
ram:f000:c2df   9a1900e0f9      CALLF       FUN_f000_9e19                           ;undefined2 FUN_f000_9e19(void)
ram:f000:c2e4   83c404          ADD         SP,0x4                                  
ram:f000:c2e7   eb00            JMP         LAB_f000_c2e9                           
                            LAB_f000_c2e9:                ;XREF[5,0]:   f000:c02a,f000:c039,f000:c0ff,f000:c1c5
                                                          ;             f000:c2e7
ram:f000:c2e9   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 FUN_f000_c2ee(void)
                                                          ;XREF[1,0]:   f000:ba47
ram:f000:c2ee   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:c2f3   81ec2600        SUB         SP,0x26                                 
ram:f000:c2f7   8b460e          MOV         AX,word ptr [BP + 0xe]                  
ram:f000:c2fa   b90300          MOV         CX,0x3                                  
ram:f000:c2fd   d3f8            SAR         AX,CL                                   
ram:f000:c2ff   8946fe          MOV         word ptr [BP + -0x2],AX                 
ram:f000:c302   be101f          MOV         SI,0x1f10                               
ram:f000:c305   8ede            MOV         DS,SI                                   
ram:f000:c307   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c30b   884404          MOV         byte ptr [SI + 0x4],AL                  
ram:f000:c30e   8b460e          MOV         AX,word ptr [BP + 0xe]                  
ram:f000:c311   250300          AND         AX,0x3                                  
ram:f000:c314   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:c317   be101f          MOV         SI,0x1f10                               
ram:f000:c31a   8ede            MOV         DS,SI                                   
ram:f000:c31c   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c320   884405          MOV         byte ptr [SI + 0x5],AL                  
ram:f000:c323   be101f          MOV         SI,0x1f10                               
ram:f000:c326   8ede            MOV         DS,SI                                   
ram:f000:c328   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c32c   c744260000      MOV         word ptr [SI + 0x26],0x0                
ram:f000:c331   c744280000      MOV         word ptr [SI + 0x28],0x0                
ram:f000:c336   c57610          LDS         SI,[BP + 0x10]                          
ram:f000:c339   8b440a          MOV         AX,word ptr [SI + 0xa]                  
ram:f000:c33c   8b540c          MOV         DX,word ptr [SI + 0xc]                  
ram:f000:c33f   be101f          MOV         SI,0x1f10                               
ram:f000:c342   8ede            MOV         DS,SI                                   
ram:f000:c344   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c348   894422          MOV         word ptr [SI + 0x22],AX                 
ram:f000:c34b   895424          MOV         word ptr [SI + 0x24],DX                 
ram:f000:c34e   c57610          LDS         SI,[BP + 0x10]                          
ram:f000:c351   8b440a          MOV         AX,word ptr [SI + 0xa]                  
ram:f000:c354   8b540c          MOV         DX,word ptr [SI + 0xc]                  
ram:f000:c357   be101f          MOV         SI,0x1f10                               
ram:f000:c35a   8ede            MOV         DS,SI                                   
ram:f000:c35c   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c360   89441e          MOV         word ptr [SI + 0x1e],AX                 
ram:f000:c363   895420          MOV         word ptr [SI + 0x20],DX                 
ram:f000:c366   c57610          LDS         SI,[BP + 0x10]                          
ram:f000:c369   8b04            MOV         AX,word ptr [SI]                        
ram:f000:c36b   a90200          TEST        AX,0x2                                  
ram:f000:c36e   740f            JZ          LAB_f000_c37f                           
ram:f000:c370   be101f          MOV         SI,0x1f10                               
ram:f000:c373   8ede            MOV         DS,SI                                   
ram:f000:c375   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c379   c7042000        MOV         word ptr [SI],0x20                      
ram:f000:c37d   eb0d            JMP         LAB_f000_c38c                           
                            LAB_f000_c37f:                ;XREF[1,0]:   f000:c36e
ram:f000:c37f   be101f          MOV         SI,0x1f10                               
ram:f000:c382   8ede            MOV         DS,SI                                   
ram:f000:c384   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c388   c7040000        MOV         word ptr [SI],0x0                       
                            LAB_f000_c38c:                ;XREF[1,0]:   f000:c37d
ram:f000:c38c   c57610          LDS         SI,[BP + 0x10]                          
ram:f000:c38f   8b04            MOV         AX,word ptr [SI]                        
ram:f000:c391   a90100          TEST        AX,0x1                                  
ram:f000:c394   7471            JZ          LAB_f000_c407                           
ram:f000:c396   b80000          MOV         AX,0x0                                  
ram:f000:c399   50              PUSH        AX                                      
ram:f000:c39a   b80000          MOV         AX,0x0                                  
ram:f000:c39d   50              PUSH        AX                                      
ram:f000:c39e   b80002          MOV         AX,0x200                                
ram:f000:c3a1   50              PUSH        AX                                      
ram:f000:c3a2   c57610          LDS         SI,[BP + 0x10]                          
ram:f000:c3a5   8b440a          MOV         AX,word ptr [SI + 0xa]                  
ram:f000:c3a8   8b540c          MOV         DX,word ptr [SI + 0xc]                  
ram:f000:c3ab   05ff01          ADD         AX,0x1ff                                
ram:f000:c3ae   83d200          ADC         DX,0x0                                  
ram:f000:c3b1   52              PUSH        DX                                      
ram:f000:c3b2   50              PUSH        AX                                      
ram:f000:c3b3   9aff00c0fd      CALLF       FUN_f000_dcff                           ;uint FUN_f000_dcff(uint param_1, uin...
ram:f000:c3b8   83c408          ADD         SP,0x8                                  
ram:f000:c3bb   50              PUSH        AX                                      
ram:f000:c3bc   b80000          MOV         AX,0x0                                  
ram:f000:c3bf   50              PUSH        AX                                      
ram:f000:c3c0   b80000          MOV         AX,0x0                                  
ram:f000:c3c3   50              PUSH        AX                                      
ram:f000:c3c4   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:c3c7   b90500          MOV         CX,0x5                                  
ram:f000:c3ca   d3e0            SHL         AX,CL                                   
ram:f000:c3cc   0d0100          OR          AX,0x1                                  
ram:f000:c3cf   50              PUSH        AX                                      
ram:f000:c3d0   b80800          MOV         AX,0x8                                  
ram:f000:c3d3   50              PUSH        AX                                      
ram:f000:c3d4   b80600          MOV         AX,0x6                                  
ram:f000:c3d7   50              PUSH        AX                                      
ram:f000:c3d8   b8101f          MOV         AX,0x1f10                               
ram:f000:c3db   8ed8            MOV         DS,AX                                   
ram:f000:c3dd   ff36b600        PUSH        word ptr [offset SCSI_CMD_PTR_SEG &0xff]
ram:f000:c3e1   ff36b400        PUSH        word ptr [offset SCSI_CMD_PTR &0xff]    
ram:f000:c3e5   9a800060fa      CALLF       FUN_f000_a680                           ;void FUN_f000_a680(void)
ram:f000:c3ea   83c412          ADD         SP,0x12                                 
ram:f000:c3ed   c57610          LDS         SI,[BP + 0x10]                          
ram:f000:c3f0   8b4406          MOV         AX,word ptr [SI + 0x6]                  
ram:f000:c3f3   8b5408          MOV         DX,word ptr [SI + 0x8]                  
ram:f000:c3f6   be101f          MOV         SI,0x1f10                               
ram:f000:c3f9   8ede            MOV         DS,SI                                   
ram:f000:c3fb   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c3ff   89441a          MOV         word ptr [SI + 0x1a],AX                 
ram:f000:c402   89541c          MOV         word ptr [SI + 0x1c],DX                 
ram:f000:c405   eb6f            JMP         LAB_f000_c476                           
                            LAB_f000_c407:                ;XREF[1,0]:   f000:c394
ram:f000:c407   b80000          MOV         AX,0x0                                  
ram:f000:c40a   50              PUSH        AX                                      
ram:f000:c40b   b80000          MOV         AX,0x0                                  
ram:f000:c40e   50              PUSH        AX                                      
ram:f000:c40f   b80002          MOV         AX,0x200                                
ram:f000:c412   50              PUSH        AX                                      
ram:f000:c413   c57610          LDS         SI,[BP + 0x10]                          
ram:f000:c416   8b440a          MOV         AX,word ptr [SI + 0xa]                  
ram:f000:c419   8b540c          MOV         DX,word ptr [SI + 0xc]                  
ram:f000:c41c   05ff01          ADD         AX,0x1ff                                
ram:f000:c41f   83d200          ADC         DX,0x0                                  
ram:f000:c422   52              PUSH        DX                                      
ram:f000:c423   50              PUSH        AX                                      
ram:f000:c424   9aff00c0fd      CALLF       FUN_f000_dcff                           ;uint FUN_f000_dcff(uint param_1, uin...
ram:f000:c429   83c408          ADD         SP,0x8                                  
ram:f000:c42c   50              PUSH        AX                                      
ram:f000:c42d   b80000          MOV         AX,0x0                                  
ram:f000:c430   50              PUSH        AX                                      
ram:f000:c431   b80000          MOV         AX,0x0                                  
ram:f000:c434   50              PUSH        AX                                      
ram:f000:c435   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:c438   b90500          MOV         CX,0x5                                  
ram:f000:c43b   d3e0            SHL         AX,CL                                   
ram:f000:c43d   0d0100          OR          AX,0x1                                  
ram:f000:c440   50              PUSH        AX                                      
ram:f000:c441   b80a00          MOV         AX,0xa                                  
ram:f000:c444   50              PUSH        AX                                      
ram:f000:c445   b80600          MOV         AX,0x6                                  
ram:f000:c448   50              PUSH        AX                                      
ram:f000:c449   b8101f          MOV         AX,0x1f10                               
ram:f000:c44c   8ed8            MOV         DS,AX                                   
ram:f000:c44e   ff36b600        PUSH        word ptr [offset SCSI_CMD_PTR_SEG &0xff]
ram:f000:c452   ff36b400        PUSH        word ptr [offset SCSI_CMD_PTR &0xff]    
ram:f000:c456   9a800060fa      CALLF       FUN_f000_a680                           ;void FUN_f000_a680(void)
ram:f000:c45b   83c412          ADD         SP,0x12                                 
ram:f000:c45e   c57610          LDS         SI,[BP + 0x10]                          
ram:f000:c461   8b4402          MOV         AX,word ptr [SI + 0x2]                  
ram:f000:c464   8b5404          MOV         DX,word ptr [SI + 0x4]                  
ram:f000:c467   be101f          MOV         SI,0x1f10                               
ram:f000:c46a   8ede            MOV         DS,SI                                   
ram:f000:c46c   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:c470   89441a          MOV         word ptr [SI + 0x1a],AX                 
ram:f000:c473   89541c          MOV         word ptr [SI + 0x1c],DX                 
                            LAB_f000_c476:                ;XREF[1,0]:   f000:c405
ram:f000:c476   9ab400d0f9      CALLF       scsi_select_with_attn                   ;void scsi_select_with_attn(void)
ram:f000:c47b   b80000          MOV         AX,0x0                                  
ram:f000:c47e   50              PUSH        AX                                      
ram:f000:c47f   b81027          MOV         AX,0x2710                               
ram:f000:c482   50              PUSH        AX                                      
ram:f000:c483   9a1900e0f9      CALLF       FUN_f000_9e19                           ;undefined2 FUN_f000_9e19(void)
ram:f000:c488   83c404          ADD         SP,0x4                                  
ram:f000:c48b   8946fa          MOV         word ptr [BP + -0x6],AX                 
ram:f000:c48e   3dfdff          CMP         AX,0xfffd                               
ram:f000:c491   7500            JNZ         LAB_f000_c493                           
                            LAB_f000_c493:                ;XREF[1,0]:   f000:c491
ram:f000:c493   8b46fa          MOV         AX,word ptr [BP + -0x6]                 
ram:f000:c496   eb00            JMP         LAB_f000_c498                           
                            LAB_f000_c498:                ;XREF[1,0]:   f000:c496
ram:f000:c498   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 FUN_f000_c49d(void)
                                                          ;XREF[1,0]:   f000:89c4
ram:f000:c49d   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:c4a2   81ec0800        SUB         SP,0x8                                  
ram:f000:c4a6   c746fc00e0      MOV         word ptr [BP + -0x4],0xe000             
ram:f000:c4ab   c746fe0100      MOV         word ptr [BP + -0x2],0x1                
ram:f000:c4b0   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:c4b3   8b4404          MOV         AX,word ptr [SI + 0x4]                  
ram:f000:c4b6   8b5406          MOV         DX,word ptr [SI + 0x6]                  
ram:f000:c4b9   8946f8          MOV         word ptr [BP + -0x8],AX                 
ram:f000:c4bc   8956fa          MOV         word ptr [BP + -0x6],DX                 
ram:f000:c4bf   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:c4c2   8b04            MOV         AX,word ptr [SI]                        
ram:f000:c4c4   40              INC         AX                                      
ram:f000:c4c5   8bf8            MOV         DI,AX                                   
ram:f000:c4c7   b80100          MOV         AX,0x1                                  
ram:f000:c4ca   50              PUSH        AX                                      
ram:f000:c4cb   57              PUSH        DI                                      
ram:f000:c4cc   ff76fa          PUSH        word ptr [BP + -0x6]                    
ram:f000:c4cf   ff76f8          PUSH        word ptr [BP + -0x8]                    
ram:f000:c4d2   ff76fe          PUSH        word ptr [BP + -0x2]                    
ram:f000:c4d5   ff76fc          PUSH        word ptr [BP + -0x4]                    
ram:f000:c4d8   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:c4dd   83c40c          ADD         SP,0xc                                  
ram:f000:c4e0   b80000          MOV         AX,0x0                                  
ram:f000:c4e3   eb00            JMP         LAB_f000_c4e5                           
                            LAB_f000_c4e5:                ;XREF[1,0]:   f000:c4e3
ram:f000:c4e5   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 FUN_f000_c4ea(void)
                                                          ;XREF[1,0]:   f000:89d5
ram:f000:c4ea   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:c4ef   81ec0800        SUB         SP,0x8                                  
ram:f000:c4f3   c5760e          LDS         SI,[BP + 0xe]                           
                            ;Load job address into AX,DX
ram:f000:c4f6   8b4404          MOV         AX,word ptr [SI + 0x4]                  
ram:f000:c4f9   8b5406          MOV         DX,word ptr [SI + 0x6]                  
ram:f000:c4fc   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:c4ff   8956fe          MOV         word ptr [BP + -0x2],DX                 
ram:f000:c502   c746f800e0      MOV         word ptr [BP + -0x8],0xe000             
ram:f000:c507   c746fa0100      MOV         word ptr [BP + -0x6],0x1                
ram:f000:c50c   c5760e          LDS         SI,[BP + 0xe]                           
                            ;Move byte count into AX
ram:f000:c50f   8b04            MOV         AX,word ptr [SI]                        
                            ;Increment byte count by one
ram:f000:c511   40              INC         AX                                      
                            ;Move byte count into destination index?
ram:f000:c512   8bf8            MOV         DI,AX                                   
ram:f000:c514   b80000          MOV         AX,0x0                                  
ram:f000:c517   50              PUSH        AX                                      
ram:f000:c518   57              PUSH        DI                                      
ram:f000:c519   ff76fa          PUSH        word ptr [BP + -0x6]                    
ram:f000:c51c   ff76f8          PUSH        word ptr [BP + -0x8]                    
ram:f000:c51f   ff76fe          PUSH        word ptr [BP + -0x2]                    
ram:f000:c522   ff76fc          PUSH        word ptr [BP + -0x4]                    
                            ;Move bytes from host memory to 1000:e000
ram:f000:c525   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:c52a   83c40c          ADD         SP,0xc                                  
ram:f000:c52d   b80000          MOV         AX,0x0                                  
ram:f000:c530   eb00            JMP         LAB_f000_c532                           
                            LAB_f000_c532:                ;XREF[1,0]:   f000:c530
ram:f000:c532   ea7e00e0fd      JMPF        init_vectors::function_return           
ram:f000:c537   90              NOP                                                  
                            ;************************************************************************************************
                            ;*  Perform a Sysgen.                                                                           *
                            ;*                                                                                              *
                            ;*  This routine is responsible for actually reading the sysgen                                 *
                            ;*  block from the 3B2 host at address 0x2000000.                                               *
                            ;************************************************************************************************
                            ;undefined perform_sysgen()
                                                          ;XREF[1,0]:   f000:8f7e
ram:f000:c538   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:c53d   81ec0800        SUB         SP,0x8                                  
                            ;Set the 80186 / Host address to 0x2000000
ram:f000:c541   b80002          MOV         AX,0x200                                
ram:f000:c544   50              PUSH        AX                                      
ram:f000:c545   b80000          MOV         AX,0x0                                  
ram:f000:c548   50              PUSH        AX                                      
ram:f000:c549   9a020090fd      CALLF       set_host_page                           ;undefined2 set_host_page(undefined2 ...
ram:f000:c54e   83c404          ADD         SP,0x4                                  
ram:f000:c551   8af2            MOV         DH,DL                                   
ram:f000:c553   8ad4            MOV         DL,AH                                   
ram:f000:c555   30e4            XOR         AH,AH                                   
ram:f000:c557   d1e2            SHL         DX,1                                    
ram:f000:c559   d1e2            SHL         DX,1                                    
ram:f000:c55b   d1e2            SHL         DX,1                                    
ram:f000:c55d   d1e2            SHL         DX,1                                    
ram:f000:c55f   8bf0            MOV         SI,AX                                   
ram:f000:c561   8eda            MOV         DS,DX                                   
ram:f000:c563   8b04            MOV         AX,word ptr [SI]                        ;AX gets RQUE low nybble
ram:f000:c565   8b5402          MOV         DX,word ptr [SI + 0x2]                  ;DX gets RQUE high nybble
ram:f000:c568   b9001f          MOV         CX,0x1f00                               
ram:f000:c56b   8ed9            MOV         DS,CX                                   
ram:f000:c56d   a37400          MOV         [offset SYSGEN_BLK_H &0xff],AX          
ram:f000:c570   89167600        MOV         word ptr [offset SYSGEN_BLK_L &0xff],DX 
ram:f000:c574   b8001f          MOV         AX,0x1f00                               
ram:f000:c577   8ed8            MOV         DS,AX                                   
ram:f000:c579   ff367600        PUSH        word ptr [offset SYSGEN_BLK_L &0xff]    
ram:f000:c57d   ff367400        PUSH        word ptr [offset SYSGEN_BLK_H &0xff]    
ram:f000:c581   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:c586   83c404          ADD         SP,0x4                                  ;Come back from the call stack
ram:f000:c589   b9001f          MOV         CX,0x1f00                               
ram:f000:c58c   8ed9            MOV         DS,CX                                   
ram:f000:c58e   a37400          MOV         [offset SYSGEN_BLK_H &0xff],AX          
ram:f000:c591   89167600        MOV         word ptr [offset SYSGEN_BLK_L &0xff],DX 
ram:f000:c595   b80000          MOV         AX,0x0                                  
ram:f000:c598   50              PUSH        AX                                      
ram:f000:c599   b80600          MOV         AX,0x6                                  
ram:f000:c59c   50              PUSH        AX                                      
                            ;Convert 1f00:32 to 0x0001f032
ram:f000:c59d   b83200          MOV         AX,0x32                                 
ram:f000:c5a0   ba001f          MOV         DX,0x1f00                               
ram:f000:c5a3   d1ea            SHR         DX,1                                    
ram:f000:c5a5   d1ea            SHR         DX,1                                    
ram:f000:c5a7   d1ea            SHR         DX,1                                    
ram:f000:c5a9   d1ea            SHR         DX,1                                    
ram:f000:c5ab   86d4            XCHG        AH,DL                                   
ram:f000:c5ad   86f2            XCHG        DL,DH                                   
ram:f000:c5af   52              PUSH        DX                                      
ram:f000:c5b0   50              PUSH        AX                                      
ram:f000:c5b1   b8001f          MOV         AX,0x1f00                               
ram:f000:c5b4   8ed8            MOV         DS,AX                                   
ram:f000:c5b6   ff367600        PUSH        word ptr [offset SYSGEN_BLK_L &0xff]    
ram:f000:c5ba   ff367400        PUSH        word ptr [offset SYSGEN_BLK_H &0xff]    
                            ;Transfer 6 words from RQUE to 1f032.
                            ;
                            ;This grabs the sysgen block at 0x2000000 and puts it into
                            ;card memory at 1f00:32 to 1f00:3e
ram:f000:c5be   9a200070fd      CALLF       transfer_words                          ;undefined transfer_words()
ram:f000:c5c3   83c40c          ADD         SP,0xc                                  ;Come back from the call stack
ram:f000:c5c6   b8001f          MOV         AX,0x1f00                               
ram:f000:c5c9   8ed8            MOV         DS,AX                                   
ram:f000:c5cb   ff363400        PUSH        word ptr [offset REQ_Q_H &0xff]         
ram:f000:c5cf   ff363200        PUSH        word ptr [offset REQ_Q_L &0xff]         
ram:f000:c5d3   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:c5d8   83c404          ADD         SP,0x4                                  
ram:f000:c5db   b9001f          MOV         CX,0x1f00                               
ram:f000:c5de   8ed9            MOV         DS,CX                                   
ram:f000:c5e0   a33200          MOV         [offset REQ_Q_L &0xff],AX               
ram:f000:c5e3   89163400        MOV         word ptr [offset REQ_Q_H &0xff],DX      
ram:f000:c5e7   b8001f          MOV         AX,0x1f00                               
ram:f000:c5ea   8ed8            MOV         DS,AX                                   
ram:f000:c5ec   ff363800        PUSH        word ptr [offset CMP_Q_H &0xff]         
ram:f000:c5f0   ff363600        PUSH        word ptr [offset CMP_Q_L &0xff]         
ram:f000:c5f4   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:c5f9   83c404          ADD         SP,0x4                                  
ram:f000:c5fc   b9001f          MOV         CX,0x1f00                               
ram:f000:c5ff   8ed9            MOV         DS,CX                                   
ram:f000:c601   a33600          MOV         [offset CMP_Q_L &0xff],AX               
ram:f000:c604   89163800        MOV         word ptr [offset CMP_Q_H &0xff],DX      
ram:f000:c608   b8001f          MOV         AX,0x1f00                               
ram:f000:c60b   8ed8            MOV         DS,AX                                   
ram:f000:c60d   a03c00          MOV         AL,[offset CIO_IRQ_VEC &0xff]           
ram:f000:c610   30e4            XOR         AH,AH                                   
ram:f000:c612   ba001f          MOV         DX,0x1f00                               
ram:f000:c615   8eda            MOV         DS,DX                                   
ram:f000:c617   a27a00          MOV         [offset DAT_1000_f07a &0xff],AL         
ram:f000:c61a   b8001f          MOV         AX,0x1f00                               
ram:f000:c61d   8ed8            MOV         DS,AX                                   
ram:f000:c61f   a03c00          MOV         AL,[offset CIO_IRQ_VEC &0xff]           
ram:f000:c622   30e4            XOR         AH,AH                                   
ram:f000:c624   ba00c0          MOV         DX,0xc000                               
ram:f000:c627   8eda            MOV         DS,DX                                   
ram:f000:c629   a28100          MOV         [DAT_c000_0081],AL                      
ram:f000:c62c   b8001f          MOV         AX,0x1f00                               
ram:f000:c62f   8ed8            MOV         DS,AX                                   
ram:f000:c631   f6063d00ff      TEST        byte ptr [offset NUM_REQ_Q &0xff],0xff  
ram:f000:c636   7513            JNZ         LAB_f000_c64b                           
ram:f000:c638   b8301f          MOV         AX,0x1f30                               
ram:f000:c63b   8ed8            MOV         DS,AX                                   
ram:f000:c63d   c706e6000100    MOV         word ptr [offset...,0x1                 
ram:f000:c643   9a8a0080fc      CALLF       sysgen_response_no_rque                 ;void sysgen_response_no_rque(void)
ram:f000:c648   e93a02          JMP         LAB_f000_c885                           
                            LAB_f000_c64b:                ;XREF[1,0]:   f000:c636
ram:f000:c64b   b8301f          MOV         AX,0x1f30                               
ram:f000:c64e   8ed8            MOV         DS,AX                                   
ram:f000:c650   c706e6000000    MOV         word ptr [offset...,0x0                 
ram:f000:c656   b8001f          MOV         AX,0x1f00                               
ram:f000:c659   8ed8            MOV         DS,AX                                   
ram:f000:c65b   a13200          MOV         AX,[offset REQ_Q_L &0xff]               
ram:f000:c65e   8b163400        MOV         DX,word ptr [offset REQ_Q_H &0xff]      
ram:f000:c662   b9001f          MOV         CX,0x1f00                               
ram:f000:c665   8ed9            MOV         DS,CX                                   
ram:f000:c667   a36200          MOV         [offset REQ_Q_L_P &0xff],AX             
ram:f000:c66a   89166400        MOV         word ptr [offset REQ_Q_H_P &0xff],DX    
ram:f000:c66e   b8001f          MOV         AX,0x1f00                               
ram:f000:c671   8ed8            MOV         DS,AX                                   
ram:f000:c673   a13600          MOV         AX,[offset CMP_Q_L &0xff]               
ram:f000:c676   8b163800        MOV         DX,word ptr [offset CMP_Q_H &0xff]      
ram:f000:c67a   b9001f          MOV         CX,0x1f00                               
ram:f000:c67d   8ed9            MOV         DS,CX                                   
ram:f000:c67f   a36600          MOV         [offset CMP_Q_H_P &0xff],AX             
ram:f000:c682   89166800        MOV         word ptr [offset CMP_Q_L_P &0xff],DX    
ram:f000:c686   b8001f          MOV         AX,0x1f00                               
ram:f000:c689   8ed8            MOV         DS,AX                                   
ram:f000:c68b   a03a00          MOV         AL,[offset DAT_1000_f03a &0xff]         
ram:f000:c68e   30e4            XOR         AH,AH                                   
ram:f000:c690   b90400          MOV         CX,0x4                                  
ram:f000:c693   d3e0            SHL         AX,CL                                   
ram:f000:c695   ba001f          MOV         DX,0x1f00                               
ram:f000:c698   8eda            MOV         DS,DX                                   
ram:f000:c69a   a36e00          MOV         [offset DAT_1000_f06e &0xff],AX         
ram:f000:c69d   b80c00          MOV         AX,0xc                                  
ram:f000:c6a0   be001f          MOV         SI,0x1f00                               
ram:f000:c6a3   8ede            MOV         DS,SI                                   
ram:f000:c6a5   8b363b00        MOV         SI,word ptr [offset DAT_1000_f03b &0xff]
ram:f000:c6a9   81e6ff00        AND         SI,0xff                                 
ram:f000:c6ad   f7ee            IMUL        SI                                      
ram:f000:c6af   ba001f          MOV         DX,0x1f00                               
ram:f000:c6b2   8eda            MOV         DS,DX                                   
ram:f000:c6b4   a37000          MOV         [offset DAT_1000_f070 &0xff],AX         
ram:f000:c6b7   b8001f          MOV         AX,0x1f00                               
ram:f000:c6ba   8ed8            MOV         DS,AX                                   
ram:f000:c6bc   a13600          MOV         AX,[offset CMP_Q_L &0xff]               
ram:f000:c6bf   8b163800        MOV         DX,word ptr [offset CMP_Q_H &0xff]      
ram:f000:c6c3   b9001f          MOV         CX,0x1f00                               
ram:f000:c6c6   8ed9            MOV         DS,CX                                   
ram:f000:c6c8   a36a00          MOV         [offset DAT_1000_f06a &0xff],AX         
ram:f000:c6cb   89166c00        MOV         word ptr [offset DAT_1000_f06c &0xff],DX
ram:f000:c6cf   b8001f          MOV         AX,0x1f00                               
ram:f000:c6d2   8ed8            MOV         DS,AX                                   
ram:f000:c6d4   83066a000c      ADD         word ptr [offset...,0xc                 
ram:f000:c6d9   83166c0000      ADC         word ptr [offset...,0x0                 
ram:f000:c6de   b8001f          MOV         AX,0x1f00                               
ram:f000:c6e1   8ed8            MOV         DS,AX                                   
ram:f000:c6e3   c70672000000    MOV         word ptr [offset...,0x0                 
ram:f000:c6e9   b8001f          MOV         AX,0x1f00                               
ram:f000:c6ec   8ed8            MOV         DS,AX                                   
ram:f000:c6ee   c7065a001000    MOV         word ptr [offset...,0x10                
ram:f000:c6f4   c7065c00401f    MOV         word ptr [offset...,0x1f40              
ram:f000:c6fa   b8001f          MOV         AX,0x1f00                               
ram:f000:c6fd   8ed8            MOV         DS,AX                                   
ram:f000:c6ff   a15a00          MOV         AX,[offset DAT_1000_f05a &0xff]         
ram:f000:c702   8b165c00        MOV         DX,word ptr [offset DAT_1000_f05c &0xff]
ram:f000:c706   b9001f          MOV         CX,0x1f00                               
ram:f000:c709   8ed9            MOV         DS,CX                                   
ram:f000:c70b   8a0e3d00        MOV         CL,byte ptr [offset NUM_REQ_Q &0xff]    
ram:f000:c70f   30ed            XOR         CH,CH                                   
ram:f000:c711   d1e1            SHL         CX,1                                    
ram:f000:c713   d1e1            SHL         CX,1                                    
ram:f000:c715   02c1            ADD         AL,CL                                   
ram:f000:c717   7303            JNC         LAB_f000_c71c                           
ram:f000:c719   83c210          ADD         DX,0x10                                 
                            LAB_f000_c71c:                ;XREF[1,0]:   f000:c717
ram:f000:c71c   30c9            XOR         CL,CL                                   
ram:f000:c71e   d1e9            SHR         CX,1                                    
ram:f000:c720   d1e9            SHR         CX,1                                    
ram:f000:c722   d1e9            SHR         CX,1                                    
ram:f000:c724   d1e9            SHR         CX,1                                    
ram:f000:c726   03d1            ADD         DX,CX                                   
ram:f000:c728   b9001f          MOV         CX,0x1f00                               
ram:f000:c72b   8ed9            MOV         DS,CX                                   
ram:f000:c72d   a35e00          MOV         [offset DAT_1000_f05e &0xff],AX         
ram:f000:c730   89166000        MOV         word ptr [offset DAT_1000_f060 &0xff],DX
ram:f000:c734   b8001f          MOV         AX,0x1f00                               
ram:f000:c737   8ed8            MOV         DS,AX                                   
ram:f000:c739   a16e00          MOV         AX,[offset DAT_1000_f06e &0xff]         
ram:f000:c73c   050400          ADD         AX,0x4                                  
ram:f000:c73f   8946f8          MOV         word ptr [BP + -0x8],AX                 
ram:f000:c742   b8001f          MOV         AX,0x1f00                               
ram:f000:c745   8ed8            MOV         DS,AX                                   
ram:f000:c747   a16200          MOV         AX,[offset REQ_Q_L_P &0xff]             
ram:f000:c74a   8b166400        MOV         DX,word ptr [offset REQ_Q_H_P &0xff]    
ram:f000:c74e   051000          ADD         AX,0x10                                 
ram:f000:c751   83d200          ADC         DX,0x0                                  
ram:f000:c754   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:c757   8956fe          MOV         word ptr [BP + -0x2],DX                 
ram:f000:c75a   31ff            XOR         DI,DI                                   
                            LAB_f000_c75c:                ;XREF[1,0]:   f000:c7d3
ram:f000:c75c   b8001f          MOV         AX,0x1f00                               
ram:f000:c75f   8ed8            MOV         DS,AX                                   
ram:f000:c761   a03d00          MOV         AL,[offset NUM_REQ_Q &0xff]             
ram:f000:c764   30e4            XOR         AH,AH                                   
ram:f000:c766   3bf8            CMP         DI,AX                                   
ram:f000:c768   736b            JNC         LAB_f000_c7d5                           
ram:f000:c76a   8bc7            MOV         AX,DI                                   
ram:f000:c76c   f76ef8          IMUL        word ptr [BP + -0x8]                    
ram:f000:c76f   99              CWD                                                  
ram:f000:c770   0346fc          ADD         AX,word ptr [BP + -0x4]                 
ram:f000:c773   1356fe          ADC         DX,word ptr [BP + -0x2]                 
ram:f000:c776   b9001f          MOV         CX,0x1f00                               
ram:f000:c779   8ed9            MOV         DS,CX                                   
ram:f000:c77b   8b0e5a00        MOV         CX,word ptr [offset DAT_1000_f05a &0xff]
ram:f000:c77f   8b1e5c00        MOV         BX,word ptr [offset DAT_1000_f05c &0xff]
ram:f000:c783   8bf7            MOV         SI,DI                                   
ram:f000:c785   d1e6            SHL         SI,1                                    
ram:f000:c787   d1e6            SHL         SI,1                                    
ram:f000:c789   87de            XCHG        SI,BX                                   
ram:f000:c78b   02cb            ADD         CL,BL                                   
ram:f000:c78d   7303            JNC         LAB_f000_c792                           
ram:f000:c78f   83c610          ADD         SI,0x10                                 
                            LAB_f000_c792:                ;XREF[1,0]:   f000:c78d
ram:f000:c792   30db            XOR         BL,BL                                   
ram:f000:c794   d1fb            SAR         BX,1                                    
ram:f000:c796   d1fb            SAR         BX,1                                    
ram:f000:c798   d1fb            SAR         BX,1                                    
ram:f000:c79a   d1fb            SAR         BX,1                                    
ram:f000:c79c   03de            ADD         BX,SI                                   
ram:f000:c79e   8bf1            MOV         SI,CX                                   
ram:f000:c7a0   8edb            MOV         DS,BX                                   
                                                          ; FWD[2,0]:   1000:f410,1000:f510
ram:f000:c7a2   8904            MOV         word ptr [SI]=>DAT_1000_f510,AX         
                                                          ; FWD[2,0]:   1000:f412,1000:f512
ram:f000:c7a4   895402          MOV         word ptr [SI + 0x2]=>DAT_1000_f512,DX   
ram:f000:c7a7   b8001f          MOV         AX,0x1f00                               
ram:f000:c7aa   8ed8            MOV         DS,AX                                   
ram:f000:c7ac   a15e00          MOV         AX,[offset DAT_1000_f05e &0xff]         
ram:f000:c7af   8b166000        MOV         DX,word ptr [offset DAT_1000_f060 &0xff]
ram:f000:c7b3   8bcf            MOV         CX,DI                                   
ram:f000:c7b5   d1e1            SHL         CX,1                                    
ram:f000:c7b7   02c1            ADD         AL,CL                                   
ram:f000:c7b9   7303            JNC         LAB_f000_c7be                           
ram:f000:c7bb   83c210          ADD         DX,0x10                                 
                            LAB_f000_c7be:                ;XREF[1,0]:   f000:c7b9
ram:f000:c7be   30c9            XOR         CL,CL                                   
ram:f000:c7c0   d1f9            SAR         CX,1                                    
ram:f000:c7c2   d1f9            SAR         CX,1                                    
ram:f000:c7c4   d1f9            SAR         CX,1                                    
ram:f000:c7c6   d1f9            SAR         CX,1                                    
ram:f000:c7c8   03d1            ADD         DX,CX                                   
ram:f000:c7ca   8bf0            MOV         SI,AX                                   
ram:f000:c7cc   8eda            MOV         DS,DX                                   
ram:f000:c7ce   c7040000        MOV         word ptr [SI],0x0                       
ram:f000:c7d2   47              INC         DI                                      
ram:f000:c7d3   eb87            JMP         LAB_f000_c75c                           
                            LAB_f000_c7d5:                ;XREF[1,0]:   f000:c768
ram:f000:c7d5   b8001f          MOV         AX,0x1f00                               
ram:f000:c7d8   8ed8            MOV         DS,AX                                   
ram:f000:c7da   a15e00          MOV         AX,[offset DAT_1000_f05e &0xff]         
ram:f000:c7dd   8b166000        MOV         DX,word ptr [offset DAT_1000_f060 &0xff]
ram:f000:c7e1   b9001f          MOV         CX,0x1f00                               
ram:f000:c7e4   8ed9            MOV         DS,CX                                   
ram:f000:c7e6   8a0e3d00        MOV         CL,byte ptr [offset NUM_REQ_Q &0xff]    
ram:f000:c7ea   30ed            XOR         CH,CH                                   
ram:f000:c7ec   d1e1            SHL         CX,1                                    
ram:f000:c7ee   d1e1            SHL         CX,1                                    
ram:f000:c7f0   d1e1            SHL         CX,1                                    
ram:f000:c7f2   02c1            ADD         AL,CL                                   
ram:f000:c7f4   7303            JNC         LAB_f000_c7f9                           
ram:f000:c7f6   83c210          ADD         DX,0x10                                 
                            LAB_f000_c7f9:                ;XREF[1,0]:   f000:c7f4
ram:f000:c7f9   30c9            XOR         CL,CL                                   
ram:f000:c7fb   d1e9            SHR         CX,1                                    
ram:f000:c7fd   d1e9            SHR         CX,1                                    
ram:f000:c7ff   d1e9            SHR         CX,1                                    
ram:f000:c801   d1e9            SHR         CX,1                                    
ram:f000:c803   03d1            ADD         DX,CX                                   
ram:f000:c805   b9001f          MOV         CX,0x1f00                               
ram:f000:c808   8ed9            MOV         DS,CX                                   
ram:f000:c80a   a35600          MOV         [offset DAT_1000_f056 &0xff],AX         
ram:f000:c80d   89165800        MOV         word ptr [offset DAT_1000_f058 &0xff],DX
ram:f000:c811   9a9d0060f8      CALLF       return_success                          ;undefined2 return_success(void)
ram:f000:c816   8846fb          MOV         byte ptr [BP + -0x5],AL                 
ram:f000:c819   b8001f          MOV         AX,0x1f00                               
ram:f000:c81c   8ed8            MOV         DS,AX                                   
ram:f000:c81e   80264c007f      AND         byte ptr [offset...,0x7f                
ram:f000:c823   f646fbff        TEST        byte ptr [BP + -0x5],0xff               
ram:f000:c827   740c            JZ          LAB_f000_c835                           
ram:f000:c829   b8001f          MOV         AX,0x1f00                               
ram:f000:c82c   8ed8            MOV         DS,AX                                   
ram:f000:c82e   c6064d0003      MOV         byte ptr [offset...,0x3                 
ram:f000:c833   eb0a            JMP         LAB_f000_c83f                           
                            LAB_f000_c835:                ;XREF[1,0]:   f000:c827
ram:f000:c835   b8001f          MOV         AX,0x1f00                               
ram:f000:c838   8ed8            MOV         DS,AX                                   
ram:f000:c83a   c6064d0001      MOV         byte ptr [offset...,0x1                 
                            LAB_f000_c83f:                ;XREF[1,0]:   f000:c833
ram:f000:c83f   31ff            XOR         DI,DI                                   
                            LAB_f000_c841:                ;XREF[1,0]:   f000:c851
ram:f000:c841   83ff04          CMP         DI,0x4                                  
ram:f000:c844   730d            JNC         LAB_f000_c853                           
ram:f000:c846   b8001f          MOV         AX,0x1f00                               
ram:f000:c849   8ed8            MOV         DS,AX                                   
ram:f000:c84b   c685520000      MOV         byte ptr [DI + o...,0x0                 
ram:f000:c850   47              INC         DI                                      
ram:f000:c851   ebee            JMP         LAB_f000_c841                           
                            LAB_f000_c853:                ;XREF[1,0]:   f000:c844
ram:f000:c853   b8001f          MOV         AX,0x1f00                               
ram:f000:c856   50              PUSH        AX                                      
ram:f000:c857   b84a00          MOV         AX,0x4a                                 
ram:f000:c85a   50              PUSH        AX                                      
ram:f000:c85b   9a4c0090fd      CALLF       complete_full_job                       ;undefined2 complete_full_job(void)
ram:f000:c860   83c404          ADD         SP,0x4                                  
ram:f000:c863   b8001f          MOV         AX,0x1f00                               
ram:f000:c866   8ed8            MOV         DS,AX                                   
ram:f000:c868   c70678000100    MOV         word ptr [offset...,0x1                 
ram:f000:c86e   b8001f          MOV         AX,0x1f00                               
ram:f000:c871   50              PUSH        AX                                      
ram:f000:c872   b84a00          MOV         AX,0x4a                                 
ram:f000:c875   50              PUSH        AX                                      
ram:f000:c876   9a300020fd      CALLF       complete_express_job                    ;void complete_express_job(void)
ram:f000:c87b   83c404          ADD         SP,0x4                                  
ram:f000:c87e   8a46fb          MOV         AL,byte ptr [BP + -0x5]                 
ram:f000:c881   30e4            XOR         AH,AH                                   
ram:f000:c883   eb00            JMP         LAB_f000_c885                           
                            LAB_f000_c885:                ;XREF[2,0]:   f000:c648,f000:c883
ram:f000:c885   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void sysgen_response_no_rque(void)
                                                          ;XREF[1,0]:   f000:c643
ram:f000:c88a   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:c88f   81ec0000        SUB         SP,0x0                                  
ram:f000:c893   b8001f          MOV         AX,0x1f00                               
ram:f000:c896   8ed8            MOV         DS,AX                                   
ram:f000:c898   a13200          MOV         AX,[offset REQ_Q_L &0xff]               
ram:f000:c89b   8b163400        MOV         DX,word ptr [offset REQ_Q_H &0xff]      
ram:f000:c89f   b9301f          MOV         CX,0x1f30                               
ram:f000:c8a2   8ed9            MOV         DS,CX                                   
ram:f000:c8a4   a3de00          MOV         [offset HOST_ADDR_L &0xff],AX           
ram:f000:c8a7   8916e000        MOV         word ptr [offset HOST_ADDR_H &0xff],DX  
ram:f000:c8ab   b8001f          MOV         AX,0x1f00                               
ram:f000:c8ae   8ed8            MOV         DS,AX                                   
ram:f000:c8b0   a13600          MOV         AX,[offset CMP_Q_L &0xff]               
ram:f000:c8b3   8b163800        MOV         DX,word ptr [offset CMP_Q_H &0xff]      
ram:f000:c8b7   b9301f          MOV         CX,0x1f30                               
ram:f000:c8ba   8ed9            MOV         DS,CX                                   
ram:f000:c8bc   a3e200          MOV         [offset DAT_1000_f3e2 &0xff],AX         
ram:f000:c8bf   8916e400        MOV         word ptr [offset DAT_1000_f3e4 &0xff],DX
ram:f000:c8c3   b8301f          MOV         AX,0x1f30                               
ram:f000:c8c6   8ed8            MOV         DS,AX                                   
ram:f000:c8c8   ff36e400        PUSH        word ptr [offset DAT_1000_f3e4 &0xff]   
ram:f000:c8cc   ff36e200        PUSH        word ptr [offset DAT_1000_f3e2 &0xff]   
ram:f000:c8d0   9a020090fd      CALLF       set_host_page                           ;undefined2 set_host_page(undefined2 ...
ram:f000:c8d5   83c404          ADD         SP,0x4                                  
ram:f000:c8d8   8af2            MOV         DH,DL                                   
ram:f000:c8da   8ad4            MOV         DL,AH                                   
ram:f000:c8dc   30e4            XOR         AH,AH                                   
ram:f000:c8de   d1e2            SHL         DX,1                                    
ram:f000:c8e0   d1e2            SHL         DX,1                                    
ram:f000:c8e2   d1e2            SHL         DX,1                                    
ram:f000:c8e4   d1e2            SHL         DX,1                                    
ram:f000:c8e6   8bf0            MOV         SI,AX                                   
ram:f000:c8e8   8eda            MOV         DS,DX                                   
ram:f000:c8ea   c60403          MOV         byte ptr [SI],0x3                       
ram:f000:c8ed   9a9d0060f8      CALLF       return_success                          ;undefined2 return_success(void)
ram:f000:c8f2   eb00            JMP         LAB_f000_c8f4                           
                            LAB_f000_c8f4:                ;XREF[1,0]:   f000:c8f2
ram:f000:c8f4   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void get_fast_job(void)
                                                          ;XREF[2,0]:   f000:c9c1,f000:c9e9
ram:f000:c8f9   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:c8fe   81ec0000        SUB         SP,0x0                                  
ram:f000:c902   b8001f          MOV         AX,0x1f00                               
ram:f000:c905   8ed8            MOV         DS,AX                                   
ram:f000:c907   f6060100ff      TEST        byte ptr [offset job_pending &0xff],0xff
ram:f000:c90c   750c            JNZ         LAB_f000_c91a                           
ram:f000:c90e   b8001f          MOV         AX,0x1f00                               
ram:f000:c911   8ed8            MOV         DS,AX                                   
ram:f000:c913   c606010001      MOV         byte ptr [offset job_pending &0xff],0x1 
ram:f000:c918   eb05            JMP         LAB_f000_c91f                           
                            LAB_f000_c91a:                ;XREF[1,0]:   f000:c90c
ram:f000:c91a   9ab700f0f8      CALLF       halt_on_error                           ;void halt_on_error(void)
                            LAB_f000_c91f:                ;XREF[1,0]:   f000:c918
ram:f000:c91f   b80000          MOV         AX,0x0                                  
ram:f000:c922   50              PUSH        AX                                      
ram:f000:c923   b81000          MOV         AX,0x10                                 
ram:f000:c926   50              PUSH        AX                                      
ram:f000:c927   b8e800          MOV         AX,0xe8                                 
ram:f000:c92a   ba301f          MOV         DX,0x1f30                               
ram:f000:c92d   d1ea            SHR         DX,1                                    
ram:f000:c92f   d1ea            SHR         DX,1                                    
ram:f000:c931   d1ea            SHR         DX,1                                    
ram:f000:c933   d1ea            SHR         DX,1                                    
ram:f000:c935   86d4            XCHG        AH,DL                                   
ram:f000:c937   86f2            XCHG        DL,DH                                   
ram:f000:c939   52              PUSH        DX                                      
ram:f000:c93a   50              PUSH        AX                                      
ram:f000:c93b   b8301f          MOV         AX,0x1f30                               
ram:f000:c93e   8ed8            MOV         DS,AX                                   
ram:f000:c940   ff36e000        PUSH        word ptr [offset HOST_ADDR_H &0xff]     
ram:f000:c944   ff36de00        PUSH        word ptr [offset HOST_ADDR_L &0xff]     
ram:f000:c948   9a200070fd      CALLF       transfer_words                          ;undefined transfer_words()
ram:f000:c94d   83c40c          ADD         SP,0xc                                  
ram:f000:c950   b8301f          MOV         AX,0x1f30                               
ram:f000:c953   8ed8            MOV         DS,AX                                   
ram:f000:c955   ff36ee00        PUSH        word ptr [offset frq_timeout_lo &0xff]  
ram:f000:c959   ff36ec00        PUSH        word ptr [offset frq_timeout_hi &0xff]  
ram:f000:c95d   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:c962   83c404          ADD         SP,0x4                                  
ram:f000:c965   b9301f          MOV         CX,0x1f30                               
ram:f000:c968   8ed9            MOV         DS,CX                                   
ram:f000:c96a   a3ec00          MOV         [offset frq_timeout_hi &0xff],AX        
ram:f000:c96d   8916ee00        MOV         word ptr [offset...,DX                  
ram:f000:c971   b8301f          MOV         AX,0x1f30                               
ram:f000:c974   8ed8            MOV         DS,AX                                   
ram:f000:c976   ff36f200        PUSH        word ptr [offset frq_addr_lo &0xff]     
ram:f000:c97a   ff36f000        PUSH        word ptr [offset frq_addr_hi &0xff]     
ram:f000:c97e   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:c983   83c404          ADD         SP,0x4                                  
ram:f000:c986   b9301f          MOV         CX,0x1f30                               
ram:f000:c989   8ed9            MOV         DS,CX                                   
ram:f000:c98b   a3f000          MOV         [offset frq_addr_hi &0xff],AX           
ram:f000:c98e   8916f200        MOV         word ptr [offset frq_addr_lo &0xff],DX  
ram:f000:c992   b8301f          MOV         AX,0x1f30                               
ram:f000:c995   8ed8            MOV         DS,AX                                   
ram:f000:c997   ff36f600        PUSH        word ptr [offset frq_len_lo &0xff]      
ram:f000:c99b   ff36f400        PUSH        word ptr [offset frq_len_hi &0xff]      
ram:f000:c99f   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:c9a4   83c404          ADD         SP,0x4                                  
ram:f000:c9a7   b9301f          MOV         CX,0x1f30                               
ram:f000:c9aa   8ed9            MOV         DS,CX                                   
ram:f000:c9ac   a3f400          MOV         [offset frq_len_hi &0xff],AX            
ram:f000:c9af   8916f600        MOV         word ptr [offset frq_len_lo &0xff],DX   
ram:f000:c9b3   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void FUN_f000_c9b8(void)
                                                          ;XREF[1,0]:   f000:88cb
ram:f000:c9b8   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:c9bd   81ec0000        SUB         SP,0x0                                  
ram:f000:c9c1   9af90080fc      CALLF       get_fast_job                            ;void get_fast_job(void)
ram:f000:c9c6   b800c0          MOV         AX,0xc000                               
ram:f000:c9c9   8ed8            MOV         DS,AX                                   
ram:f000:c9cb   c606890000      MOV         byte ptr [PCSR_1_INT1],0x0              
ram:f000:c9d0   b840c0          MOV         AX,0xc040                               
ram:f000:c9d3   8ed8            MOV         DS,AX                                   
ram:f000:c9d5   c70622000d00    MOV         word ptr [offset INT_CTRL_EOI &0xff],0xd
ram:f000:c9db   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void FUN_f000_c9e0(void)
                                                          ;XREF[1,0]:   f000:88d7
ram:f000:c9e0   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:c9e5   81ec0000        SUB         SP,0x0                                  
ram:f000:c9e9   9af90080fc      CALLF       get_fast_job                            ;void get_fast_job(void)
ram:f000:c9ee   b800c0          MOV         AX,0xc000                               
ram:f000:c9f1   8ed8            MOV         DS,AX                                   
ram:f000:c9f3   c606880000      MOV         byte ptr [PCSR_0_INT0],0x0              
ram:f000:c9f8   b840c0          MOV         AX,0xc040                               
ram:f000:c9fb   8ed8            MOV         DS,AX                                   
ram:f000:c9fd   c70622000c00    MOV         word ptr [offset INT_CTRL_EOI &0xff],0xc
ram:f000:ca03   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void pre_sysgen_loop(void)
                                                          ;XREF[1,0]:   f000:86c6
ram:f000:ca08   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:ca0d   81ec0000        SUB         SP,0x0                                  
ram:f000:ca11   b8001f          MOV         AX,0x1f00                               
ram:f000:ca14   8ed8            MOV         DS,AX                                   
ram:f000:ca16   c606010000      MOV         byte ptr [offset job_pending &0xff],0x0 
ram:f000:ca1b   b8001f          MOV         AX,0x1f00                               
ram:f000:ca1e   8ed8            MOV         DS,AX                                   
ram:f000:ca20   c606000000      MOV         byte ptr [0x0]=>express_job_pending,0x0 
ram:f000:ca25   fa              CLI                                                  
                            ;Set up interrupt handlers so we can sysgen, or take
                            ;some pre-sysgen express jobs.
ram:f000:ca26   b80000          MOV         AX,0x0                                  
ram:f000:ca29   8ed8            MOV         DS,AX                                   
ram:f000:ca2b   c7063000d400    MOV         word ptr [INT0_VEC_IP],0xd4             
ram:f000:ca31   c706320080f8    MOV         word ptr [INT0_VEC_CS],0xf880           
ram:f000:ca37   b80000          MOV         AX,0x0                                  
ram:f000:ca3a   8ed8            MOV         DS,AX                                   
ram:f000:ca3c   c7063400c800    MOV         word ptr [INT1_VEC_IP],0xc8             
ram:f000:ca42   c706360080f8    MOV         word ptr [INT1_VEC_CS],0xf880           
ram:f000:ca48   b840c0          MOV         AX,0xc040                               
ram:f000:ca4b   8ed8            MOV         DS,AX                                   
ram:f000:ca4d   81263800f7ff    AND         word ptr [offset INT0_CTRL &0xff],0xfff7
ram:f000:ca53   b840c0          MOV         AX,0xc040                               
ram:f000:ca56   8ed8            MOV         DS,AX                                   
ram:f000:ca58   81263a00f7ff    AND         word ptr [offset INT1_CTRL &0xff],0xfff7
ram:f000:ca5e   fb              STI                                                  
                            LAB_f000_ca5f:                ;XREF[1,0]:   f000:cb0b
ram:f000:ca5f   b8001f          MOV         AX,0x1f00                               
ram:f000:ca62   8ed8            MOV         DS,AX                                   
ram:f000:ca64   f6060100ff      TEST        byte ptr [offset job_pending &0xff],0xff
ram:f000:ca69   7503            JNZ         LAB_f000_ca6e                           
ram:f000:ca6b   e99d00          JMP         LAB_f000_cb0b                           
                            LAB_f000_ca6e:                ;XREF[1,0]:   f000:ca69
ram:f000:ca6e   b8301f          MOV         AX,0x1f30                               
ram:f000:ca71   8ed8            MOV         DS,AX                                   
ram:f000:ca73   a0e900          MOV         AL,[offset OPCODE &0xff]                
ram:f000:ca76   30e4            XOR         AH,AH                                   
ram:f000:ca78   ba401f          MOV         DX,0x1f40                               
ram:f000:ca7b   8eda            MOV         DS,DX                                   
ram:f000:ca7d   a20900          MOV         [offset DAT_1000_f409 &0xff],AL         
ram:f000:ca80   b8301f          MOV         AX,0x1f30                               
ram:f000:ca83   8ed8            MOV         DS,AX                                   
ram:f000:ca85   a0ea00          MOV         AL,[offset DAT_1000_f3ea &0xff]         
ram:f000:ca88   30e4            XOR         AH,AH                                   
ram:f000:ca8a   ba401f          MOV         DX,0x1f40                               
ram:f000:ca8d   8eda            MOV         DS,DX                                   
ram:f000:ca8f   a20a00          MOV         [offset DAT_1000_f40a &0xff],AL         
ram:f000:ca92   9a1300b0fc      CALLF       handle_pre_sysgen_jobs                  ;void handle_pre_sysgen_jobs(void)
ram:f000:ca97   ba401f          MOV         DX,0x1f40                               
ram:f000:ca9a   8eda            MOV         DS,DX                                   
ram:f000:ca9c   a20800          MOV         [offset DAT_1000_f408 &0xff],AL         
ram:f000:ca9f   fa              CLI                                                  
ram:f000:caa0   b8301f          MOV         AX,0x1f30                               
ram:f000:caa3   8ed8            MOV         DS,AX                                   
ram:f000:caa5   ff36e000        PUSH        word ptr [offset HOST_ADDR_H &0xff]     
ram:f000:caa9   ff36de00        PUSH        word ptr [offset HOST_ADDR_L &0xff]     
ram:f000:caad   9a020090fd      CALLF       set_host_page                           ;undefined2 set_host_page(undefined2 ...
ram:f000:cab2   83c404          ADD         SP,0x4                                  
ram:f000:cab5   8af2            MOV         DH,DL                                   
ram:f000:cab7   8ad4            MOV         DL,AH                                   
ram:f000:cab9   30e4            XOR         AH,AH                                   
ram:f000:cabb   d1e2            SHL         DX,1                                    
ram:f000:cabd   d1e2            SHL         DX,1                                    
ram:f000:cabf   d1e2            SHL         DX,1                                    
ram:f000:cac1   d1e2            SHL         DX,1                                    
ram:f000:cac3   8bf0            MOV         SI,AX                                   
ram:f000:cac5   8eda            MOV         DS,DX                                   
ram:f000:cac7   c60400          MOV         byte ptr [SI],0x0                       
ram:f000:caca   b80100          MOV         AX,0x1                                  
ram:f000:cacd   50              PUSH        AX                                      
ram:f000:cace   b80200          MOV         AX,0x2                                  
ram:f000:cad1   50              PUSH        AX                                      
ram:f000:cad2   b8301f          MOV         AX,0x1f30                               
ram:f000:cad5   8ed8            MOV         DS,AX                                   
ram:f000:cad7   ff36e400        PUSH        word ptr [offset DAT_1000_f3e4 &0xff]   
ram:f000:cadb   ff36e200        PUSH        word ptr [offset DAT_1000_f3e2 &0xff]   
ram:f000:cadf   b80800          MOV         AX,0x8                                  
ram:f000:cae2   ba401f          MOV         DX,0x1f40                               
ram:f000:cae5   d1ea            SHR         DX,1                                    
ram:f000:cae7   d1ea            SHR         DX,1                                    
ram:f000:cae9   d1ea            SHR         DX,1                                    
ram:f000:caeb   d1ea            SHR         DX,1                                    
ram:f000:caed   86d4            XCHG        AH,DL                                   
ram:f000:caef   86f2            XCHG        DL,DH                                   
ram:f000:caf1   52              PUSH        DX                                      
ram:f000:caf2   50              PUSH        AX                                      
ram:f000:caf3   9a200070fd      CALLF       transfer_words                          ;undefined transfer_words()
ram:f000:caf8   83c40c          ADD         SP,0xc                                  
ram:f000:cafb   9a220090fd      CALLF       req_sbd_interrupt                       ;void req_sbd_interrupt(void)
ram:f000:cb00   b8001f          MOV         AX,0x1f00                               
ram:f000:cb03   8ed8            MOV         DS,AX                                   
ram:f000:cb05   c606010000      MOV         byte ptr [offset job_pending &0xff],0x0 
ram:f000:cb0a   fb              STI                                                  
                            LAB_f000_cb0b:                ;XREF[1,0]:   f000:ca6b
ram:f000:cb0b   e951ff          JMP         LAB_f000_ca5f                           
ram:f000:cb0e   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void handle_pre_sysgen_jobs(void)
                                                          ;XREF[1,0]:   f000:ca92
ram:f000:cb13   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:cb18   81ec0000        SUB         SP,0x0                                  
ram:f000:cb1c   b8301f          MOV         AX,0x1f30                               
ram:f000:cb1f   8ed8            MOV         DS,AX                                   
ram:f000:cb21   a0e900          MOV         AL,[offset OPCODE &0xff]                
ram:f000:cb24   30e4            XOR         AH,AH                                   
ram:f000:cb26   e9af00          JMP         LAB_f000_cbd8                           
                            LAB_f000_cb29:                ;XREF[1,0]:   f000:cbf8
ram:f000:cb29   9a4400c0fc      CALLF       cio_dlm                                 ;undefined2 cio_dlm(void)
ram:f000:cb2e   e90e01          JMP         LAB_f000_cc3f                           
                            LAB_f000_cb31:                ;XREF[1,0]:   f000:cbee
ram:f000:cb31   9aab00c0fc      CALLF       FUN_f000_ccab                           ;undefined2 FUN_f000_ccab(void)
ram:f000:cb36   e90601          JMP         LAB_f000_cc3f                           
                            LAB_f000_cb39:                ;XREF[1,0]:   f000:cc02
ram:f000:cb39   9a1200d0fc      CALLF       cio_fcf                                 ;void cio_fcf(void)
ram:f000:cb3e   e9fe00          JMP         LAB_f000_cc3f                           
                            LAB_f000_cb41:                ;XREF[1,0]:   f000:cbe4
ram:f000:cb41   b80000          MOV         AX,0x0                                  
ram:f000:cb44   e9f800          JMP         LAB_f000_cc3f                           
                            LAB_f000_cb47:                ;XREF[1,0]:   f000:cc16
ram:f000:cb47   b8301f          MOV         AX,0x1f30                               
ram:f000:cb4a   8ed8            MOV         DS,AX                                   
ram:f000:cb4c   ff36f200        PUSH        word ptr [offset frq_addr_lo &0xff]     
ram:f000:cb50   ff36f000        PUSH        word ptr [offset frq_addr_hi &0xff]     
ram:f000:cb54   9a2c00c0f8      CALLF       scsi_dsd                                ;undefined2 scsi_dsd(void)
ram:f000:cb59   83c404          ADD         SP,0x4                                  
ram:f000:cb5c   e9e000          JMP         LAB_f000_cc3f                           
                            LAB_f000_cb5f:                ;XREF[1,0]:   f000:cc0c
ram:f000:cb5f   9add00e0fc      CALLF       scsi_control_fast                       ;undefined2 scsi_control_fast(void)
ram:f000:cb64   e9d800          JMP         LAB_f000_cc3f                           
                            LAB_f000_cb67:                ;XREF[1,0]:   f000:cc20
ram:f000:cb67   b8001f          MOV         AX,0x1f00                               
ram:f000:cb6a   8ed8            MOV         DS,AX                                   
ram:f000:cb6c   f7067c00ffff    TEST        word ptr [offset...,0xffff              
ram:f000:cb72   7437            JZ          LAB_f000_cbab                           
ram:f000:cb74   b80100          MOV         AX,0x1                                  
ram:f000:cb77   50              PUSH        AX                                      
ram:f000:cb78   b82000          MOV         AX,0x20                                 
ram:f000:cb7b   50              PUSH        AX                                      
ram:f000:cb7c   b8301f          MOV         AX,0x1f30                               
ram:f000:cb7f   8ed8            MOV         DS,AX                                   
ram:f000:cb81   ff36f200        PUSH        word ptr [offset frq_addr_lo &0xff]     
ram:f000:cb85   ff36f000        PUSH        word ptr [offset frq_addr_hi &0xff]     
ram:f000:cb89   b88a00          MOV         AX,0x8a                                 
ram:f000:cb8c   bae0fd          MOV         DX,0xfde0                               
ram:f000:cb8f   d1ea            SHR         DX,1                                    
ram:f000:cb91   d1ea            SHR         DX,1                                    
ram:f000:cb93   d1ea            SHR         DX,1                                    
ram:f000:cb95   d1ea            SHR         DX,1                                    
ram:f000:cb97   86d4            XCHG        AH,DL                                   
ram:f000:cb99   86f2            XCHG        DL,DH                                   
ram:f000:cb9b   52              PUSH        DX                                      
ram:f000:cb9c   50              PUSH        AX                                      
ram:f000:cb9d   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:cba2   83c40c          ADD         SP,0xc                                  
ram:f000:cba5   b80000          MOV         AX,0x0                                  
ram:f000:cba8   e99400          JMP         LAB_f000_cc3f                           
                            LAB_f000_cbab:                ;XREF[1,0]:   f000:cb72
ram:f000:cbab   b88000          MOV         AX,0x80                                 
ram:f000:cbae   e98e00          JMP         LAB_f000_cc3f                           
                            LAB_f000_cbb1:                ;XREF[1,0]:   f000:cc38
ram:f000:cbb1   fa              CLI                                                  
ram:f000:cbb2   9a350050fa      CALLF       scsi_reset_bus                          ;void scsi_reset_bus(void)
ram:f000:cbb7   fb              STI                                                  
ram:f000:cbb8   b80000          MOV         AX,0x0                                  
ram:f000:cbbb   e98100          JMP         LAB_f000_cc3f                           
                            LAB_f000_cbbe:                ;XREF[1,0]:   f000:cbdb
ram:f000:cbbe   9ad400d0fc      CALLF       FUN_f000_cdd4                           ;undefined FUN_f000_cdd4()
ram:f000:cbc3   eb7a            JMP         LAB_f000_cc3f                           
                            LAB_f000_cbc5:                ;XREF[1,0]:   f000:cc2f
ram:f000:cbc5   9a3100e0fc      CALLF       download_edt                            ;undefined2 download_edt(void)
ram:f000:cbca   eb73            JMP         LAB_f000_cc3f                           
                            LAB_f000_cbcc:                ;XREF[1,0]:   f000:cc28
ram:f000:cbcc   9a8700e0fc      CALLF       upload_edt                              ;undefined2 upload_edt(void)
ram:f000:cbd1   eb6c            JMP         LAB_f000_cc3f                           
                            LAB_f000_cbd3:                ;XREF[7,0]:   f000:cbfb,f000:cc05,f000:cc19,f000:cc23
                                                          ;             f000:cc31,f000:cc3b,f000:cc3d
ram:f000:cbd3   b88000          MOV         AX,0x80                                 
ram:f000:cbd6   eb67            JMP         LAB_f000_cc3f                           
                            LAB_f000_cbd8:                ;XREF[1,0]:   f000:cb26
ram:f000:cbd8   3d4000          CMP         AX,0x40                                 
ram:f000:cbdb   74e1            JZ          LAB_f000_cbbe                           
ram:f000:cbdd   7f46            JG          LAB_f000_cc25                           
ram:f000:cbdf   3d0400          CMP         AX,0x4                                  
ram:f000:cbe2   7503            JNZ         LAB_f000_cbe7                           
ram:f000:cbe4   e95aff          JMP         LAB_f000_cb41                           
                            LAB_f000_cbe7:                ;XREF[1,0]:   f000:cbe2
ram:f000:cbe7   7f1e            JG          LAB_f000_cc07                           
ram:f000:cbe9   3d0200          CMP         AX,0x2                                  
ram:f000:cbec   7503            JNZ         LAB_f000_cbf1                           
ram:f000:cbee   e940ff          JMP         LAB_f000_cb31                           
                            LAB_f000_cbf1:                ;XREF[1,0]:   f000:cbec
ram:f000:cbf1   7f0a            JG          LAB_f000_cbfd                           
ram:f000:cbf3   3d0100          CMP         AX,0x1                                  
ram:f000:cbf6   7503            JNZ         LAB_f000_cbfb                           
ram:f000:cbf8   e92eff          JMP         LAB_f000_cb29                           
                            LAB_f000_cbfb:                ;XREF[1,0]:   f000:cbf6
ram:f000:cbfb   ebd6            JMP         LAB_f000_cbd3                           
                            LAB_f000_cbfd:                ;XREF[1,0]:   f000:cbf1
ram:f000:cbfd   3d0300          CMP         AX,0x3                                  
ram:f000:cc00   7503            JNZ         LAB_f000_cc05                           
ram:f000:cc02   e934ff          JMP         LAB_f000_cb39                           
                            LAB_f000_cc05:                ;XREF[1,0]:   f000:cc00
ram:f000:cc05   ebcc            JMP         LAB_f000_cbd3                           
                            LAB_f000_cc07:                ;XREF[1,0]:   f000:cbe7
ram:f000:cc07   3d2000          CMP         AX,0x20                                 
ram:f000:cc0a   7503            JNZ         LAB_f000_cc0f                           
ram:f000:cc0c   e950ff          JMP         LAB_f000_cb5f                           
                            LAB_f000_cc0f:                ;XREF[1,0]:   f000:cc0a
ram:f000:cc0f   7f0a            JG          LAB_f000_cc1b                           
ram:f000:cc11   3d0500          CMP         AX,0x5                                  
ram:f000:cc14   7503            JNZ         LAB_f000_cc19                           
ram:f000:cc16   e92eff          JMP         LAB_f000_cb47                           
                            LAB_f000_cc19:                ;XREF[1,0]:   f000:cc14
ram:f000:cc19   ebb8            JMP         LAB_f000_cbd3                           
                            LAB_f000_cc1b:                ;XREF[1,0]:   f000:cc0f
ram:f000:cc1b   3d2100          CMP         AX,0x21                                 
ram:f000:cc1e   7503            JNZ         LAB_f000_cc23                           
ram:f000:cc20   e944ff          JMP         LAB_f000_cb67                           
                            LAB_f000_cc23:                ;XREF[1,0]:   f000:cc1e
ram:f000:cc23   ebae            JMP         LAB_f000_cbd3                           
                            LAB_f000_cc25:                ;XREF[1,0]:   f000:cbdd
ram:f000:cc25   3d4300          CMP         AX,0x43                                 
ram:f000:cc28   74a2            JZ          LAB_f000_cbcc                           
ram:f000:cc2a   7f07            JG          LAB_f000_cc33                           
ram:f000:cc2c   3d4200          CMP         AX,0x42                                 
ram:f000:cc2f   7494            JZ          LAB_f000_cbc5                           
ram:f000:cc31   eba0            JMP         LAB_f000_cbd3                           
                            LAB_f000_cc33:                ;XREF[1,0]:   f000:cc2a
ram:f000:cc33   3d4500          CMP         AX,0x45                                 
ram:f000:cc36   7503            JNZ         LAB_f000_cc3b                           
ram:f000:cc38   e976ff          JMP         LAB_f000_cbb1                           
                            LAB_f000_cc3b:                ;XREF[1,0]:   f000:cc36
ram:f000:cc3b   eb96            JMP         LAB_f000_cbd3                           
ram:f000:cc3d   eb94            JMP         LAB_f000_cbd3                           
                            LAB_f000_cc3f:                ;XREF[13,0]:  f000:cb2e,f000:cb36,f000:cb3e,f000:cb44
                                                          ;             f000:cb5c,f000:cb64,f000:cba8,f000:cbae
                                                          ;             f000:cbbb,f000:cbc3,f000:cbca,f000:cbd1
                                                          ;             f000:cbd6
ram:f000:cc3f   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 cio_dlm(void)
                                                          ;XREF[1,0]:   f000:cb29
ram:f000:cc44   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:cc49   81ec0800        SUB         SP,0x8                                  
ram:f000:cc4d   b8301f          MOV         AX,0x1f30                               
ram:f000:cc50   8ed8            MOV         DS,AX                                   
ram:f000:cc52   a1f400          MOV         AX,[offset frq_len_hi &0xff]            
ram:f000:cc55   8b16f600        MOV         DX,word ptr [offset frq_len_lo &0xff]   
ram:f000:cc59   8bf8            MOV         DI,AX                                   
ram:f000:cc5b   b8301f          MOV         AX,0x1f30                               
ram:f000:cc5e   8ed8            MOV         DS,AX                                   
ram:f000:cc60   a1f000          MOV         AX,[offset frq_addr_hi &0xff]           
ram:f000:cc63   8b16f200        MOV         DX,word ptr [offset frq_addr_lo &0xff]  
ram:f000:cc67   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:cc6a   8956fe          MOV         word ptr [BP + -0x2],DX                 
ram:f000:cc6d   b8301f          MOV         AX,0x1f30                               
ram:f000:cc70   8ed8            MOV         DS,AX                                   
ram:f000:cc72   ff36fa00        PUSH        word ptr [offset frq_req_lo &0xff]      
ram:f000:cc76   ff36f800        PUSH        word ptr [offset frq_req_hi &0xff]      
ram:f000:cc7a   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:cc7f   83c404          ADD         SP,0x4                                  
ram:f000:cc82   8946f8          MOV         word ptr [BP + -0x8],AX                 
ram:f000:cc85   8956fa          MOV         word ptr [BP + -0x6],DX                 
ram:f000:cc88   b80000          MOV         AX,0x0                                  
ram:f000:cc8b   50              PUSH        AX                                      
ram:f000:cc8c   57              PUSH        DI                                      
ram:f000:cc8d   ff76fa          PUSH        word ptr [BP + -0x6]                    
ram:f000:cc90   ff76f8          PUSH        word ptr [BP + -0x8]                    
ram:f000:cc93   ff76fe          PUSH        word ptr [BP + -0x2]                    
ram:f000:cc96   ff76fc          PUSH        word ptr [BP + -0x4]                    
ram:f000:cc99   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:cc9e   83c40c          ADD         SP,0xc                                  
ram:f000:cca1   b80000          MOV         AX,0x0                                  
ram:f000:cca4   eb00            JMP         LAB_f000_cca6                           
                            LAB_f000_cca6:                ;XREF[1,0]:   f000:cca4
ram:f000:cca6   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 FUN_f000_ccab(void)
                                                          ;XREF[1,0]:   f000:cb31
ram:f000:ccab   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:ccb0   81ec0800        SUB         SP,0x8                                  
ram:f000:ccb4   b8301f          MOV         AX,0x1f30                               
ram:f000:ccb7   8ed8            MOV         DS,AX                                   
ram:f000:ccb9   a1f400          MOV         AX,[offset frq_len_hi &0xff]            
ram:f000:ccbc   8b16f600        MOV         DX,word ptr [offset frq_len_lo &0xff]   
ram:f000:ccc0   8bf8            MOV         DI,AX                                   
ram:f000:ccc2   b8301f          MOV         AX,0x1f30                               
ram:f000:ccc5   8ed8            MOV         DS,AX                                   
ram:f000:ccc7   a1f000          MOV         AX,[offset frq_addr_hi &0xff]           
ram:f000:ccca   8b16f200        MOV         DX,word ptr [offset frq_addr_lo &0xff]  
ram:f000:ccce   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:ccd1   8956fe          MOV         word ptr [BP + -0x2],DX                 
ram:f000:ccd4   b8301f          MOV         AX,0x1f30                               
ram:f000:ccd7   8ed8            MOV         DS,AX                                   
ram:f000:ccd9   ff36fa00        PUSH        word ptr [offset frq_req_lo &0xff]      
ram:f000:ccdd   ff36f800        PUSH        word ptr [offset frq_req_hi &0xff]      
ram:f000:cce1   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:cce6   83c404          ADD         SP,0x4                                  
ram:f000:cce9   8946f8          MOV         word ptr [BP + -0x8],AX                 
ram:f000:ccec   8956fa          MOV         word ptr [BP + -0x6],DX                 
ram:f000:ccef   b80100          MOV         AX,0x1                                  
ram:f000:ccf2   50              PUSH        AX                                      
ram:f000:ccf3   57              PUSH        DI                                      
ram:f000:ccf4   ff76fa          PUSH        word ptr [BP + -0x6]                    
ram:f000:ccf7   ff76f8          PUSH        word ptr [BP + -0x8]                    
ram:f000:ccfa   ff76fe          PUSH        word ptr [BP + -0x2]                    
ram:f000:ccfd   ff76fc          PUSH        word ptr [BP + -0x4]                    
ram:f000:cd00   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:cd05   83c40c          ADD         SP,0xc                                  
ram:f000:cd08   b80000          MOV         AX,0x0                                  
ram:f000:cd0b   eb00            JMP         LAB_f000_cd0d                           
                            LAB_f000_cd0d:                ;XREF[1,0]:   f000:cd0b
ram:f000:cd0d   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void cio_fcf(void)
                                                          ;XREF[1,0]:   f000:cb39
ram:f000:cd12   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:cd17   81ec0400        SUB         SP,0x4                                  
ram:f000:cd1b   b8301f          MOV         AX,0x1f30                               
ram:f000:cd1e   8ed8            MOV         DS,AX                                   
ram:f000:cd20   a1f000          MOV         AX,[offset frq_addr_hi &0xff]           
ram:f000:cd23   8b16f200        MOV         DX,word ptr [offset frq_addr_lo &0xff]  
ram:f000:cd27   2500ff          AND         AX,0xff00                               
ram:f000:cd2a   81e20f00        AND         DX,0xf                                  
ram:f000:cd2e   b90400          MOV         CX,0x4                                  
ram:f000:cd31   e306            JCXZ        LAB_f000_cd39                           
                            LAB_f000_cd33:                ;XREF[1,0]:   f000:cd37
ram:f000:cd33   d1fa            SAR         DX,1                                    
ram:f000:cd35   d1d8            RCR         AX,1                                    
ram:f000:cd37   e2fa            LOOP        LAB_f000_cd33                           
                            LAB_f000_cd39:                ;XREF[1,0]:   f000:cd31
ram:f000:cd39   8946fe          MOV         word ptr [BP + -0x2],AX                 
ram:f000:cd3c   b8301f          MOV         AX,0x1f30                               
ram:f000:cd3f   8ed8            MOV         DS,AX                                   
ram:f000:cd41   a1f000          MOV         AX,[offset frq_addr_hi &0xff]           
ram:f000:cd44   8b16f200        MOV         DX,word ptr [offset frq_addr_lo &0xff]  
ram:f000:cd48   25ff00          AND         AX,0xff                                 
ram:f000:cd4b   81e20000        AND         DX,0x0                                  
ram:f000:cd4f   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:cd52   b8401f          MOV         AX,0x1f40                               
ram:f000:cd55   8ed8            MOV         DS,AX                                   
ram:f000:cd57   c606080000      MOV         byte ptr [offset...,0x0                 
ram:f000:cd5c   b8301f          MOV         AX,0x1f30                               
ram:f000:cd5f   8ed8            MOV         DS,AX                                   
ram:f000:cd61   ff36e000        PUSH        word ptr [offset HOST_ADDR_H &0xff]     
ram:f000:cd65   ff36de00        PUSH        word ptr [offset HOST_ADDR_L &0xff]     
ram:f000:cd69   9a020090fd      CALLF       set_host_page                           ;undefined2 set_host_page(undefined2 ...
ram:f000:cd6e   83c404          ADD         SP,0x4                                  
ram:f000:cd71   8af2            MOV         DH,DL                                   
ram:f000:cd73   8ad4            MOV         DL,AH                                   
ram:f000:cd75   30e4            XOR         AH,AH                                   
ram:f000:cd77   d1e2            SHL         DX,1                                    
ram:f000:cd79   d1e2            SHL         DX,1                                    
ram:f000:cd7b   d1e2            SHL         DX,1                                    
ram:f000:cd7d   d1e2            SHL         DX,1                                    
ram:f000:cd7f   8bf0            MOV         SI,AX                                   
ram:f000:cd81   8eda            MOV         DS,DX                                   
ram:f000:cd83   c60400          MOV         byte ptr [SI],0x0                       
ram:f000:cd86   b80100          MOV         AX,0x1                                  
ram:f000:cd89   50              PUSH        AX                                      
ram:f000:cd8a   b80200          MOV         AX,0x2                                  
ram:f000:cd8d   50              PUSH        AX                                      
ram:f000:cd8e   b8301f          MOV         AX,0x1f30                               
ram:f000:cd91   8ed8            MOV         DS,AX                                   
ram:f000:cd93   ff36e400        PUSH        word ptr [offset DAT_1000_f3e4 &0xff]   
ram:f000:cd97   ff36e200        PUSH        word ptr [offset DAT_1000_f3e2 &0xff]   
ram:f000:cd9b   b80800          MOV         AX,0x8                                  
ram:f000:cd9e   ba401f          MOV         DX,0x1f40                               
ram:f000:cda1   d1ea            SHR         DX,1                                    
ram:f000:cda3   d1ea            SHR         DX,1                                    
ram:f000:cda5   d1ea            SHR         DX,1                                    
ram:f000:cda7   d1ea            SHR         DX,1                                    
ram:f000:cda9   86d4            XCHG        AH,DL                                   
ram:f000:cdab   86f2            XCHG        DL,DH                                   
ram:f000:cdad   52              PUSH        DX                                      
ram:f000:cdae   50              PUSH        AX                                      
ram:f000:cdaf   9a200070fd      CALLF       transfer_words                          ;undefined transfer_words()
ram:f000:cdb4   83c40c          ADD         SP,0xc                                  
ram:f000:cdb7   9a220090fd      CALLF       req_sbd_interrupt                       ;void req_sbd_interrupt(void)
ram:f000:cdbc   9ab70050f8      CALLF       init_state                              ;undefined init_state(void)
ram:f000:cdc1   ff76fc          PUSH        word ptr [BP + -0x4]                    
ram:f000:cdc4   ff76fe          PUSH        word ptr [BP + -0x2]                    
ram:f000:cdc7   9a6e0050fd      CALLF       call_pumped_function                    ;void call_pumped_function(void)
ram:f000:cdcc   83c404          ADD         SP,0x4                                  
ram:f000:cdcf   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined FUN_f000_cdd4()
                                                          ;XREF[1,0]:   f000:cbbe
ram:f000:cdd4   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:cdd9   81ec0400        SUB         SP,0x4                                  
ram:f000:cddd   b80100          MOV         AX,0x1                                  
ram:f000:cde0   50              PUSH        AX                                      
ram:f000:cde1   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:cde6   83c402          ADD         SP,0x2                                  
ram:f000:cde9   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:cdec   8956fe          MOV         word ptr [BP + -0x2],DX                 
ram:f000:cdef   b80100          MOV         AX,0x1                                  
ram:f000:cdf2   50              PUSH        AX                                      
ram:f000:cdf3   b80400          MOV         AX,0x4                                  
ram:f000:cdf6   50              PUSH        AX                                      
ram:f000:cdf7   b8301f          MOV         AX,0x1f30                               
ram:f000:cdfa   8ed8            MOV         DS,AX                                   
ram:f000:cdfc   ff36f200        PUSH        word ptr [offset frq_addr_lo &0xff]     
ram:f000:ce00   ff36f000        PUSH        word ptr [offset frq_addr_hi &0xff]     
ram:f000:ce04   8b4600          MOV         AX,word ptr [BP + 0x0]                  
ram:f000:ce07   8b5602          MOV         DX,word ptr [BP + 0x2]                  
ram:f000:ce0a   2c04            SUB         AL,0x4                                  
ram:f000:ce0c   7303            JNC         LAB_f000_ce11                           
ram:f000:ce0e   83ea10          SUB         DX,0x10                                 
                            LAB_f000_ce11:                ;XREF[1,0]:   f000:ce0c
ram:f000:ce11   d1ea            SHR         DX,1                                    
ram:f000:ce13   d1ea            SHR         DX,1                                    
ram:f000:ce15   d1ea            SHR         DX,1                                    
ram:f000:ce17   d1ea            SHR         DX,1                                    
ram:f000:ce19   86d4            XCHG        AH,DL                                   
ram:f000:ce1b   86f2            XCHG        DL,DH                                   
ram:f000:ce1d   52              PUSH        DX                                      
ram:f000:ce1e   50              PUSH        AX                                      
ram:f000:ce1f   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:ce24   83c40c          ADD         SP,0xc                                  
ram:f000:ce27   b80000          MOV         AX,0x0                                  
ram:f000:ce2a   eb00            JMP         LAB_f000_ce2c                           
                            LAB_f000_ce2c:                ;XREF[1,0]:   f000:ce2a
ram:f000:ce2c   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*  This function appears to respond to a request to update                                     *
                            ;*  a LUN's EDT in memory. I think it knows that the EDT                                        *
                            ;*  lives at 0x2080000 (established during the earlier                                          *
                            ;*  EXTENDED_DSD phase) and that it uses the second word of                                     *
                            ;*  the application data as an offset into this table.                                          *
                            ;*                                                                                              *
                            ;*  The first word of app data is a pointer of some kind,                                       *
                            ;*  but I don't know what it wants me to write there!                                           *
                            ;************************************************************************************************
                            ;undefined2 download_edt(void)
                                                          ;XREF[1,0]:   f000:cbc5
ram:f000:ce31   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:ce36   81ec0800        SUB         SP,0x8                                  
ram:f000:ce3a   b8301f          MOV         AX,0x1f30                               
ram:f000:ce3d   8ed8            MOV         DS,AX                                   
ram:f000:ce3f   a1f400          MOV         AX,[offset frq_len_hi &0xff]            
ram:f000:ce42   8b16f600        MOV         DX,word ptr [offset frq_len_lo &0xff]   
ram:f000:ce46   8bf8            MOV         DI,AX                                   
ram:f000:ce48   b8301f          MOV         AX,0x1f30                               
ram:f000:ce4b   8ed8            MOV         DS,AX                                   
ram:f000:ce4d   a1f000          MOV         AX,[offset frq_addr_hi &0xff]           
ram:f000:ce50   8b16f200        MOV         DX,word ptr [offset frq_addr_lo &0xff]  
ram:f000:ce54   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:ce57   8956fe          MOV         word ptr [BP + -0x2],DX                 
ram:f000:ce5a   c746f800e0      MOV         word ptr [BP + -0x8],0xe000             
ram:f000:ce5f   c746fa0100      MOV         word ptr [BP + -0x6],0x1                
ram:f000:ce64   b80100          MOV         AX,0x1                                  
ram:f000:ce67   50              PUSH        AX                                      
ram:f000:ce68   57              PUSH        DI                                      
ram:f000:ce69   ff76fe          PUSH        word ptr [BP + -0x2]                    
ram:f000:ce6c   ff76fc          PUSH        word ptr [BP + -0x4]                    
ram:f000:ce6f   ff76fa          PUSH        word ptr [BP + -0x6]                    
ram:f000:ce72   ff76f8          PUSH        word ptr [BP + -0x8]                    
ram:f000:ce75   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:ce7a   83c40c          ADD         SP,0xc                                  
ram:f000:ce7d   b80000          MOV         AX,0x0                                  
ram:f000:ce80   eb00            JMP         LAB_f000_ce82                           
                            LAB_f000_ce82:                ;XREF[1,0]:   f000:ce80
ram:f000:ce82   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 upload_edt(void)
                                                          ;XREF[1,0]:   f000:cbcc
ram:f000:ce87   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:ce8c   81ec0800        SUB         SP,0x8                                  
ram:f000:ce90   b8301f          MOV         AX,0x1f30                               
ram:f000:ce93   8ed8            MOV         DS,AX                                   
ram:f000:ce95   a1f400          MOV         AX,[offset frq_len_hi &0xff]            
ram:f000:ce98   8b16f600        MOV         DX,word ptr [offset frq_len_lo &0xff]   
ram:f000:ce9c   8bf8            MOV         DI,AX                                   
ram:f000:ce9e   b8301f          MOV         AX,0x1f30                               
ram:f000:cea1   8ed8            MOV         DS,AX                                   
ram:f000:cea3   a1f000          MOV         AX,[offset frq_addr_hi &0xff]           
ram:f000:cea6   8b16f200        MOV         DX,word ptr [offset frq_addr_lo &0xff]  
ram:f000:ceaa   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:cead   8956fe          MOV         word ptr [BP + -0x2],DX                 
ram:f000:ceb0   c746f800e0      MOV         word ptr [BP + -0x8],0xe000             
ram:f000:ceb5   c746fa0100      MOV         word ptr [BP + -0x6],0x1                
ram:f000:ceba   b80000          MOV         AX,0x0                                  
ram:f000:cebd   50              PUSH        AX                                      
ram:f000:cebe   57              PUSH        DI                                      
ram:f000:cebf   ff76fa          PUSH        word ptr [BP + -0x6]                    
ram:f000:cec2   ff76f8          PUSH        word ptr [BP + -0x8]                    
ram:f000:cec5   ff76fe          PUSH        word ptr [BP + -0x2]                    
ram:f000:cec8   ff76fc          PUSH        word ptr [BP + -0x4]                    
ram:f000:cecb   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:ced0   83c40c          ADD         SP,0xc                                  
ram:f000:ced3   b80000          MOV         AX,0x0                                  
ram:f000:ced6   eb00            JMP         LAB_f000_ced8                           
                            LAB_f000_ced8:                ;XREF[1,0]:   f000:ced6
ram:f000:ced8   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 scsi_control_fast(void)
                                                          ;XREF[1,0]:   f000:cb5f
ram:f000:cedd   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:cee2   81ec0c00        SUB         SP,0xc                                  
ram:f000:cee6   b8101f          MOV         AX,0x1f10                               
ram:f000:cee9   8ed8            MOV         DS,AX                                   
ram:f000:ceeb   a1b400          MOV         AX,[offset SCSI_CMD_PTR &0xff]          
ram:f000:ceee   8b16b600        MOV         DX,word ptr [offset SCSI_CMD_PTR_SEG ...
ram:f000:cef2   0406            ADD         AL,0x6                                  
ram:f000:cef4   7303            JNC         LAB_f000_cef9                           
ram:f000:cef6   83c210          ADD         DX,0x10                                 
                            LAB_f000_cef9:                ;XREF[1,0]:   f000:cef4
ram:f000:cef9   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:cefc   8956fe          MOV         word ptr [BP + -0x2],DX                 
ram:f000:ceff   be301f          MOV         SI,0x1f30                               
ram:f000:cf02   8ede            MOV         DS,SI                                   
ram:f000:cf04   ff36fa00        PUSH        word ptr [offset frq_req_lo &0xff]      
ram:f000:cf08   9a6800c0fd      CALLF       byte_swap_ax                            ;undefined2 byte_swap_ax(undefined2 p...
ram:f000:cf0d   83c402          ADD         SP,0x2                                  
ram:f000:cf10   ba301f          MOV         DX,0x1f30                               
ram:f000:cf13   8eda            MOV         DS,DX                                   
ram:f000:cf15   a3fa00          MOV         [offset frq_req_lo &0xff],AX            
ram:f000:cf18   be301f          MOV         SI,0x1f30                               
ram:f000:cf1b   8ede            MOV         DS,SI                                   
ram:f000:cf1d   ff36f800        PUSH        word ptr [offset frq_req_hi &0xff]      
ram:f000:cf21   9a6800c0fd      CALLF       byte_swap_ax                            ;undefined2 byte_swap_ax(undefined2 p...
ram:f000:cf26   83c402          ADD         SP,0x2                                  
ram:f000:cf29   ba301f          MOV         DX,0x1f30                               
ram:f000:cf2c   8eda            MOV         DS,DX                                   
ram:f000:cf2e   a3f800          MOV         [offset frq_req_hi &0xff],AX            
ram:f000:cf31   b8301f          MOV         AX,0x1f30                               
ram:f000:cf34   8ed8            MOV         DS,AX                                   
ram:f000:cf36   a1fa00          MOV         AX,[offset frq_req_lo &0xff]            
ram:f000:cf39   8bf8            MOV         DI,AX                                   
ram:f000:cf3b   57              PUSH        DI                                      
ram:f000:cf3c   ff76fe          PUSH        word ptr [BP + -0x2]                    
ram:f000:cf3f   ff76fc          PUSH        word ptr [BP + -0x4]                    
ram:f000:cf42   b8301f          MOV         AX,0x1f30                               
ram:f000:cf45   50              PUSH        AX                                      
ram:f000:cf46   b8fc00          MOV         AX,0xfc                                 
ram:f000:cf49   50              PUSH        AX                                      
ram:f000:cf4a   9ae60080fd      CALLF       FUN_f000_d8e6                           ;void FUN_f000_d8e6(undefined * param...
ram:f000:cf4f   83c40a          ADD         SP,0xa                                  
ram:f000:cf52   b8301f          MOV         AX,0x1f30                               
ram:f000:cf55   8ed8            MOV         DS,AX                                   
ram:f000:cf57   a1f000          MOV         AX,[offset frq_addr_hi &0xff]           
ram:f000:cf5a   8b16f200        MOV         DX,word ptr [offset frq_addr_lo &0xff]  
ram:f000:cf5e   8946f8          MOV         word ptr [BP + -0x8],AX                 
ram:f000:cf61   8956fa          MOV         word ptr [BP + -0x6],DX                 
ram:f000:cf64   b8301f          MOV         AX,0x1f30                               
ram:f000:cf67   8ed8            MOV         DS,AX                                   
ram:f000:cf69   a1f400          MOV         AX,[offset frq_len_hi &0xff]            
ram:f000:cf6c   8b16f600        MOV         DX,word ptr [offset frq_len_lo &0xff]   
ram:f000:cf70   8946f4          MOV         word ptr [BP + -0xc],AX                 
ram:f000:cf73   8956f6          MOV         word ptr [BP + -0xa],DX                 
ram:f000:cf76   be101f          MOV         SI,0x1f10                               
ram:f000:cf79   8ede            MOV         DS,SI                                   
ram:f000:cf7b   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:cf7f   c744260000      MOV         word ptr [SI + 0x26],0x0                
ram:f000:cf84   c744280000      MOV         word ptr [SI + 0x28],0x0                
ram:f000:cf89   be101f          MOV         SI,0x1f10                               
ram:f000:cf8c   8ede            MOV         DS,SI                                   
ram:f000:cf8e   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:cf92   8b46f4          MOV         AX,word ptr [BP + -0xc]                 
ram:f000:cf95   8b56f6          MOV         DX,word ptr [BP + -0xa]                 
ram:f000:cf98   894422          MOV         word ptr [SI + 0x22],AX                 
ram:f000:cf9b   895424          MOV         word ptr [SI + 0x24],DX                 
ram:f000:cf9e   be101f          MOV         SI,0x1f10                               
ram:f000:cfa1   8ede            MOV         DS,SI                                   
ram:f000:cfa3   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:cfa7   c7040000        MOV         word ptr [SI],0x0                       
ram:f000:cfab   b8301f          MOV         AX,0x1f30                               
ram:f000:cfae   8ed8            MOV         DS,AX                                   
ram:f000:cfb0   a1fa00          MOV         AX,[offset frq_req_lo &0xff]            
ram:f000:cfb3   99              CWD                                                  
ram:f000:cfb4   be101f          MOV         SI,0x1f10                               
ram:f000:cfb7   8ede            MOV         DS,SI                                   
ram:f000:cfb9   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:cfbd   894416          MOV         word ptr [SI + 0x16],AX                 
ram:f000:cfc0   895418          MOV         word ptr [SI + 0x18],DX                 
ram:f000:cfc3   b8301f          MOV         AX,0x1f30                               
ram:f000:cfc6   8ed8            MOV         DS,AX                                   
ram:f000:cfc8   f706f800ffff    TEST        word ptr [offset...,0xffff              
ram:f000:cfce   7f03            JG          LAB_f000_cfd3                           
ram:f000:cfd0   e9ae00          JMP         LAB_f000_d081                           
                            LAB_f000_cfd3:                ;XREF[1,0]:   f000:cfce
ram:f000:cfd3   b8301f          MOV         AX,0x1f30                               
ram:f000:cfd6   8ed8            MOV         DS,AX                                   
ram:f000:cfd8   813ef8000001    CMP         word ptr [offset frq_req_hi &0xff],0x100
ram:f000:cfde   7e06            JLE         LAB_f000_cfe6                           
ram:f000:cfe0   b8bd00          MOV         AX,0xbd                                 
ram:f000:cfe3   e97801          JMP         LAB_f000_d15e                           
                            LAB_f000_cfe6:                ;XREF[1,0]:   f000:cfde
ram:f000:cfe6   b8301f          MOV         AX,0x1f30                               
ram:f000:cfe9   8ed8            MOV         DS,AX                                   
ram:f000:cfeb   a1f800          MOV         AX,[offset frq_req_hi &0xff]            
ram:f000:cfee   99              CWD                                                  
ram:f000:cfef   52              PUSH        DX                                      
ram:f000:cff0   50              PUSH        AX                                      
ram:f000:cff1   b8101f          MOV         AX,0x1f10                               
ram:f000:cff4   8ed8            MOV         DS,AX                                   
ram:f000:cff6   a1b400          MOV         AX,[offset SCSI_CMD_PTR &0xff]          
ram:f000:cff9   8b16b600        MOV         DX,word ptr [offset SCSI_CMD_PTR_SEG ...
ram:f000:cffd   0436            ADD         AL,0x36                                 
ram:f000:cfff   7303            JNC         LAB_f000_d004                           
ram:f000:d001   83c210          ADD         DX,0x10                                 
                            LAB_f000_d004:                ;XREF[1,0]:   f000:cfff
ram:f000:d004   52              PUSH        DX                                      
ram:f000:d005   50              PUSH        AX                                      
ram:f000:d006   ff76fa          PUSH        word ptr [BP + -0x6]                    
ram:f000:d009   ff76f8          PUSH        word ptr [BP + -0x8]                    
ram:f000:d00c   9ac800f0fa      CALLF       FUN_f000_afc8                           ;undefined FUN_f000_afc8()
ram:f000:d011   83c40c          ADD         SP,0xc                                  
ram:f000:d014   be101f          MOV         SI,0x1f10                               
ram:f000:d017   8ede            MOV         DS,SI                                   
ram:f000:d019   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:d01d   8b4436          MOV         AX,word ptr [SI + 0x36]                 
ram:f000:d020   8b5438          MOV         DX,word ptr [SI + 0x38]                 
ram:f000:d023   be101f          MOV         SI,0x1f10                               
ram:f000:d026   8ede            MOV         DS,SI                                   
ram:f000:d028   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:d02c   89441a          MOV         word ptr [SI + 0x1a],AX                 
ram:f000:d02f   89541c          MOV         word ptr [SI + 0x1c],DX                 
ram:f000:d032   be101f          MOV         SI,0x1f10                               
ram:f000:d035   8ede            MOV         DS,SI                                   
ram:f000:d037   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:d03b   8b443a          MOV         AX,word ptr [SI + 0x3a]                 
ram:f000:d03e   8b543c          MOV         DX,word ptr [SI + 0x3c]                 
ram:f000:d041   be101f          MOV         SI,0x1f10                               
ram:f000:d044   8ede            MOV         DS,SI                                   
ram:f000:d046   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:d04a   89441e          MOV         word ptr [SI + 0x1e],AX                 
ram:f000:d04d   895420          MOV         word ptr [SI + 0x20],DX                 
ram:f000:d050   b8101f          MOV         AX,0x1f10                               
ram:f000:d053   8ed8            MOV         DS,AX                                   
ram:f000:d055   a1b400          MOV         AX,[offset SCSI_CMD_PTR &0xff]          
ram:f000:d058   8b16b600        MOV         DX,word ptr [offset SCSI_CMD_PTR_SEG ...
ram:f000:d05c   043e            ADD         AL,0x3e                                 
ram:f000:d05e   7303            JNC         LAB_f000_d063                           
ram:f000:d060   83c210          ADD         DX,0x10                                 
                            LAB_f000_d063:                ;XREF[1,0]:   f000:d05e
ram:f000:d063   be101f          MOV         SI,0x1f10                               
ram:f000:d066   8ede            MOV         DS,SI                                   
ram:f000:d068   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:d06c   894432          MOV         word ptr [SI + 0x32],AX                 
ram:f000:d06f   895434          MOV         word ptr [SI + 0x34],DX                 
ram:f000:d072   be101f          MOV         SI,0x1f10                               
ram:f000:d075   8ede            MOV         DS,SI                                   
ram:f000:d077   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:d07b   810c0004        OR          word ptr [SI],0x400                     
ram:f000:d07f   eb2a            JMP         LAB_f000_d0ab                           
                            LAB_f000_d081:                ;XREF[1,0]:   f000:cfd0
ram:f000:d081   be101f          MOV         SI,0x1f10                               
ram:f000:d084   8ede            MOV         DS,SI                                   
ram:f000:d086   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:d08a   8b46f8          MOV         AX,word ptr [BP + -0x8]                 
ram:f000:d08d   8b56fa          MOV         DX,word ptr [BP + -0x6]                 
ram:f000:d090   89441a          MOV         word ptr [SI + 0x1a],AX                 
ram:f000:d093   89541c          MOV         word ptr [SI + 0x1c],DX                 
ram:f000:d096   be101f          MOV         SI,0x1f10                               
ram:f000:d099   8ede            MOV         DS,SI                                   
ram:f000:d09b   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:d09f   8b46f4          MOV         AX,word ptr [BP + -0xc]                 
ram:f000:d0a2   8b56f6          MOV         DX,word ptr [BP + -0xa]                 
ram:f000:d0a5   89441e          MOV         word ptr [SI + 0x1e],AX                 
ram:f000:d0a8   895420          MOV         word ptr [SI + 0x20],DX                 
                            LAB_f000_d0ab:                ;XREF[1,0]:   f000:d07f
ram:f000:d0ab   b8301f          MOV         AX,0x1f30                               
ram:f000:d0ae   8ed8            MOV         DS,AX                                   
ram:f000:d0b0   a0ea00          MOV         AL,[offset DAT_1000_f3ea &0xff]         
ram:f000:d0b3   30e4            XOR         AH,AH                                   
ram:f000:d0b5   b90300          MOV         CX,0x3                                  
ram:f000:d0b8   d3f8            SAR         AX,CL                                   
ram:f000:d0ba   be101f          MOV         SI,0x1f10                               
ram:f000:d0bd   8ede            MOV         DS,SI                                   
ram:f000:d0bf   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:d0c3   884404          MOV         byte ptr [SI + 0x4],AL                  
ram:f000:d0c6   b8301f          MOV         AX,0x1f30                               
ram:f000:d0c9   8ed8            MOV         DS,AX                                   
ram:f000:d0cb   a0ea00          MOV         AL,[offset DAT_1000_f3ea &0xff]         
ram:f000:d0ce   30e4            XOR         AH,AH                                   
ram:f000:d0d0   250700          AND         AX,0x7                                  
ram:f000:d0d3   be101f          MOV         SI,0x1f10                               
ram:f000:d0d6   8ede            MOV         DS,SI                                   
ram:f000:d0d8   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:d0dc   884405          MOV         byte ptr [SI + 0x5],AL                  
ram:f000:d0df   9ab400d0f9      CALLF       scsi_select_with_attn                   ;void scsi_select_with_attn(void)
ram:f000:d0e4   b8301f          MOV         AX,0x1f30                               
ram:f000:d0e7   8ed8            MOV         DS,AX                                   
ram:f000:d0e9   ff36ee00        PUSH        word ptr [offset frq_timeout_lo &0xff]  
ram:f000:d0ed   ff36ec00        PUSH        word ptr [offset frq_timeout_hi &0xff]  
ram:f000:d0f1   9a1900e0f9      CALLF       FUN_f000_9e19                           ;undefined2 FUN_f000_9e19(void)
ram:f000:d0f6   83c404          ADD         SP,0x4                                  
ram:f000:d0f9   eb4d            JMP         LAB_f000_d148                           
                            LAB_f000_d0fb:                ;XREF[1,0]:   f000:d15a
ram:f000:d0fb   b80000          MOV         AX,0x0                                  
ram:f000:d0fe   eb5e            JMP         LAB_f000_d15e                           
                            LAB_f000_d100:                ;XREF[1,0]:   f000:d155
ram:f000:d100   b86500          MOV         AX,0x65                                 
ram:f000:d103   eb59            JMP         LAB_f000_d15e                           
                            LAB_f000_d105:                ;XREF[1,0]:   f000:d150
ram:f000:d105   fa              CLI                                                  
ram:f000:d106   9a350050fa      CALLF       scsi_reset_bus                          ;void scsi_reset_bus(void)
ram:f000:d10b   fb              STI                                                  
                            LAB_f000_d10c:                ;XREF[1,0]:   f000:d126
ram:f000:d10c   b8f01f          MOV         AX,0x1ff0                               
ram:f000:d10f   8ed8            MOV         DS,AX                                   
ram:f000:d111   f706f000ffff    TEST        word ptr [offset...,0xffff              
ram:f000:d117   750d            JNZ         LAB_f000_d126                           
ram:f000:d119   b8f01f          MOV         AX,0x1ff0                               
ram:f000:d11c   8ed8            MOV         DS,AX                                   
ram:f000:d11e   810ef4000100    OR          word ptr [offset...,0x1                 
ram:f000:d124   eb02            JMP         LAB_f000_d128                           
                            LAB_f000_d126:                ;XREF[1,0]:   f000:d117
ram:f000:d126   ebe4            JMP         LAB_f000_d10c                           
                            LAB_f000_d128:                ;XREF[1,0]:   f000:d124
ram:f000:d128   b86300          MOV         AX,0x63                                 
ram:f000:d12b   eb31            JMP         LAB_f000_d15e                           
                            LAB_f000_d12d:                ;XREF[2,0]:   f000:d14b,f000:d15c
ram:f000:d12d   be101f          MOV         SI,0x1f10                               
ram:f000:d130   8ede            MOV         DS,SI                                   
ram:f000:d132   c536b400        LDS         SI,[offset SCSI_CMD_PTR &0xff]          
ram:f000:d136   8a4402          MOV         AL,byte ptr [SI + 0x2]                  
ram:f000:d139   30e4            XOR         AH,AH                                   
ram:f000:d13b   ba401f          MOV         DX,0x1f40                               
ram:f000:d13e   8eda            MOV         DS,DX                                   
ram:f000:d140   a20b00          MOV         [offset DAT_1000_f40b &0xff],AL         
ram:f000:d143   b86000          MOV         AX,0x60                                 
ram:f000:d146   eb16            JMP         LAB_f000_d15e                           
                            LAB_f000_d148:                ;XREF[1,0]:   f000:d0f9
ram:f000:d148   3dfdff          CMP         AX,0xfffd                               
ram:f000:d14b   74e0            JZ          LAB_f000_d12d                           
ram:f000:d14d   3dfeff          CMP         AX,0xfffe                               
ram:f000:d150   74b3            JZ          LAB_f000_d105                           
ram:f000:d152   3dffff          CMP         AX,0xffff                               
ram:f000:d155   74a9            JZ          LAB_f000_d100                           
ram:f000:d157   3d0000          CMP         AX,0x0                                  
ram:f000:d15a   749f            JZ          LAB_f000_d0fb                           
ram:f000:d15c   ebcf            JMP         LAB_f000_d12d                           
                            LAB_f000_d15e:                ;XREF[5,0]:   f000:cfe3,f000:d0fe,f000:d103,f000:d12b
                                                          ;             f000:d146
ram:f000:d15e   ea7e00e0fd      JMPF        init_vectors::function_return           
ram:f000:d163   90              ??          90h                                     
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void do_ddma0_bytes(undefined2 param_1, undefined2 param_2, undefined2 param_3, undefined2 param_4, undefined2 param_5)
          ;param_1       undefined2           4                      ;XREF[1,0]:   f000:d16d
          ;param_2       undefined2           6                      ;XREF[1,0]:   f000:d173
          ;param_3       undefined2           8                      ;XREF[1,0]:   f000:d179
          ;param_4       undefined2           a                      ;XREF[1,0]:   f000:d17f
          ;param_5       undefined2           c                      ;XREF[1,0]:   f000:d185
                                                          ;XREF[2,0]:   f000:d670,f000:d703
ram:f000:d164   52              PUSH        DX                                      
ram:f000:d165   55              PUSH        BP                                      
ram:f000:d166   8bec            MOV         BP,SP                                   
ram:f000:d168   b840c0          MOV         AX,0xc040                               
ram:f000:d16b   8ed8            MOV         DS,AX                                   
ram:f000:d16d   8b4608          MOV         AX,word ptr [BP + param_1+0x4]          
ram:f000:d170   a3c800          MOV         [offset DDMA0_XFR_CNT &0xff],AX         
ram:f000:d173   8b460a          MOV         AX,word ptr [BP + param_2+0x4]          
ram:f000:d176   a3c000          MOV         [offset DDMA0_SRC_LSB &0xff],AX         
ram:f000:d179   8b460c          MOV         AX,word ptr [BP + param_3+0x4]          
ram:f000:d17c   a3c200          MOV         [offset DDMA0_SRC_MSB &0xff],AX         
ram:f000:d17f   8b460e          MOV         AX,word ptr [BP + param_4+0x4]          
ram:f000:d182   a3c400          MOV         [offset DDMA0_DST_LSB &0xff],AX         
ram:f000:d185   8b4610          MOV         AX,word ptr [BP + param_5+0x4]          
ram:f000:d188   a3c600          MOV         [offset DDMA0_DST_MSB &0xff],AX         
ram:f000:d18b   c706ca00a6b6    MOV         word ptr [offset...,0xb6a6              
ram:f000:d191   5d              POP         BP                                      
ram:f000:d192   5a              POP         DX                                      
ram:f000:d193   cb              RET                                                  
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void do_ddma0_words(undefined2 param_1, undefined2 param_2, undefined2 param_3, undefined2 param_4, undefined2 param_5)
          ;param_1       undefined2           4                      ;XREF[1,0]:   f000:d19d
          ;param_2       undefined2           6                      ;XREF[1,0]:   f000:d1a3
          ;param_3       undefined2           8                      ;XREF[1,0]:   f000:d1a9
          ;param_4       undefined2           a                      ;XREF[1,0]:   f000:d1af
          ;param_5       undefined2           c                      ;XREF[1,0]:   f000:d1b5
                                                          ;XREF[2,0]:   f000:d81c,f000:d8c9
ram:f000:d194   52              PUSH        DX                                      
ram:f000:d195   55              PUSH        BP                                      
ram:f000:d196   b840c0          MOV         AX,0xc040                               
ram:f000:d199   8ed8            MOV         DS,AX                                   
ram:f000:d19b   8bec            MOV         BP,SP                                   
ram:f000:d19d   8b4608          MOV         AX,word ptr [BP + param_1+0x4]          
ram:f000:d1a0   a3c800          MOV         [offset DDMA0_XFR_CNT &0xff],AX         
ram:f000:d1a3   8b460a          MOV         AX,word ptr [BP + param_2+0x4]          
ram:f000:d1a6   a3c000          MOV         [offset DDMA0_SRC_LSB &0xff],AX         
ram:f000:d1a9   8b460c          MOV         AX,word ptr [BP + param_3+0x4]          
ram:f000:d1ac   a3c200          MOV         [offset DDMA0_SRC_MSB &0xff],AX         
ram:f000:d1af   8b460e          MOV         AX,word ptr [BP + param_4+0x4]          
ram:f000:d1b2   a3c400          MOV         [offset DDMA0_DST_LSB &0xff],AX         
ram:f000:d1b5   8b4610          MOV         AX,word ptr [BP + param_5+0x4]          
ram:f000:d1b8   a3c600          MOV         [offset DDMA0_DST_MSB &0xff],AX         
ram:f000:d1bb   c706ca00a7b6    MOV         word ptr [offset...,0xb6a7              
ram:f000:d1c1   5d              POP         BP                                      
ram:f000:d1c2   5a              POP         DX                                      
ram:f000:d1c3   cb              RET                                                  
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void get_express_job(void)
                                                          ;XREF[1,0]:   f000:9021
ram:f000:d1c4   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:d1c9   81ec0000        SUB         SP,0x0                                  
ram:f000:d1cd   b80000          MOV         AX,0x0                                  
ram:f000:d1d0   50              PUSH        AX                                      
ram:f000:d1d1   b80800          MOV         AX,0x8                                  
ram:f000:d1d4   50              PUSH        AX                                      
ram:f000:d1d5   8b460e          MOV         AX,word ptr [BP + 0xe]                  
ram:f000:d1d8   8b5610          MOV         DX,word ptr [BP + 0x10]                 
ram:f000:d1db   d1ea            SHR         DX,1                                    
ram:f000:d1dd   d1ea            SHR         DX,1                                    
ram:f000:d1df   d1ea            SHR         DX,1                                    
ram:f000:d1e1   d1ea            SHR         DX,1                                    
ram:f000:d1e3   86d4            XCHG        AH,DL                                   
ram:f000:d1e5   86f2            XCHG        DL,DH                                   
ram:f000:d1e7   52              PUSH        DX                                      
ram:f000:d1e8   50              PUSH        AX                                      
ram:f000:d1e9   b8001f          MOV         AX,0x1f00                               
ram:f000:d1ec   8ed8            MOV         DS,AX                                   
ram:f000:d1ee   ff366400        PUSH        word ptr [offset REQ_Q_H_P &0xff]       
ram:f000:d1f2   ff366200        PUSH        word ptr [offset REQ_Q_L_P &0xff]       
ram:f000:d1f6   9a200070fd      CALLF       transfer_words                          ;undefined transfer_words()
ram:f000:d1fb   83c40c          ADD         SP,0xc                                  
ram:f000:d1fe   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:d201   ff34            PUSH        word ptr [SI]                           
ram:f000:d203   9a6800c0fd      CALLF       byte_swap_ax                            ;undefined2 byte_swap_ax(undefined2 p...
ram:f000:d208   83c402          ADD         SP,0x2                                  
ram:f000:d20b   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:d20e   8904            MOV         word ptr [SI],AX                        
ram:f000:d210   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:d213   ff7406          PUSH        word ptr [SI + 0x6]                     
ram:f000:d216   ff7404          PUSH        word ptr [SI + 0x4]                     
ram:f000:d219   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:d21e   83c404          ADD         SP,0x4                                  
ram:f000:d221   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:d224   894404          MOV         word ptr [SI + 0x4],AX                  
ram:f000:d227   895406          MOV         word ptr [SI + 0x6],DX                  
ram:f000:d22a   ea7e00e0fd      JMPF        init_vectors::function_return           
ram:f000:d22f   90              NOP                                                  
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void complete_express_job(void)
                                                          ;XREF[3,0]:   f000:8bee,f000:90d2,f000:c876
ram:f000:d230   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:d235   81ec0000        SUB         SP,0x0                                  
ram:f000:d239   bf001f          MOV         DI,0x1f00                               
ram:f000:d23c   8ec7            MOV         ES,DI                                   
ram:f000:d23e   bf3e00          MOV         DI,0x3e                                 
ram:f000:d241   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:d244   b90600          MOV         CX,0x6                                  
ram:f000:d247   fc              CLD                                                  
ram:f000:d248   f2a5            MOVSW       ES:DI=>DAT_1000_f03e,SI                 
ram:f000:d24a   b8001f          MOV         AX,0x1f00                               
ram:f000:d24d   8ed8            MOV         DS,AX                                   
ram:f000:d24f   a17800          MOV         AX,[offset DAT_1000_f078 &0xff]         
ram:f000:d252   350100          XOR         AX,0x1                                  
ram:f000:d255   ba001f          MOV         DX,0x1f00                               
ram:f000:d258   8eda            MOV         DS,DX                                   
ram:f000:d25a   a37800          MOV         [offset DAT_1000_f078 &0xff],AX         
ram:f000:d25d   b8001f          MOV         AX,0x1f00                               
ram:f000:d260   8ed8            MOV         DS,AX                                   
ram:f000:d262   a17800          MOV         AX,[offset DAT_1000_f078 &0xff]         
ram:f000:d265   ba001f          MOV         DX,0x1f00                               
ram:f000:d268   8eda            MOV         DS,DX                                   
ram:f000:d26a   b106            MOV         CL,0x6                                  
ram:f000:d26c   d3c0            ROL         AX,CL                                   
ram:f000:d26e   33064000        XOR         AX,word ptr [offset DAT_1000_f040 &0xff]
ram:f000:d272   254000          AND         AX,0x40                                 
ram:f000:d275   31064000        XOR         word ptr [offset DAT_1000_f040 &0xff],AX
ram:f000:d279   be001f          MOV         SI,0x1f00                               
ram:f000:d27c   8ede            MOV         DS,SI                                   
ram:f000:d27e   ff363e00        PUSH        word ptr [offset DAT_1000_f03e &0xff]   
ram:f000:d282   9a6800c0fd      CALLF       byte_swap_ax                            ;undefined2 byte_swap_ax(undefined2 p...
ram:f000:d287   83c402          ADD         SP,0x2                                  
ram:f000:d28a   ba001f          MOV         DX,0x1f00                               
ram:f000:d28d   8eda            MOV         DS,DX                                   
ram:f000:d28f   a33e00          MOV         [offset DAT_1000_f03e &0xff],AX         
ram:f000:d292   b8001f          MOV         AX,0x1f00                               
ram:f000:d295   8ed8            MOV         DS,AX                                   
ram:f000:d297   ff364400        PUSH        word ptr [offset DAT_1000_f044 &0xff]   
ram:f000:d29b   ff364200        PUSH        word ptr [offset DAT_1000_f042 &0xff]   
ram:f000:d29f   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:d2a4   83c404          ADD         SP,0x4                                  
ram:f000:d2a7   b9001f          MOV         CX,0x1f00                               
ram:f000:d2aa   8ed9            MOV         DS,CX                                   
ram:f000:d2ac   a34200          MOV         [offset DAT_1000_f042 &0xff],AX         
ram:f000:d2af   89164400        MOV         word ptr [offset DAT_1000_f044 &0xff],DX
ram:f000:d2b3   b80100          MOV         AX,0x1                                  
ram:f000:d2b6   50              PUSH        AX                                      
ram:f000:d2b7   b80600          MOV         AX,0x6                                  
ram:f000:d2ba   50              PUSH        AX                                      
ram:f000:d2bb   b8001f          MOV         AX,0x1f00                               
ram:f000:d2be   8ed8            MOV         DS,AX                                   
ram:f000:d2c0   ff366800        PUSH        word ptr [offset CMP_Q_L_P &0xff]       
ram:f000:d2c4   ff366600        PUSH        word ptr [offset CMP_Q_H_P &0xff]       
ram:f000:d2c8   b83e00          MOV         AX,0x3e                                 
ram:f000:d2cb   ba001f          MOV         DX,0x1f00                               
ram:f000:d2ce   d1ea            SHR         DX,1                                    
ram:f000:d2d0   d1ea            SHR         DX,1                                    
ram:f000:d2d2   d1ea            SHR         DX,1                                    
ram:f000:d2d4   d1ea            SHR         DX,1                                    
ram:f000:d2d6   86d4            XCHG        AH,DL                                   
ram:f000:d2d8   86f2            XCHG        DL,DH                                   
ram:f000:d2da   52              PUSH        DX                                      
ram:f000:d2db   50              PUSH        AX                                      
ram:f000:d2dc   9a200070fd      CALLF       transfer_words                          ;undefined transfer_words()
ram:f000:d2e1   83c40c          ADD         SP,0xc                                  
ram:f000:d2e4   ea7e00e0fd      JMPF        init_vectors::function_return           
ram:f000:d2e9   90              NOP                                                  
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void FUN_f000_d2ea(void)
                                                          ;XREF[1,0]:   f000:857c
ram:f000:d2ea   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:d2ef   81ec0000        SUB         SP,0x0                                  
ram:f000:d2f3   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:d2f6   8a4614          MOV         AL,byte ptr [BP + 0x14]                 
ram:f000:d2f9   8804            MOV         byte ptr [SI],AL                        
ram:f000:d2fb   8b4612          MOV         AX,word ptr [BP + 0x12]                 
ram:f000:d2fe   48              DEC         AX                                      
ram:f000:d2ff   50              PUSH        AX                                      
ram:f000:d300   8b460e          MOV         AX,word ptr [BP + 0xe]                  
ram:f000:d303   8b5610          MOV         DX,word ptr [BP + 0x10]                 
ram:f000:d306   0401            ADD         AL,0x1                                  
ram:f000:d308   7303            JNC         LAB_f000_d30d                           
ram:f000:d30a   83c210          ADD         DX,0x10                                 
                            LAB_f000_d30d:                ;XREF[1,0]:   f000:d308
ram:f000:d30d   52              PUSH        DX                                      
ram:f000:d30e   50              PUSH        AX                                      
ram:f000:d30f   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:d312   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:d315   9ae60080fd      CALLF       FUN_f000_d8e6                           ;void FUN_f000_d8e6(undefined * param...
ram:f000:d31a   83c40a          ADD         SP,0xa                                  
ram:f000:d31d   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 FUN_f000_d322(void)
                                                          ;XREF[2,0]:   f000:d43b,f000:d9a6
ram:f000:d322   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:d327   81ec0200        SUB         SP,0x2                                  
ram:f000:d32b   8b7e0e          MOV         DI,word ptr [BP + 0xe]                  
ram:f000:d32e   3b7e10          CMP         DI,word ptr [BP + 0x10]                 
ram:f000:d331   7505            JNZ         LAB_f000_d338                           
ram:f000:d333   b80000          MOV         AX,0x0                                  
ram:f000:d336   eb53            JMP         LAB_f000_d38b                           
                            LAB_f000_d338:                ;XREF[1,0]:   f000:d331
ram:f000:d338   3b7e10          CMP         DI,word ptr [BP + 0x10]                 
ram:f000:d33b   7e0a            JLE         LAB_f000_d347                           
ram:f000:d33d   8bc7            MOV         AX,DI                                   
ram:f000:d33f   2b4610          SUB         AX,word ptr [BP + 0x10]                 
ram:f000:d342   8946fe          MOV         word ptr [BP + -0x2],AX                 
ram:f000:d345   eb28            JMP         LAB_f000_d36f                           
                            LAB_f000_d347:                ;XREF[1,0]:   f000:d33b
ram:f000:d347   f64612ff        TEST        byte ptr [BP + 0x12],0xff               
ram:f000:d34b   7412            JZ          LAB_f000_d35f                           
ram:f000:d34d   b8001f          MOV         AX,0x1f00                               
ram:f000:d350   8ed8            MOV         DS,AX                                   
ram:f000:d352   a16e00          MOV         AX,[offset DAT_1000_f06e &0xff]         
ram:f000:d355   2b4610          SUB         AX,word ptr [BP + 0x10]                 
ram:f000:d358   03c7            ADD         AX,DI                                   
ram:f000:d35a   8946fe          MOV         word ptr [BP + -0x2],AX                 
ram:f000:d35d   eb10            JMP         LAB_f000_d36f                           
                            LAB_f000_d35f:                ;XREF[1,0]:   f000:d34b
ram:f000:d35f   b8001f          MOV         AX,0x1f00                               
ram:f000:d362   8ed8            MOV         DS,AX                                   
ram:f000:d364   a17000          MOV         AX,[offset DAT_1000_f070 &0xff]         
ram:f000:d367   2b4610          SUB         AX,word ptr [BP + 0x10]                 
ram:f000:d36a   03c7            ADD         AX,DI                                   
ram:f000:d36c   8946fe          MOV         word ptr [BP + -0x2],AX                 
                            LAB_f000_d36f:                ;XREF[2,0]:   f000:d345,f000:d35d
ram:f000:d36f   f64612ff        TEST        byte ptr [BP + 0x12],0xff               
ram:f000:d373   740b            JZ          LAB_f000_d380                           
ram:f000:d375   be1000          MOV         SI,0x10                                 
ram:f000:d378   8b46fe          MOV         AX,word ptr [BP + -0x2]                 
ram:f000:d37b   99              CWD                                                  
ram:f000:d37c   f7f6            DIV         SI                                      
ram:f000:d37e   eb0b            JMP         LAB_f000_d38b                           
                            LAB_f000_d380:                ;XREF[1,0]:   f000:d373
ram:f000:d380   be0c00          MOV         SI,0xc                                  
ram:f000:d383   8b46fe          MOV         AX,word ptr [BP + -0x2]                 
ram:f000:d386   99              CWD                                                  
ram:f000:d387   f7f6            DIV         SI                                      
ram:f000:d389   eb00            JMP         LAB_f000_d38b                           
                            LAB_f000_d38b:                ;XREF[3,0]:   f000:d336,f000:d37e,f000:d389
ram:f000:d38b   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;int scan_request_queues_for_job(void)
                                                          ;XREF[1,0]:   f000:911b
ram:f000:d390   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:d395   81ec1000        SUB         SP,0x10                                 
ram:f000:d399   8b7e10          MOV         DI,word ptr [BP + 0x10]                 
ram:f000:d39c   b8001f          MOV         AX,0x1f00                               
ram:f000:d39f   8ed8            MOV         DS,AX                                   
ram:f000:d3a1   a15a00          MOV         AX,[offset DAT_1000_f05a &0xff]         
ram:f000:d3a4   8b165c00        MOV         DX,word ptr [offset DAT_1000_f05c &0xff]
ram:f000:d3a8   8b4e0e          MOV         CX,word ptr [BP + 0xe]                  
ram:f000:d3ab   d1e1            SHL         CX,1                                    
ram:f000:d3ad   d1e1            SHL         CX,1                                    
ram:f000:d3af   02c1            ADD         AL,CL                                   
ram:f000:d3b1   7303            JNC         LAB_f000_d3b6                           
ram:f000:d3b3   83c210          ADD         DX,0x10                                 
                            LAB_f000_d3b6:                ;XREF[1,0]:   f000:d3b1
ram:f000:d3b6   30c9            XOR         CL,CL                                   
ram:f000:d3b8   d1f9            SAR         CX,1                                    
ram:f000:d3ba   d1f9            SAR         CX,1                                    
ram:f000:d3bc   d1f9            SAR         CX,1                                    
ram:f000:d3be   d1f9            SAR         CX,1                                    
ram:f000:d3c0   03d1            ADD         DX,CX                                   
ram:f000:d3c2   8bf0            MOV         SI,AX                                   
ram:f000:d3c4   8eda            MOV         DS,DX                                   
ram:f000:d3c6   8b04            MOV         AX,word ptr [SI]                        
ram:f000:d3c8   8b5402          MOV         DX,word ptr [SI + 0x2]                  
ram:f000:d3cb   8946fc          MOV         word ptr [BP + -0x4],AX                 
ram:f000:d3ce   8956fe          MOV         word ptr [BP + -0x2],DX                 
ram:f000:d3d1   ff76fe          PUSH        word ptr [BP + -0x2]                    
ram:f000:d3d4   ff76fc          PUSH        word ptr [BP + -0x4]                    
ram:f000:d3d7   9a020090fd      CALLF       set_host_page                           ;undefined2 set_host_page(undefined2 ...
ram:f000:d3dc   83c404          ADD         SP,0x4                                  
ram:f000:d3df   8af2            MOV         DH,DL                                   
ram:f000:d3e1   8ad4            MOV         DL,AH                                   
ram:f000:d3e3   30e4            XOR         AH,AH                                   
ram:f000:d3e5   d1e2            SHL         DX,1                                    
ram:f000:d3e7   d1e2            SHL         DX,1                                    
ram:f000:d3e9   d1e2            SHL         DX,1                                    
ram:f000:d3eb   d1e2            SHL         DX,1                                    
ram:f000:d3ed   8bf0            MOV         SI,AX                                   
ram:f000:d3ef   8eda            MOV         DS,DX                                   
ram:f000:d3f1   8b04            MOV         AX,word ptr [SI]                        
ram:f000:d3f3   8946f2          MOV         word ptr [BP + -0xe],AX                 
ram:f000:d3f6   ff76f2          PUSH        word ptr [BP + -0xe]                    
ram:f000:d3f9   9a6800c0fd      CALLF       byte_swap_ax                            ;undefined2 byte_swap_ax(undefined2 p...
ram:f000:d3fe   83c402          ADD         SP,0x2                                  
ram:f000:d401   8946f2          MOV         word ptr [BP + -0xe],AX                 
ram:f000:d404   b8001f          MOV         AX,0x1f00                               
ram:f000:d407   8ed8            MOV         DS,AX                                   
ram:f000:d409   a15e00          MOV         AX,[offset DAT_1000_f05e &0xff]         
ram:f000:d40c   8b166000        MOV         DX,word ptr [offset DAT_1000_f060 &0xff]
ram:f000:d410   8b4e0e          MOV         CX,word ptr [BP + 0xe]                  
ram:f000:d413   d1e1            SHL         CX,1                                    
ram:f000:d415   02c1            ADD         AL,CL                                   
ram:f000:d417   7303            JNC         LAB_f000_d41c                           
ram:f000:d419   83c210          ADD         DX,0x10                                 
                            LAB_f000_d41c:                ;XREF[1,0]:   f000:d417
ram:f000:d41c   30c9            XOR         CL,CL                                   
ram:f000:d41e   d1f9            SAR         CX,1                                    
ram:f000:d420   d1f9            SAR         CX,1                                    
ram:f000:d422   d1f9            SAR         CX,1                                    
ram:f000:d424   d1f9            SAR         CX,1                                    
ram:f000:d426   03d1            ADD         DX,CX                                   
ram:f000:d428   8bf0            MOV         SI,AX                                   
ram:f000:d42a   8eda            MOV         DS,DX                                   
ram:f000:d42c   8b04            MOV         AX,word ptr [SI]                        
ram:f000:d42e   8946f0          MOV         word ptr [BP + -0x10],AX                
ram:f000:d431   b80100          MOV         AX,0x1                                  
ram:f000:d434   50              PUSH        AX                                      
ram:f000:d435   ff76f0          PUSH        word ptr [BP + -0x10]                   
ram:f000:d438   ff76f2          PUSH        word ptr [BP + -0xe]                    
ram:f000:d43b   9a220030fd      CALLF       FUN_f000_d322                           ;undefined2 FUN_f000_d322(void)
ram:f000:d440   83c406          ADD         SP,0x6                                  
ram:f000:d443   8946f4          MOV         word ptr [BP + -0xc],AX                 
ram:f000:d446   f746f4ffff      TEST        word ptr [BP + -0xc],0xffff             
ram:f000:d44b   7506            JNZ         LAB_f000_d453                           
ram:f000:d44d   b80000          MOV         AX,0x0                                  
ram:f000:d450   e91501          JMP         LAB_f000_d568                           
                            LAB_f000_d453:                ;XREF[1,0]:   f000:d44b
ram:f000:d453   397ef4          CMP         word ptr [BP + -0xc],DI                 
ram:f000:d456   7d03            JGE         LAB_f000_d45b                           
ram:f000:d458   8b7ef4          MOV         DI,word ptr [BP + -0xc]                 
                            LAB_f000_d45b:                ;XREF[1,0]:   f000:d456
ram:f000:d45b   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:d45e   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:d461   050400          ADD         AX,0x4                                  
ram:f000:d464   83d200          ADC         DX,0x0                                  
ram:f000:d467   8946f8          MOV         word ptr [BP + -0x8],AX                 
ram:f000:d46a   8956fa          MOV         word ptr [BP + -0x6],DX                 
ram:f000:d46d   c746f60000      MOV         word ptr [BP + -0xa],0x0                
                            LAB_f000_d472:                ;XREF[1,0]:   f000:d4f9
ram:f000:d472   397ef6          CMP         word ptr [BP + -0xa],DI                 
ram:f000:d475   7c03            JL          LAB_f000_d47a                           
ram:f000:d477   e98200          JMP         LAB_f000_d4fc                           
                            LAB_f000_d47a:                ;XREF[1,0]:   f000:d475
ram:f000:d47a   b80000          MOV         AX,0x0                                  
ram:f000:d47d   50              PUSH        AX                                      
ram:f000:d47e   b80800          MOV         AX,0x8                                  
ram:f000:d481   50              PUSH        AX                                      
ram:f000:d482   8b4612          MOV         AX,word ptr [BP + 0x12]                 
ram:f000:d485   8b5614          MOV         DX,word ptr [BP + 0x14]                 
ram:f000:d488   d1ea            SHR         DX,1                                    
ram:f000:d48a   d1ea            SHR         DX,1                                    
ram:f000:d48c   d1ea            SHR         DX,1                                    
ram:f000:d48e   d1ea            SHR         DX,1                                    
ram:f000:d490   86d4            XCHG        AH,DL                                   
ram:f000:d492   86f2            XCHG        DL,DH                                   
ram:f000:d494   52              PUSH        DX                                      
ram:f000:d495   50              PUSH        AX                                      
ram:f000:d496   8b46f0          MOV         AX,word ptr [BP + -0x10]                
ram:f000:d499   99              CWD                                                  
ram:f000:d49a   0346f8          ADD         AX,word ptr [BP + -0x8]                 
ram:f000:d49d   1356fa          ADC         DX,word ptr [BP + -0x6]                 
ram:f000:d4a0   52              PUSH        DX                                      
ram:f000:d4a1   50              PUSH        AX                                      
ram:f000:d4a2   9a200070fd      CALLF       transfer_words                          ;undefined transfer_words()
ram:f000:d4a7   83c40c          ADD         SP,0xc                                  
ram:f000:d4aa   c57612          LDS         SI,[BP + 0x12]                          
ram:f000:d4ad   ff34            PUSH        word ptr [SI]                           
ram:f000:d4af   9a6800c0fd      CALLF       byte_swap_ax                            ;undefined2 byte_swap_ax(undefined2 p...
ram:f000:d4b4   83c402          ADD         SP,0x2                                  
ram:f000:d4b7   c57612          LDS         SI,[BP + 0x12]                          
ram:f000:d4ba   8904            MOV         word ptr [SI],AX                        
ram:f000:d4bc   c57612          LDS         SI,[BP + 0x12]                          
ram:f000:d4bf   ff7406          PUSH        word ptr [SI + 0x6]                     
ram:f000:d4c2   ff7404          PUSH        word ptr [SI + 0x4]                     
ram:f000:d4c5   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:d4ca   83c404          ADD         SP,0x4                                  
ram:f000:d4cd   c57612          LDS         SI,[BP + 0x12]                          
ram:f000:d4d0   894404          MOV         word ptr [SI + 0x4],AX                  
ram:f000:d4d3   895406          MOV         word ptr [SI + 0x6],DX                  
ram:f000:d4d6   80461210        ADD         byte ptr [BP + 0x12],0x10               
ram:f000:d4da   7304            JNC         LAB_f000_d4e0                           
ram:f000:d4dc   83461410        ADD         word ptr [BP + 0x14],0x10               
                            LAB_f000_d4e0:                ;XREF[1,0]:   f000:d4da
ram:f000:d4e0   b8001f          MOV         AX,0x1f00                               
ram:f000:d4e3   8ed8            MOV         DS,AX                                   
ram:f000:d4e5   a16e00          MOV         AX,[offset DAT_1000_f06e &0xff]         
ram:f000:d4e8   8346f010        ADD         word ptr [BP + -0x10],0x10              
ram:f000:d4ec   3946f0          CMP         word ptr [BP + -0x10],AX                
ram:f000:d4ef   7c05            JL          LAB_f000_d4f6                           
ram:f000:d4f1   c746f00000      MOV         word ptr [BP + -0x10],0x0               
                            LAB_f000_d4f6:                ;XREF[1,0]:   f000:d4ef
ram:f000:d4f6   ff46f6          INC         word ptr [BP + -0xa]                    
ram:f000:d4f9   e976ff          JMP         LAB_f000_d472                           
                            LAB_f000_d4fc:                ;XREF[1,0]:   f000:d477
ram:f000:d4fc   b8001f          MOV         AX,0x1f00                               
ram:f000:d4ff   8ed8            MOV         DS,AX                                   
ram:f000:d501   a15e00          MOV         AX,[offset DAT_1000_f05e &0xff]         
ram:f000:d504   8b166000        MOV         DX,word ptr [offset DAT_1000_f060 &0xff]
ram:f000:d508   8b4e0e          MOV         CX,word ptr [BP + 0xe]                  
ram:f000:d50b   d1e1            SHL         CX,1                                    
ram:f000:d50d   02c1            ADD         AL,CL                                   
ram:f000:d50f   7303            JNC         LAB_f000_d514                           
ram:f000:d511   83c210          ADD         DX,0x10                                 
                            LAB_f000_d514:                ;XREF[1,0]:   f000:d50f
ram:f000:d514   30c9            XOR         CL,CL                                   
ram:f000:d516   d1f9            SAR         CX,1                                    
ram:f000:d518   d1f9            SAR         CX,1                                    
ram:f000:d51a   d1f9            SAR         CX,1                                    
ram:f000:d51c   d1f9            SAR         CX,1                                    
ram:f000:d51e   03d1            ADD         DX,CX                                   
ram:f000:d520   8bf0            MOV         SI,AX                                   
ram:f000:d522   8eda            MOV         DS,DX                                   
ram:f000:d524   8b46f0          MOV         AX,word ptr [BP + -0x10]                
ram:f000:d527   8904            MOV         word ptr [SI],AX                        
ram:f000:d529   ff76f0          PUSH        word ptr [BP + -0x10]                   
ram:f000:d52c   9a6800c0fd      CALLF       byte_swap_ax                            ;undefined2 byte_swap_ax(undefined2 p...
ram:f000:d531   83c402          ADD         SP,0x2                                  
ram:f000:d534   8946f0          MOV         word ptr [BP + -0x10],AX                
ram:f000:d537   8b46fc          MOV         AX,word ptr [BP + -0x4]                 
ram:f000:d53a   8b56fe          MOV         DX,word ptr [BP + -0x2]                 
ram:f000:d53d   050200          ADD         AX,0x2                                  
ram:f000:d540   83d200          ADC         DX,0x0                                  
ram:f000:d543   52              PUSH        DX                                      
ram:f000:d544   50              PUSH        AX                                      
ram:f000:d545   9a020090fd      CALLF       set_host_page                           ;undefined2 set_host_page(undefined2 ...
ram:f000:d54a   83c404          ADD         SP,0x4                                  
ram:f000:d54d   8af2            MOV         DH,DL                                   
ram:f000:d54f   8ad4            MOV         DL,AH                                   
ram:f000:d551   30e4            XOR         AH,AH                                   
ram:f000:d553   d1e2            SHL         DX,1                                    
ram:f000:d555   d1e2            SHL         DX,1                                    
ram:f000:d557   d1e2            SHL         DX,1                                    
ram:f000:d559   d1e2            SHL         DX,1                                    
ram:f000:d55b   8bf0            MOV         SI,AX                                   
ram:f000:d55d   8eda            MOV         DS,DX                                   
ram:f000:d55f   8b46f0          MOV         AX,word ptr [BP + -0x10]                
ram:f000:d562   8904            MOV         word ptr [SI],AX                        
ram:f000:d564   8bc7            MOV         AX,DI                                   
ram:f000:d566   eb00            JMP         LAB_f000_d568                           
                            LAB_f000_d568:                ;XREF[2,0]:   f000:d450,f000:d566
ram:f000:d568   ea7e00e0fd      JMPF        init_vectors::function_return           
ram:f000:d56d   90              NOP                                                  
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void call_pumped_function(void)
                                                          ;XREF[2,0]:   f000:8c1f,f000:cdc7
ram:f000:d56e   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:d573   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:d576   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:d579   8cd0            MOV         AX,SS                                   
ram:f000:d57b   8ed8            MOV         DS,AX                                   
ram:f000:d57d   8bdc            MOV         BX,SP                                   
ram:f000:d57f   ff1f            CALLF       [BX]                                    
ram:f000:d581   83c404          ADD         SP,0x4                                  
ram:f000:d584   ea7e00e0fd      JMPF        init_vectors::function_return           
ram:f000:d589   9b              WAIT                                                 
ram:f000:d58a   cb              RET                                                  
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void FUN_f000_d58b(void)
                                                          ;XREF[1,0]:   f000:8520
ram:f000:d58b   f4              HLT                                                  
ram:f000:d58c   cb              RET                                                  
ram:f000:d58d   fa              CLI                                                  
ram:f000:d58e   cb              RET                                                  
ram:f000:d58f   fb              STI                                                  
ram:f000:d590   cb              RET                                                  
ram:f000:d591   90              NOP                                                  
                            ;************************************************************************************************
                            ;*  Arguments:                                                                                  *
                            ;*                                                                                              *
                            ;*  1. SCSI Segment                                                                             *
                            ;*  2. SCSI Offset                                                                              *
                            ;*  3. 3B2 Segment                                                                              *
                            ;*  4. 3B2 Offset                                                                               *
                            ;*  5. Bytes to Transfer                                                                        *
                            ;*  6. Read/Write                                                                               *
                            ;************************************************************************************************
                            ;undefined transfer_bytes()
                                                          ;XREF[25,0]:  f000:80ea,f000:8ad9,f000:8b4c,f000:8e9a
                                                          ;             f000:9546,f000:969b,f000:98fd,f000:a0f2
                                                          ;             f000:a2ab,f000:aea4,f000:afbb,f000:b042
                                                          ;             f000:b34d,f000:b493,f000:c4d8,f000:c525
                                                          ;             f000:cb9d,f000:cc99,f000:cd00,f000:ce1f
                                                          ;             f000:ce75,f000:cecb,f000:d5b9,f000:d644
                                                          ;             f000:d6d7
ram:f000:d592   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:d597   81ec0600        SUB         SP,0x6                                  
ram:f000:d59b   8b7e16          MOV         DI,word ptr [BP + 0x16]                 
ram:f000:d59e   81ff0004        CMP         DI,0x400                                
ram:f000:d5a2   763a            JBE         LAB_f000_d5de                           
ram:f000:d5a4   ff7618          PUSH        word ptr [BP + 0x18]                    
ram:f000:d5a7   8bc7            MOV         AX,DI                                   
ram:f000:d5a9   2d0004          SUB         AX,0x400                                
ram:f000:d5ac   50              PUSH        AX                                      
ram:f000:d5ad   ff7614          PUSH        word ptr [BP + 0x14]                    
ram:f000:d5b0   ff7612          PUSH        word ptr [BP + 0x12]                    
ram:f000:d5b3   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:d5b6   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:d5b9   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:d5be   83c40c          ADD         SP,0xc                                  
ram:f000:d5c1   8bc7            MOV         AX,DI                                   
ram:f000:d5c3   2d0004          SUB         AX,0x400                                
ram:f000:d5c6   31d2            XOR         DX,DX                                   
ram:f000:d5c8   01460e          ADD         word ptr [BP + 0xe],AX                  
ram:f000:d5cb   115610          ADC         word ptr [BP + 0x10],DX                 
ram:f000:d5ce   8bc7            MOV         AX,DI                                   
ram:f000:d5d0   2d0004          SUB         AX,0x400                                
ram:f000:d5d3   31d2            XOR         DX,DX                                   
ram:f000:d5d5   014612          ADD         word ptr [BP + 0x12],AX                 
ram:f000:d5d8   115614          ADC         word ptr [BP + 0x14],DX                 
ram:f000:d5db   bf0004          MOV         DI,0x400                                
                            LAB_f000_d5de:                ;XREF[1,0]:   f000:d5a2
ram:f000:d5de   f74618ffff      TEST        word ptr [BP + 0x18],0xffff             
ram:f000:d5e3   7403            JZ          LAB_f000_d5e8                           
ram:f000:d5e5   e99300          JMP         LAB_f000_d67b                           
                            LAB_f000_d5e8:                ;XREF[1,0]:   f000:d5e3
ram:f000:d5e8   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:d5eb   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:d5ee   9a020090fd      CALLF       set_host_page                           ;undefined2 set_host_page(undefined2 ...
ram:f000:d5f3   83c404          ADD         SP,0x4                                  
ram:f000:d5f6   8946fa          MOV         word ptr [BP + -0x6],AX                 
ram:f000:d5f9   8956fc          MOV         word ptr [BP + -0x4],DX                 
ram:f000:d5fc   8bc7            MOV         AX,DI                                   
ram:f000:d5fe   31d2            XOR         DX,DX                                   
ram:f000:d600   0346fa          ADD         AX,word ptr [BP + -0x6]                 
ram:f000:d603   1356fc          ADC         DX,word ptr [BP + -0x4]                 
ram:f000:d606   83fa0a          CMP         DX,0xa                                  
ram:f000:d609   7258            JC          LAB_f000_d663                           
ram:f000:d60b   7705            JA          LAB_f000_d612                           
ram:f000:d60d   3d0000          CMP         AX,0x0                                  
ram:f000:d610   7651            JBE         LAB_f000_d663                           
                            LAB_f000_d612:                ;XREF[1,0]:   f000:d60b
ram:f000:d612   b80000          MOV         AX,0x0                                  
ram:f000:d615   ba0a00          MOV         DX,0xa                                  
ram:f000:d618   2b46fa          SUB         AX,word ptr [BP + -0x6]                 
ram:f000:d61b   1b56fc          SBB         DX,word ptr [BP + -0x4]                 
ram:f000:d61e   8946fe          MOV         word ptr [BP + -0x2],AX                 
ram:f000:d621   ff7618          PUSH        word ptr [BP + 0x18]                    
ram:f000:d624   8bc7            MOV         AX,DI                                   
ram:f000:d626   2b46fe          SUB         AX,word ptr [BP + -0x2]                 
ram:f000:d629   50              PUSH        AX                                      
ram:f000:d62a   8b46fe          MOV         AX,word ptr [BP + -0x2]                 
ram:f000:d62d   31d2            XOR         DX,DX                                   
ram:f000:d62f   034612          ADD         AX,word ptr [BP + 0x12]                 
ram:f000:d632   135614          ADC         DX,word ptr [BP + 0x14]                 
ram:f000:d635   52              PUSH        DX                                      
ram:f000:d636   50              PUSH        AX                                      
ram:f000:d637   8b46fe          MOV         AX,word ptr [BP + -0x2]                 
ram:f000:d63a   31d2            XOR         DX,DX                                   
ram:f000:d63c   03460e          ADD         AX,word ptr [BP + 0xe]                  
ram:f000:d63f   135610          ADC         DX,word ptr [BP + 0x10]                 
ram:f000:d642   52              PUSH        DX                                      
ram:f000:d643   50              PUSH        AX                                      
ram:f000:d644   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:d649   83c40c          ADD         SP,0xc                                  
ram:f000:d64c   8b7efe          MOV         DI,word ptr [BP + -0x2]                 
ram:f000:d64f   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:d652   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:d655   9a020090fd      CALLF       set_host_page                           ;undefined2 set_host_page(undefined2 ...
ram:f000:d65a   83c404          ADD         SP,0x4                                  
ram:f000:d65d   8946fa          MOV         word ptr [BP + -0x6],AX                 
ram:f000:d660   8956fc          MOV         word ptr [BP + -0x4],DX                 
                            LAB_f000_d663:                ;XREF[2,0]:   f000:d609,f000:d610
ram:f000:d663   ff7614          PUSH        word ptr [BP + 0x14]                    
ram:f000:d666   ff7612          PUSH        word ptr [BP + 0x12]                    
ram:f000:d669   ff76fc          PUSH        word ptr [BP + -0x4]                    
ram:f000:d66c   ff76fa          PUSH        word ptr [BP + -0x6]                    
ram:f000:d66f   57              PUSH        DI                                      
ram:f000:d670   9a640010fd      CALLF       do_ddma0_bytes                          ;void do_ddma0_bytes(undefined2 param...
ram:f000:d675   83c40a          ADD         SP,0xa                                  
ram:f000:d678   e99000          JMP         LAB_f000_d70b                           
                            LAB_f000_d67b:                ;XREF[1,0]:   f000:d5e5
ram:f000:d67b   ff7614          PUSH        word ptr [BP + 0x14]                    
ram:f000:d67e   ff7612          PUSH        word ptr [BP + 0x12]                    
ram:f000:d681   9a020090fd      CALLF       set_host_page                           ;undefined2 set_host_page(undefined2 ...
ram:f000:d686   83c404          ADD         SP,0x4                                  
ram:f000:d689   8946fa          MOV         word ptr [BP + -0x6],AX                 
ram:f000:d68c   8956fc          MOV         word ptr [BP + -0x4],DX                 
ram:f000:d68f   8bc7            MOV         AX,DI                                   
ram:f000:d691   31d2            XOR         DX,DX                                   
ram:f000:d693   0346fa          ADD         AX,word ptr [BP + -0x6]                 
ram:f000:d696   1356fc          ADC         DX,word ptr [BP + -0x4]                 
ram:f000:d699   83fa0a          CMP         DX,0xa                                  
ram:f000:d69c   7258            JC          LAB_f000_d6f6                           
ram:f000:d69e   7705            JA          LAB_f000_d6a5                           
ram:f000:d6a0   3d0000          CMP         AX,0x0                                  
ram:f000:d6a3   7651            JBE         LAB_f000_d6f6                           
                            LAB_f000_d6a5:                ;XREF[1,0]:   f000:d69e
ram:f000:d6a5   b80000          MOV         AX,0x0                                  
ram:f000:d6a8   ba0a00          MOV         DX,0xa                                  
ram:f000:d6ab   2b46fa          SUB         AX,word ptr [BP + -0x6]                 
ram:f000:d6ae   1b56fc          SBB         DX,word ptr [BP + -0x4]                 
ram:f000:d6b1   8946fe          MOV         word ptr [BP + -0x2],AX                 
ram:f000:d6b4   ff7618          PUSH        word ptr [BP + 0x18]                    
ram:f000:d6b7   8bc7            MOV         AX,DI                                   
ram:f000:d6b9   2b46fe          SUB         AX,word ptr [BP + -0x2]                 
ram:f000:d6bc   50              PUSH        AX                                      
ram:f000:d6bd   8b46fe          MOV         AX,word ptr [BP + -0x2]                 
ram:f000:d6c0   31d2            XOR         DX,DX                                   
ram:f000:d6c2   034612          ADD         AX,word ptr [BP + 0x12]                 
ram:f000:d6c5   135614          ADC         DX,word ptr [BP + 0x14]                 
ram:f000:d6c8   52              PUSH        DX                                      
ram:f000:d6c9   50              PUSH        AX                                      
ram:f000:d6ca   8b46fe          MOV         AX,word ptr [BP + -0x2]                 
ram:f000:d6cd   31d2            XOR         DX,DX                                   
ram:f000:d6cf   03460e          ADD         AX,word ptr [BP + 0xe]                  
ram:f000:d6d2   135610          ADC         DX,word ptr [BP + 0x10]                 
ram:f000:d6d5   52              PUSH        DX                                      
ram:f000:d6d6   50              PUSH        AX                                      
ram:f000:d6d7   9a920050fd      CALLF       transfer_bytes                          ;undefined transfer_bytes()
ram:f000:d6dc   83c40c          ADD         SP,0xc                                  
ram:f000:d6df   8b7efe          MOV         DI,word ptr [BP + -0x2]                 
ram:f000:d6e2   ff7614          PUSH        word ptr [BP + 0x14]                    
ram:f000:d6e5   ff7612          PUSH        word ptr [BP + 0x12]                    
ram:f000:d6e8   9a020090fd      CALLF       set_host_page                           ;undefined2 set_host_page(undefined2 ...
ram:f000:d6ed   83c404          ADD         SP,0x4                                  
ram:f000:d6f0   8946fa          MOV         word ptr [BP + -0x6],AX                 
ram:f000:d6f3   8956fc          MOV         word ptr [BP + -0x4],DX                 
                            LAB_f000_d6f6:                ;XREF[2,0]:   f000:d69c,f000:d6a3
ram:f000:d6f6   ff76fc          PUSH        word ptr [BP + -0x4]                    
ram:f000:d6f9   ff76fa          PUSH        word ptr [BP + -0x6]                    
ram:f000:d6fc   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:d6ff   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:d702   57              PUSH        DI                                      
ram:f000:d703   9a640010fd      CALLF       do_ddma0_bytes                          ;void do_ddma0_bytes(undefined2 param...
ram:f000:d708   83c40a          ADD         SP,0xa                                  
                            LAB_f000_d70b:                ;XREF[2,0]:   f000:d678,f000:d718
ram:f000:d70b   b840c0          MOV         AX,0xc040                               
ram:f000:d70e   8ed8            MOV         DS,AX                                   
ram:f000:d710   f706c800ffff    TEST        word ptr [offset...,0xffff              
ram:f000:d716   7402            JZ          LAB_f000_d71a                           
ram:f000:d718   ebf1            JMP         LAB_f000_d70b                           
                            LAB_f000_d71a:                ;XREF[1,0]:   f000:d716
ram:f000:d71a   ea7e00e0fd      JMPF        init_vectors::function_return           
ram:f000:d71f   90              NOP                                                  
                            ;************************************************************************************************
                            ;*  Arguments:                                                                                  *
                            ;*                                                                                              *
                            ;*  1. SCSI Segment                                                                             *
                            ;*  2. SCSI Offset                                                                              *
                            ;*  3. 3B2 Segment                                                                              *
                            ;*  4. 3B2 Offset                                                                               *
                            ;*  5. Words to Transfer                                                                        *
                            ;*  6. Read/Write                                                                               *
                            ;************************************************************************************************
                            ;undefined transfer_words()
                                                          ;XREF[15,0]:  f000:8e41,f000:b574,f000:b6b1,f000:b896
                                                          ;             f000:c5be,f000:c948,f000:caf3,f000:cdaf
                                                          ;             f000:d1f6,f000:d2dc,f000:d4a2,f000:d747
                                                          ;             f000:d7e7,f000:d894,f000:da62
ram:f000:d720   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:d725   81ec0800        SUB         SP,0x8                                  
ram:f000:d729   8b7e16          MOV         DI,word ptr [BP + 0x16]                 
ram:f000:d72c   81ff0002        CMP         DI,0x200                                
ram:f000:d730   763e            JBE         LAB_f000_d770                           
ram:f000:d732   ff7618          PUSH        word ptr [BP + 0x18]                    
ram:f000:d735   8bc7            MOV         AX,DI                                   
ram:f000:d737   2d0002          SUB         AX,0x200                                
ram:f000:d73a   50              PUSH        AX                                      
ram:f000:d73b   ff7614          PUSH        word ptr [BP + 0x14]                    
ram:f000:d73e   ff7612          PUSH        word ptr [BP + 0x12]                    
ram:f000:d741   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:d744   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:d747   9a200070fd      CALLF       transfer_words                          ;undefined transfer_words()
ram:f000:d74c   83c40c          ADD         SP,0xc                                  
ram:f000:d74f   8bc7            MOV         AX,DI                                   
ram:f000:d751   2d0002          SUB         AX,0x200                                
ram:f000:d754   d1e0            SHL         AX,1                                    
ram:f000:d756   31d2            XOR         DX,DX                                   
ram:f000:d758   01460e          ADD         word ptr [BP + 0xe],AX                  
ram:f000:d75b   115610          ADC         word ptr [BP + 0x10],DX                 
ram:f000:d75e   8bc7            MOV         AX,DI                                   
ram:f000:d760   2d0002          SUB         AX,0x200                                
ram:f000:d763   d1e0            SHL         AX,1                                    
ram:f000:d765   31d2            XOR         DX,DX                                   
ram:f000:d767   014612          ADD         word ptr [BP + 0x12],AX                 
ram:f000:d76a   115614          ADC         word ptr [BP + 0x14],DX                 
ram:f000:d76d   bf0002          MOV         DI,0x200                                
                            LAB_f000_d770:                ;XREF[1,0]:   f000:d730
ram:f000:d770   f74618ffff      TEST        word ptr [BP + 0x18],0xffff             
ram:f000:d775   7403            JZ          LAB_f000_d77a                           
ram:f000:d777   e9ad00          JMP         LAB_f000_d827                           
                            LAB_f000_d77a:                ;XREF[1,0]:   f000:d775
ram:f000:d77a   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:d77d   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:d780   9a020090fd      CALLF       set_host_page                           ;undefined2 set_host_page(undefined2 ...
ram:f000:d785   83c404          ADD         SP,0x4                                  
ram:f000:d788   8946fa          MOV         word ptr [BP + -0x6],AX                 
ram:f000:d78b   8956fc          MOV         word ptr [BP + -0x4],DX                 
ram:f000:d78e   8bc7            MOV         AX,DI                                   
ram:f000:d790   d1e0            SHL         AX,1                                    
ram:f000:d792   31d2            XOR         DX,DX                                   
ram:f000:d794   0346fa          ADD         AX,word ptr [BP + -0x6]                 
ram:f000:d797   1356fc          ADC         DX,word ptr [BP + -0x4]                 
ram:f000:d79a   83fa0a          CMP         DX,0xa                                  
ram:f000:d79d   7270            JC          LAB_f000_d80f                           
ram:f000:d79f   7705            JA          LAB_f000_d7a6                           
ram:f000:d7a1   3d0000          CMP         AX,0x0                                  
ram:f000:d7a4   7669            JBE         LAB_f000_d80f                           
                            LAB_f000_d7a6:                ;XREF[1,0]:   f000:d79f
ram:f000:d7a6   b80000          MOV         AX,0x0                                  
ram:f000:d7a9   ba0a00          MOV         DX,0xa                                  
ram:f000:d7ac   2b46fa          SUB         AX,word ptr [BP + -0x6]                 
ram:f000:d7af   1b56fc          SBB         DX,word ptr [BP + -0x4]                 
ram:f000:d7b2   8946fe          MOV         word ptr [BP + -0x2],AX                 
ram:f000:d7b5   be0200          MOV         SI,0x2                                  
ram:f000:d7b8   8b46fe          MOV         AX,word ptr [BP + -0x2]                 
ram:f000:d7bb   31d2            XOR         DX,DX                                   
ram:f000:d7bd   f7f6            DIV         SI                                      
ram:f000:d7bf   8986f8ff        MOV         word ptr [BP + 0xfff8],AX               
ram:f000:d7c3   ff7618          PUSH        word ptr [BP + 0x18]                    
ram:f000:d7c6   8bc7            MOV         AX,DI                                   
ram:f000:d7c8   2b86f8ff        SUB         AX,word ptr [BP + 0xfff8]               
ram:f000:d7cc   50              PUSH        AX                                      
ram:f000:d7cd   8b46fe          MOV         AX,word ptr [BP + -0x2]                 
ram:f000:d7d0   31d2            XOR         DX,DX                                   
ram:f000:d7d2   034612          ADD         AX,word ptr [BP + 0x12]                 
ram:f000:d7d5   135614          ADC         DX,word ptr [BP + 0x14]                 
ram:f000:d7d8   52              PUSH        DX                                      
ram:f000:d7d9   50              PUSH        AX                                      
ram:f000:d7da   8b46fe          MOV         AX,word ptr [BP + -0x2]                 
ram:f000:d7dd   31d2            XOR         DX,DX                                   
ram:f000:d7df   03460e          ADD         AX,word ptr [BP + 0xe]                  
ram:f000:d7e2   135610          ADC         DX,word ptr [BP + 0x10]                 
ram:f000:d7e5   52              PUSH        DX                                      
ram:f000:d7e6   50              PUSH        AX                                      
ram:f000:d7e7   9a200070fd      CALLF       transfer_words                          ;undefined transfer_words()
ram:f000:d7ec   83c40c          ADD         SP,0xc                                  
ram:f000:d7ef   be0200          MOV         SI,0x2                                  
ram:f000:d7f2   8b46fe          MOV         AX,word ptr [BP + -0x2]                 
ram:f000:d7f5   31d2            XOR         DX,DX                                   
ram:f000:d7f7   f7f6            DIV         SI                                      
ram:f000:d7f9   8bf8            MOV         DI,AX                                   
ram:f000:d7fb   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:d7fe   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:d801   9a020090fd      CALLF       set_host_page                           ;undefined2 set_host_page(undefined2 ...
ram:f000:d806   83c404          ADD         SP,0x4                                  
ram:f000:d809   8946fa          MOV         word ptr [BP + -0x6],AX                 
ram:f000:d80c   8956fc          MOV         word ptr [BP + -0x4],DX                 
                            LAB_f000_d80f:                ;XREF[2,0]:   f000:d79d,f000:d7a4
ram:f000:d80f   ff7614          PUSH        word ptr [BP + 0x14]                    
ram:f000:d812   ff7612          PUSH        word ptr [BP + 0x12]                    
ram:f000:d815   ff76fc          PUSH        word ptr [BP + -0x4]                    
ram:f000:d818   ff76fa          PUSH        word ptr [BP + -0x6]                    
ram:f000:d81b   57              PUSH        DI                                      
ram:f000:d81c   9a940010fd      CALLF       do_ddma0_words                          ;void do_ddma0_words(undefined2 param...
ram:f000:d821   83c40a          ADD         SP,0xa                                  
ram:f000:d824   e9aa00          JMP         LAB_f000_d8d1                           
                            LAB_f000_d827:                ;XREF[1,0]:   f000:d777
ram:f000:d827   ff7614          PUSH        word ptr [BP + 0x14]                    
ram:f000:d82a   ff7612          PUSH        word ptr [BP + 0x12]                    
ram:f000:d82d   9a020090fd      CALLF       set_host_page                           ;undefined2 set_host_page(undefined2 ...
ram:f000:d832   83c404          ADD         SP,0x4                                  
ram:f000:d835   8946fa          MOV         word ptr [BP + -0x6],AX                 
ram:f000:d838   8956fc          MOV         word ptr [BP + -0x4],DX                 
ram:f000:d83b   8bc7            MOV         AX,DI                                   
ram:f000:d83d   d1e0            SHL         AX,1                                    
ram:f000:d83f   31d2            XOR         DX,DX                                   
ram:f000:d841   0346fa          ADD         AX,word ptr [BP + -0x6]                 
ram:f000:d844   1356fc          ADC         DX,word ptr [BP + -0x4]                 
ram:f000:d847   83fa0a          CMP         DX,0xa                                  
ram:f000:d84a   7270            JC          LAB_f000_d8bc                           
ram:f000:d84c   7705            JA          LAB_f000_d853                           
ram:f000:d84e   3d0000          CMP         AX,0x0                                  
ram:f000:d851   7669            JBE         LAB_f000_d8bc                           
                            LAB_f000_d853:                ;XREF[1,0]:   f000:d84c
ram:f000:d853   b80000          MOV         AX,0x0                                  
ram:f000:d856   ba0a00          MOV         DX,0xa                                  
ram:f000:d859   2b46fa          SUB         AX,word ptr [BP + -0x6]                 
ram:f000:d85c   1b56fc          SBB         DX,word ptr [BP + -0x4]                 
ram:f000:d85f   8946fe          MOV         word ptr [BP + -0x2],AX                 
ram:f000:d862   be0200          MOV         SI,0x2                                  
ram:f000:d865   8b46fe          MOV         AX,word ptr [BP + -0x2]                 
ram:f000:d868   31d2            XOR         DX,DX                                   
ram:f000:d86a   f7f6            DIV         SI                                      
ram:f000:d86c   8986f8ff        MOV         word ptr [BP + 0xfff8],AX               
ram:f000:d870   ff7618          PUSH        word ptr [BP + 0x18]                    
ram:f000:d873   8bc7            MOV         AX,DI                                   
ram:f000:d875   2b86f8ff        SUB         AX,word ptr [BP + 0xfff8]               
ram:f000:d879   50              PUSH        AX                                      
ram:f000:d87a   8b46fe          MOV         AX,word ptr [BP + -0x2]                 
ram:f000:d87d   31d2            XOR         DX,DX                                   
ram:f000:d87f   034612          ADD         AX,word ptr [BP + 0x12]                 
ram:f000:d882   135614          ADC         DX,word ptr [BP + 0x14]                 
ram:f000:d885   52              PUSH        DX                                      
ram:f000:d886   50              PUSH        AX                                      
ram:f000:d887   8b46fe          MOV         AX,word ptr [BP + -0x2]                 
ram:f000:d88a   31d2            XOR         DX,DX                                   
ram:f000:d88c   03460e          ADD         AX,word ptr [BP + 0xe]                  
ram:f000:d88f   135610          ADC         DX,word ptr [BP + 0x10]                 
ram:f000:d892   52              PUSH        DX                                      
ram:f000:d893   50              PUSH        AX                                      
ram:f000:d894   9a200070fd      CALLF       transfer_words                          ;undefined transfer_words()
ram:f000:d899   83c40c          ADD         SP,0xc                                  
ram:f000:d89c   be0200          MOV         SI,0x2                                  
ram:f000:d89f   8b46fe          MOV         AX,word ptr [BP + -0x2]                 
ram:f000:d8a2   31d2            XOR         DX,DX                                   
ram:f000:d8a4   f7f6            DIV         SI                                      
ram:f000:d8a6   8bf8            MOV         DI,AX                                   
ram:f000:d8a8   ff7614          PUSH        word ptr [BP + 0x14]                    
ram:f000:d8ab   ff7612          PUSH        word ptr [BP + 0x12]                    
ram:f000:d8ae   9a020090fd      CALLF       set_host_page                           ;undefined2 set_host_page(undefined2 ...
ram:f000:d8b3   83c404          ADD         SP,0x4                                  
ram:f000:d8b6   8946fa          MOV         word ptr [BP + -0x6],AX                 
ram:f000:d8b9   8956fc          MOV         word ptr [BP + -0x4],DX                 
                            LAB_f000_d8bc:                ;XREF[2,0]:   f000:d84a,f000:d851
ram:f000:d8bc   ff76fc          PUSH        word ptr [BP + -0x4]                    
ram:f000:d8bf   ff76fa          PUSH        word ptr [BP + -0x6]                    
ram:f000:d8c2   ff7610          PUSH        word ptr [BP + 0x10]                    
ram:f000:d8c5   ff760e          PUSH        word ptr [BP + 0xe]                     
ram:f000:d8c8   57              PUSH        DI                                      
ram:f000:d8c9   9a940010fd      CALLF       do_ddma0_words                          ;void do_ddma0_words(undefined2 param...
ram:f000:d8ce   83c40a          ADD         SP,0xa                                  
                            LAB_f000_d8d1:                ;XREF[2,0]:   f000:d824,f000:d8de
ram:f000:d8d1   b840c0          MOV         AX,0xc040                               
ram:f000:d8d4   8ed8            MOV         DS,AX                                   
ram:f000:d8d6   f706c800ffff    TEST        word ptr [offset...,0xffff              
ram:f000:d8dc   7402            JZ          LAB_f000_d8e0                           
ram:f000:d8de   ebf1            JMP         LAB_f000_d8d1                           
                            LAB_f000_d8e0:                ;XREF[1,0]:   f000:d8dc
ram:f000:d8e0   ea7e00e0fd      JMPF        init_vectors::function_return           
ram:f000:d8e5   90              NOP                                                  
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void FUN_f000_d8e6(undefined * param_1, undefined * param_2)
          ;param_1       undefined *          4                      ;XREF[1,0]:   f000:d8f1
          ;param_2       undefined *          8                      ;XREF[1,0]:   f000:d8ee
                                                          ;XREF[2,0]:   f000:cf4a,f000:d315
ram:f000:d8e6   55              PUSH        BP                                      
ram:f000:d8e7   1e              PUSH        DS                                      
ram:f000:d8e8   06              PUSH        ES                                      
ram:f000:d8e9   56              PUSH        SI                                      
ram:f000:d8ea   57              PUSH        DI                                      
ram:f000:d8eb   51              PUSH        CX                                      
ram:f000:d8ec   8bec            MOV         BP,SP                                   
ram:f000:d8ee   c47e14          LES         DI,[BP + param_2+0xc]                   
ram:f000:d8f1   c57610          LDS         SI,[BP + param_1+0xc]                   
ram:f000:d8f4   8b4e18          MOV         CX,word ptr [BP + Stack[0xc]+0xc]       
ram:f000:d8f7   fc              CLD                                                  
ram:f000:d8f8   f2a4            MOVSB       ES:DI,SI                                
ram:f000:d8fa   59              POP         CX                                      
ram:f000:d8fb   5f              POP         DI                                      
ram:f000:d8fc   5e              POP         SI                                      
ram:f000:d8fd   07              POP         ES                                      
ram:f000:d8fe   1f              POP         DS                                      
ram:f000:d8ff   5d              POP         BP                                      
ram:f000:d900   cb              RET                                                  
ram:f000:d901   90              NOP                                                  
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 set_host_page(undefined2 param_1, uint param_2)
          ;param_1       undefined2           4                      ;XREF[1,0]:   f000:d91d
          ;param_2       uint                 6                      ;XREF[2,0]:   f000:d90a,f000:d912
                                                          ;XREF[16,0]:  f000:c549,f000:c8d0,f000:caad,f000:cd69
                                                          ;             f000:d3d7,f000:d545,f000:d5ee,f000:d655
                                                          ;             f000:d681,f000:d6e8,f000:d780,f000:d801
                                                          ;             f000:d82d,f000:d8ae,f000:d969,f000:dabd
ram:f000:d902   55              PUSH        BP                                      
ram:f000:d903   8bec            MOV         BP,SP                                   
ram:f000:d905   b800c0          MOV         AX,0xc000                               
ram:f000:d908   8ed8            MOV         DS,AX                                   
ram:f000:d90a   8b4608          MOV         AX,word ptr [BP + param_2+0x2]          
ram:f000:d90d   d1e8            SHR         AX,1                                    
ram:f000:d90f   a38200          MOV         [PAGE_REG],AX                           
ram:f000:d912   8b5608          MOV         DX,word ptr [BP + param_2+0x2]          
ram:f000:d915   81e20100        AND         DX,0x1                                  
ram:f000:d919   81ca0800        OR          DX,0x8                                  
ram:f000:d91d   8b4606          MOV         AX,word ptr [BP + param_1+0x2]          
ram:f000:d920   5d              POP         BP                                      
ram:f000:d921   cb              RET                                                  
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void req_sbd_interrupt(void)
                                                          ;XREF[6,0]:   f000:8c0f,f000:8f8d,f000:909d,f000:90da
                                                          ;             f000:cafb,f000:cdb7
ram:f000:d922   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:d927   81ec0000        SUB         SP,0x0                                  
                            int_already_pending:          ;XREF[1,0]:   f000:d93a
ram:f000:d92b   b800c0          MOV         AX,0xc000                               
ram:f000:d92e   8ed8            MOV         DS,AX                                   
ram:f000:d930   a08400          MOV         AL,[PCSR_ALL]                           
ram:f000:d933   30e4            XOR         AH,AH                                   
ram:f000:d935   a98000          TEST        AX,0x80                                 ;Check if PINT bit is set in PCSR
ram:f000:d938   7502            JNZ         int_not_pending                         
ram:f000:d93a   ebef            JMP         int_already_pending                     
                            int_not_pending:              ;XREF[1,0]:   f000:d938
ram:f000:d93c   b800c0          MOV         AX,0xc000                               
ram:f000:d93f   8ed8            MOV         DS,AX                                   
ram:f000:d941   c6068f00ff      MOV         byte ptr [PCSR_7_PINT],0xff             ;Request system board interrupt
ram:f000:d946   ea7e00e0fd      JMPF        init_vectors::function_return           
ram:f000:d94b   90              NOP                                                  
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 complete_full_job(void)
                                                          ;XREF[3,0]:   f000:8c07,f000:9077,f000:c85b
ram:f000:d94c   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:d951   81ec0a00        SUB         SP,0xa                                  
ram:f000:d955   b8001f          MOV         AX,0x1f00                               
ram:f000:d958   8ed8            MOV         DS,AX                                   
ram:f000:d95a   a16a00          MOV         AX,[offset DAT_1000_f06a &0xff]         
ram:f000:d95d   8b166c00        MOV         DX,word ptr [offset DAT_1000_f06c &0xff]
ram:f000:d961   050200          ADD         AX,0x2                                  
ram:f000:d964   83d200          ADC         DX,0x0                                  
ram:f000:d967   52              PUSH        DX                                      
ram:f000:d968   50              PUSH        AX                                      
ram:f000:d969   9a020090fd      CALLF       set_host_page                           ;undefined2 set_host_page(undefined2 ...
ram:f000:d96e   83c404          ADD         SP,0x4                                  
ram:f000:d971   8af2            MOV         DH,DL                                   
ram:f000:d973   8ad4            MOV         DL,AH                                   
ram:f000:d975   30e4            XOR         AH,AH                                   
ram:f000:d977   d1e2            SHL         DX,1                                    
ram:f000:d979   d1e2            SHL         DX,1                                    
ram:f000:d97b   d1e2            SHL         DX,1                                    
ram:f000:d97d   d1e2            SHL         DX,1                                    
ram:f000:d97f   8bf0            MOV         SI,AX                                   
ram:f000:d981   8eda            MOV         DS,DX                                   
ram:f000:d983   8b04            MOV         AX,word ptr [SI]                        
ram:f000:d985   8946fe          MOV         word ptr [BP + -0x2],AX                 
ram:f000:d988   ff76fe          PUSH        word ptr [BP + -0x2]                    
ram:f000:d98b   9a6800c0fd      CALLF       byte_swap_ax                            ;undefined2 byte_swap_ax(undefined2 p...
ram:f000:d990   83c402          ADD         SP,0x2                                  
ram:f000:d993   8946fe          MOV         word ptr [BP + -0x2],AX                 
ram:f000:d996   b80000          MOV         AX,0x0                                  
ram:f000:d999   50              PUSH        AX                                      
ram:f000:d99a   ff76fe          PUSH        word ptr [BP + -0x2]                    
ram:f000:d99d   be001f          MOV         SI,0x1f00                               
ram:f000:d9a0   8ede            MOV         DS,SI                                   
ram:f000:d9a2   ff367200        PUSH        word ptr [offset DAT_1000_f072 &0xff]   
ram:f000:d9a6   9a220030fd      CALLF       FUN_f000_d322                           ;undefined2 FUN_f000_d322(void)
ram:f000:d9ab   83c406          ADD         SP,0x6                                  
ram:f000:d9ae   8bf8            MOV         DI,AX                                   
ram:f000:d9b0   b8001f          MOV         AX,0x1f00                               
ram:f000:d9b3   8ed8            MOV         DS,AX                                   
ram:f000:d9b5   a03b00          MOV         AL,[offset DAT_1000_f03b &0xff]         
ram:f000:d9b8   30e4            XOR         AH,AH                                   
ram:f000:d9ba   48              DEC         AX                                      
ram:f000:d9bb   3bf8            CMP         DI,AX                                   
ram:f000:d9bd   7506            JNZ         LAB_f000_d9c5                           
ram:f000:d9bf   b80000          MOV         AX,0x0                                  
ram:f000:d9c2   e94201          JMP         LAB_f000_db07                           
                            LAB_f000_d9c5:                ;XREF[1,0]:   f000:d9bd
ram:f000:d9c5   b8001f          MOV         AX,0x1f00                               
ram:f000:d9c8   8ed8            MOV         DS,AX                                   
ram:f000:d9ca   a16a00          MOV         AX,[offset DAT_1000_f06a &0xff]         
ram:f000:d9cd   8b166c00        MOV         DX,word ptr [offset DAT_1000_f06c &0xff]
ram:f000:d9d1   050400          ADD         AX,0x4                                  
ram:f000:d9d4   83d200          ADC         DX,0x0                                  
ram:f000:d9d7   b9001f          MOV         CX,0x1f00                               
ram:f000:d9da   8ed9            MOV         DS,CX                                   
ram:f000:d9dc   8b0e7200        MOV         CX,word ptr [offset DAT_1000_f072 &0xff]
ram:f000:d9e0   31db            XOR         BX,BX                                   
ram:f000:d9e2   83f900          CMP         CX,0x0                                  
ram:f000:d9e5   7d02            JGE         LAB_f000_d9e9                           
ram:f000:d9e7   f7d3            NOT         BX                                      
                            LAB_f000_d9e9:                ;XREF[1,0]:   f000:d9e5
ram:f000:d9e9   03c1            ADD         AX,CX                                   
ram:f000:d9eb   13d3            ADC         DX,BX                                   
ram:f000:d9ed   8946fa          MOV         word ptr [BP + -0x6],AX                 
ram:f000:d9f0   8956fc          MOV         word ptr [BP + -0x4],DX                 
ram:f000:d9f3   57              PUSH        DI                                      
ram:f000:d9f4   bf001f          MOV         DI,0x1f00                               
ram:f000:d9f7   8ec7            MOV         ES,DI                                   
ram:f000:d9f9   bf4a00          MOV         DI,0x4a                                 
ram:f000:d9fc   c5760e          LDS         SI,[BP + 0xe]                           
ram:f000:d9ff   b90600          MOV         CX,0x6                                  
ram:f000:da02   fc              CLD                                                  
ram:f000:da03   f2a5            MOVSW       ES:DI=>DAT_1000_f04a,SI                 
ram:f000:da05   5f              POP         DI                                      
ram:f000:da06   be001f          MOV         SI,0x1f00                               
ram:f000:da09   8ede            MOV         DS,SI                                   
ram:f000:da0b   ff364a00        PUSH        word ptr [offset DAT_1000_f04a &0xff]   
ram:f000:da0f   9a6800c0fd      CALLF       byte_swap_ax                            ;undefined2 byte_swap_ax(undefined2 p...
ram:f000:da14   83c402          ADD         SP,0x2                                  
ram:f000:da17   ba001f          MOV         DX,0x1f00                               
ram:f000:da1a   8eda            MOV         DS,DX                                   
ram:f000:da1c   a34a00          MOV         [offset DAT_1000_f04a &0xff],AX         
ram:f000:da1f   b8001f          MOV         AX,0x1f00                               
ram:f000:da22   8ed8            MOV         DS,AX                                   
ram:f000:da24   ff365000        PUSH        word ptr [offset DAT_1000_f050 &0xff]   
ram:f000:da28   ff364e00        PUSH        word ptr [offset DAT_1000_f04e &0xff]   
ram:f000:da2c   9a7200c0fd      CALLF       byte_swap_ax_dx                         ;undefined2 byte_swap_ax_dx(undefined...
ram:f000:da31   83c404          ADD         SP,0x4                                  
ram:f000:da34   b9001f          MOV         CX,0x1f00                               
ram:f000:da37   8ed9            MOV         DS,CX                                   
ram:f000:da39   a34e00          MOV         [offset DAT_1000_f04e &0xff],AX         
ram:f000:da3c   89165000        MOV         word ptr [offset DAT_1000_f050 &0xff],DX
ram:f000:da40   b80100          MOV         AX,0x1                                  
ram:f000:da43   50              PUSH        AX                                      
ram:f000:da44   b80600          MOV         AX,0x6                                  
ram:f000:da47   50              PUSH        AX                                      
ram:f000:da48   ff76fc          PUSH        word ptr [BP + -0x4]                    
ram:f000:da4b   ff76fa          PUSH        word ptr [BP + -0x6]                    
ram:f000:da4e   b84a00          MOV         AX,0x4a                                 
ram:f000:da51   ba001f          MOV         DX,0x1f00                               
ram:f000:da54   d1ea            SHR         DX,1                                    
ram:f000:da56   d1ea            SHR         DX,1                                    
ram:f000:da58   d1ea            SHR         DX,1                                    
ram:f000:da5a   d1ea            SHR         DX,1                                    
ram:f000:da5c   86d4            XCHG        AH,DL                                   
ram:f000:da5e   86f2            XCHG        DL,DH                                   
ram:f000:da60   52              PUSH        DX                                      
ram:f000:da61   50              PUSH        AX                                      
ram:f000:da62   9a200070fd      CALLF       transfer_words                          ;undefined transfer_words()
ram:f000:da67   83c40c          ADD         SP,0xc                                  
ram:f000:da6a   b8001f          MOV         AX,0x1f00                               
ram:f000:da6d   8ed8            MOV         DS,AX                                   
ram:f000:da6f   a17200          MOV         AX,[offset DAT_1000_f072 &0xff]         
ram:f000:da72   050c00          ADD         AX,0xc                                  
ram:f000:da75   ba001f          MOV         DX,0x1f00                               
ram:f000:da78   8eda            MOV         DS,DX                                   
ram:f000:da7a   3b067000        CMP         AX,word ptr [offset DAT_1000_f070 &0xff]
ram:f000:da7e   720d            JC          LAB_f000_da8d                           
ram:f000:da80   b8001f          MOV         AX,0x1f00                               
ram:f000:da83   8ed8            MOV         DS,AX                                   
ram:f000:da85   c70672000000    MOV         word ptr [offset...,0x0                 
ram:f000:da8b   eb0a            JMP         LAB_f000_da97                           
                            LAB_f000_da8d:                ;XREF[1,0]:   f000:da7e
ram:f000:da8d   b8001f          MOV         AX,0x1f00                               
ram:f000:da90   8ed8            MOV         DS,AX                                   
ram:f000:da92   830672000c      ADD         word ptr [offset...,0xc                 
                            LAB_f000_da97:                ;XREF[1,0]:   f000:da8b
ram:f000:da97   be001f          MOV         SI,0x1f00                               
ram:f000:da9a   8ede            MOV         DS,SI                                   
ram:f000:da9c   ff367200        PUSH        word ptr [offset DAT_1000_f072 &0xff]   
ram:f000:daa0   9a6800c0fd      CALLF       byte_swap_ax                            ;undefined2 byte_swap_ax(undefined2 p...
ram:f000:daa5   83c402          ADD         SP,0x2                                  
ram:f000:daa8   ba001f          MOV         DX,0x1f00                               
ram:f000:daab   8eda            MOV         DS,DX                                   
ram:f000:daad   a37200          MOV         [offset DAT_1000_f072 &0xff],AX         
ram:f000:dab0   b8001f          MOV         AX,0x1f00                               
ram:f000:dab3   8ed8            MOV         DS,AX                                   
ram:f000:dab5   ff366c00        PUSH        word ptr [offset DAT_1000_f06c &0xff]   
ram:f000:dab9   ff366a00        PUSH        word ptr [offset DAT_1000_f06a &0xff]   
ram:f000:dabd   9a020090fd      CALLF       set_host_page                           ;undefined2 set_host_page(undefined2 ...
ram:f000:dac2   83c404          ADD         SP,0x4                                  
ram:f000:dac5   8af2            MOV         DH,DL                                   
ram:f000:dac7   8ad4            MOV         DL,AH                                   
ram:f000:dac9   30e4            XOR         AH,AH                                   
ram:f000:dacb   d1e2            SHL         DX,1                                    
ram:f000:dacd   d1e2            SHL         DX,1                                    
ram:f000:dacf   d1e2            SHL         DX,1                                    
ram:f000:dad1   d1e2            SHL         DX,1                                    
ram:f000:dad3   8986f6ff        MOV         word ptr [BP + 0xfff6],AX               
ram:f000:dad7   8996f8ff        MOV         word ptr [BP + 0xfff8],DX               
ram:f000:dadb   b8001f          MOV         AX,0x1f00                               
ram:f000:dade   8ed8            MOV         DS,AX                                   
ram:f000:dae0   a17200          MOV         AX,[offset DAT_1000_f072 &0xff]         
ram:f000:dae3   c576f6          LDS         SI,[BP + -0xa]                          
ram:f000:dae6   ff8904be        DEC         word ptr [BX + DI + 0xbe04]             
ram:f000:daea   001f            ADD         byte ptr [BX],BL                        
ram:f000:daec   8ede            MOV         DS,SI                                   
ram:f000:daee   ff367200        PUSH        word ptr [0x72]                         
ram:f000:daf2   9a6800c0fd      CALLF       byte_swap_ax                            ;undefined2 byte_swap_ax(undefined2 p...
ram:f000:daf7   83c402          ADD         SP,0x2                                  
ram:f000:dafa   ba001f          MOV         DX,0x1f00                               
ram:f000:dafd   8eda            MOV         DS,DX                                   
ram:f000:daff   a37200          MOV         [offset DAT_1000_f072 &0xff],AX         
ram:f000:db02   b80100          MOV         AX,0x1                                  
ram:f000:db05   eb00            JMP         LAB_f000_db07                           
                            LAB_f000_db07:                ;XREF[2,0]:   f000:d9c2,f000:db05
ram:f000:db07   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 test_registers(void)
                                                          ;XREF[2,0]:   f000:80fd,f000:84d9
ram:f000:db0c   9a4800e0fd      CALLF       function_entry                          ;undefined function_entry(void)
ram:f000:db11   b85555          MOV         AX,0x5555                               
ram:f000:db14   3d5555          CMP         AX,0x5555                               
ram:f000:db17   7540            JNZ         LAB_f000_db59                           
ram:f000:db19   b8aaaa          MOV         AX,0xaaaa                               
ram:f000:db1c   3daaaa          CMP         AX,0xaaaa                               
ram:f000:db1f   7538            JNZ         LAB_f000_db59                           
ram:f000:db21   bb5555          MOV         BX,0x5555                               
ram:f000:db24   81fb5555        CMP         BX,0x5555                               
ram:f000:db28   752f            JNZ         LAB_f000_db59                           
ram:f000:db2a   bbaaaa          MOV         BX,0xaaaa                               
ram:f000:db2d   81fbaaaa        CMP         BX,0xaaaa                               
ram:f000:db31   7526            JNZ         LAB_f000_db59                           
ram:f000:db33   b95555          MOV         CX,0x5555                               
ram:f000:db36   81f95555        CMP         CX,0x5555                               
ram:f000:db3a   751d            JNZ         LAB_f000_db59                           
ram:f000:db3c   b9aaaa          MOV         CX,0xaaaa                               
ram:f000:db3f   81f9aaaa        CMP         CX,0xaaaa                               
ram:f000:db43   7514            JNZ         LAB_f000_db59                           
ram:f000:db45   ba5555          MOV         DX,0x5555                               
ram:f000:db48   81fa5555        CMP         DX,0x5555                               
ram:f000:db4c   750b            JNZ         LAB_f000_db59                           
ram:f000:db4e   baaaaa          MOV         DX,0xaaaa                               
ram:f000:db51   81faaaaa        CMP         DX,0xaaaa                               
ram:f000:db55   7502            JNZ         LAB_f000_db59                           
ram:f000:db57   eb05            JMP         LAB_f000_db5e                           
                            LAB_f000_db59:                ;XREF[8,0]:   f000:db17,f000:db1f,f000:db28,f000:db31
                                                          ;             f000:db3a,f000:db43,f000:db4c,f000:db55
ram:f000:db59   ea5b00c0fd      JMPF        LAB_f000_dc5b                           
                            LAB_f000_db5e:                ;XREF[1,0]:   f000:db57
ram:f000:db5e   8bc6            MOV         AX,SI                                   
ram:f000:db60   be5555          MOV         SI,0x5555                               
ram:f000:db63   81fe5555        CMP         SI,0x5555                               
ram:f000:db67   750d            JNZ         LAB_f000_db76                           
ram:f000:db69   beaaaa          MOV         SI,0xaaaa                               
ram:f000:db6c   81feaaaa        CMP         SI,0xaaaa                               
ram:f000:db70   7504            JNZ         LAB_f000_db76                           
ram:f000:db72   8bf0            MOV         SI,AX                                   
ram:f000:db74   eb07            JMP         LAB_f000_db7d                           
                            LAB_f000_db76:                ;XREF[2,0]:   f000:db67,f000:db70
ram:f000:db76   8bf0            MOV         SI,AX                                   
ram:f000:db78   ea5b00c0fd      JMPF        LAB_f000_dc5b                           
                            LAB_f000_db7d:                ;XREF[1,0]:   f000:db74
ram:f000:db7d   8bc7            MOV         AX,DI                                   
ram:f000:db7f   bf5555          MOV         DI,0x5555                               
ram:f000:db82   81ff5555        CMP         DI,0x5555                               
ram:f000:db86   750d            JNZ         LAB_f000_db95                           
ram:f000:db88   bfaaaa          MOV         DI,0xaaaa                               
ram:f000:db8b   81ffaaaa        CMP         DI,0xaaaa                               
ram:f000:db8f   7504            JNZ         LAB_f000_db95                           
ram:f000:db91   8bf8            MOV         DI,AX                                   
ram:f000:db93   eb07            JMP         LAB_f000_db9c                           
                            LAB_f000_db95:                ;XREF[2,0]:   f000:db86,f000:db8f
ram:f000:db95   8bf8            MOV         DI,AX                                   
ram:f000:db97   ea5b00c0fd      JMPF        LAB_f000_dc5b                           
                            LAB_f000_db9c:                ;XREF[1,0]:   f000:db93
ram:f000:db9c   8bc4            MOV         AX,SP                                   
ram:f000:db9e   bc5555          MOV         SP,0x5555                               
ram:f000:dba1   81fc5555        CMP         SP,0x5555                               
ram:f000:dba5   750d            JNZ         LAB_f000_dbb4                           
ram:f000:dba7   bcaaaa          MOV         SP,0xaaaa                               
ram:f000:dbaa   81fcaaaa        CMP         SP,0xaaaa                               
ram:f000:dbae   7504            JNZ         LAB_f000_dbb4                           
ram:f000:dbb0   8be0            MOV         SP,AX                                   
ram:f000:dbb2   eb07            JMP         LAB_f000_dbbb                           
                            LAB_f000_dbb4:                ;XREF[2,0]:   f000:dba5,f000:dbae
ram:f000:dbb4   8be0            MOV         SP,AX                                   
ram:f000:dbb6   ea5b00c0fd      JMPF        LAB_f000_dc5b                           
                            LAB_f000_dbbb:                ;XREF[1,0]:   f000:dbb2
ram:f000:dbbb   8bc5            MOV         AX,BP                                   
ram:f000:dbbd   bd5555          MOV         BP,0x5555                               
ram:f000:dbc0   81fd5555        CMP         BP,0x5555                               
ram:f000:dbc4   750d            JNZ         LAB_f000_dbd3                           
ram:f000:dbc6   bdaaaa          MOV         BP,0xaaaa                               
ram:f000:dbc9   81fdaaaa        CMP         BP,0xaaaa                               
ram:f000:dbcd   7504            JNZ         LAB_f000_dbd3                           
ram:f000:dbcf   8be8            MOV         BP,AX                                   
ram:f000:dbd1   eb07            JMP         LAB_f000_dbda                           
                            LAB_f000_dbd3:                ;XREF[2,0]:   f000:dbc4,f000:dbcd
ram:f000:dbd3   8be8            MOV         BP,AX                                   
ram:f000:dbd5   ea5b00c0fd      JMPF        LAB_f000_dc5b                           
                            LAB_f000_dbda:                ;XREF[1,0]:   f000:dbd1
ram:f000:dbda   8cd8            MOV         AX,DS                                   
ram:f000:dbdc   8bd8            MOV         BX,AX                                   
ram:f000:dbde   b85555          MOV         AX,0x5555                               
ram:f000:dbe1   8ed8            MOV         DS,AX                                   
ram:f000:dbe3   8cd8            MOV         AX,DS                                   
ram:f000:dbe5   3d5555          CMP         AX,0x5555                               
ram:f000:dbe8   7512            JNZ         LAB_f000_dbfc                           
ram:f000:dbea   b8aaaa          MOV         AX,0xaaaa                               
ram:f000:dbed   8ed8            MOV         DS,AX                                   
ram:f000:dbef   8cd8            MOV         AX,DS                                   
ram:f000:dbf1   3daaaa          CMP         AX,0xaaaa                               
ram:f000:dbf4   7506            JNZ         LAB_f000_dbfc                           
ram:f000:dbf6   8bc3            MOV         AX,BX                                   
ram:f000:dbf8   8ed8            MOV         DS,AX                                   
ram:f000:dbfa   eb09            JMP         LAB_f000_dc05                           
                            LAB_f000_dbfc:                ;XREF[2,0]:   f000:dbe8,f000:dbf4
ram:f000:dbfc   8bc3            MOV         AX,BX                                   
ram:f000:dbfe   8ed8            MOV         DS,AX                                   
ram:f000:dc00   ea5b00c0fd      JMPF        LAB_f000_dc5b                           
                            LAB_f000_dc05:                ;XREF[1,0]:   f000:dbfa
ram:f000:dc05   8cd0            MOV         AX,SS                                   
ram:f000:dc07   8bd8            MOV         BX,AX                                   
ram:f000:dc09   b85555          MOV         AX,0x5555                               
ram:f000:dc0c   8ed0            MOV         SS,AX                                   
ram:f000:dc0e   8cd0            MOV         AX,SS                                   
ram:f000:dc10   3d5555          CMP         AX,0x5555                               
ram:f000:dc13   7512            JNZ         LAB_f000_dc27                           
ram:f000:dc15   b8aaaa          MOV         AX,0xaaaa                               
ram:f000:dc18   8ed0            MOV         SS,AX                                   
ram:f000:dc1a   8cd0            MOV         AX,SS                                   
ram:f000:dc1c   3daaaa          CMP         AX,0xaaaa                               
ram:f000:dc1f   7506            JNZ         LAB_f000_dc27                           
ram:f000:dc21   8bc3            MOV         AX,BX                                   
ram:f000:dc23   8ed0            MOV         SS,AX                                   
ram:f000:dc25   eb09            JMP         LAB_f000_dc30                           
                            LAB_f000_dc27:                ;XREF[2,0]:   f000:dc13,f000:dc1f
ram:f000:dc27   8bc3            MOV         AX,BX                                   
ram:f000:dc29   8ed0            MOV         SS,AX                                   
ram:f000:dc2b   ea5b00c0fd      JMPF        LAB_f000_dc5b                           
                            LAB_f000_dc30:                ;XREF[1,0]:   f000:dc25
ram:f000:dc30   8cc0            MOV         AX,ES                                   
ram:f000:dc32   8bd8            MOV         BX,AX                                   
ram:f000:dc34   b85555          MOV         AX,0x5555                               
ram:f000:dc37   8ec0            MOV         ES,AX                                   
ram:f000:dc39   8cc0            MOV         AX,ES                                   
ram:f000:dc3b   3d5555          CMP         AX,0x5555                               
ram:f000:dc3e   7512            JNZ         LAB_f000_dc52                           
ram:f000:dc40   b8aaaa          MOV         AX,0xaaaa                               
ram:f000:dc43   8ec0            MOV         ES,AX                                   
ram:f000:dc45   8cc0            MOV         AX,ES                                   
ram:f000:dc47   3daaaa          CMP         AX,0xaaaa                               
ram:f000:dc4a   7506            JNZ         LAB_f000_dc52                           
ram:f000:dc4c   8bc3            MOV         AX,BX                                   
ram:f000:dc4e   8ec0            MOV         ES,AX                                   
ram:f000:dc50   eb0e            JMP         LAB_f000_dc60                           
                            LAB_f000_dc52:                ;XREF[2,0]:   f000:dc3e,f000:dc4a
ram:f000:dc52   8bc3            MOV         AX,BX                                   
ram:f000:dc54   8ec0            MOV         ES,AX                                   
ram:f000:dc56   ea5b00c0fd      JMPF        LAB_f000_dc5b                           
                            LAB_f000_dc5b:                ;XREF[8,0]:   f000:db59,f000:db78,f000:db97,f000:dbb6
                                                          ;             f000:dbd5,f000:dc00,f000:dc2b,f000:dc56
ram:f000:dc5b   b80000          MOV         AX,0x0                                  
ram:f000:dc5e   eb03            JMP         LAB_f000_dc63                           
                            LAB_f000_dc60:                ;XREF[1,0]:   f000:dc50
ram:f000:dc60   b80100          MOV         AX,0x1                                  
                            LAB_f000_dc63:                ;XREF[1,0]:   f000:dc5e
ram:f000:dc63   ea7e00e0fd      JMPF        init_vectors::function_return           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 byte_swap_ax(undefined2 param_1)
          ;param_1       undefined2           4                      ;XREF[1,0]:   f000:dc6b
                                                          ;XREF[15,0]:  f000:816f,f000:8185,f000:8ded,f000:8e06
                                                          ;             f000:cf08,f000:cf21,f000:d203,f000:d282
                                                          ;             f000:d3f9,f000:d4af,f000:d52c,f000:d98b
                                                          ;             f000:da0f,f000:daa0,f000:daf2
ram:f000:dc68   55              PUSH        BP                                      
ram:f000:dc69   8bec            MOV         BP,SP                                   
ram:f000:dc6b   8b4606          MOV         AX,word ptr [BP + param_1+0x2]          
ram:f000:dc6e   86c4            XCHG        AH,AL                                   
ram:f000:dc70   5d              POP         BP                                      
ram:f000:dc71   cb              RET                                                  
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined2 byte_swap_ax_dx(undefined2 high_word, undefined2 low_word)
          ;high_word     undefined2           4                      ;XREF[1,0]:   f000:dc75
          ;low_word      undefined2           6                      ;XREF[1,0]:   f000:dc78
                                                          ;XREF[30,0]:  f000:8764,f000:87fe,f000:8bcd,f000:8e60
                                                          ;             f000:aeb9,f000:aeda,f000:aefb,f000:af1c
                                                          ;             f000:af3d,f000:af5e,f000:b052,f000:b06b
                                                          ;             f000:b58e,f000:b5a9,f000:b6cb,f000:b6e6
                                                          ;             f000:b8ac,f000:c581,f000:c5d3,f000:c5f4
                                                          ;             f000:c95d,f000:c97e,f000:c99f,f000:cc7a
                                                          ;             f000:cce1,f000:cde1,f000:d219,f000:d29f
                                                          ;             f000:d4c5,f000:da2c
ram:f000:dc72   55              PUSH        BP                                      
ram:f000:dc73   8bec            MOV         BP,SP                                   
ram:f000:dc75   8b5606          MOV         DX,word ptr [BP + high_word+0x2]        
ram:f000:dc78   8b4608          MOV         AX,word ptr [BP + low_word+0x2]         
ram:f000:dc7b   86c4            XCHG        AH,AL                                   
ram:f000:dc7d   86d6            XCHG        DH,DL                                   
ram:f000:dc7f   5d              POP         BP                                      
ram:f000:dc80   cb              RET                                                  
ram:f000:dc81   90              NOP                                                  
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void FUN_f000_dc82(uint param_1, uint param_2, uint param_3, int param_4)
          ;param_1       uint                 4                      ;XREF[1,0]:   f000:dc8e
          ;param_2       uint                 6                      ;XREF[1,0]:   f000:dc8b
          ;param_3       uint                 8                      ;XREF[1,0]:   f000:dca2
          ;param_4       int                  a                      ;XREF[1,0]:   f000:dca5
          ;local_6       undefined           -6                      ;XREF[1,0]:   f000:dcaa
ram:f000:dc82   83ec04          SUB         SP,0x4                                  
ram:f000:dc85   55              PUSH        BP                                      
ram:f000:dc86   83ec04          SUB         SP,0x4                                  
ram:f000:dc89   8bec            MOV         BP,SP                                   
ram:f000:dc8b   8b7610          MOV         SI,word ptr [BP + param_2+0xa]          
ram:f000:dc8e   8b5e0e          MOV         BX,word ptr [BP + param_1+0xa]          
ram:f000:dc91   31c0            XOR         AX,AX                                   
ram:f000:dc93   31d2            XOR         DX,DX                                   
ram:f000:dc95   b92000          MOV         CX,0x20                                 
                            LAB_f000_dc98:                ;XREF[1,0]:   f000:dca8
ram:f000:dc98   d1e0            SHL         AX,1                                    
ram:f000:dc9a   d1d2            RCL         DX,1                                    
ram:f000:dc9c   d1d3            RCL         BX,1                                    
ram:f000:dc9e   d1d6            RCL         SI,1                                    
ram:f000:dca0   7306            JNC         LAB_f000_dca8                           
ram:f000:dca2   034612          ADD         AX,word ptr [BP + param_3+0xa]          
ram:f000:dca5   135614          ADC         DX,word ptr [BP + param_4+0xa]          
                            LAB_f000_dca8:                ;XREF[1,0]:   f000:dca0
ram:f000:dca8   e2ee            LOOP        LAB_f000_dc98                           
ram:f000:dcaa   8d6604          LEA         SP,[BP + local_6+0xa]                   
ram:f000:dcad   5d              POP         BP                                      
ram:f000:dcae   83c404          ADD         SP,0x4                                  
ram:f000:dcb1   cb              RET                                                  
ram:f000:dcb2   83ec04          SUB         SP,0x4                                  
ram:f000:dcb5   55              PUSH        BP                                      
ram:f000:dcb6   83ec04          SUB         SP,0x4                                  
ram:f000:dcb9   8bec            MOV         BP,SP                                   
ram:f000:dcbb   c55e0e          LDS         BX,[BP + 0xe]                           
ram:f000:dcbe   8b7702          MOV         SI,word ptr [BX + 0x2]                  
ram:f000:dcc1   8b1f            MOV         BX,word ptr [BX]                        
ram:f000:dcc3   31c0            XOR         AX,AX                                   
ram:f000:dcc5   31d2            XOR         DX,DX                                   
ram:f000:dcc7   b92000          MOV         CX,0x20                                 
                            LAB_f000_dcca:                ;XREF[1,0]:   f000:dcda
ram:f000:dcca   d1e0            SHL         AX,1                                    
ram:f000:dccc   d1d2            RCL         DX,1                                    
ram:f000:dcce   d1d3            RCL         BX,1                                    
ram:f000:dcd0   d1d6            RCL         SI,1                                    
ram:f000:dcd2   7306            JNC         LAB_f000_dcda                           
ram:f000:dcd4   034612          ADD         AX,word ptr [BP + 0x12]                 
ram:f000:dcd7   135614          ADC         DX,word ptr [BP + 0x14]                 
                            LAB_f000_dcda:                ;XREF[1,0]:   f000:dcd2
ram:f000:dcda   e2ee            LOOP        LAB_f000_dcca                           
ram:f000:dcdc   c55e0e          LDS         BX,[BP + 0xe]                           
ram:f000:dcdf   895702          MOV         word ptr [BX + 0x2],DX                  
ram:f000:dce2   8907            MOV         word ptr [BX],AX                        
ram:f000:dce4   8d6604          LEA         SP,[BP + 0x4]                           
ram:f000:dce7   5d              POP         BP                                      
ram:f000:dce8   83c404          ADD         SP,0x4                                  
ram:f000:dceb   cb              RET                                                  
ram:f000:dcec   83ec04          SUB         SP,0x4                                  
ram:f000:dcef   55              PUSH        BP                                      
ram:f000:dcf0   83ec04          SUB         SP,0x4                                  
ram:f000:dcf3   8bec            MOV         BP,SP                                   
ram:f000:dcf5   83ec02          SUB         SP,0x2                                  
ram:f000:dcf8   c746fe6400      MOV         word ptr [BP + -0x2],0x64               
ram:f000:dcfd   eb11            JMP         LAB_f000_dd10                           
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;uint FUN_f000_dcff(uint param_1, uint param_2, uint param_3, uint param_4)
          ;param_1       uint                 4                      ;XREF[1,0]:   f000:dd10
          ;param_2       uint                 6                      ;XREF[2,0]:   f000:dd13,f000:dd6e
          ;param_3       uint                 8                      ;XREF[4,0]:   f000:dd32,f000:dd38,f000:dd55,f000:dd5e
          ;param_4       uint                 a                      ;XREF[5,0]:   f000:dd2b,f000:dd35,f000:dd3c,f000:dd4e,f000:dd61
          ;local_6       undefined           -6                      ;XREF[1,0]:   f000:dd8c
          ;local_c       undefined2          -c                      ;XREF[5,0]:   f000:dd0b,f000:dd1a,f000:dd40,f000:dd67,f000:dd7b
                                                          ;XREF[6,0]:   f000:9e4c,f000:afdf,f000:bc77,f000:bd30
                                                          ;             f000:c3b3,f000:c424
ram:f000:dcff   83ec04          SUB         SP,0x4                                  
ram:f000:dd02   55              PUSH        BP                                      
ram:f000:dd03   83ec04          SUB         SP,0x4                                  
ram:f000:dd06   8bec            MOV         BP,SP                                   
ram:f000:dd08   83ec02          SUB         SP,0x2                                  
ram:f000:dd0b   c746fe0000      MOV         word ptr [BP + local_c+0xa],0x0         
                            LAB_f000_dd10:                ;XREF[1,0]:   f000:dcfd
ram:f000:dd10   8b5e0e          MOV         BX,word ptr [BP + param_1+0xa]          
ram:f000:dd13   8b7610          MOV         SI,word ptr [BP + param_2+0xa]          
ram:f000:dd16   85f6            TEST        SI,SI                                   
ram:f000:dd18   790d            JNS         LAB_f000_dd27                           
ram:f000:dd1a   ff46fe          INC         word ptr [BP + local_c+0xa]             
ram:f000:dd1d   f7d3            NOT         BX                                      
ram:f000:dd1f   f7d6            NOT         SI                                      
ram:f000:dd21   83c301          ADD         BX,0x1                                  
ram:f000:dd24   83d600          ADC         SI,0x0                                  
                            LAB_f000_dd27:                ;XREF[1,0]:   f000:dd18
ram:f000:dd27   31c0            XOR         AX,AX                                   
ram:f000:dd29   31d2            XOR         DX,DX                                   
ram:f000:dd2b   f74614ffff      TEST        word ptr [BP + param_4+0xa],0xffff      
ram:f000:dd30   7d11            JGE         LAB_f000_dd43                           
ram:f000:dd32   f75612          NOT         word ptr [BP + param_3+0xa]             
ram:f000:dd35   f75614          NOT         word ptr [BP + param_4+0xa]             
ram:f000:dd38   83461201        ADD         word ptr [BP + param_3+0xa],0x1         
ram:f000:dd3c   83561400        ADC         word ptr [BP + param_4+0xa],0x0         
ram:f000:dd40   ff46fe          INC         word ptr [BP + local_c+0xa]             
                            LAB_f000_dd43:                ;XREF[1,0]:   f000:dd30
ram:f000:dd43   b92000          MOV         CX,0x20                                 
                            LAB_f000_dd46:                ;XREF[2,0]:   f000:dd5a,f000:dd65
ram:f000:dd46   d1e3            SHL         BX,1                                    
ram:f000:dd48   d1d6            RCL         SI,1                                    
ram:f000:dd4a   d1d0            RCL         AX,1                                    
ram:f000:dd4c   d1d2            RCL         DX,1                                    
ram:f000:dd4e   395614          CMP         word ptr [BP + param_4+0xa],DX          
ram:f000:dd51   7c0b            JL          LAB_f000_dd5e                           
ram:f000:dd53   7f05            JG          LAB_f000_dd5a                           
ram:f000:dd55   394612          CMP         word ptr [BP + param_3+0xa],AX          
ram:f000:dd58   7604            JBE         LAB_f000_dd5e                           
                            LAB_f000_dd5a:                ;XREF[1,0]:   f000:dd53
ram:f000:dd5a   e2ea            LOOP        LAB_f000_dd46                           
ram:f000:dd5c   eb09            JMP         LAB_f000_dd67                           
                            LAB_f000_dd5e:                ;XREF[2,0]:   f000:dd51,f000:dd58
ram:f000:dd5e   2b4612          SUB         AX,word ptr [BP + param_3+0xa]          
ram:f000:dd61   1b5614          SBB         DX,word ptr [BP + param_4+0xa]          
ram:f000:dd64   43              INC         BX                                      
ram:f000:dd65   e2df            LOOP        LAB_f000_dd46                           
                            LAB_f000_dd67:                ;XREF[1,0]:   f000:dd5c
ram:f000:dd67   f746fe6400      TEST        word ptr [BP + local_c+0xa],0x64        
ram:f000:dd6c   7409            JZ          LAB_f000_dd77                           
ram:f000:dd6e   f74610ffff      TEST        word ptr [BP + param_2+0xa],0xffff      
ram:f000:dd73   7917            JNS         LAB_f000_dd8c                           
ram:f000:dd75   eb0b            JMP         LAB_f000_dd82                           
                            LAB_f000_dd77:                ;XREF[1,0]:   f000:dd6c
ram:f000:dd77   8bd6            MOV         DX,SI                                   
ram:f000:dd79   8bc3            MOV         AX,BX                                   
ram:f000:dd7b   f746fe0100      TEST        word ptr [BP + local_c+0xa],0x1         
ram:f000:dd80   740a            JZ          LAB_f000_dd8c                           
                            LAB_f000_dd82:                ;XREF[1,0]:   f000:dd75
ram:f000:dd82   f7d0            NOT         AX                                      
ram:f000:dd84   f7d2            NOT         DX                                      
ram:f000:dd86   050100          ADD         AX,0x1                                  
ram:f000:dd89   83d200          ADC         DX,0x0                                  
                            LAB_f000_dd8c:                ;XREF[2,0]:   f000:dd73,f000:dd80
ram:f000:dd8c   8d6604          LEA         SP,[BP + local_6+0xa]                   
ram:f000:dd8f   5d              POP         BP                                      
ram:f000:dd90   83c404          ADD         SP,0x4                                  
ram:f000:dd93   cb              RET                                                  
ram:f000:dd94   83ec02          SUB         SP,0x2                                  
ram:f000:dd97   57              PUSH        DI                                      
ram:f000:dd98   55              PUSH        BP                                      
ram:f000:dd99   83ec04          SUB         SP,0x4                                  
ram:f000:dd9c   8bec            MOV         BP,SP                                   
ram:f000:dd9e   83ec02          SUB         SP,0x2                                  
ram:f000:dda1   c746fe6400      MOV         word ptr [BP + -0x2],0x64               
ram:f000:dda6   eb12            JMP         LAB_f000_ddba                           
ram:f000:dda8   83ec02          SUB         SP,0x2                                  
ram:f000:ddab   57              PUSH        DI                                      
ram:f000:ddac   55              PUSH        BP                                      
ram:f000:ddad   83ec04          SUB         SP,0x4                                  
ram:f000:ddb0   8bec            MOV         BP,SP                                   
ram:f000:ddb2   83ec02          SUB         SP,0x2                                  
ram:f000:ddb5   c746fe0000      MOV         word ptr [BP + -0x2],0x0                
                            LAB_f000_ddba:                ;XREF[1,0]:   f000:dda6
ram:f000:ddba   c55e0e          LDS         BX,[BP + 0xe]                           
ram:f000:ddbd   8b7702          MOV         SI,word ptr [BX + 0x2]                  
ram:f000:ddc0   8b1f            MOV         BX,word ptr [BX]                        
ram:f000:ddc2   85f6            TEST        SI,SI                                   
ram:f000:ddc4   790d            JNS         LAB_f000_ddd3                           
ram:f000:ddc6   ff46fe          INC         word ptr [BP + -0x2]                    
ram:f000:ddc9   f7d3            NOT         BX                                      
ram:f000:ddcb   f7d6            NOT         SI                                      
ram:f000:ddcd   83c301          ADD         BX,0x1                                  
ram:f000:ddd0   83d600          ADC         SI,0x0                                  
                            LAB_f000_ddd3:                ;XREF[1,0]:   f000:ddc4
ram:f000:ddd3   31c0            XOR         AX,AX                                   
ram:f000:ddd5   31d2            XOR         DX,DX                                   
ram:f000:ddd7   f74614ffff      TEST        word ptr [BP + 0x14],0xffff             
ram:f000:dddc   7d11            JGE         LAB_f000_ddef                           
ram:f000:ddde   f75612          NOT         word ptr [BP + 0x12]                    
ram:f000:dde1   f75614          NOT         word ptr [BP + 0x14]                    
ram:f000:dde4   83461201        ADD         word ptr [BP + 0x12],0x1                
ram:f000:dde8   83561400        ADC         word ptr [BP + 0x14],0x0                
ram:f000:ddec   ff46fe          INC         word ptr [BP + -0x2]                    
                            LAB_f000_ddef:                ;XREF[1,0]:   f000:dddc
ram:f000:ddef   b92000          MOV         CX,0x20                                 
                            LAB_f000_ddf2:                ;XREF[2,0]:   f000:de06,f000:de11
ram:f000:ddf2   d1e3            SHL         BX,1                                    
ram:f000:ddf4   d1d6            RCL         SI,1                                    
ram:f000:ddf6   d1d0            RCL         AX,1                                    
ram:f000:ddf8   d1d2            RCL         DX,1                                    
ram:f000:ddfa   395614          CMP         word ptr [BP + 0x14],DX                 
ram:f000:ddfd   7c0b            JL          LAB_f000_de0a                           
ram:f000:ddff   7f05            JG          LAB_f000_de06                           
ram:f000:de01   394612          CMP         word ptr [BP + 0x12],AX                 
ram:f000:de04   7604            JBE         LAB_f000_de0a                           
                            LAB_f000_de06:                ;XREF[1,0]:   f000:ddff
ram:f000:de06   e2ea            LOOP        LAB_f000_ddf2                           
ram:f000:de08   eb09            JMP         LAB_f000_de13                           
                            LAB_f000_de0a:                ;XREF[2,0]:   f000:ddfd,f000:de04
ram:f000:de0a   2b4612          SUB         AX,word ptr [BP + 0x12]                 
ram:f000:de0d   1b5614          SBB         DX,word ptr [BP + 0x14]                 
ram:f000:de10   43              INC         BX                                      
ram:f000:de11   e2df            LOOP        LAB_f000_ddf2                           
                            LAB_f000_de13:                ;XREF[1,0]:   f000:de08
ram:f000:de13   c57e0e          LDS         DI,[BP + 0xe]                           
ram:f000:de16   f746fe6400      TEST        word ptr [BP + -0x2],0x64               
ram:f000:de1b   7408            JZ          LAB_f000_de25                           
ram:f000:de1d   f705ffff        TEST        word ptr [DI],0xffff                    
ram:f000:de21   7917            JNS         LAB_f000_de3a                           
ram:f000:de23   eb0b            JMP         LAB_f000_de30                           
                            LAB_f000_de25:                ;XREF[1,0]:   f000:de1b
ram:f000:de25   8bd6            MOV         DX,SI                                   
ram:f000:de27   8bc3            MOV         AX,BX                                   
ram:f000:de29   f746fe0100      TEST        word ptr [BP + -0x2],0x1                
ram:f000:de2e   740a            JZ          LAB_f000_de3a                           
                            LAB_f000_de30:                ;XREF[1,0]:   f000:de23
ram:f000:de30   f7d0            NOT         AX                                      
ram:f000:de32   f7d2            NOT         DX                                      
ram:f000:de34   050100          ADD         AX,0x1                                  
ram:f000:de37   83d200          ADC         DX,0x0                                  
                            LAB_f000_de3a:                ;XREF[2,0]:   f000:de21,f000:de2e
ram:f000:de3a   895502          MOV         word ptr [DI + 0x2],DX                  
ram:f000:de3d   8905            MOV         word ptr [DI],AX                        
ram:f000:de3f   8d6604          LEA         SP,[BP + 0x4]                           
ram:f000:de42   5d              POP         BP                                      
ram:f000:de43   5f              POP         DI                                      
ram:f000:de44   83c402          ADD         SP,0x2                                  
ram:f000:de47   cb              RET                                                  
                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;undefined function_entry(void)
                                                          ;XREF[80,0]:  f000:8000,f000:81ec,f000:8472,f000:8559
                                                          ;             f000:85b7,f000:869d,f000:86b0,f000:88e0
                                                          ;             f000:8a78,f000:8aeb,f000:8b5e,f000:8c2c
                                                          ;             f000:8e53,f000:8eac,f000:8ef9,f000:8f5f
                                                          ;             f000:8fb7,f000:8fc9,f000:8fd7,f000:8fff
                                                          ;             f000:904e,f000:9066,f000:90a7,f000:90e4
                                                          ;             f000:913c,f000:917a,f000:91ae,f000:94a0
                                                          ;             f000:9719,f000:9844,f000:9a49,f000:9b37
                                                          ;             f000:9c1b,f000:9db4,f000:9e19,f000:9eec
                                                          ;             f000:a535,f000:a57a,f000:a680,f000:a6ea
                                                          ;             f000:ae43,f000:afc8,f000:b0b9,f000:b382
                                                          ;             f000:b4a5,f000:b5e2,f000:b71f,f000:b8ef
                                                          ;             f000:b9ce,f000:bab9,f000:bbaf,f000:bee0
                                                          ;             f000:c2ee,f000:c49d,f000:c4ea,f000:c538
                                                          ;             f000:c88a,f000:c8f9,f000:c9b8,f000:c9e0
                                                          ;             f000:ca08,f000:cb13,f000:cc44,f000:ccab
                                                          ;             f000:cd12,f000:cdd4,f000:ce31,f000:ce87
                                                          ;             f000:cedd,f000:d1c4,f000:d230,f000:d2ea
                                                          ;             f000:d322,f000:d390,f000:d56e,f000:d592
                                                          ;             f000:d720,f000:d922,f000:d94c,f000:db0c
ram:f000:de48   5e              POP         SI                                      
ram:f000:de49   1f              POP         DS                                      
ram:f000:de4a   83ec02          SUB         SP,0x2                                  
ram:f000:de4d   57              PUSH        DI                                      
ram:f000:de4e   55              PUSH        BP                                      
ram:f000:de4f   8bdc            MOV         BX,SP                                   
ram:f000:de51   83eb04          SUB         BX,0x4                                  
ram:f000:de54   8beb            MOV         BP,BX                                   
ram:f000:de56   8bcb            MOV         CX,BX                                   
ram:f000:de58   d1eb            SHR         BX,1                                    
ram:f000:de5a   d1eb            SHR         BX,1                                    
ram:f000:de5c   d1eb            SHR         BX,1                                    
ram:f000:de5e   d1eb            SHR         BX,1                                    
ram:f000:de60   8cd7            MOV         DI,SS                                   
ram:f000:de62   03df            ADD         BX,DI                                   
ram:f000:de64   8aeb            MOV         CH,BL                                   
ram:f000:de66   80e3f0          AND         BL,0xf0                                 
ram:f000:de69   53              PUSH        BX                                      
ram:f000:de6a   d0e5            SHL         CH,1                                    
ram:f000:de6c   d0e5            SHL         CH,1                                    
ram:f000:de6e   d0e5            SHL         CH,1                                    
ram:f000:de70   d0e5            SHL         CH,1                                    
ram:f000:de72   81e10ff0        AND         CX,0xf00f                               
ram:f000:de76   0acd            OR          CL,CH                                   
ram:f000:de78   30ed            XOR         CH,CH                                   
ram:f000:de7a   51              PUSH        CX                                      
ram:f000:de7b   1e              PUSH        DS                                      
ram:f000:de7c   56              PUSH        SI                                      
ram:f000:de7d   cb              RET                                                  
                            function_return:              ;XREF[80,0]:  f000:81e7,f000:846d,f000:8554,f000:85b2
                                                          ;             f000:8698,f000:86ab,f000:8857,f000:8a73
                                                          ;             f000:8ae6,f000:8b59,f000:8c27,f000:8e4e
                                                          ;             f000:8ea7,f000:8ef4,f000:8f5a,f000:8fb2
                                                          ;             f000:8fc4,f000:8fd2,f000:8ffa,f000:9048
                                                          ;             f000:9061,f000:90a2,f000:90df,f000:9137
                                                          ;             f000:9175,f000:91a9,f000:949b,f000:9714
                                                          ;             f000:983f,f000:9a44,f000:9b32,f000:9c16
                                                          ;             f000:9daf,f000:9e14,f000:9ee7,f000:a530
                                                          ;             f000:a575,f000:a67b,f000:a6e5,f000:ae3e
                                                          ;             f000:afc3,f000:b0b4,f000:b37d,f000:b4a0
                                                          ;             f000:b5dd,f000:b71a,f000:b8ea,f000:b9c9
                                                          ;             f000:bab4,f000:bbaa,f000:bedb,f000:c2e9
                                                          ;             f000:c498,f000:c4e5,f000:c532,f000:c885
                                                          ;             f000:c8f4,f000:c9b3,f000:c9db,f000:ca03
                                                          ;             f000:cb0e,f000:cc3f,f000:cca6,f000:cd0d
                                                          ;             f000:cdcf,f000:ce2c,f000:ce82,f000:ced8
                                                          ;             f000:d15e,f000:d22a,f000:d2e4,f000:d31d
                                                          ;             f000:d38b,f000:d568,f000:d584,f000:d71a
                                                          ;             f000:d8e0,f000:d946,f000:db07,f000:dc63
ram:f000:de7e   8be5            MOV         SP,BP                                   
ram:f000:de80   83c404          ADD         SP,0x4                                  
ram:f000:de83   5d              POP         BP                                      
ram:f000:de84   5f              POP         DI                                      
ram:f000:de85   83c402          ADD         SP,0x2                                  
ram:f000:de88   cb              RET                                                  
ram:f000:de89   90              NOP                                                  
                            DAT_f000_de8a:                ;XREF[1,0]:   f000:8ca7
ram:f000:de8a   01              undefined1  01h                                     
                            DAT_f000_de8b:                ;XREF[1,0]:   f000:8c95
ram:f000:de8b   00              undefined1  00h                                     
ram:f000:de8c   0101            ADD         word ptr [BX + DI],AX                   
ram:f000:de8e   0102            ADD         word ptr [BP + SI],AX                   
ram:f000:de90   0103            ADD         word ptr [BP + DI],AX                   
ram:f000:de92   0200            ADD         AL,byte ptr [BX + SI]                   
ram:f000:de94   0201            ADD         AL,byte ptr [BX + DI]                   
ram:f000:de96   0202            ADD         AL,byte ptr [BP + SI]                   
ram:f000:de98   0203            ADD         AL,byte ptr [BP + DI]                   
ram:f000:de9a   0300            ADD         AX,word ptr [BX + SI]                   
ram:f000:de9c   0301            ADD         AX,word ptr [BX + DI]                   
ram:f000:de9e   0400            ADD         AL,0x0                                  
ram:f000:dea0   0401            ADD         AL,0x1                                  
ram:f000:dea2   050006          ADD         AX,0x600                                
ram:f000:dea5   0007            ADD         byte ptr [BX],AL                        
ram:f000:dea7   0000            ADD         byte ptr [BX + SI],AL                   
ram:f000:dea9   00ae00e0        ADD         byte ptr [BP + 0xe000],CH               
ram:f000:dead   fd              STD                                                  
ram:f000:deae   402823295...    ds          "@(#)SCSI ROM VERSION 08/28/86 11:18:...

                            ;************************************************************************************************
                            ;*                                           FUNCTION                                           *
                            ;************************************************************************************************
                            ;void RESET_INIT(void)
                                                          ;XREF[1,0]:   Entry Point
ram:f000:fff0   ea0000f0ff      JMPF        power_on_reset                          ;void power_on_reset(void)
ram:f000:fff5   90              NOP                                                  
