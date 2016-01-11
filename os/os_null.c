#include <stdio.h>
#include "register_variant.h"

#define LED_CS1   	(*((volatile unsigned short int *)(0x10200000)))    //LED1 and LED2
#define LED_CS2   	(*((volatile unsigned short int *)(0x10300000)))	//LED3 and LED4
#define LED_CS3   	(*((volatile unsigned short int *)(0x10400000)))	//LED5 and LED6

#define RTSR (*(volatile unsigned long *)(0x40900008))
#define RCNR (*(volatile unsigned long *)(0x40900000))
#define RDCR (*(volatile unsigned long *)(0x40900010))
#define RYCR (*(volatile unsigned long *)(0x40900014))

#define KPDK_VALUE	(*((volatile unsigned char *)(0x41500008)))		//Direct Keypad
#define KPAS_VALUE	(*((volatile unsigned char *)(0x41500020)))		//Matrix Keypad

#define OIER		(*(volatile unsigned long *)(0x40a0001c))
#define	OSCR		(*(volatile unsigned long *)(osTimer_OSCR))
#define	OSMR0		(*(volatile unsigned long *)(0x40a00000))
#define OSSR		(*(volatile unsigned long *)(0x40a00014))

extern void disable_lcd(void);
extern void enable_lcd(void);
extern void lighton1(void);
extern void lighton2(void);
extern void lightoff1(void);
extern void lightoff2(void);
extern void screen_clean(int);

//the index of the picture
int index = 0;
//the total number of the picture
int TOTAL_NUM = 3;
//the led code of an unit 
const unsigned long NUM_CODE[10] = {0x40, 0x79, 0x24, 0x30, 0x19, 0x12, 0x02, 0x78, 0x00, 0x10};
//the color of the screen
const int SCREEN_COLOR[3] = {0xF800F800, 0x07E007E0, 0x1F001F};

int pretimer;


void Delay(unsigned int x)
{
	unsigned int i, j, k;
	for (i =0; i <=x; i++)
		for (j = 0; j <0xff; j++)
			for (k = 0; k <0xff; k++);
}

/* get the led display of a double-digit */
unsigned long get_led_display(unsigned long num)
{
    int unit = num % 10;
    int decade = ((int)num / 10) % 10;
    unsigned long answer = NUM_CODE[unit];
    answer <<= 8;
    answer += NUM_CODE[decade];
    return answer;
}

/* show time or date according to num */
void led_display(int num) 
{
    switch(num) 
    {
    case 1:
	    LED_CS1 = get_led_display( (RDCR << 15) >> 27 ); //display hour
	    LED_CS2 = get_led_display( (RDCR << 20) >> 26 ); //display minute
	    LED_CS3 = get_led_display( (RDCR << 26) >> 26 ); //display second      
	    break;
	case 2:
	    LED_CS1 = get_led_display( (RYCR << 11) >> 20 ); //display year
	    LED_CS2 = get_led_display( (RYCR << 23) >> 28 ); //display month
	    LED_CS3 = get_led_display( (RYCR << 27) >> 27 ); //display day
	    break;
	default:
	    LED_CS1 = LED_CS2 = LED_CS3 = 0xFFFF;
	    break;
    }
}

/* show picture according to index */
void lcd_display()
{
    if (index < 0)
        index = TOTAL_NUM;
    else if (index >= TOTAL_NUM)
        index = 0;
    else {
        screen_clean(SCREEN_COLOR[index]);
    }
}


/* for keyboard IRQ interrupt */
void IRQ_Function(void)
{	
	char i;
	char j;
	i = KPDK_VALUE;					
	j = KPAS_VALUE;		
		
	/*For timer*/
	if (OSSR == 0x01)
	{
	    index = 0;
	    lcd_display();
	}
				
    /* For LED display */
	switch (i)
	{			
		case 0x40:					//key-press 1, display time
	        led_display(1);         
			break;				
		case 0x02:  				//key-press 2, display date
            led_display(2);         
			break;				
		/*case 0x04:  				//key-press 3
			break;				
		case 0x20: 					//key-press 4
			break;	*/			
		default: break;		
	}
	
    /* For LCD display */
	switch (j)
	{			
		case 0x00:					//key-press 5, previous pic
			index--;
		    lcd_display();
			break;
					
		case 0x01:  				//key-press 6, next pic
			index++;
			lcd_display();
			break;
					
		case 0x02:  				//key-press 7, enable timer 0
			OIER = 0x1;		
    		pretimer = OSCR;
    		OSMR0 = pretimer + 0x800000;
			Delay(10);
			break;
					
		case 0x05: 					//key-press 8
		
			break;
				
		default: break;		
	}

}


void dummyOs(void)
{	
	RTSR = 0x0;				//reset the status registers	
	RCNR = 0x0;				//reset the clock counter
	RDCR = 0x1e0000;        //set the time 00:00:00
	RYCR = 0xfc030;         //set the date 2016.1.13
	LED_CS1 = LED_CS2 = LED_CS3 = 0xFFFF; //init led

	while (1)
	{
	    led_display(1);
        //waiting for interrupt
	}
	
}