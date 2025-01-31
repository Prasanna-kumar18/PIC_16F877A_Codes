/*
 * File:   main.c
 * Author: Prasanna
 *
 * Created on 31 January, 2025, 8:12 PM
 */


#include <xc.h>

#define _XTAL_FREQ 20000000

// CONFIG
#pragma config FOSC = HS        // Oscillator Selection bits (HS oscillator)
#pragma config WDTE = OFF       // Watchdog Timer Enable bit (WDT disabled)
#pragma config PWRTE = OFF      // Power-up Timer Enable bit (PWRT disabled)
#pragma config BOREN = OFF      // Brown-out Reset Enable bit (BOR disabled)
#pragma config LVP = ON         // Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit (RB3/PGM pin has PGM function; low-voltage programming enabled)
#pragma config CPD = OFF        // Data EEPROM Memory Code Protection bit (Data EEPROM code protection off)
#pragma config WRT = OFF        // Flash Program Memory Write Enable bits (Write protection off; all program memory may be written to by EECON control)
#pragma config CP = OFF         // Flash Program Memory Code Protection bit (Code protection off)

//Defining macros for control pins
#define RS PORTBbits.RB0
#define RW PORTBbits.RB1
#define EN PORTBbits.RB2

unsigned int adc;

unsigned int a,b,c,d,e,f;


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

void interrupt pot_val()
{
    if(PIR1bits.ADIF == 1)  //Checking if conversion is completed
    {
        adc = (ADRESH << 8);
        
        adc = adc + ADRESL; //0000 00xx xxxx xxxx
        
        PIR1bits.ADIF = 0;  //Resetting the A/D Flag
    }
}


void main(void) 
{
    INTCONbits.GIE = 1;     //Enabling all interrupts
    INTCONbits.PEIE = 1;    //Enabling Peripheral interrupt
    
    PIE1bits.ADIE = 1;      //A/D Interrupt Enable
    
    TRISB = 0x00;           //Entire port B as output
    TRISC = 0x00;           //Entire port C as output
    
    lcd_intialise();
    
    lcd_command(0x80);      //Column 0 Row 0
    lcd_string("POT Value",9);
    
    ADCON0 = 0x41;          //2.5MHz, CH0, ADON
    ADCON1 = 0x8E;          //Right justify, AN0 (Analog)
    
    while(1)
    {
        ADCON0 = ADCON0 | (0x04);   //Start conversion for ADC
        
        lcd_command(0x8B);
        
        //ADC = 1023;
        
        a = adc/10;     //102
        
        b = adc%10;     //3
        
        c = a%10;       //2
        
        d = a/10;       //10
        
        e = d%10;       //0
        
        f = d/10;       //1
        
        //fecb
        
        lcd_data(f+0x30);   //Convert the int number into ascii character
        lcd_data(e+0x30);
        lcd_data(c+0x30);
        lcd_data(b+0x30);
        
    }
    
    return;
}
