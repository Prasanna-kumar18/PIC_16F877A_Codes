subtitle "Microchip MPLAB XC8 C Compiler v2.50 (Free license) build 20240725155939 Og1 "

pagewidth 120

	opt flic

	processor	16F877A
include "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\16f877a.cgen.inc"
getbyte	macro	val,pos
	(((val) >> (8 * pos)) and 0xff)
endm
byte0	macro	val
	(getbyte(val,0))
endm
byte1	macro	val
	(getbyte(val,1))
endm
byte2	macro	val
	(getbyte(val,2))
endm
byte3	macro	val
	(getbyte(val,3))
endm
byte4	macro	val
	(getbyte(val,4))
endm
byte5	macro	val
	(getbyte(val,5))
endm
byte6	macro	val
	(getbyte(val,6))
endm
byte7	macro	val
	(getbyte(val,7))
endm
getword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffff)
endm
word0	macro	val
	(getword(val,0))
endm
word1	macro	val
	(getword(val,2))
endm
word2	macro	val
	(getword(val,4))
endm
word3	macro	val
	(getword(val,6))
endm
gettword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffff)
endm
tword0	macro	val
	(gettword(val,0))
endm
tword1	macro	val
	(gettword(val,3))
endm
tword2	macro	val
	(gettword(val,6))
endm
getdword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffffff)
endm
dword0	macro	val
	(getdword(val,0))
endm
dword1	macro	val
	(getdword(val,4))
