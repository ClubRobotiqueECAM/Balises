#include "global.h"
#include "math.h" //Attention : Compiler avec -lm
#include "printf_P.h"
#include "SPIpfd.h"

#define ATTENTE 0
#define START 1
#define BALISE0 2
#define INTERMEDIAIRE_BAL0_BAL1 3
#define BALISE1 4
#define BALISE2 5
#define BALISE3 6
#define ECHEC 100

volatile u16 tempsRec1Start=0; 
volatile u16 tempsRec2Start=0; 
volatile u16 tempsRec1Precedent=0; 
volatile u16 tempsRec2Precedent=0; 
volatile u16 tempsRec1Actuel=0; 
volatile u16 tempsRec2Actuel=0; 
volatile u08 etatTrameRec1=0;
volatile u08 etatTrameRec2=0;
volatile s08 baliseChoppee=0;
volatile u16 tempsLastBaliseRec1=0;
volatile u16 tempsLastBaliseRec2=0;

volatile u16 topTourActuel=0;
volatile u16 topTourPrecedent=0;
volatile u16 topTourActuelStocke;
volatile u16 topTourPrecedentStocke;
volatile u16 ancienTopTourBaliseStocke;
volatile u16 topTourBaliseStocke;

// position en x
//u16 posBalise[4] = {0,60,150,210};
u16 posBalise[4] = {7,62,152,210};


#ifdef CARTE2
#define INV1 !
#else
#define INV1  
#endif

