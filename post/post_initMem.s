   
   IMPORT  MDCNFG
   IMPORT  MDREFR  
   IMPORT  MSC0
   IMPORT  MSC1
   IMPORT  MSC2 
   IMPORT  MECR 
   IMPORT  SXCNFG
   IMPORT  SXMRS
   IMPORT  MDMRS
   IMPORT  BOOT_DEF
   
   IMPORT  init_MDCNFG 
   IMPORT  init_MDREFR  
   IMPORT  init_MSC0
   IMPORT  init_MSC1 
   IMPORT  init_MSC2 
   IMPORT  init_MECR  
   IMPORT  init_SXCNFG 
   IMPORT  init_SXMRS
   IMPORT  init_MDMRS 
   IMPORT  init_BOOT_DEF 


   EXPORT init_Memory


   AREA init_Memory, CODE, READONLY
 
   ldr r11, =MDCNFG
   ldr r1,  =init_MDCNFG
   str r1, [r11]

   nop
   nop

   ldr  r11, =MDREFR
   ldr  r1,  =init_MDREFR
   str  r1,[r11]

   nop
   nop
  
   ldr  r11, =MSC0
   ldr  r1, =init_MSC0
   str  r1, [r11]

   nop
   nop
 
   ldr  r11, =MSC1
   ldr  r1, =init_MSC1
   str  r1, [r11]

   nop
   nop

   ldr  r11, =MSC2
   ldr  r1, =init_MSC2
   str  r1, [r11]

   nop
   nop

   ldr r11, =MECR
   ldr r1, =init_MECR
   str r1, [r11]
   
   nop
   nop

   ldr r11, =SXCNFG
   ldr r1, =init_SXCNFG
   str r1, [r11]
   
   nop
   nop

   ldr r11, =SXMRS
   ldr r1, =init_SXMRS
   str r1, [r11]
 
   nop
   nop

   ldr r11, =MDMRS
   ldr r1,  =init_MDMRS
   str r1, [r11]

   nop
   nop

   ldr r11, =BOOT_DEF
   ldr r1, =init_BOOT_DEF
   str r1,[r11]

   nop
   nop

   mov pc,r14

   END








  