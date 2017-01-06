// version simple sans retour, ici la partie emission et reception sont completement independantes
// on ajoute une commande ou adresse, 1-255, 0= rien a transmettre

// SLAVE

#include "global.h"
#include "SPIpfd.h"
#include "attente.h"
#include <stdarg.h>



volatile u08 reg_EM[T_TAMPON_EM+3];// 0, donnees, taille, cmd
volatile u08 reg_RC[T_TAMPON_RC+3];// 0, cmd, taille, donnees
volatile u08 taille_RC;

volatile u08 testSPIOverflow=0;

// optimisation
#if T_TAMPON_RC >= 250
extern volatile u16 taille_RC;
volatile u16 indice_RC = 0;
#else
extern volatile u08 taille_RC;
volatile u08 indice_RC = 0;
#endif

#if T_TAMPON_EM >= 250
volatile u16 indice_EM = 0;
#else
volatile u08 indice_EM = 0;
#endif

// traitement de l interruption SPI

SIGNAL(SIG_SPI) // autres interruptions non autorisees
{

  u08 lectureSPI;

  lectureSPI = inp(SPDR);
#ifdef BCLE_LOCALE
  lectureSPI = em; // boucle locale pour les tests
#endif


  // emission

  outp(reg_EM[indice_EM], SPDR);
  sei();
  
#ifdef BCLE_LOCALE
  em = reg_EM[indice_EM];
#endif
  if (indice_EM !=0)
    indice_EM--;

  if (indice_EM ==1)
    testSPIOverflow--;

  // traitement lecture
  if ((indice_RC ==0 )&&(lectureSPI !=0))
    {
      indice_RC = 1;
      taille_RC = 0;
    }

  reg_RC[indice_RC] = lectureSPI; 

  if (indice_RC == 2) // si on est au 2 eme octet transmis, c est la taille de donnees
    {
      taille_RC = lectureSPI;
      if (taille_RC > T_TAMPON_RC)
	taille_RC = 0;
    }

  if ((indice_RC >= taille_RC + 2)/*||(indice_RC == T_TAMPON_RC+2)*/) // fin de reception, traitement
    {
      // traitement
      traitement_RC(); 
      indice_RC = 0;
    }

  if (indice_RC != 0) indice_RC ++;

}

void initSPI(void)
{
  cli();
  indice_EM = 0;
  indice_RC = 0;

  
  reg_EM[0]= 0;

  outp((1<<SPIE)|(1<<SPE)|(1<<SPR0), SPCR); // 0b11000001 , spi activee en esclave avec interruption, CK/16
  sbi(DDRB, 6); // met miso en sortie
  cbi(PORTB, 0); // vire la res de pull-up sur /SS

  outp(0x00, SPDR); // lancement

  sei();
}




#ifdef BCLE_LOCALE
u08 em = 0; // provisoire
#endif


void EM( u08 adresse, u08 taille, u08* donnees)
{
  testSPIOverflow++;
  if(testSPIOverflow > 3)
    {
      //      LED4ON();
    }
  else
    {
      //      LED4OFF();
    }
  while(indice_EM !=0)  
    {
      rien(); // attente fin emission precedente
      //      printf("attente fin em");
      //    lcd_clrscr();
    }

  cli(); 

  reg_EM[0]= 0;
  // copie des donnees dans le registre d emission (ordre inverse)
  for(  indice_EM = 1; (indice_EM  <= taille) ; indice_EM ++)
    {
      if (adresse == 0)
	reg_EM[indice_EM]= 0;
      else
	reg_EM[indice_EM]= donnees[taille - indice_EM ];
    }
  // copie taille
  reg_EM[indice_EM] = taille;
  
  indice_EM ++;
  
  // copie adresse 
  reg_EM[indice_EM] = adresse;

  sei();
}

void EMGenerique( u08 adresse, u08 taille, ...)
{
  va_list ap;
  u16 temp;

  while(indice_EM !=0)  
    {
      rien(); // attente fin emission precedente
      //      printf("attente fin em");
      //    lcd_clrscr();
    }

  cli(); 

  reg_EM[0]= 0;
  // adresse
  reg_EM[taille+2]=adresse;
  // taille
  reg_EM[taille+1]=taille;

  va_start(ap, taille);
  // La fonction avec paramètres variables interprete tous les types de données comme des
  // int. C'est pourquoi les char sont transférés comme des int, mais avec leur MSB à 0

  // copie des donnees dans le registre d emission (ordre inverse)
  for (indice_EM = taille; indice_EM > 0; indice_EM--) {
    temp=(u16)va_arg(ap, unsigned int);
    reg_EM[indice_EM] = extr16_08_0(temp);
    reg_EM[indice_EM] = extr16_08_1(temp);
  }
  va_end(ap);

  indice_EM=taille+2;

  sei();
}
