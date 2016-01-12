	EXPORT	osScanInterval
	EXPORT	ledShareInterval
	EXPORT	osTimerPreDelay
	EXPORT	postDelay
	EXPORT	buttonScanDelay
	EXPORT	ledStatusSetDelay
	EXPORT	pwmPreScale
	EXPORT	ledcode
	EXPORT	ledStatusBuffer
	EXPORT	pwmFSM
	EXPORT	temPwmDuty0
	EXPORT	temPwmPerval0
	EXPORT	pwmDuty0
	EXPORT	pwmPerval0
	EXPORT	pwmDuty0Counter
	EXPORT	pwmPerval0Counter
	EXPORT	buttonStatus
	EXPORT	pwmEmulatorStatus
	
	EXPORT	StackSvc
	EXPORT	StackIrq
	EXPORT	StackFiq
	EXPORT	StackAbt
	EXPORT	StackUnd
	EXPORT	StackUsr
	
	EXPORT	PSSR
	

	AREA library_variant ,DATA ,READONLY

osScanInterval	EQU	0x1000
ledShareInterval	EQU	0x40
osTimerPreDelay	EQU	0x400000
buttonScanDelay	EQU	0x4000
postDelay	EQU	0x100000
ledStatusSetDelay	EQU	0x1000
pwmPreScale	EQU	0x2000


ledStatusBuffer	EQU	0xa0100000
pwmFSM		EQU	0xa0100004
temPwmDuty0	EQU	0xa0100008
temPwmPerval0	EQU	0xa010000c
pwmDuty0		EQU	0xa0100010
pwmPerval0	EQU	0xa0100014
pwmDuty0Counter	EQU	0xa0100018
pwmPerval0Counter	EQU	0xa010001c
buttonStatus	EQU	0xa0100020
pwmEmulatorStatus	EQU	0xa0100024
ledcode		EQU	0xa0100028


StackSvc		EQU		0xa0600000
StackIrq		EQU		0xa0605000
StackFiq		EQU		0xa060a000
StackAbt		EQU		0xa060e000
StackUnd		EQU		0xa0714000
StackUsr		EQU		0xa0720000			

;clock and power Register
PSSR             EQU       0x40f00004


	END



