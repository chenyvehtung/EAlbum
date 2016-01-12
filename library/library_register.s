	EXPORT	osTimer_OSMR0
	EXPORT	osTimer_OSMR1
	EXPORT	osTimer_OSMR2
	EXPORT	osTimer_OSMR3
	EXPORT	osTimer_OSCR
	EXPORT	osTimer_OIER
	EXPORT	osTimer_OSSR	
	EXPORT	int_ICPR
	EXPORT	gpio_GAFR2L
	EXPORT	gpio_GAFR2U
	EXPORT	gpio_GPDR0
	EXPORT	gpio_GPDR2
	EXPORT	gpio_GPSR2
	EXPORT	gpio_GPCR2
	EXPORT	gpio_GPSR0
	EXPORT	gpio_GPCR0


	EXPORT	gpio_GPLR0


	EXPORT	rtc_RTSR
	EXPORT	pwm_PSSR


         EXPORT  MDCNFG
         EXPORT  MDREFR  
         EXPORT  MSC0
         EXPORT  MSC1
         EXPORT  MSC2 
         EXPORT  MECR 
         EXPORT  SXCNFG
         EXPORT  SXMRS
         EXPORT  MDMRS
         EXPORT  BOOT_DEF
         EXPORT  init_MDCNFG 
         EXPORT  init_MDREFR  
         EXPORT  init_MSC0
         EXPORT  init_MSC1 
         EXPORT  init_MSC2 
         EXPORT  init_MECR  
         EXPORT  init_SXCNFG 
         EXPORT  init_SXMRS
         EXPORT  init_MDMRS 
         EXPORT  init_BOOT_DEF 
	EXPORT	initGpio_GPDR2
	EXPORT	initGpio_GPDR0
	EXPORT	initGpio_GAFR2L
	EXPORT	initGpio_GAFR2U
	EXPORT	switch_dummyAddress
	EXPORT	led_dummyAddress
	EXPORT	Sram_Addr


	EXPORT	led_board

	EXPORT	osStack
	
	
	EXPORT	ICMR
	EXPORT	init_ICMR
	
	EXPORT  gpio_GPDR1
         EXPORT  gpio_GAFR1_U
         EXPORT  gpio_GAFR2_L
         EXPORT  init_GPDR1
         EXPORT  init_GPDR2
         EXPORT  init_GAFR1_U
         EXPORT  init_GAFR2_L

         EXPORT  desc_word_0
         EXPORT  desc_word_1
         EXPORT  desc_word_2 
         EXPORT  desc_word_3 
         EXPORT  init_word_0
         EXPORT  init_word_1 
         EXPORT  init_word_2  
         EXPORT  init_word_3


         EXPORT  LCCR0
         EXPORT  LCCR1
         EXPORT  LCCR2
         EXPORT  LCCR3
         EXPORT  FBR0 
         EXPORT  FBR1
         EXPORT  LCSR
         EXPORT  LIIDR
         EXPORT  FDADR0
         EXPORT  FDADR1
         EXPORT  init_LCCR0
         EXPORT  init_LCCR1
         EXPORT  init_LCCR2 
         EXPORT  init_LCCR3 
         EXPORT   init_FBR0
         EXPORT   init_FBR1
         EXPORT   init_FDADR0

         EXPORT  backlight_cs
         EXPORT  lcdlight 

    ;For timer
	EXPORT	OSSR
	EXPORT	KPC		
	

	AREA library_register ,DATA ,READONLY

osTimer_OSMR0	EQU	0x40a00000
osTimer_OSMR1	EQU	0x40a00004
osTimer_OSMR2	EQU	0x40a00008
osTimer_OSMR3	EQU	0x40a0000c
osTimer_OSCR	EQU	0x40a00010
osTimer_OSSR	EQU	0x40a00014
osTimer_OIER	EQU	0x40a0001C
int_ICPR		EQU	0x40d00010
gpio_GAFR2L	EQU	0x40e00064
gpio_GAFR2U	EQU	0x40e00068
gpio_GPDR0	EQU	0x40e0000c
gpio_GPDR2	EQU	0x40e00014
gpio_GPSR2	EQU	0x40e00020
gpio_GPCR2	EQU	0x40e0002c
gpio_GPLR0	EQU	0x40e00000

gpio_GPSR0	EQU	0x40e00018
gpio_GPCR0	EQU	0x40e00024

rtc_RTSR		EQU	0x40900008
pwm_PSSR		EQU	0x40f00004

MDCNFG            EQU      0x48000000
MDREFR            EQU      0x48000004
MSC0              EQU      0x48000008
MSC1              EQU      0x4800000c
MSC2              EQU      0x48000010
MECR              EQU      0x48000014
SXCNFG            EQU      0x4800001C
SXMRS             EQU      0x48000024
MDMRS             EQU      0x48000040
BOOT_DEF          EQU      0x48000044

init_MDCNFG       EQU      0x02000ac9
init_MDREFR       EQU      0x0011e018
init_MSC0         EQU      0x95c095c0
init_MSC1         EQU      0xb884a691
init_MSC2         EQU      0x7ff4b88c
init_MECR         EQU      0x1
init_SXCNFG       EQU      0x0;6011
init_SXMRS        EQU      0x0
init_MDMRS        EQU      0x320032
init_BOOT_DEF     EQU      0x00000008


initGpio_GPDR0	EQU	0x607800
initGpio_GPDR2	EQU	0x1c000
initGpio_GAFR2L	EQU	0xa0000000
initGpio_GAFR2U	EQU	0x2

switch_dummyAddress	EQU	0x10200000
led_dummyAddress		EQU	0x10300000
led_board		EQU	0x10300000

Sram_Addr		EQU	0x0c500000
;Sram_Addr		EQU	0xa0001000

osStack			EQU	0xa0200000



;Interrupt Controller
ICMR             EQU       0x40d00004
init_ICMR        EQU       0x3c400010 ;0x00000010


;GPIO configuration
gpio_GPDR1        EQU      0x40e00010
gpio_GAFR1_U      EQU      0x40e00060
gpio_GAFR2_L      EQU      0x40e00064

init_GPDR1        EQU      0xfc000000
init_GPDR2        EQU      0x7fff
init_GAFR1_U      EQU      0xaaa00000
init_GAFR2_L      EQU      0x2aaaaaaa


;Frame Descriptor
desc_word_0       EQU      0xa0300000
desc_word_1       EQU      0xa0300004
desc_word_2       EQU      0xa0300008
desc_word_3       EQU      0xa030000c

init_word_0       EQU      0xa0300000
init_word_1       EQU      0xa0500000
init_word_2       EQU      0x0
init_word_3       EQU      0x00096000


;LCD Controller
LCCR0             EQU      0x44000000  
LCCR1             EQU      0x44000004
LCCR2             EQU      0x44000008
LCCR3             EQU      0x4400000C

FBR0              EQU      0x44000020
FBR1              EQU      0x44000024
LCSR              EQU      0x44000038
LIIDR             EQU      0x4400003C
FDADR0            EQU      0x44000200
FDADR1            EQU      0x44000210

init_LCCR0        EQU      0x7b008f9;3b008f8;003008f8
init_LCCR1        EQU      0x6481067f;530fee7f
init_LCCR2        EQU      0x220001df;210a05df
init_LCCR3        EQU      0x4400006;0440ff07
init_FBR0         EQU      0x0
init_FBR1         EQU      0x0
init_FDADR0       EQU      0xa0300000


backlight_cs      EQU      0x08000000
lcdlight          EQU      0x80


;***************************
;TIMER
;***************************
OSSR			EQU		0x40a00014
KPC				EQU		0x41500000


	END
