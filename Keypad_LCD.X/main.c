/*
 * File:   main.c
 * Author: Prasanna
 *
 * Created on 28 January, 2025, 7:51 PM
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

#define RS PORTCbits.RC0
#define RW PORTCbits.RC1
#define EN PORTCbits.RC2

#define C1 PORTBbits.RB0
#define C2 PORTBbits.RB1
#define C3 PORTBbits.RB2

#define R1 PORTBbits.RB4
#define R2 PORTBbits.RB5
#define R3 PORTBbits.RB6
#define R4 PORTBbits.RB7


void lcd_data(unsigned char data)
{
    PORTD = data;
    RS = 1;
    RW = 0;
    EN = 1;
    __delay_ms(5);
    EN = 0;
}

void lcd_cmd(unsigned char cmd)
{
    PORTD = cmd;
    RS = 0;
    RW = 0;
    EN = 1;
    __delay_ms(5);
    EN = 0;
}

void lcd_string(unsigned char *str, unsigned char num)
{
    for(unsigned int i=0;i<num;i++)
    {
        lcd_data(str[i]);
    }
}

void lcd_init()
{
    lcd_cmd(0x38);  //5x7 matrix 8-bit mode 16x2 LCD
    lcd_cmd(0x06);  //Shifting cursor to Right
    lcd_cmd(0x0C);  //Cursor OFF and Display ON
    lcd_cmd(0x01);  //LCD Clear
}

void keypad()
{
    C1 = 1; C2 = 0; C3 = 0;     //Making column 1 as HIGH
    
    if(R1 == 1)
    {
        lcd_data('1');
        while(R1==1);
    }
    if(R2 == 1)
    {
        lcd_data('4');
        while(R2==1);
    }
    if(R3 == 1)
    {
        lcd_data('7');
        while(R3==1);
    }
    if(R4 == 1)
    {
        lcd_data('*');
        while(R4==1);
    }
    C1 = 0; C2 = 1; C3 = 0;     //Making column 2 as HIGH
    
    if(R1 == 1)
    {
        lcd_data('2');
        while(R1==1);
    }
    if(R2 == 1)
    {
        lcd_data('5');
        while(R2==1);
    }
    if(R3 == 1)
    {
        lcd_data('8');
        while(R3==1);
    }
    if(R4 == 1)
    {
        lcd_data('0');
        while(R4==1);
    }
    C1 = 0; C2 = 0; C3 = 1;     //Making column 3 as HIGH
    
    if(R1 == 1)
    {
        lcd_data('3');
        while(R1==1);
    }
    if(R2 == 1)
    {
        lcd_data('6');
        while(R2==1);
    }
    if(R3 == 1)
    {
        lcd_data('9');
        while(R3==1);
    }
    if(R4 == 1)
    {
        lcd_data('#');
        while(R4==1);
    }
}



 void main(void) 
{
    TRISC = 0x00;   //Entire port c is OUTPUT
    TRISD = 0x00;   //Entire port d is OUTPUT
    
    TRISB = 0xF0;   //(RB0-RB3 is OUTPUT and RB4-RB7 is INPUT)
    
    lcd_init();
    lcd_cmd(0x80);  //Print in Column 0 and Row 0
    lcd_string("KEYPAD VALUE",12);
    lcd_cmd(0xC0);
    
    while(1)
    {
    keypad();
    }
       
    return;
}
