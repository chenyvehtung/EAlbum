
   	EXPORT led_code
	IMPORT ledcode
	
   AREA led_code, CODE, READONLY
	stmfd r13!,{r4-r6,r10,r11,r14}
   nop
   nop
	



	ldr r11,=ledcode
	ldr r1,[r11]
	and r1,r1,#0xff
	cmp r1,#0xff
	beq code_end
	sub r2,r1,#9
	bcs code_end


	mov r0,#4
	mul r2,r1,r0

	add r15,r15,r2
	
jumptab
	nop
	b value0
	b value1
	b value2
	b value3
	b value4
	b value5
	b value6
	b value7
	b value8
	b value9

value0
	ldr r0,=0x3f

	b code_end


value1
	ldr r0,=0x6

	b code_end

value2
	ldr r0,=0x5b

	b code_end

value3
	ldr r0,=0x4f

	b code_end

value4
	ldr r0,=0x66

	b code_end

value5
	ldr r0,=0x6d

	b code_end
value6
	ldr r0,=0x7d

	b code_end
value7
	ldr r0,=0x07

	b code_end
value8
	ldr r0,=0x7f

	b code_end
value9
	ldr r0,=0x6f


code_end
	mvn r0,r0
	str r0,[r11]

	ldmfd r13!,{r4-r6,r10,r11,pc}

   END








  