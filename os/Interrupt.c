#include <stdio.h>
#include "register_variant.h"


#define LED_CS1   	(*((volatile unsigned short int *)(0x10200000)))
#define LED_CS2   	(*((volatile unsigned short int *)(0x10300000)))	//LED1 and LED2
#define LED_CS3   	(*((volatile unsigned short int *)(0x10400000)))	//LED3 and LED4

#define KPDK_VALUE	(*((volatile unsigned char *)(0x41500008)))		//Direct Keypad
#define KPAS_VALUE	(*((volatile unsigned char *)(0x41500020)))		//Matrix Keypad


#define RTSR (*(volatile unsigned long *)(0x40900008))
#define RCNR (*(volatile unsigned long *)(0x40900000))
#define RDCR (*(volatile unsigned long *)(0x40900010))
#define RYCR (*(volatile unsigned long *)(0x40900014))


#define OIER		(*(volatile unsigned long *)(0x40a0001c))
#define	OSCR		(*(volatile unsigned long *)(osTimer_OSCR))
#define	OSMR0		(*(volatile unsigned long *)(0x40a00000))
#define OSSR		(*(volatile unsigned long *)(0x40a00014))


extern void disable_lcd(void);
extern void enable_lcd(void);
extern void screen_clean(int);
extern void print_flag(int);


int pretimer;
int autoplay = 0;
int timer0 = 0;
//the index of the picture
int index = 0;
//the led code of an unit 
const unsigned long NUM_CODE[10] = {0x40, 0x79, 0x24, 0x30, 0x19, 0x12, 0x02, 0x78, 0x00, 0x10};
//the color of the screen
const unsigned long SCREEN_COLOR[3] = {0xF800F800, 0x07E007E0, 0x1F001F};


void Delay(unsigned int x)
{
	unsigned int i, j, k;
	for (i =0; i <=x; i++)
		for (j = 0; j <0xff; j++)
			for (k = 0; k <0xff; k++);
}


//get the led display of a double-digit
unsigned long get_led_display(unsigned long num)
{
	int unit = num % 10;
    int decade = (num / 10) % 10;   
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
    {
        index = 2;
    }
    if (index >= 3)
    {
        index = 0;
    }
        
    //screen_clean(SCREEN_COLOR[index]);
    print_flag(index);
}

void IRQ_Function(void)
{	
	char i;
	char j;
	unsigned short int kbd_buff;
	i = KPDK_VALUE;					
	j = KPAS_VALUE;			
	
	
	switch (i)
	{
			
		case 0x40:					//key-press 1, show date
	        led_display(2);
			Delay(500);
			break;
					
		case 0x02:  				//key-press 2, enable timer 0		
            if (OSSR == 0x01)
            {
               timer0 = 1;
            }
			break;
					
		case 0x04:  				//key-press 3

			break;
				
		case 0x20: 					//key-press 4
			kbd_buff=0x198F;
			LED_CS3 = kbd_buff;	
			LED_CS2 = 0x8F8F;	
			break;
					
		default: break;
			
		
	}

	switch (j)
	{
			
		case 0x00:					//key-press 5, previous page
			index--;
		    lcd_display();
			break;
					
		case 0x01:  				//key-press 6, next page
			index++;
		    lcd_display();
			break;
					
		case 0x02:  				//key-press 7, autoplay start and stop
			if (autoplay == 0){
			    autoplay = 1;
			}
			else {
			    autoplay = 0;
			}
			break;
					
		case 0x10: 					//key-press 8, restart
			index = 0;
			lcd_display();
			break;
				
		default: break;
		
	}

}


void dummyOs(void)
{
 	
	RTSR = 0x0;				//reset the status registers	
	RCNR = 0x0;				//reset the clock counter
	RDCR = 0x1e0000;        //set the time 00:00:00
	RYCR = 0xfae21;			//set the data 2007.1.1
	LED_CS1 = LED_CS2 = LED_CS3 = 0xFFFF; //init led
	index = 0;
	autoplay = 0;
	timer0 = 0;

 	while(1) 
   	{
   	    led_display(1);
			//waiting for interrupt
		while (autoplay == 1) {
		    lcd_display();
		    led_display(1);
		    Delay(500);
		    index++;
		}
		if (KPDK_VALUE == 0x02) { //keypress 2, starttimer
		    OIER = 0x1;		
    		pretimer = OSCR;
    		OSMR0 = pretimer + 0x800000;
			//Delay(500);
		}
		
		//do timer action, show picture
		if (timer0 == 1) {
		    index = 1;
		    lcd_display();
		    timer0 = 0;
		}
	}
	


}