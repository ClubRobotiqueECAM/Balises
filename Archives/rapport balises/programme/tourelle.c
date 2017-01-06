#include "global.h"
#include "utils.h"
#include "SPIpfd.h"
#include "printf_P.h"

volatile u08 tourelleTimeout=0;
volatile u16 nbTours=0;
volatile u16 temps65536us=0;

extern volatile u16 topTourActuel;
extern volatile u16 topTourPrecedent;

volatile s16 erreur;
volatile s32 valMoteurProportionnel;
volatile s32 valMoteurIntegral=0;
volatile s32 valMoteur;

INTERRUPT(SIG_OUTPUT_COMPARE2)
{
  MOTEUROFF();
}

INTERRUPT(SIG_OVERFLOW2)
{
  MOTEURON();
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
  temps65536us++;
  
  LED8OFF();
  LED7OFF();
  LED6OFF();
  LED5OFF();
}

// dépassement timer toutes les 65536 us
INTERRUPT(SIG_OVERFLOW1)// autres interruptions autorisees
{
  #define VAL_MAX_PROPORTIONNEL 16383
  #define VAL_MAX_INTEGRAL 5000000
  #define VAL_MAX_TOTAL 16256 // 254 * 4
  #define GAIN_PROPORTIONNEL 2
  #define DIVISEUR_INTEGRAL 60
  #define OFFSET_ERREUR 0
  #define ERREUR_QD_MOINS_DE_1_TOUR 5000


  if(temps65536us == 0) // moteur beaucoup trop lent (moins de 1 tour par 65ms)
    {
      valMoteurProportionnel = VAL_MAX_PROPORTIONNEL;
      valMoteurIntegral += ERREUR_QD_MOINS_DE_1_TOUR ;
    }
  else
    {
      erreur = (s32)(topTourActuel-topTourPrecedent) - (s32)TPS_ROTATION_TOURELLE;
      
      valMoteurProportionnel = OFFSET_ERREUR + erreur;
      
      if(valMoteurProportionnel < 0)
	valMoteurProportionnel = 0;
    
      if(valMoteurProportionnel > (VAL_MAX_PROPORTIONNEL/GAIN_PROPORTIONNEL))
	{
	  valMoteurProportionnel = VAL_MAX_PROPORTIONNEL ;
	}
      else
	{
	  valMoteurProportionnel = valMoteurProportionnel * GAIN_PROPORTIONNEL;
	}
      
      valMoteurIntegral = erreur + valMoteurIntegral;
    }

  if(valMoteurIntegral < 0)
    valMoteurIntegral = 0;
    
  if(valMoteurIntegral > VAL_MAX_INTEGRAL)
    {
      valMoteurIntegral = VAL_MAX_INTEGRAL ;
    }

  valMoteur = valMoteurProportionnel + (valMoteurIntegral/DIVISEUR_INTEGRAL) ;

  if(valMoteur <0)
    valMoteur=0;

  if(valMoteur > VAL_MAX_TOTAL)
    valMoteur = VAL_MAX_TOTAL ;

  OCR2=(u08)(valMoteur >> 6);

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
  temps65536us=0;
}

