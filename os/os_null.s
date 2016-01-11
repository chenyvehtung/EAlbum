	IMPORT	osStack
	IMPORT	osScanInterval
	IMPORT	ledShareInterval
	IMPORT	ledStatusBuffer	
	IMPORT	led_dummyAddress
	IMPORT	led_board

	IMPORT	ledStatusSetDelay
	IMPORT	led_statusSet
	IMPORT	button_statusFetch
	IMPORT	switch_dummyAddress
	IMPORT	buttonScanDelay
	IMPORT	buttonStatus
         IMPORT   ledStatusBuffer
	IMPORT 	led_code

	IMPORT	gpio_GPLR0

	IMPORT	ledcode

	IMPORT	Sram_Addr



	EXPORT	dummyOs

	AREA dummyOs ,CODE ,READONLY


	ldr r13,=osStack

	ldr r11,=buttonStatus

	LDR R12,=0x10400000	

	ldr r10,=led_dummyAddress
	ldr r9,=led_board
	ldr r8,=Sram_Addr
	ldr r7,=ledcode
	mov  r5,#0x0
	

	
pendingMode

	ldr r1,=ledShareInterval
pendingLoop
	sub r1,r1,#0x1
	cmp r1,#0x0
	bne pendingLoop

	mov r14,pc
	ldr pc,=button_statusFetch
	

	ldr r4,[r11]


	cmp r4,#0xff
	beq nokey
keyed

	mov r5,r4
	mvn r5,r5


nokey
	strh r5,[r10]



	MOV          R0,#0xa000000		;turn on the light of board
	ldr 	R2,=0xffffce00
	STRH          R2,[R0,#0]

	str r4,[r7]
	mov r14,pc
	ldr pc,=led_code
	

	ldr  r1,[r7]
	and r1,r1,#0xff
	str r1,[r12]



	ldr r1,=ledShareInterval
pendingLoop1
	sub r1,r1,#0x1
	cmp r1,#0x0
	bne pendingLoop1

	MOV          R0,#0xa000000		;turn off the light of board
	ldr 	R2,=0xfffffeff
	STRH          R2,[R0,#0]
	strh r2,[r10]
	
	ldr  r1,=0xffffffff
	str r1,[r12]
	


	b pendingMode

	nop
	nop
	END