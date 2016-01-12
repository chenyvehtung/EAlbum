#include <stdio.h>

#define LED_CS1   	(*((volatile unsigned short int *)(0x10200000)))
#define LED_CS2   	(*((volatile unsigned short int *)(0x10300000)))	//LED1 and LED2
#define LED_CS3   	(*((volatile unsigned short int *)(0x10400000)))	//LED3 and LED4

#define KPDK_VALUE	(*((volatile unsigned char *)(0x41500008)))		//Direct Keypad
#define KPAS_VALUE	(*((volatile unsigned char *)(0x41500020)))		//Matrix Keypad


#define RTSR (*(volatile unsigned long *)(0x40900008))
#define RCNR (*(volatile unsigned long *)(0x40900000))
#define RDCR (*(volatile unsigned long *)(0x40900010))
#define RYCR (*(volatile unsigned long *)(0x40900014))


void Delay(unsigned int x)
{
	unsigned int i, j, k;
	for (i =0; i <=x; i++)
		for (j = 0; j <0xff; j++)
			for (k = 0; k <0xff; k++);
}


//the led code of an unit 
const unsigned long num_code[10] = {0x40, 0x79, 0x24, 0x30, 0x19, 0x12, 0x02, 0x78, 0x00, 0x10};

//get the led display of a double-digit
unsigned long get_led_display(unsigned long num)
{
	int unit = num % 10;
    int decade = (num / 10) % 10;   
    unsigned long answer = num_code[unit];
    answer <<= 8;
    answer += num_code[decade];
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

void IRQ_Function(void)
{	
	char i;
	char j;
	unsigned short int kbd_buff;
	i = KPDK_VALUE;					
	j = KPAS_VALUE;					

	switch (i)
	{
			
		case 0x40:					//key-press 1
	        led_display(2);
			Delay(500);
			break;
					
		case 0x02:  				//key-press 2		
			
			break;
					
		case 0x04:  				//key-press 3
			kbd_buff=0x8F30;
			LED_CS3 = kbd_buff;	
			LED_CS2 = 0x8F8F;
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
			
		case 0x00:					//key-press 5
			kbd_buff=0x8F12;
			LED_CS2 = kbd_buff;
			LED_CS3 = 0x8F8F;
			break;
					
		case 0x01:  				//key-press 6
			kbd_buff=0x028F;
			LED_CS2 = kbd_buff;
			LED_CS3 = 0x8F8F;  
			break;
					
		case 0x02:  				//key-press 7
			kbd_buff=0x8F78;
			LED_CS3 = kbd_buff;
			LED_CS2 = 0x8F8F;
			break;
					
		case 0x05: 					//key-press 8
			kbd_buff=0x008F;
			LED_CS3 = kbd_buff;
			LED_CS2 = 0x8F8F;
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

 	while(1) 
   	{
   	    led_display(1);
			//waiting for interrupt
	}
	


}