#ifndef _UTILS_
#define _UTILS_

#include "global.h"

typedef unsigned char  u08;
typedef unsigned short u16;
typedef unsigned long u32;
typedef unsigned long long u64;
typedef signed char  s08;
typedef signed short s16;
typedef signed long s32;
typedef signed long long s64;


#define extr16_08_0(i) (*(char *)(&i))
#define extr16_08_1(i) (*((char *)(&i)+1))

#define extr32_16_0(i) (*(int *)(&i)) // poids faible
#define extr32_16_1(i) (* (((int *)(&i)) +1)) //poids fort
#define extr32_16_23(i) (*((int *)((char *)(&i)+1))) // les 2 octets du milieu

#define extr32_08_0(i) (*(char *)(&i))
#define extr32_08_1(i) (*((char *)(&i)+1))
#define extr32_08_2(i) (*((char *)(&i)+2))
#define extr32_08_3(i) (*((char *)(&i)+3))


void eeprom_ww(u16 addr, u16 val);
u32 eeprom_r32(u16 addr);
u32 eeprom_r24(u16 addr);

#define nop() __asm__ __volatile__ ("NOP") ;
#define rien() __asm__ __volatile__ (" ") ;

#define LED1ON() {sbi(LED1PORT,LED1BIT);}
#define LED1OFF() {cbi(LED1PORT,LED1BIT);}
#define LED1TOGGLE() {if(bit_is_set(LED1PIN,LED1BIT)) cbi(LED1PORT,LED1BIT); else sbi(LED1PORT,LED1BIT);}

#define LED2ON() {sbi(LED2PORT,LED2BIT);}
#define LED2OFF() {cbi(LED2PORT,LED2BIT);}
#define LED2TOGGLE() {if(bit_is_set(LED2PIN,LED2BIT)) cbi(LED2PORT,LED2BIT); else sbi(LED2PORT,LED2BIT);}

#define LED3ON() {sbi(LED3PORT,LED3BIT);}
#define LED3OFF() {cbi(LED3PORT,LED3BIT);}
#define LED3TOGGLE() {if(bit_is_set(LED3PIN,LED3BIT)) cbi(LED3PORT,LED3BIT); else sbi(LED3PORT,LED3BIT);}

#define LED4ON() {sbi(LED4PORT,LED4BIT);}
#define LED4OFF() {cbi(LED4PORT,LED4BIT);}
#define LED4TOGGLE() {if(bit_is_set(LED4PIN,LED4BIT)) cbi(LED4PORT,LED4BIT); else sbi(LED4PORT,LED4BIT);}

#define LED5ON() {sbi(LED5PORT,LED5BIT);}
#define LED5OFF() {cbi(LED5PORT,LED5BIT);}
#define LED5TOGGLE() {if(bit_is_set(LED5PIN,LED5BIT)) cbi(LED5PORT,LED5BIT); else sbi(LED5PORT,LED5BIT);}

#define LED6ON() {sbi(LED6PORT,LED6BIT);}
#define LED6OFF() {cbi(LED6PORT,LED6BIT);}
#define LED6TOGGLE() {if(bit_is_set(LED6PIN,LED6BIT)) cbi(LED6PORT,LED6BIT); else sbi(LED6PORT,LED6BIT);}

#define LED7ON() {sbi(LED7PORT,LED7BIT);}
#define LED7OFF() {cbi(LED7PORT,LED7BIT);}
#define LED7TOGGLE() {if(bit_is_set(LED7PIN,LED7BIT)) cbi(LED7PORT,LED7BIT); else sbi(LED7PORT,LED7BIT);}

#define LED8ON() {sbi(LED8PORT,LED8BIT);}
#define LED8OFF() {cbi(LED8PORT,LED8BIT);}
#define LED8TOGGLE() {if(bit_is_set(LED8PIN,LED8BIT)) cbi(LED8PORT,LED8BIT); else sbi(LED8PORT,LED8BIT);}

#ifdef CARTE2
#define MOTEURON() {sbi(MOTEURPORT,MOTEURBIT);}
#define MOTEUROFF() {cbi(MOTEURPORT,MOTEURBIT);}
#else
#define MOTEURON() {cbi(MOTEURPORT,MOTEURBIT);}
#define MOTEUROFF() {sbi(MOTEURPORT,MOTEURBIT);}
#endif

#define LASERON() {sbi(LASERPORT,LASERBIT); statut|=0x20;}
#define LASEROFF() {cbi(LASERPORT,LASERBIT); statut&=(~0x20);}

#endif
