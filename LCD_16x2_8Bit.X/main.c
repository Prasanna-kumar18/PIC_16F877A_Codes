/*
 * File:   main.c
 * Author: Prasanna
 *
 * Created on 23 January, 2025, 8:24 PM
 */

// CONFIG
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

//Defining macros for control pins
#define RS PORTBbits.RB0
#define RW PORTBbits.RB1
#define EN PORTBbits.RB2

void lcd_data(unsigned char data)
{
    PORTC = data;
    RS = 1;     //Register select as Data
    RW = 0;     //Write
    EN = 1;     //Enabling the pins for 5ms
    __delay_ms(5);
    EN = 0;
}

void lcd_command(unsigned char cmd)
{
    PORTC = cmd;
    RS = 0;     //Register select as cmd
    RW = 0;     //Write
    EN = 1;     //Enabling the pins for 5ms
    __delay_ms(5);
    EN = 0;
}
void lcd_string(unsigned char *str,unsigned char num)
{
    for(unsigned int i=0;i<num;i++)
    {
        lcd_data(str[i]);   //Calling lcd_data function with single character(8-bit)
    }
}

void lcd_intialise()
{
    lcd_command(0x38);      //5x7 lcd matrix with 2 rows 8-bit mode
    lcd_command(0x06);      //Shifting cursor to right
    lcd_command(0x0C);      //Display ON and cursor OFF
    lcd_command(0x01);      //Clear LCD Display
    
}

void main(void) 
{
    TRISB = 0x00;   //Entire portB as OUTPUT    control pins
    TRISC = 0x00;   //Entire portC as OUTPUT    data pins
    
    lcd_intialise();    //Initialise LCD
    
    while(1)
    {
        lcd_command(0x86);  //Row 0 column 6
        lcd_string("PIC",3);
        lcd_command(0xC1);  //Row 1 column 2
        lcd_string("MICROCONTROLLER",15);
    }
    
    return;
}