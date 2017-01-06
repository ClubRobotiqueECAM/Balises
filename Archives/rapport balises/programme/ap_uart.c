#include "global.h"
#include "debug.h"
#ifdef GCC33
#include <avr/signal.h>
#else
#include <sig-avr.h>
#endif
#include "ap_uart.h"

volatile static unsigned char uart_tx_busy;
static unsigned char *uart_tx_buf;
static unsigned char uart_tx_prgptr;   // zero    => uart_tx_buf pointer is to RAM,
													// no-zero => uart_tx_buf pointer is to FLASH

SIGNAL(SIG_UART_TRANS) {
	unsigned char c;
	
	if (uart_tx_buf) {
		uart_tx_buf++;
		c = uart_tx_prgptr ? PRG_RDB(uart_tx_buf) : *uart_tx_buf;
		if (c!=0)
			UDR=c;
		else {             // end of string
		        validDebugPrintf=1; // autorise un nouveau debug printf
			uart_tx_buf=0;
			uart_tx_busy=0;
		}
	} else 
		uart_tx_busy=0;
}

void uart_init(void) {
	uart_tx_prgptr=0; // default pointer type is RAM
	uart_tx_busy=0;
	uart_tx_buf=0;
	UCSRB=(1<<TXEN)|(1<<TXCIE); // enable tx, disable rx
	UBRR=12;              // set baud rate 
    /* !!! remember to enable interrupts in main program! */
}

void uart_sendchar(char c) {
	while (uart_tx_busy);
	uart_tx_busy=1;
	UDR=c;
}

void uart_sendstr(char *pc, unsigned char pt) {
	unsigned char c;

	while(uart_tx_busy);
	c = pt ? PRG_RDB(pc) : *pc;
	if (c!=0) {
		uart_tx_buf=pc;
		uart_tx_prgptr=pt;
		uart_tx_busy=1;
		
		UDR=c;
	} else {				// empty string - release uart and do nothing
		uart_tx_buf=0;
		validDebugPrintf=1; // autorise un nouveau debug printf
	}
}

