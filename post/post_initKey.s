
   EXPORT post_initKey


   AREA post_initKey, CODE, READONLY
   nop
   nop
	
	ldr r1,=0x41500000
	
	;KPC
	ldr r0,=0x7FBFF9C3	;0x2FAFF1C2		;≤È—Ø∑Ω Ω    £®0x2FAFF9C3:interrupt£©	
	str r0,[r1,#0x0]
	
	;KPDK
;	ldr r0,=0x1
;	str r0,[r1,#0x8]

;	;KPREC
;	ldr r0,=0x1
;	str r0,[r1,#0x10]

	;KPMK
;	ldr r0,=0x1
;	str r0,[r1,#0x18]


	;KPAS
;	ldr r0,=0x1
;	str r0,[r1,#0x20]

;	ldr r0,=0x1
;	str r0,[r1,#0x0]
;KPKDI
	ldr r0,=0x707
	str r0,[r1,#0x48]




   mov pc,r14

   END








  