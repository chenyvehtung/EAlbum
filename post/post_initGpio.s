
	EXPORT	post_initGpio

	AREA post_initGpio ,CODE ,READONLY


	ldr r1,=0x40e00000
	
;GPSR0
	MOV          R0,#0x3000         ;GPIO<13:12>
	STR          R0,[R1,#0x18]
	
;GPCR0
	MOV          R0,#0x800         ;GPIO<11>
	STR          R0,[R1,#0x24]

;GAFR0_L//////////////////////////////////////////////////
	MOV          R0,#0x80000000         ;GPIO<15>:F2:nCS1
	STR          R0,[R1,#0x54]

;GAFR0_U
	ldr          R0,=0x10		;0xa5000010  
	STR          R0,[R1,#0x58]

;GPDR0/////////////////////////////////////////////////
	ldr          R0,=0xc1a08000        ;GPIO<15>:nCS1
	STR          R0,[R1,#0xc]

;GPSR1
	MOV          R0,#0
	STR          R0,[R1,#0x1c]

;GPCR1
	MOV          R0,#0
	STR          R0,[R1,#0x28]

;GAFR1_L
	LDR          R0,=0xc9c		;0xa9558    
	STR          R0,[R1,#0x5c]

;GAFR1_U
	LDR          R0,=0xca0		;0xaaa590aa  
	STR          R0,[R1,#0x60]

;GPDR1
	LDR          R0,=0xca4		;0xfccf0382   
	STR          R0,[R1,#0x10]

;GPSR2
	MOV          R0,#0x10000
	STR          R0,[R1,#0x20]

;GPCR2
	MOV          R0,#0
	STR          R0,[R1,#0x2c]

;GAFR2_L////////////////////////////////////
	ldr          R0,=0xa0000000	;0xaaaaaaaa ;GPIO<79:78>:nCS<3:2>
	STR          R0,[R1,#0x64]

;GAFR2_U/////////////////////////////////////////
	ldr          R0,=0x50000400		;0x50090402 ;GPIO<95:94,80>:KP_DKIN<1>,KP_DKIN<2>,nCS4
	STR          R0,[R1,#0x68]

;GPDR2///////////////////////////////////////////
	ldr          R0,=0x0221ffff		;GPIO<80:78>:nCS<4:2>
	STR          R0,[R1,#0x14]

;	LDR          R0,=0xca8
;	STR          R0,[R1,#0x68]

;GPSR3
	MOV          R0,#0x20000
	STR          R0,[R1,#0x118]

;GPCR3
	MOV          R0,#0
	STR          R0,[R1,#0x124]

;GAFR3_L//////////////////////////////////////////////
	ldr          R0,=0x020a9550		;GPIO<108,105:98>
	STR          R0,[R1,#0x6c]

;GAFR3_U
	ldr          R0,=0x1408
	STR          R0,[R1,#0x70]

;GPDR3//////////////////////////////////////////////////
	ldr          R0,=0x21380		;GPIO<108,105:103>
	STR          R0,[R1,#0x10c]



;config twice:
;GAFR0_U
	ldr          R0,=0xa5000010	;0x0x10
	STR          R0,[R1,#0x58]

;GAFR1_L
	LDR          R0,=0xa9558		;0xc9c
	STR          R0,[R1,#0x5c]

;GAFR1_U
	LDR          R0,=0xaaa590aa	;0xca0
	STR          R0,[R1,#0x60]

;GPDR1
	LDR          R0,=0xfccf0382	;0xca4
	STR          R0,[R1,#0x10]

;GAFR2_L///////////////////////////////////////////////////
	ldr          R0,=0xa0000000		;GPIO<79:78>:nCS<3:2>	
	STR          R0,[R1,#0x64]

;GAFR2_U///////////////////////////////////////////////////////////////////////
	ldr          R0,=0x50090402		;GPIO<95:94,80>:KP_DKIN<1>,KP_DKIN<2>,nCS4    
	STR          R0,[R1,#0x68]







	mov pc,r14

	END