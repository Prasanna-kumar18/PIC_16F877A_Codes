/*
 * File:   main.c
 * Author: Prasanna
 *
 * Created on 22 January, 2025, 8:56 PM
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
    //Hex values for 7-seg common Cathode from 0-9
    unsigned char segment[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0X6F}; 
    
    TRISB = 0;  //Entire port B is output
    
    while(1)
    {
        for(unsigned int i=0;i<10;i++)
        {
            PORTB = segment[i];
            __delay_ms(500);
        }
        
    }
    
    
    return;
}
