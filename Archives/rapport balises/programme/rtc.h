
/* TIMERS: RTC + gestion temps asserv
on utilise ici le debordement dze timer0 toutes les 256us
sec est l  heure en secondes, cyc represente des 3906emes de secondes
avec un quartz de 8MHz, on prend un prediviseur de 8

Le decodage de l'heure est fait par secHeure() ou secHeure2()

ne pas oublier d activer les interruptions avec sei()
et d activer l asservissement si necessaire
*/


#ifndef _RTC_
#define _RTC_

extern void initRtc(void);

extern u16 timer;



#endif