endm
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
# 54 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
INDF equ 00h ;# 
# 61 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TMR0 equ 01h ;# 
# 68 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PCL equ 02h ;# 
# 75 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
STATUS equ 03h ;# 
# 161 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
FSR equ 04h ;# 
# 168 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PORTA equ 05h ;# 
# 218 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PORTB equ 06h ;# 
# 280 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PORTC equ 07h ;# 
# 342 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PORTD equ 08h ;# 
# 404 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PORTE equ 09h ;# 
# 436 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PCLATH equ 0Ah ;# 
# 456 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
INTCON equ 0Bh ;# 
# 534 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PIR1 equ 0Ch ;# 
# 596 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PIR2 equ 0Dh ;# 
# 636 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TMR1 equ 0Eh ;# 
# 643 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TMR1L equ 0Eh ;# 
# 650 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TMR1H equ 0Fh ;# 
# 657 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
T1CON equ 010h ;# 
# 732 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TMR2 equ 011h ;# 
# 739 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
T2CON equ 012h ;# 
# 810 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
SSPBUF equ 013h ;# 
# 817 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
SSPCON equ 014h ;# 
# 887 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
CCPR1 equ 015h ;# 
# 894 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
CCPR1L equ 015h ;# 
# 901 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
CCPR1H equ 016h ;# 
# 908 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
CCP1CON equ 017h ;# 
# 966 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
RCSTA equ 018h ;# 
# 1061 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TXREG equ 019h ;# 
# 1068 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
RCREG equ 01Ah ;# 
# 1075 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
CCPR2 equ 01Bh ;# 
# 1082 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
CCPR2L equ 01Bh ;# 
# 1089 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
CCPR2H equ 01Ch ;# 
# 1096 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
CCP2CON equ 01Dh ;# 
# 1154 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
ADRESH equ 01Eh ;# 
# 1161 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
ADCON0 equ 01Fh ;# 
# 1257 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
OPTION_REG equ 081h ;# 
# 1327 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TRISA equ 085h ;# 
# 1377 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TRISB equ 086h ;# 
# 1439 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TRISC equ 087h ;# 
# 1501 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TRISD equ 088h ;# 
# 1563 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TRISE equ 089h ;# 
# 1620 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PIE1 equ 08Ch ;# 
# 1682 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PIE2 equ 08Dh ;# 
# 1722 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PCON equ 08Eh ;# 
# 1756 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
SSPCON2 equ 091h ;# 
# 1818 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PR2 equ 092h ;# 
# 1825 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
SSPADD equ 093h ;# 
# 1832 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
SSPSTAT equ 094h ;# 
# 2001 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TXSTA equ 098h ;# 
# 2082 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
SPBRG equ 099h ;# 
# 2089 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
CMCON equ 09Ch ;# 
# 2159 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
CVRCON equ 09Dh ;# 
# 2224 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
ADRESL equ 09Eh ;# 
# 2231 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
ADCON1 equ 09Fh ;# 
# 2290 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
EEDATA equ 010Ch ;# 
# 2297 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
EEADR equ 010Dh ;# 
# 2304 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
EEDATH equ 010Eh ;# 
# 2311 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
EEADRH equ 010Fh ;# 
# 2318 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
EECON1 equ 018Ch ;# 
# 2363 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
EECON2 equ 018Dh ;# 
# 54 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
INDF equ 00h ;# 
# 61 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TMR0 equ 01h ;# 
# 68 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PCL equ 02h ;# 
# 75 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
STATUS equ 03h ;# 
# 161 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
FSR equ 04h ;# 
# 168 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PORTA equ 05h ;# 
# 218 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PORTB equ 06h ;# 
# 280 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PORTC equ 07h ;# 
# 342 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PORTD equ 08h ;# 
# 404 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PORTE equ 09h ;# 
# 436 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PCLATH equ 0Ah ;# 
# 456 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
INTCON equ 0Bh ;# 
# 534 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PIR1 equ 0Ch ;# 
# 596 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PIR2 equ 0Dh ;# 
# 636 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TMR1 equ 0Eh ;# 
# 643 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TMR1L equ 0Eh ;# 
# 650 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TMR1H equ 0Fh ;# 
# 657 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
T1CON equ 010h ;# 
# 732 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TMR2 equ 011h ;# 
# 739 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
T2CON equ 012h ;# 
# 810 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
SSPBUF equ 013h ;# 
# 817 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
SSPCON equ 014h ;# 
# 887 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
CCPR1 equ 015h ;# 
# 894 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
CCPR1L equ 015h ;# 
# 901 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
CCPR1H equ 016h ;# 
# 908 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
CCP1CON equ 017h ;# 
# 966 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
RCSTA equ 018h ;# 
# 1061 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TXREG equ 019h ;# 
# 1068 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
RCREG equ 01Ah ;# 
# 1075 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
CCPR2 equ 01Bh ;# 
# 1082 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
CCPR2L equ 01Bh ;# 
# 1089 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
CCPR2H equ 01Ch ;# 
# 1096 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
CCP2CON equ 01Dh ;# 
# 1154 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
ADRESH equ 01Eh ;# 
# 1161 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
ADCON0 equ 01Fh ;# 
# 1257 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
OPTION_REG equ 081h ;# 
# 1327 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TRISA equ 085h ;# 
# 1377 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TRISB equ 086h ;# 
# 1439 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TRISC equ 087h ;# 
# 1501 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TRISD equ 088h ;# 
# 1563 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TRISE equ 089h ;# 
# 1620 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PIE1 equ 08Ch ;# 
# 1682 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PIE2 equ 08Dh ;# 
# 1722 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PCON equ 08Eh ;# 
# 1756 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
SSPCON2 equ 091h ;# 
# 1818 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
PR2 equ 092h ;# 
# 1825 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
SSPADD equ 093h ;# 
# 1832 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
SSPSTAT equ 094h ;# 
# 2001 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
TXSTA equ 098h ;# 
# 2082 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
SPBRG equ 099h ;# 
# 2089 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
CMCON equ 09Ch ;# 
# 2159 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
CVRCON equ 09Dh ;# 
# 2224 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
ADRESL equ 09Eh ;# 
# 2231 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
ADCON1 equ 09Fh ;# 
# 2290 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
EEDATA equ 010Ch ;# 
# 2297 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
EEADR equ 010Dh ;# 
# 2304 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
EEDATH equ 010Eh ;# 
# 2311 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
EEADRH equ 010Fh ;# 
# 2318 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
EECON1 equ 018Ch ;# 
# 2363 "J:/Microchip/MPLABX/v6.20/packs/Microchip/PIC16Fxxx_DFP/1.6.156/xc8\pic\include\proc\pic16f877a.h"
EECON2 equ 018Dh ;# 
	debug_source C
	FNROOT	_main
	FNCALL	intlevel1,_timer_0
	global	intlevel1
	FNROOT	intlevel1
	global	_Timer_count
	global	_PORTBbits
_PORTBbits	set	0x6
	global	_TMR0
_TMR0	set	0x1
	global	_INTCONbits
_INTCONbits	set	0xB
	global	_TRISB
_TRISB	set	0x86
	global	_OPTION_REG
_OPTION_REG	set	0x81
; #config settings
	config pad_punits      = on
	config apply_mask      = off
	config ignore_cmsgs    = off
	config default_configs = off
	config default_idlocs  = off
	config FOSC = "HS"
	config WDTE = "OFF"
	config PWRTE = "OFF"
	config BOREN = "OFF"
	config LVP = "ON"
	config CPD = "OFF"
	config WRT = "OFF"
	config CP = "OFF"
	file	"dist/default/production\Timer_interrupt.X.production.s"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssCOMMON,class=COMMON,space=1,noexec
global __pbssCOMMON
__pbssCOMMON:
_Timer_count:
       ds      1

	file	"dist/default/production\Timer_interrupt.X.production.s"
	line	#
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbssCOMMON)+0)&07Fh
psect cinit,class=CODE,delta=2,merge=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1,noexec
global __pcstackCOMMON
__pcstackCOMMON:
?_timer_0:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
??_timer_0:	; 1 bytes @ 0x0
	ds	2
