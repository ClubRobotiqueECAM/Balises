#include "global.h"
#include "SPIpfd.h"
#include "rtc.h"
#include "traite.h"
#include "printf_P.h"
#include "utils.h"
#include "ap_uart.h"
#include "debug.h"

u08 volatile cptINTR=0; // compteur incrémenté à chaque interruption externe

extern volatile s08 baliseChoppee;
extern volatile u16 tempsLastBaliseRec1;
extern volatile u16 tempsLastBaliseRec2;
extern volatile u08 etatTrameRec1;

extern volatile u16 nbTours;
extern volatile u16 topTourActuel;
extern volatile u16 topTourPrecedent;
extern volatile u16 topTourActuelStocke;
extern volatile u16 topTourPrecedentStocke;
extern volatile u16 ancienTopTourBaliseStocke;


// a virer
extern volatile u16 valMoteurProportionnel;
extern volatile u16 valMoteurIntegral;
extern volatile u16 valMoteur;
extern volatile s32 erreur;


position pos;
u08 statut=0;
u16 tempsDernierCalcul=0;

u16 ancienAngleBalise[5];
u16 angleBalise[5]; // la balise 5 est le robot adv
u16 tempsBalise[5]; 

u16 litNbTours(void)
{
  u16 tps;

  do // lit deux fois au cas ou intrpt
    {
      tps = nbTours;
    }
  while(tps != nbTours);

  return tps;
}

void init(void)
{
  // initialisations :
  DDRA=VAL_DDRA;
  DDRB=VAL_DDRB;
  DDRC=VAL_DDRC;
  DDRD=VAL_DDRD;

  // timer 1 à clk/8
  //  TCCR1A = 0x83;
  TCCR1A=0;
#ifdef CARTE2
  TCCR1B = 0x02; // CK/8
#else 
  TCCR1B = 0x42; // CK/8
#endif  

  // pwm tourelle
  TCCR2=0x04; // CK/64

  // interruption timer 1 input capture + overflow - > actifs
  // intrp timer 2 input capture + overflow - > actifs
  TIMSK = 0xE4;

  // activation des interruptions exterieures
  GIMSK = 0xC0;
  MCUCR = 0x05;

  // variables
  pos.x=-1; // -1 signifie mesure pas faite ou pas fiable
  pos.y=0;
  pos.a=0;

  LED4OFF();

  /*
  // moteur a 75 % au depart (attention c'est inverse)
  OCR1AH=0x01;
  OCR1AL=0x00;
  */
}

void laserTest(void)
{
  cli();
  LASERON();
  MOTEUROFF();
  while(1);
}

int main(void)
{
  s16 differenceAngle;
  u16 angleBaliseValides[4];
  u08 numBaliseValides[4];
  u08 n;
  u16 tps;
  u16 cpt_timeout=0;
  u08 nombreBaliseChoppee=0;

  u08 i;

  initRtc();
  init();
  initSPI();
  uart_init();
  
  LASERON();
  MOTEURON();

  // reglage du laser 
  //  laserTest();

  sei();

  debug_printf("Demarrage\r\n");
  delay_ms(500);
  debug_printf("the Demarrage\r\n");

  while(1)
    {
      /* MESURE DE L'ANGLE */

      baliseChoppee =-1;
      cpt_timeout=0;
      while(baliseChoppee == -1)
	{
	  cpt_timeout++;
	  if(cpt_timeout > 10000)
	    {
	      statut &= 0xF0; // invalide les balises dans les statuts
	    }
	  delay_4cyc(10);
	}

      ancienAngleBalise[baliseChoppee] = angleBalise[baliseChoppee];
      
      angleBalise[baliseChoppee] = (( ((u32)(tempsLastBaliseRec1 - ancienTopTourBaliseStocke)) << 15) / (u32)(topTourActuelStocke - topTourPrecedentStocke))%32768;
      tempsBalise[baliseChoppee] = litNbTours();
      nombreBaliseChoppee++;
      


      if((baliseChoppee == 3)||(nombreBaliseChoppee>4))
	{
	  nombreBaliseChoppee=0;
	  n=0; 

	  tps=litNbTours();
	  for(i=0 ; i<4 ; i++)
	    {
	      differenceAngle = (s16)angleBalise[i] - (s16)ancienAngleBalise[i];
	      
	      if(differenceAngle < 0) 
		differenceAngle = -differenceAngle;
	      
	      if(  ( (tps - tempsBalise[i]) < TOLERANCE_TEMPS) && 
	      	   ( differenceAngle < TOLERANCE_ANGLE) )  // tolerance angle à mettre vers 40°
		{
		  // valide la balise
		  angleBaliseValides[n] = angleBalise[i];
		  numBaliseValides[n++] = i;
		  statut |= (1<<i); // valide la balise dans les statuts
		  
		}
	      else
		{
		  statut &= (~(1<<i)); // invalide la balise dans les statuts
		}
	    }
	  
	  if(n>=3) // si on a au moins trois balises valides
	    {
	      LED3ON();
	      calculePosition(angleBaliseValides,numBaliseValides);
	      LED3OFF();
	      tempsDernierCalcul = litNbTours();
	      debug_printf("x:%d,y:%d,a:%d\r\n", pos.x,pos.y,pos.a);
	      /*	  debug_printf("balise %d %d\r\n",numBaliseValides[0],angleBaliseValides[0]);
			  debug_printf("balise %d %d\r\n",numBaliseValides[1],angleBaliseValides[1]);
			  debug_printf("balise %d %d\r\n",numBaliseValides[2],angleBaliseValides[2]);*/
	    }
	  
	  // invalide le calcul si trop vieux
	  if( (litNbTours() - tempsDernierCalcul) > TPS_CALCUL_INVALIDE)
	    {  
	      SPCR &= (~(1<<SPIE)); // desactive intrp spi
	      pos.x=-1;
	      SPCR |= (1<<SPIE); // active intrp spi
	    }
	}
    }
  return 0;
}
























