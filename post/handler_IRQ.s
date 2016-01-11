	IMPORT	IRQ_Function
	IMPORT	ICMR
	IMPORT	OSSR
	IMPORT  KPC
	
	EXPORT	IRQ_Handler
	

	AREA IRQ_Handler,CODE,READONLY
	;****************************
	SUB	LR,	LR,	#0x4
	STMFD SP!,{R0-R12,LR}
	
	MRS	R4,	SPSR
	
	STMFD SP!,{R4}
	
	BL	IRQ_Function
	
	LDMFD	SP!,{R4}
	
	;************************
	;clean the timer flag
	;************************
	LDR	R3,=OSSR
	MOV R0,#0xf
	STR R0,[R3]
	
	;*************************
	;enable the timer interrupt
	;**************************
	LDR R0,=ICMR
	MOV R1,#0x3c000000
	STR R1,[R0]
	
	;*************************
	;enable the keypad
	;*************************
	LDR R0,=KPC
	LDR R1,[R0]
	ORR R1,R1,#0x02
	STR R1,[R0]
	

	MSR SPSR_cxsf, R4
	
	LDMFD SP!,{R0-R12,PC}^
	;*******************************	


	END
	
	
	
