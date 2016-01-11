	IMPORT	IRQ_Function
	;IMPORT	ICMR
	
	
	EXPORT	IRQ_Handler
	

	AREA IRQ_Handler,CODE,READONLY
	;****************************
	SUB	LR,	LR,	#0x4
	STMFD SP!,{R0-R12,LR}
	
	MRS	R4,	SPSR
	
	STMFD SP!,{R4}
	
	;LDR R0,=ICMR
	;LDR R1,[R0]
	;BIC R1,R1,#0x01	;Clean the kpdk
	;BIC R1,R1,#800		;Clean the kpmk
	;STR R1,[R0]
	
	BL	IRQ_Function
	LDMFD	SP!,{R4}
	
	;LDR R0,=ICMR
	;LDR R1,[R0]
	;ORR R1,R1,#0x800
	;ORR R1,R1,#0x01
	;STR R1,[R0]
	
	LDR	R0,=0x41500000
	LDR R1,[R0]

	
	MSR SPSR_cxsf, R4
	
	LDMFD SP!,{R0-R12,PC}^
	;*******************************	


	END