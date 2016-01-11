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
	
	;Interrupt Controller
	EXPORT	ICMR
	EXPORT	init_ICMR


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
init_ICMR        EQU       0x00000010


	END
