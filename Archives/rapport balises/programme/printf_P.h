#ifndef _PRINTF_P_H_
#define _PRINTF_P_H_

#include "global.h"

#ifdef GCC33
#include <avr/pgmspace.h>
#else
#include <progmem.h>
#endif
// on enleve les options: space # * . - + p s o O
//#define LIGHTPRINTF




extern void _printf_P (u08 fct, char const *fmt0, ...);

#define printf(fct, format, args...)   _printf_P(fct, PSTR(format) , ## args)
//#define lcd_printf(format, args...) printf(0, (format), ## args)
#define uart_printf(format, args...) printf(1,(format), ## args)
#define debug_printf(format, args...) { if(estPretDebugPrintf()) {printf(2,(format), ## args); terminerEcritureBufDebug();}}
#endif
