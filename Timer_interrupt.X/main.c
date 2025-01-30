/*
 * File:   main.c
 * Author: Prasanna
 *
 * Created on 30 January, 2025, 8:29 PM
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

unsigned char Timer_count = 0;

void interrupt timer_0()    //ISR
{
    if(INTCONbits.TMR0IF == 1)  //Checking if the timer overflow flag is set
    {
        Timer_count++;  //Incrementing Every 10ms
        INTCONbits.TMR0IF = 0;
    }
}



void main(void) 
{
    INTCONbits.GIE = 1;     //Enable the interrupt in uc.
    INTCONbits.PEIE = 1;    //Enables peripheral interrupt.
    INTCONbits.TMR0IE = 1;  //Enables the timer overflow interrupt bit
    
    OPTION_REG = 0x07;      //00000111  (256 Prescalar with Low to high edge selection)
    
    TMR0 = 59;  //10ms time period
    
    TRISB = 0x00;   //Entire port B as output
    
    while(1)
    {
        if(Timer_count == 0)
        {
            PORTBbits.RB0 = 1;  //Turning ON LED
        }
        if(Timer_count == 100)  //Checking if timer is 1 second
        {
            PORTBbits.RB0 = 0;  //Turning OFF LED
        }
        if(Timer_count == 200)  //Checking if timer is 2 second
        {
            Timer_count = 0;
        }
     
        
    }
    
    return;
}
