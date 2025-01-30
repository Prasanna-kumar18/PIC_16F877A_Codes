/*
 * File:   main.c
 * Author: Prasanna
 *
 * Created on 24 January, 2025, 8:49 PM
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

/*
 D1 - RC0
 D2 - RC1
 D3 - RC2
 D4 - RC3
  
 a - h -> RB0 to RB7
  */

void main(void) 
{
    
    unsigned char segment[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};
    
    TRISB = 0x00;
    TRISC = 0x00;
    
    unsigned int digit[4], i=3;
    
    
    unsigned int number = 4589;
    
    while(number!=0)
    {
        digit[i] = number%10;   //digit[3] = 9, 
        number = number/10;     //180
        i--;
    }
    
    PORTC = 0xFE;  //Enabling RC0 and RC1-RC3 is OFF
    PORTB = segment[digit[0]];
    __delay_ms(10);
    PORTC = 0xFD;  //RC1 is ON and RC0, RC2 & RC3 is OFF
    PORTB = segment[digit[1]];
    __delay_ms(10);
    PORTC = 0xFB;  //RC2 is ON and RC0, RC1 & RC3 is OFF
    PORTB = segment[digit[2]];
    __delay_ms(10);
    PORTC = 0xF7;  //RC3 is ON and RC0, RC1 & RC2 is OFF
    PORTB = segment[digit[3]];
    __delay_ms(10);
    
    
    return;
}
