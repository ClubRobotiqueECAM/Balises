 
/*Ici nous codons toutes les Variables et Constantes globales necessaires
 * 
      émission d’une valeur integer via module nRF24L01 
 * Pins hardware SPI for nano:
 * GND            Noir  (pin 1)
 * Alim (3.3V)    Rouge (pin 2)
 * MISO -> 12     Vert  (pin 7)
 * MOSI -> 11     Jaune (pin 6)
 * SCK -> 13      Bleu  (pin 5)
 *
 * Configurable:
 * CE -> ?       Jaune (pin 3)
 * CSN -> 10       Vert (pin 4)
 * Pins pour selectionner & afficher le nom de la balise
 * Analog pins A0~A5 are normal pins. You can refer to them as pins 14-19 as well.
 * btnPin=A3~A5 17~19
 * ledPin=A0~A2 14~16
 * 
 * SortieUSPin=8
 */

#ifndef _CONS_VARS_
  #define _CONS_VARS_
   
  const byte iLength=4;                //longueur du mot a transmettre MAX 8
  const byte cePin=9;
  const byte csnPin=10;//53
  const byte ledPin[]={14, 15, 16};    // PortC 0-2
  const byte btnPin[]={17, 18, 19};    // PortC 3-5
  const byte iNumPin=6;                //choix de la pin modulant le signal
  
  byte idBalise=0;              //Numéro de la balise
  byte motTransmis = 0x04;      // contient la valeur à envoyer
  
  /*Pour le HF*/
  byte* myAdresses[]={(byte*)"BFixe", (byte*)"Bali1", (byte*)"Bali2",(byte*) "Bali3"};
  
  byte valeur_octet[2];// contient la valeur découpée en octet pour l’envoi

  #include "Mirf.h"                            // gestion de la communication 
  #include "Mirf_nRF24L01.h"                   // définition des registres du nRF24L01 
  #include "MirfHardwareSpiDriver.h"           // communication SPI nRF24L01
  //#include <Arduino.h>
  
  /*Pour l'US*/
  const byte iBaseTemps=7;             //temps de ref en milliseconde
  const byte iBitStart=5*iBaseTemps;   //5 base de temps a 1
  const byte iBitUn=7*iBaseTemps;      //7 base de temps a 1
  const byte iBitZero=3*iBaseTemps;    //3 base de temps a 1
  const byte iBitFin=1*iBaseTemps;     //1 base de temps a 1
  

#endif /* _CONS_VARS_ */
