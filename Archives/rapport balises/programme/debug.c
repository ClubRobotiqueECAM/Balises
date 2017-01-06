#include "global.h"
#include "ap_uart.h"

#define TAILLE_BUF_DEBUG 64

u08 bufDebug[TAILLE_BUF_DEBUG];
u08 *ptrBufDebug=bufDebug;
u08 validDebugPrintf=1;

void emettreCharDebug(char c)
{
  if(validDebugPrintf)
    {
      // ecrit dans le buffer tant que l'on atteint pas la taille max
      if((ptrBufDebug-bufDebug) < (TAILLE_BUF_DEBUG - 1))
	*(ptrBufDebug++)=c;
    }
}

void terminerEcritureBufDebug(void)
{
  if(validDebugPrintf)
    {
      validDebugPrintf=0;
      uart_sendstr(bufDebug,0);
      ptrBufDebug=bufDebug;
    }
}

u08 estPretDebugPrintf(void)
{
  return validDebugPrintf;
}


