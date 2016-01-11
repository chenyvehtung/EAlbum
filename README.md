# EAlbum
An Electronic Album running on PXA270

SYSU 2015 EMBEDED SYSTEM FINAL PROJECT
UNDER CONSTRUCTING...

## 注意事项

本项目基于系统引导代码进行，所以在实现某些功能时，需要修改相应的汇编代码，用于初始化以及相关模块的启动设置。

### 键盘中断

* 在library_register.s中添加如下代码，用于添加ICMR

```
EXPORT	ICMR
EXPORT	init_ICMR
……
ICMR             EQU       0x40d00004
init_ICMR        EQU       0x00000010
```

* 在library_variant.s中添加如下代码，用于添加时钟寄存器

```
EXPORT  PSSR
……
PSSR             EQU       0x40f00004
```

* 最后，在boot.s中添加如下代码，用于启动键盘中断控制。并且注意移除IRQ中断的哑函数跳转

```
IMPORT  ICMR
IMPORT  init_ICMR
IMPORT  PSSR
……
mrs  r1, CPSR
bic  r1, r1,#0x80
msr  CPSR_c, r1		
ldr  r1, =ICMR
ldr  r2, =init_ICMR
str  r2,[r1]         
```

### LCD显示器

LCD显示器需要初始化的部分相对较多，主要包含以下几个。

* 添加`post_initDescriptor.s`以及添加部分相关的`print_method.c`
* 在`library_register.s`中添加如下代码，用于初始化GPIO控制器，帧以及LCD控制器。

```
    EXPORT  gpio_GPDR1
    EXPORT  gpio_GPDR2
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
……
;GPIO configuration
gpio_GPDR1        EQU      0x40e00010
;gpio_GPDR2        EQU      0x40e00014
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
```

* 在`boot.s`中添加如下代码，用于添加并初始化LCD显示器。另外，原LCD代码中对于stack的初始化使用了不同的方法，原因不明。

```
IMPORT	post_LcdController
IMPORT	backlight_cs
IMPORT	lcdlight 
IMPORT	screen_clean
……
mov r14,pc
ldr pc,=post_LcdController
……
LDRH    R2,[R0,#0]		
ORR 	R2,R2,#0x100
STRH    R2,[R0,#0]
```

## 待解决问题

* 在清屏时，lighton和lightoff函数对SDRAM的第一部分进行了操作，但作用不明。