#define LCD_LCCR0  (*(volatile unsigned long *)(0x44000000))
#define LCD_FDADR0 (*(volatile unsigned long *)(0x44000200))
#define LCD_FSADR0 (*(volatile unsigned long *)(0xa0300004))
#define LCD_LCSR   (*(volatile unsigned long *)(0x44000038))
#define LCD_LIGHT   (*(volatile unsigned long *)(0xa000000))
#define LIGHT1	(1<<12)
#define LIGHT2	(1<<13)
#define BACKLIGHT (1<<8)

//RED,,BLUE, WHITE
const unsigned long RUSSIA[3] = {0xF800F800, 0x1F001F, 0xFFFFFFFF};
//WHITE, GREEN,RED,
const unsigned long BULGARIA[3] = {0xFFFFFFFF, 0x07E007E0, 0xF800F800};
//RED, WHITE, BLACK
const unsigned long YEMEN[3] = {0xF800F800, 0xFFFFFFFF, 0x0};

/*extern void udelay(int multi);*/


extern char UPPERR[13][1];
extern char UPPERS[13][1];
extern char UPPERU[13][1];
extern char UPPERI[13][1];
extern char UPPERA[13][1];
extern char UPPERB[13][1];
extern char UPPERL[13][1];
extern char UPPERG[13][1];
extern char UPPERY[13][1];
extern char UPPERE[13][1];
extern char UPPERM[13][1];
extern void print_0813(char *,int, int);

void udelay(int multi)
{
	
  long int delay_1,delay_2;
  multi*=5;
  for (delay_2=0;delay_2<multi;delay_2++)
     for(delay_1=0;delay_1<100000;delay_1++);

}

/*void lighton1(void)
{
	LCD_LIGHT=(~LIGHT1)|BACKLIGHT;	

}

void lighton2(void)
{
	LCD_LIGHT=(~LIGHT2)|BACKLIGHT;
}

void lightoff1(void)
{
	LCD_LIGHT=LIGHT1|BACKLIGHT;	
}

void lightoff2(void)
{
	LCD_LIGHT=LIGHT2|BACKLIGHT;
}*/


/*void typename(void)
{
print_3232(word_1[0],200,200);
print_3232(word_2[0],250,200);
print_3232(word_3[0],300,200);
print_3232(word_4[0],350,200);
print_3232(word_5[0],400,200);
print_3232(word_6[0],450,200);
}*/


void screen_clean(long int color)
{
 
 long int i,fill_color ;
 i = 0x96000/4;
 fill_color =color;
 for(;i>0;i--) 
  (*(volatile unsigned long int *)(0xa0500000 + i*4)) = fill_color; 
}


/*void disable_lcd(void)
{
  LCD_LCCR0 = LCD_LCCR0 | 0x0400;
 
}


void enable_lcd(void)
{
  LCD_FDADR0 = 0xa0300000;
  LCD_FSADR0 = 0xa0500000;
  LCD_LCSR = 0;
  LCD_LCCR0 = 0x3b008f8;
udelay(1);
  LCD_LCCR0 = LCD_LCCR0 | 0x01;
  
}*/

void print_country (int num) 
{
	switch (num) 
	{
	case 0:
	  	print_0813(UPPERR[0],250+36,100);
  		print_0813(UPPERU[0],262+36,100);
  		print_0813(UPPERS[0],274+36,100);
  		print_0813(UPPERS[0],286+36,100);
  		print_0813(UPPERI[0],298+36,100);
		print_0813(UPPERA[0],310+36,100);
		break;
	case 1:
		print_0813(UPPERB[0],250,100);
		print_0813(UPPERU[0],262,100);
		print_0813(UPPERL[0],274,100);
		print_0813(UPPERG[0],286,100);
		print_0813(UPPERA[0],298,100);
		print_0813(UPPERR[0],310,100);
		print_0813(UPPERI[0],322,100);
		print_0813(UPPERR[0],334,100);
		break;
	case 2:
		print_0813(UPPERY[0],280,200);
		print_0813(UPPERE[0],292,200);
		print_0813(UPPERM[0],304,200);
		print_0813(UPPERE[0],316,200);
		print_0813(UPPERM[0],328,200);
		break;
	default:
		break;	
	}
}


