# Simple Makefile Volker Oth (c) 1999
# edited by AVRfreaks.net nov.2001

########### change these lines according to your project ##################


#put the name of the target mcu here (at90s8515, at90s8535, attiny22,atmega603 etc.)
    MCU = atmega163
#put the name of the target file here (without extension)
	TRG	= main

#put your C sourcefiles here 
	SRC	=  traite.c rtc.c attente.c utils.c SPIpfd.c SPIpfdS.c printf_P.c tourelle.c ap_uart.c debug.c $(TRG).c

#put additional assembler source file here
	ASRC    =

#additional libraries and object files to link
	LIB	=

#additional includes to compile
	INC	=

#assembler flags
	ASFLAGS = -Wa, -gstabs

#compiler flags
	CPFLAGS	= -g  -Os -Wall -Wstrict-prototypes -Wa,-ahlms=$(<:.c=.lst)

#linker flags
	LDFLAGS = -lm -Wl,-Map=$(TRG).map,--cref


########### you should not need to change the following line #############
include $(AVR)/avrfreaks/avr_make

###### dependencies, add any dependencies you need here ###################

rtc.o : rtc.c rtc.h global.h
attente.o : attente.c attente.h global.h
utils.o : utils.c utils.h global.h
SPIpfdS.o : SPIpfdS.c SPIpfd.h global.h
SPIpfd.o : SPIpfd.c SPIpfd.h global.h
traite.o : traite.c traite.h global.h
printf_P.o : printf_P.c printf_P.h global.h
tourelle.o : tourelle.c global.h utils.h
ap_uart.o : ap_uart.c ap_uart.h global.h 
debug.o : debug.c debug.h global.h
$(TRG).o : $(TRG).c  global.h

