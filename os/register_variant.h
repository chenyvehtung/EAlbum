/*Registers are listed as follow*/
#define osTimer_OSMR0  0x40a00000
#define osTimer_OSMR1  0x40a00004
#define osTimer_OSMR2  0x40a00008
#define osTimer_OSMR3  0x40a0000c
#define osTimer_OSCR   0x40a00010
#define osTimer_OSSR   0x40a00014
#define osTimer_OIER   0x40a0001C
#define int_ICPR       0x40d00010
#define gpio_GAFR2L    0x40e00064
#define gpio_GPDR2     0x40e00014
#define gpio_GPSR2     0x40e00020
#define gpio_GPCR2     0x40e0002c
#define mem_MDCNFG     0x48000000
#define mem_MDREFR     0x48000004
#define mem_MDMRS	     0x48000040
#define mem_MSC0       0x48000008
#define mem_MSC1       0x4800000c
#define mem_MSC2	     0x48000010
#define rtc_RTSR	     0x40900008
#define pwm_PSSR	     0x40f00004

#define initMem_MSC0   0x2bd0
#define initMem_MSC1   0x2239
#define initMem_MSC2   0x8000
#define initMem_MDMRS  0x220022
#define initMem_MDCNFG   0xa1c9
#define initMem_MDREFR   0x91c01d
#define initGpio_GPDR2   0x4000
#define initGpio_GAFR2L  0x20000000

#define switch_dummyAddress	0x08200000
#define led_dummyAddress		0x10300000
#define osStack			0xa0200000


/*value */
#define osScanInterval	0x1000
#define ledShareInterval	0x4000
#define osTimerPreDelay	0x400000
#define buttonScanDelay	0x200000
#define postDelay	         0x100000
#define ledStatusSetDelay	0x1000
#define pwmPreScale	0x2000


#define ledStatusBuffer	0xa0100000
#define pwmFSM		0xa0100004
#define temPwmDuty0	0xa0100008
#define temPwmPerval0	0xa010000c
#define pwmDuty0		0xa0100010
#define pwmPerval0	0xa0100014
#define pwmDuty0Counter	0xa0100018
#define pwmPerval0Counter	0xa010001c
#define buttonStatus	0xa0100020
#define pwmEmulatorStatus	0xa0100024