void print_flag (int num) 
{
	long int i = 0x96000/4, fill_color;
	long int i1 = i / 3;
	long int i2 = i / 3 * 2;
	
	switch(num) {
	case 0:
		fill_color = RUSSIA[0];
		for(;i>0;i--) {
			if (i > i1 && i <= i2)
				fill_color = RUSSIA[1];
			if (i >0 && i <= i1)
				fill_color = RUSSIA[2];
  			(*(volatile unsigned long int *)(0xa0500000 + i*4)) = fill_color;
  		}

		break;
	case 1:
		fill_color = BULGARIA[2];
		for(;i>0;i--) {
			if (i > i1 && i <= i2)
				fill_color = BULGARIA[1];
			if (i >0 && i <= i1)
				fill_color = BULGARIA[0];
  			(*(volatile unsigned long int *)(0xa0500000 + i*4)) = fill_color;
  		}
	break;
	case 2:
		fill_color = YEMEN[2];
		for(;i>0;i--) {
			if (i > i1 && i <= i2)
				fill_color = YEMEN[1];
			if (i >0 && i <= i1)
				fill_color = YEMEN[0];
  			(*(volatile unsigned long int *)(0xa0500000 + i*4)) = fill_color;
  		}
	break;
	default:
	break;
	}
}


/*void print_3232(char * word,int pixel_x,int pixel_y)
{
 char bit_long = 8;
 char num_in_line = 4;
 char line = 32;
 char i=0,j=0,k=0;
 char value=0;
  
 for(k=0;k<line;k++)
  {
     for(j=0;j<num_in_line;j++)
         {
             value = (word+k*num_in_line)[j];
        for(i=0; i<bit_long; i++)
            {
               if (value & 0x80)
                  (*((volatile unsigned int *)(0xa0500000+pixel_y*1280+pixel_x*2 + k*1280+j*16+i*2))) = 0x8888;
                                  
               value = value << 1; 
            }
         }
  }
}*/

/*void print_0808(char * word,int pixel_x,int pixel_y)
{
 char bit_long = 8;
 char num_in_line = 1;
 char line = 8;
 char i=0,j=0,k=0;
 char value=0;
  
 for(k=0;k<line;k++)
  {
     for(j=0;j<num_in_line;j++)
         {
             value = (word+k*num_in_line)[j];
        for(i=0; i<bit_long; i++)
            {
               if (value & 0x80)
                  (*((volatile unsigned int *)(0xa0500000+pixel_y*1280+pixel_x*2 + k*1280+j*16+i*2))) = 0x8888;
                                  
               value = value << 1; 
            }
         }
  }
}*/


void print_0813(char * word,int pixel_x,int pixel_y)
{
 char bit_long = 8;
 char num_in_line = 1;
 char line = 13;
 char i=0,j=0,k=0;
 char value=0;
  
 for(k=0;k<line;k++)
  {
     for(j=0;j<num_in_line;j++)
         {
             value = (word+k*num_in_line)[j];
        for(i=0; i<bit_long; i++)
            {
               if (value & 0x80)
                  (*((volatile unsigned int *)(0xa0500000+pixel_y*1280+pixel_x*2 + k*1280+j*16+i*2))) = 0x8888;
                                  
               value = value << 1; 
            }
         }
  }
}

/* 16*12 
void print_song2312(char * word,int pixel_x,int pixel_y)
{
 char bit_long = 8;
 char num_in_line = 2;
 char line = 12;
 char i=0,j=0,k=0;
 char value=0;
 long int base_addr;
       base_addr = 0xa0500000;  
  
 for(k=0;k<line;k++)
  {
     for(j=0;j<num_in_line;j++)
         {
             value = (word+k*num_in_line)[j];
        for(i=0; i<bit_long; i++)
            {
               if (value & 0x80)
                  (*((volatile unsigned int *)(base_addr+pixel_y*1280+pixel_x*2 + k*1280+j*16+i*2))) = 0xdddd;
                                  
               value = value << 1; 
            }
         }
  }


}*/