SIGNAL(SIG_INTERRUPT0) // autres interruptions non autorisees
{
  u16 tps;

  *((char *)(&tempsRec1Actuel))=TCNT1L;
  *((((char *)(&tempsRec1Actuel))+1))=TCNT1H;
  
  tps=tempsRec1Actuel - tempsRec1Precedent;

  // test  
  /*
  if(tps > (TEMPS_MOYEN_REC1*3+TOLERANCE_REC1))
    {
      LED3OFF();
      LED2OFF();
      LED1ON();
    }
  else if(tps > (TEMPS_MOYEN_REC1*2+TOLERANCE_REC1))
    {
      LED3OFF();
      LED2ON();
      LED1OFF();
    }
  else if(tps > (TEMPS_MOYEN_REC1+TOLERANCE_REC1))
    {
      LED3OFF();
      LED2ON();
      LED1ON();
    }
  else if(tps > (TEMPS_MIN_REC1))
    {
      LED3ON();
      LED2OFF();
      LED1OFF();
    }
  else
    {
      LED3ON();
      LED2OFF();
      LED1ON();
    }
  */
  /*
  if(INV1 !bit_is_clear(PIN_RECEPTEUR1,BIT_RECEPTEUR1)) // si transition 0->1
    {
      LED4ON();
    }
  else
    {
      LED4OFF();
    }
  */

  switch(etatTrameRec1)
    {
      
    case ATTENTE:

      if( INV1 !bit_is_clear(PIN_RECEPTEUR1,BIT_RECEPTEUR1)) // si transition 0->1
	{
	  etatTrameRec1=START;
	  tempsRec1Start=tempsRec1Actuel;
	  ancienTopTourBaliseStocke = topTourBaliseStocke;
	  topTourBaliseStocke = topTourActuel;
	}
      else
	  etatTrameRec1=ECHEC;
      break;

    case START:

      if( INV1 bit_is_clear(PIN_RECEPTEUR1,BIT_RECEPTEUR1)) // si transition 1->0
	{
	  if(tps > (TEMPS_MOYEN_REC1*3+TOLERANCE_REC1))
	    {
	      etatTrameRec1=ECHEC;
	    }
	  else if(tps > (TEMPS_MOYEN_REC1*2+TOLERANCE_REC1))
	    {
	      etatTrameRec1=BALISE3;
	    }
	  else if(tps > (TEMPS_MOYEN_REC1+TOLERANCE_REC1))
	    {
	      etatTrameRec1=BALISE2;
	    }
	  else if(tps > (TEMPS_MIN_REC1))
	    {
	      etatTrameRec1=BALISE0;
	    }
	  else
	    {
	      etatTrameRec1=ECHEC;
	    }
	}
      else
	etatTrameRec1=ECHEC;
      break;

    case BALISE0:
      if(INV1 !bit_is_clear(PIN_RECEPTEUR1,BIT_RECEPTEUR1)) // si transition 0->1
	{
	  if(tps > (TEMPS_MOYEN_REC1*2+TOLERANCE_REC1))
	    {
	      // BALISE 0 detectee
	      LED8ON();
	      baliseChoppee=0; 
	      etatTrameRec1=START;
	      tempsLastBaliseRec1=tempsRec1Start;
	      tempsRec1Start=tempsRec1Actuel;
	      topTourActuelStocke=topTourActuel;
	      topTourPrecedentStocke=topTourPrecedent;
	      ancienTopTourBaliseStocke = topTourBaliseStocke;
	      topTourBaliseStocke = topTourActuel;
	    }
	  else if( (tps > (TEMPS_MIN_ETAT_BAS_REC1)) && (tps < (TEMPS_MOYEN_REC1+TOLERANCE_REC1)) )
	    {
	      etatTrameRec1=INTERMEDIAIRE_BAL0_BAL1;
	    }
	  else
	    {
	      etatTrameRec1=ECHEC;
	    }
	}   
      else
	{
	  etatTrameRec1=ECHEC;
	}
      break;
      
    case INTERMEDIAIRE_BAL0_BAL1:
      if(INV1 bit_is_clear(PIN_RECEPTEUR1,BIT_RECEPTEUR1)) // si transition 1->0
	{
	  if( (tps > (TEMPS_MIN_REC1)) && (tps < (TEMPS_MOYEN_REC1+TOLERANCE_REC1)) )
	    {
	      etatTrameRec1=BALISE1;
	    }
	  else
	    {
	      etatTrameRec1=ECHEC;
	    }
	}
      else
	{
	  etatTrameRec1=ECHEC;
	}
      break;

    case BALISE1:
      if(INV1 !bit_is_clear(PIN_RECEPTEUR1,BIT_RECEPTEUR1)) // si transition 0->1
	{
	  if(tps > (TEMPS_MIN_REC1))
	    {
	      LED7ON();
	      // BALISE 1 detectee
	      baliseChoppee=1; 
	      etatTrameRec1=START;
	      tempsLastBaliseRec1=tempsRec1Start;
	      tempsRec1Start=tempsRec1Actuel;
	      topTourActuelStocke=topTourActuel;
	      topTourPrecedentStocke=topTourPrecedent;
	      ancienTopTourBaliseStocke = topTourBaliseStocke;
	      topTourBaliseStocke = topTourActuel;
	    }
	  else
	    {
	      etatTrameRec1=ECHEC;
	    }
	}
      else
	{
	  etatTrameRec1=ECHEC;
	}
      break;

    case BALISE2:
      if(INV1 !bit_is_clear(PIN_RECEPTEUR1,BIT_RECEPTEUR1)) // si transition 0->1
	{
	  if(tps > (TEMPS_MOYEN_REC1+TOLERANCE_REC1))
	    {
	      LED6ON();
	      // BALISE 2 detectee
	      baliseChoppee=2; 
	      etatTrameRec1=START;
	      tempsLastBaliseRec1=tempsRec1Start;
	      tempsRec1Start=tempsRec1Actuel;
	      topTourActuelStocke=topTourActuel;
	      topTourPrecedentStocke=topTourPrecedent;
	      ancienTopTourBaliseStocke = topTourBaliseStocke;
	      topTourBaliseStocke = topTourActuel;

	    }
	  else
	    {
	      etatTrameRec1=ECHEC;
	    }
	}
      else
	{
	  etatTrameRec1=ECHEC;
	}
      break;

    case BALISE3:
      if(INV1 !bit_is_clear(PIN_RECEPTEUR1,BIT_RECEPTEUR1)) // si transition 0->1
	{
	  if(tps > (TEMPS_MIN_REC1))
	    {
	      LED5ON();
	      // BALISE 3 detectee
	      baliseChoppee=3; 
	      etatTrameRec1=START;
	      tempsLastBaliseRec1=tempsRec1Start;
	      tempsRec1Start=tempsRec1Actuel;
	      topTourActuelStocke=topTourActuel;
	      topTourPrecedentStocke=topTourPrecedent;
	      ancienTopTourBaliseStocke = topTourBaliseStocke;
	      topTourBaliseStocke = topTourActuel;
	    }
	  else
	    {
	      etatTrameRec1=ECHEC;
	    }
	}
      else
	{
	  etatTrameRec1=ECHEC;
	}
      break;

      // echec :
    default: // comme attente mais avec resynchronisation
      //      LED2ON();
      if(INV1 !bit_is_clear(PIN_RECEPTEUR1,BIT_RECEPTEUR1)) // si transition 0->1
	{
	  if(tps > TEMPS_MAX_REC1)
	    {
	      //      LED2OFF();
	      etatTrameRec1=START;
	      tempsRec1Start=tempsRec1Actuel;
	      ancienTopTourBaliseStocke = topTourBaliseStocke;
	      topTourBaliseStocke = topTourActuel;
	    }
	}
      break;
    }
  
  tempsRec1Precedent=tempsRec1Actuel;
}


