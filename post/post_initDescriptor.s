   IMPORT  desc_word_0
   IMPORT  desc_word_1
   IMPORT  desc_word_2
   IMPORT  desc_word_3
   IMPORT  init_word_0
   IMPORT  init_word_1 
   IMPORT  init_word_2
   IMPORT  init_word_3

   IMPORT  LCCR0
   IMPORT  LCCR1
   IMPORT  LCCR2
   IMPORT  LCCR3
   IMPORT  FBR0 
   IMPORT  FBR1
   IMPORT  LCSR
   IMPORT  LIIDR
   IMPORT  FDADR0
   IMPORT  FDADR1
   IMPORT  init_LCCR0
   IMPORT  init_LCCR1
   IMPORT  init_LCCR2 
   IMPORT  init_LCCR3 
   IMPORT   init_FBR0
   IMPORT   init_FBR1
   IMPORT   init_FDADR0






   EXPORT  post_LcdController
   AREA  post_LcdController,CODE,READONLY

   ldr r11, =desc_word_0
   ldr r1,  =init_word_0
   str r1, [r11]

   nop
   nop
  
   ldr r11, =desc_word_1
   ldr r1,  =init_word_1
   str r1, [r11]

   nop
   nop
 
   ldr r11, =desc_word_2
   ldr r1,  =init_word_2
   str r1, [r11]

   nop
   nop

   ldr r11, =desc_word_3
   ldr r1,  =init_word_3
   str r1, [r11]

   nop
   nop
   nop
   nop
  
   ldr r11, =LCCR1
   ldr r1, =init_LCCR1
   str r1, [r11]

   nop
   nop

   ldr r11, =LCCR2
   ldr r1, =init_LCCR2
   str r1, [r11]

   nop
   nop

   ldr r11, =LCCR3
   ldr r1, =init_LCCR3
   str r1, [r11]

   nop
   nop
 
   ldr r11,=FDADR0
   ldr r1, =init_FDADR0
   str r1, [r11]

   nop
   nop
  
   ldr r11, =LCCR0
   ldr r1, =init_LCCR0
   str r1, [r11]
   nop
   nop

   ldr r11,=LCCR0
   ldr r1, [r11]
   orr r1,r1,#0x01
   str r1,[r11]

   mov pc,r14




   END 