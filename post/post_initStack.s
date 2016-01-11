	IMPORT	StackSvc
	IMPORT	StackIrq
	IMPORT	StackFiq
	IMPORT	StackAbt
	IMPORT	StackUnd
	IMPORT	StackUsr
	

	EXPORT init_Stack

 	AREA init_Stack, CODE, READONLY
	
        
	;Set IRQ mode(IRQ)
 	MSR     CPSR_c, #0xd2
	LDR     SP, =StackIrq
        
	;Set FIQ mode(FIQ)
	MSR     CPSR_c, #0xd1
	LDR     SP, =StackFiq
        
	;Set Abort mode(ABT)
	MSR     CPSR_c, #0xd7
	LDR     SP, =StackAbt
        
	;Set Undefine mode(UND)
	MSR     CPSR_c, #0xdb
	LDR     SP, =StackUnd
        
	;Set User/System mode(USR)
	MSR     CPSR_c, #0xdf
	LDR     SP, =StackUsr
        
        
	;Set Supervisor mode(SVC)
	MSR     CPSR_c, #0xd3
	LDR     SP, =StackSvc
        
        
	mov pc,r14

	END
