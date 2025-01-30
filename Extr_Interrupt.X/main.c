/*
 * File:   main.c
 * Author: Prasanna
 *
 * Created on 26 November, 2024, 7:22 PM
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

void interrupt PB_Ext()     //ISR -> Interrupt Subroutine
{
    if(INTCONbits.INTF == 1)    //Checking if the interrupt occurred
    {
        PORTBbits.RB2 = ~PORTBbits.RB2;     //Toggling the bit
        INTCONbits.INTF = 0;    //Clearing the interrupt flag
    }
}

void main(void) 
{
    INTCONbits.GIE = 1;     //Enabling Interrupts
    INTCONbits.PEIE = 1;    //Enabling peripheral device as interrupt
    INTCONbits.INTE = 1;    //Enabling the External interrupt
    
    OPTION_REGbits.INTEDG = 1;  //Setting rising edge as interrupt
    
    
    TRISBbits.TRISB2 = 0;   //OUTPUT
    //TRISC = 0x00;   //Output
    
    while(1)
    {
        
    }
    
    return;
}
