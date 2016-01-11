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