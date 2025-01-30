/*
 * File:   main.c
 * Author: Prasanna
 *
 * Created on 24 January, 2025, 7:45 PM
 */
#pragma config FOSC = HS        // Oscillator Selection bits (HS oscillator)
#pragma config WDTE = OFF       // Watchdog Timer Enable bit (WDT disabled)
#pragma config PWRTE = OFF      // Power-up Timer Enable bit (PWRT disabled)
#pragma config BOREN = ON       // Brown-out Reset Enable bit (BOR enabled)
#pragma config LVP = ON         // Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit (RB3/PGM pin has PGM function; low-voltage programming enabled)
#pragma config CPD = OFF        // Data EEPROM Memory Code Protection bit (Data EEPROM code protection off)
#pragma config WRT = OFF        // Flash Program Memory Write Enable bits (Write protection off; all program memory may be written to by EECON control)
#pragma config CP = ON          // Flash Program Memory Code Protection bit (All program memory code-protected)

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.

#include <xc.h>

#define _XTAL_FREQ 20000000 //20 MHz clock frequency

#define RS PORTBbits.RB0
#define RW PORTBbits.RB1
#define EN PORTBbits.RB2

void lcd_data(unsigned char data)
{
    PORTB = (data & 0xF0);  //LSB value is masked with 0s
    RS = 1;
    RW = 0;
    EN = 1;
    __delay_ms(5);
    EN = 0;
    PORTB = ((data<<4)& 0xF0);
    RS = 1;
    RW = 0;
    EN = 1;
    __delay_ms(5);
    EN = 0;  
}

void lcd_cmd(unsigned char cmd)
{
    PORTB = (cmd & 0xF0);  //LSB value is masked with 0s
    RS = 0;
    RW = 0;
    EN = 1;
    __delay_ms(5);
    EN = 0;
    PORTB = ((cmd<<4) & 0xF0);
    RS = 0;
    RW = 0;
    EN = 1;
    __delay_ms(5);
    EN = 0; 
}

void lcd_string(unsigned char *str, unsigned int num)
{
    for(unsigned int i=0;i<num;i++)
    {
        lcd_data(str[i]);
    }
}

void lcd_init()
{
    lcd_cmd(0x28);  //5x7 Matrix with 2 rows and 4-Bit
    lcd_cmd(0x06);  //Shift cursor right
    lcd_cmd(0x0C);  //Display ON, Cursor OFF
    lcd_cmd(0x01);  //Clear lcd display
}


void main(void) 
{
    TRISB = 0x00;   //Entire portB as output
    
    lcd_init();
    
    while(1)
    {
        lcd_cmd(0x86);  //Printing in Row0 and Column 0
        lcd_string("4-Bit",5);
        lcd_cmd(0xC5);  //Printing in Row 1 and Column 0
        lcd_string("LCD Display",11);
    }
    
    return;
}
