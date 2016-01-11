
	IMPORT	buttonStatus

	EXPORT	button_statusFetch

	AREA button_statusFetch ,CODE ,READONLY

	stmfd r13!,{r0-r12,r14}
	ldr r10,=buttonStatus

	ldr r11,=0x41500000
	ldr r0,[r11]
	orr r0,r0,#0x40000000
	str r0,[r11]
	b tt
testloop
	nop
tt

	ldr r11,=0x41500020
	ldr r0,[r11]
	and r0,r0,#0x80000000
;	and r0,r0,#0x400000
	cmp r0,#0x0
	bne testloop



	ldr r11,=0x41500020	
	ldr r0,[r11]

	CMP R0,#0xff
	beq NOKEY
	mov r1,r0,lsr#4
	and r1,r1,#0xf
	and r0,r0,#0xf
	MOV R2,#3
	mul r3,r1,R2
	add r0,r0,r3


NOKEY
	str r0,[r10]
    

statusGetEnd

	ldmfd r13!,{r0-r12,pc}

	END


	