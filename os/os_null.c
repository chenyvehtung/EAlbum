#include <stdio.h>
#include "register_variant.h"

#define LED_CS1   	(*((volatile unsigned short int *)(0x10200000)))    //LED1 and LED2
#define LED_CS2   	(*((volatile unsigned short int *)(0x10300000)))	//LED3 and LED4
#define LED_CS3   	(*((volatile unsigned short int *)(0x10400000)))	//LED5 and LED6

#define RTSR (*(volatile unsigned long *)(0x40900008))
#define RCNR (*(volatile unsigned long *)(0x40900000))
#define RDCR (*(volatile unsigned long *)(0x40900010))

//the led code of an unit 
const unsigned long num_code[10] = {0x40, 0x79, 0x24, 0x30, 0x19, 0x12, 0x02, 0x78, 0x00, 0x10};

//get the led display of a double-digit
unsigned long get_led_display(unsigned long num)
{
    int decade = num / 10;
    int unit = num % 10;
    unsigned long answer = num_code[unit];
    answer <<= 8;
    answer += num_code[decade];
    return answer;
}

void dummyOs(void)
{	
	RTSR = 0x0;				//reset the status registers	
	RCNR = 0x0;				//reset the clock counter
	RDCR = 0x1e0000;        //set the time 00:00:00
	LED_CS1 = LED_CS2 = LED_CS3 = 0xFFFF; //init led

	while (1)
	{
	    LED_CS1 = get_led_display( (RDCR << 15) >> 27 ); //display hour
	    LED_CS2 = get_led_display( (RDCR << 20) >> 26 ); //display minute
	    LED_CS3 = get_led_display( (RDCR << 26) >> 26 ); //display second
	}
	
}