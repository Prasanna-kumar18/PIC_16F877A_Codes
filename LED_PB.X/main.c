/*
 * File:   main.c
 * Author: Prasanna
 *
 * Created on 22 January, 2025, 7:50 PM
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

void main(void) 
{
    
    TRISB = 0x01;   //RB0-> INPUT and all other pins are OUTPUT
    
    while(1)
    {
        if(PORTBbits.RB0 == 1)  //Checking if PushButton is pressed
        {
            PORTBbits.RB2 = 1;  //Turning ON led
        }
        else
        {
            PORTBbits.RB2 = 0;  //Turning OFF led
        }
    }
        
    return;
}
