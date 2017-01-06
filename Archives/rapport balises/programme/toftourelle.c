#include "global.h"
#include "utils.h"
#include "SPIpfd.h"

volatile u08 tourelleTimeout=0;
volatile u16 nbTours=0;
volatile u16 temps65536us=0;

extern volatile u16 topTourActuel;
extern volatile u16 topTourPrecedent;

volatile s32 asservtest;
volatile s32 valMoteurProportionnel;
volatile s16 valMoteurIntegral=0;
volatile s16 valMoteur;

INTERRUPT(SIG_OUTPUT_COMPARE2)
{
  MOTEUROFF();
  LED4TOGGLE();
}

INTERRUPT(SIG_OVERFLOW2)
{
  MOTEURON();
  LED3TOGGLE();
}

// interruption top tour tourelle
SIGNAL(SIG_INPUT_CAPTURE1)// autres interruptions non autorisees
{
  tourelleTimeout=3;
  LED1TOGGLE();
  topTourPrecedent=topTourActuel;
  *((char *)(&topTourActuel))=ICR1L;
  *(((char *)(&topTourActuel)+1))=ICR1H;
  nbTours++;
  temps65536us=0;
}

// dépassement timer toutes les 65536 us
INTERRUPT(SIG_OVERFLOW1)// autres interruptions autorisees
{
  #define VAL_MAX_PROPORTIONNEL 16000
  #define VAL_MAX_INTEGRAL 16000
  #define VAL_MAX_TOTAL 32767
  #define GAIN_PROPORTIONNEL 5
  #define DIVISEUR_INTEGRAL 1000 // infini

  


  asservtest=topTourActuel-topTourPrecedent;


  if(temps65536us!=0) // moteur beaucoup trop lent (moins de 1 tour par 65ms)
    {
      OCR2= 255;
    }
  else
    {
      if ((asservtest > TPS_ROTATION_TOURELLE)&&(OCR2 != 255))
	OCR2 ++;
      else if ((asservtest < TPS_ROTATION_TOURELLE)&&(OCR2 != 0))
	OCR2 --;
    }



  /*
  if( ((u16)(topTourActuel-topTourPrecedent) < (u16)TPS_ROTATION_TOURELLE) && (temps65536us==0))
    {
      MOTEUROFF();
    }
  else
    {
      MOTEURON();
    }
  */

  if(tourelleTimeout==0)
    {
      //      LASEROFF();
    }
  else
    {
      tourelleTimeout--;
      LASERON();
    }
  temps65536us++;
}

