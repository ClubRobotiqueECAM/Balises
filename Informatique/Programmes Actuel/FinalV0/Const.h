/* 
    réception d’une valeur integer via module nRF24L01 
    Programme de Reception HF uniquement
 *
 * Pins:
 * Hardware SPI:
 * GND             Noir (pin 1)
 * Alim (3.3V)    Rouge (pin 2)
 * MISO -> 50      Vert (pin 7)
 * MOSI -> 51     Jaune (pin 6)
 * SCK -> 52       Bleu (pin 5)
 *
 * Configurable:
 * CE -> 9        Jaune (pin 3)
 * CSN -> 53       Vert (pin 4)
*/

#ifndef _CONST
#define _CONST

#include "Mirf.h" // gestion de la communication 
#include "Mirf_nRF24L01.h" // définition des registres du nRF24L01 
#include "MirfHardwareSpiDriver.h" // communication SPI nRF24L01

// Pins
  const byte cePin = 9;
  const byte csnPin = 10;
  const int interruptionPin=2;// soit 2 soit 3

//Parametres Recepteur US
    const int nbBits=5;         //nb de bits + 1 
    const long iBaseTemps=7000; // en microsecondes
    const long fourchette=7000;
    const long bitStart=iBaseTemps*6-fourchette/2;
    const long bitUn=iBaseTemps*8-fourchette/2;    
    const long bitZero=iBaseTemps*4-fourchette/2;
    const int T=19;
    
    int i=1;
    byte donneeRecu=0x00;
    long dateAnalyse=0;
    long derniereDateAnalysee=0;
    long dateBitStart=0;

// HF
  int valeur = 0;  // contient la valeur à recevoir 
  byte valeur_octet[2]; // contient la valeur découpée en octet pour la réception

  long dateHFRecu;
// Distance mesuree et position

  long tabDistances[]={0,0,0,0};//Un drapeau pour connaitre l'état du tableau + 3 distances
  long tabCoordonnee[]={0,0};

//Parametres Debug
  long DebutDeMot=0;
  bool etatPin=0;
  int OscilloPin=8;
  bool debug = false;
  bool debugHF = false;
  bool debugUS = false;
  bool bProcessing = true;
//Fin Debug



#endif /* _CONST */
