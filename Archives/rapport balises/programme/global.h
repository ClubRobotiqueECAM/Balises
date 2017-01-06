#ifndef _GLOBAL_
#define _GLOBAL_

#define QUARTZ 8000 // frequence du quartz en KHz, sert pour les fonctions d'attente

//#define GCC33

#define CARTE2

#ifdef GCC33
// includes generaux
#include <avr/io.h>
#include <avr/iom163.h>  // definition du processeur
#include <avr/interrupt.h>
#include <avr/signal.h>
#include <stdlib.h>

#else

// includes generaux
#include <io.h>
#include <iom163.h>  // definition du processeur
#include <interrupt.h>
#include <sig-avr.h>
#include <stdlib.h>

#endif

#include "utils.h"
#include "attente.h"

/* Utilisation des ports
PORTA : 
0-3 -> LEDs

PORTB : 
0-3 -> rien
4-7 -> SPI

PORTC :
0-7 -> rien

PORTD :
0   -> rien
1   -> Int vers CM
2-3 -> Recepteurs
4   -> Valid Laser
5   -> Valid Moteur
6   -> Top tour
7   -> rien
*/

#define VAL_DDRA 0xFF // les LEDs
#define VAL_DDRB 0x40 // 
#define VAL_DDRC 0x00 //
#define VAL_DDRD 0x32 // 

// LED1
#define LED1PORT PORTA
#define LED1PIN PINA
#define LED1BIT 0 

// LED2
#define LED2PORT PORTA
#define LED2PIN PINA
#define LED2BIT 1 

// LED3
#define LED3PORT PORTA
#define LED3PIN PINA
#define LED3BIT 2 

// LED4
#define LED4PORT PORTA
#define LED4PIN PINA
#define LED4BIT 3 

// LED5
#define LED5PORT PORTA
#define LED5PIN PINA
#define LED5BIT 4 

// LED6
#define LED6PORT PORTA
#define LED6PIN PINA
#define LED6BIT 5 

// LED7
#define LED7PORT PORTA
#define LED7PIN PINA
#define LED7BIT 6 

// LED8
#define LED8PORT PORTA
#define LED8PIN PINA
#define LED8BIT 7 

// AUTRES
#define MOTEURPORT PORTD
#define MOTEURBIT 5

#define LASERPORT PORTD
#define LASERBIT 4

#define PIN_RECEPTEUR1 PIND
#define BIT_RECEPTEUR1 2

#define PIN_RECEPTEUR2 PIND
#define BIT_RECEPTEUR2 3

//#define R38K
#define R56K

#define LONGUEUR_TERRAIN 300
#define LARGEUR_TERRAIN 210

#define TOLERANCE_ANGLE 1000 // 360° = 32768 = 15 bits de precision
#define TOLERANCE_TEMPS 3 // temps pendant lequel une balise est valide (en nb de tours)
#define CORRECTION_ANGLE -90 // decalage toptour / avant du robot en degrés
#define TPS_CALCUL_INVALIDE 2 // temps pendant lequel le calcul de position est valide (en nb de tours)
#define TPS_ROTATION_TOURELLE 40000 // en us
#define POSITION_Y_BALISE 2 // decalage en cm des balises par rapport au 0
#define DIST_CENTRE_ROBOT 10 // en cm distance du centre des roues à la balise

#ifdef R38K
// definition des tailles des tableaux enregistrant les temps de la trame
#define TEMPS_MIN_REC1 220
#define TEMPS_MAX_REC1 1000
#define TEMPS_MOYEN_REC1 266
#define TOLERANCE_REC1 (TEMPS_MOYEN_REC1/2)
#endif

#ifdef R56K
// definition des tailles des tableaux enregistrant les temps de la trame
#define TEMPS_MIN_ETAT_BAS_REC1 70
#define TEMPS_MIN_REC1 100
#define TEMPS_MAX_REC1 1000 // pour qd on recale, temps a attendre
#define TEMPS_MOYEN_REC1 210
#define TOLERANCE_REC1 130 //(TEMPS_MOYEN_REC1/2)
#endif


#endif


