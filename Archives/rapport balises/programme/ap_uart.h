#ifndef _AP_UART_H_
#define _AP_UART_H_

#include "global.h"

#ifdef GCC33
#include <avr/pgmspace.h>
#else
#include <progmem.h>
#endif

#define  FCLK 8000000ul
#define UART_BAUD    38400ul

#define UART_CONST (FCLK/(16ul*UART_BAUD)-1)
/*#define BAUD_ERR   (UART_BAUD-(FCLK/(16ul*(UART_CONST+1))))

#if (BAUD_ERR != 0 || UART_CONST>255)
	#error "UART baud rate is inaccurate!"
#endif
*/
#define PTRTYPE_RAM   0
#define PTRTYPE_FLASH 1

void uart_init(void);
void uart_sendchar(char c);
void uart_sendstr(char *pc, unsigned char pt);

#define PRGPRINT(s) uart_sendstr(PSTR(s), PTRTYPE_FLASH);

#endif