??_main:	; 1 bytes @ 0x2
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        0
;!    BSS         1
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14      2       3
;!    BANK0            80      0       0
;!    BANK1            80      0       0
;!    BANK3            96      0       0
;!    BANK2            96      0       0

;!
;!Pointer List with Targets:
;!
;!    None.


;!
;!Critical Paths under _main in COMMON
;!
;!    None.
;!
;!Critical Paths under _timer_0 in COMMON
;!
;!    None.
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _timer_0 in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _timer_0 in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _timer_0 in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.
;!
;!Critical Paths under _timer_0 in BANK2
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 0
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (1) _timer_0                                              2     2      0       0
;!                                              0 COMMON     2     2      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 1
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!
;! _timer_0 (ROOT)
;!

;!Address spaces:

;!Name               Size   Autos  Total    Usage
;!BITCOMMON           14      0       0      0.0%
;!BITBANK0            80      0       0      0.0%
;!BITBANK1            80      0       0      0.0%
;!BITBANK3            96      0       0      0.0%
;!BITBANK2            96      0       0      0.0%
;!COMMON              14      2       3     21.4%
;!BANK0               80      0       0      0.0%
;!BANK1               80      0       0      0.0%
;!BANK3               96      0       0      0.0%
;!BANK2               96      0       0      0.0%
;!STACK                0      0       0      0.0%
;!DATA                 0      0       3      0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 36 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"main.c"
	line	36
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"main.c"
	line	36
	
_main:	
;incstack = 0
	callstack 7
; Regs used in _main: [wreg+status,2+status,0]
	line	38
	
l566:	
;main.c: 38: INTCONbits.GIE = 1;
	bsf	(11),7	;volatile
	line	39
;main.c: 39: INTCONbits.PEIE = 1;
	bsf	(11),6	;volatile
	line	40
;main.c: 40: INTCONbits.TMR0IE = 1;
	bsf	(11),5	;volatile
	line	42
;main.c: 42: OPTION_REG = 0x07;
	movlw	07h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	44
;main.c: 44: TMR0 = 59;
	movlw	03Bh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	line	46
	
l568:	
;main.c: 46: TRISB = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	50
	
l570:	
;main.c: 49: {;main.c: 50: if(Timer_count == 0)
	movf	((_Timer_count)),w
	btfss	status,2
	goto	u21
	goto	u20
u21:
	goto	l574
u20:
	line	52
	
l572:	
;main.c: 51: {;main.c: 52: PORTBbits.RB0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(6),0	;volatile
	line	54
	
l574:	
;main.c: 53: };main.c: 54: if(Timer_count == 100)
		movlw	100
	xorwf	((_Timer_count)),w
	btfss	status,2
	goto	u31
	goto	u30
u31:
	goto	l578
u30:
	line	56
	
l576:	
;main.c: 55: {;main.c: 56: PORTBbits.RB0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(6),0	;volatile
	line	58
	
l578:	
;main.c: 57: };main.c: 58: if(Timer_count == 200)
		movlw	200
	xorwf	((_Timer_count)),w
	btfss	status,2
	goto	u41
	goto	u40
u41:
	goto	l570
u40:
	line	60
	
l580:	
;main.c: 59: {;main.c: 60: Timer_count = 0;
	clrf	(_Timer_count)
	goto	l570
	global	start
	ljmp	start
	callstack 0
	line	67
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_timer_0

;; *************** function _timer_0 *****************
;; Defined at:
;;		line 25 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	line	25
global __ptext1
__ptext1:	;psect for function _timer_0
psect	text1
	file	"main.c"
	line	25
	
_timer_0:	
;incstack = 0
	callstack 7
; Regs used in _timer_0: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_timer_0+0)
	movf	pclath,w
	movwf	(??_timer_0+1)
	ljmp	_timer_0
psect	text1
	line	27
	
i1l560:	
;main.c: 27: if(INTCONbits.TMR0IF == 1)
	btfss	(11),2	;volatile
	goto	u1_21
	goto	u1_20
u1_21:
	goto	i1l18
u1_20:
	line	29
	
i1l562:	
;main.c: 28: {;main.c: 29: Timer_count++;
	movlw	low(01h)
	addwf	(_Timer_count),f
	line	30
	
i1l564:	
;main.c: 30: INTCONbits.TMR0IF = 0;
	bcf	(11),2	;volatile
	line	32
	
i1l18:	
	movf	(??_timer_0+1),w
	movwf	pclath
	swapf	(??_timer_0+0),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	callstack 0
GLOBAL	__end_of_timer_0
	__end_of_timer_0:
	signat	_timer_0,89
global	___latbits
___latbits	equ	2
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
