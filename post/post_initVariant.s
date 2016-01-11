	IMPORT	buttonStatus
	IMPORT	ledStatusBuffer
	IMPORT	pwmEmulatorStatus



	EXPORT	post_initVariant

	AREA post_initVariant ,CODE ,READONLY

	ldr r11,=buttonStatus
	mov r0,#0x0
	str r0,[r11]

	ldr r11,=ledStatusBuffer
	mov r0,#0x0
	str r0,[r11]

	ldr r11,=pwmEmulatorStatus
	mov r0,#0x0
	str r0,[r11]




	mov pc,r14

	END