SIGNAL(SIG_INTERRUPT1)// autres interruptions non autorisees
{
  *((char *)(&tempsRec2Actuel))=TCNT1L;
  *((((char *)(&tempsRec2Actuel))+1))=TCNT1H;

  tempsRec2Precedent=tempsRec2Actuel;
}

void calculePosition(u16 * angles, u08 * num)
{
  s16 x,y,a,a2;
  float Xbalise1=posBalise[num[0]] ;
  float alpha1= (float)((angles[1]-angles[0])%32768) * 2 * 3.1415926539 / 32768.0;
  float alpha2= (float)((angles[2]-angles[1])%32768) * 2 * 3.1415926539 / 32768.0;;
  float tanAlpha1,tanAlpha2;
  float distBalise1Balise2 = posBalise[num[1]] - Xbalise1 ;
  float distBalise2Balise3= posBalise[num[2]] - posBalise[num[1]];
  float tanAlpha1Carre,tanAlpha2Carre;
  float distBalise2Balise3Carre=distBalise2Balise3*distBalise2Balise3;
  float distBalise1Balise2Carre = distBalise1Balise2*distBalise1Balise2;
  float tanA2C_tanA1C;
  float denominateur;

  //  debug_printf("balise %d -> %d %d\r\n",num[0],num[1],(s16)(alpha1*180/3.14159));
  //  debug_printf("balise %d -> %d %d\r\n",num[1],num[2],(s16)(alpha2*180/3.14159));

  tanAlpha1 = tan(alpha1);
  tanAlpha2 = tan(alpha2);
  
  tanAlpha1Carre=tanAlpha1*tanAlpha1;
  tanAlpha2Carre=tanAlpha2*tanAlpha2;
  tanA2C_tanA1C = (tanAlpha2Carre)*(tanAlpha1Carre);

  denominateur = (tanA2C_tanA1C*distBalise2Balise3Carre +2*tanA2C_tanA1C*(distBalise2Balise3)*distBalise1Balise2
		  +tanA2C_tanA1C*distBalise1Balise2Carre +distBalise1Balise2Carre*(tanAlpha2Carre)
		  -2*distBalise1Balise2*tanAlpha2*(distBalise2Balise3)*tanAlpha1
		  +(distBalise2Balise3Carre)*(tanAlpha1Carre));

  x=(s16)(( (distBalise1Balise2*tanAlpha2-distBalise2Balise3*tanAlpha1)
      *distBalise1Balise2*(distBalise2Balise3)*(tanAlpha1+tanAlpha2))
    / denominateur 
    + Xbalise1+distBalise1Balise2);

  y=(s16)((tanAlpha2*tanAlpha1*((distBalise2Balise3)+distBalise1Balise2)*distBalise1Balise2*(distBalise2Balise3)*(tanAlpha1+tanAlpha2))
    / denominateur ) - POSITION_Y_BALISE;
  
  a=(s16)(atan2((float)x-Xbalise1,(float)(y+POSITION_Y_BALISE)) * 180.0 / 3.1415926539);
  a2=a;

  a -= (s16)((float)(angles[0]%32768)* 360.0 / 32768.0);
  a += CORRECTION_ANGLE + 360 * 5; // le 360*5 c'est car le modulo renvoie un trec negatif sinon
  a %= 360;

  x += sin((float)a)*DIST_CENTRE_ROBOT;
  y -= cos((float)a)*DIST_CENTRE_ROBOT;

  // si on est en dehors du terrain
  if( (x<0) || (x>LARGEUR_TERRAIN) || (y<0) || (y>LONGUEUR_TERRAIN) )
    x=-1;
  
  SPCR &= (~(1<<SPIE)); // desactive intrp spi
  pos.x=x;
  pos.y=y;
  pos.a=a;
  SPCR |= (1<<SPIE); // active intrp spi

  //  debug_printf("reel:%d mesure:%d final:%d\r\n",a2,(s16)((float)(angles[0]%32768)* 360.0 / 32768.0),a);
  

  //  debug_printf("%d %d\r\n",(s16)y,(s16)x);
  // delay_ms(1000);
  
}
