# EAlbum
An Electronic Album running on PXA270

SYSU 2015 EMBEDED SYSTEM FINAL PROJECT
UNDER CONSTRUCTING...

## ע������

����Ŀ����ϵͳ����������У�������ʵ��ĳЩ����ʱ����Ҫ�޸���Ӧ�Ļ����룬���ڳ�ʼ���Լ����ģ����������á�

### �����ж�

* ��library_register.s��������´��룬�������ICMR

```
EXPORT	ICMR
EXPORT	init_ICMR
����
ICMR             EQU       0x40d00004
init_ICMR        EQU       0x00000010
```

* ��library_variant.s��������´��룬�������ʱ�ӼĴ���

```
EXPORT  PSSR
����
PSSR             EQU       0x40f00004
```

* �����boot.s��������´��룬�������������жϿ��ơ�����ע���Ƴ�IRQ�жϵ��ƺ�����ת

```
IMPORT  ICMR
IMPORT  init_ICMR
IMPORT  PSSR
����
mrs  r1, CPSR
bic  r1, r1,#0x80
msr  CPSR_c, r1		
ldr  r1, =ICMR
ldr  r2, =init_ICMR
str  r2,[r1]         
```