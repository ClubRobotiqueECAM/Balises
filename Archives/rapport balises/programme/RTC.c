/* TIMERS: RTC + gestion temps asserv
on utilise ici le debordement dze timer0 toutes les 256us
sec est l  heure en secondes, cyc represente des 3906emes de secondes
avec un quartz de 8MHz, on prend un prediviseur de 8

Le decodage de l'heure est fait par secHeure() ou secHeure2()

ne pas oublier d activer les interruptions avec sei()
*/

#include "global.h"
#include "rtc.h" // pour la structure "heure"

u16 timerRtc=0;


INTERRUPT(SIG_OVERFLOW0) // autres interruptions autorisees
{

  // RTC, toutes les 256us
  timerRtc++;

}

void initRtc()
{
  sbi(TIMSK, 0); // activation de l'interruption correspondante
  outp(0, TCNT0);        // reset TCNT0, facultatif
  outp(0x02, TCCR0); // comptage a CK/2

}


