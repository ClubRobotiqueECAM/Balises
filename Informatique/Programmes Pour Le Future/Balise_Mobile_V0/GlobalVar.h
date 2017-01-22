/*
 *
 * Objectifs:
 *   Regrouper toutes les Variables globales
 *   necessaires pour la balise mobile
 *
 * Si vous avez des questions contactez-nous:
 *   @auteur Maxence Beroujon
 *   @auteur Bruno Bellier    bru.bellier38@gmail.com
 *
 * Copyright (c) 2016
 *   Vous pouvez en faire ce que vous voulez! Mais surtout assez de ne pas le perdre :p
 *   Ce programme ne peut être responsable d'aucune détérioration matériel.
 *   Pour la distribution, consultez la licence de MIRF :p
 *
 * Pins hardware SPI for nano:
 *   GND             Noir (pin 1)
 *   Alim (3.3V)    Rouge (pin 2)
 *   MISO -> 12      Vert (pin 7)
 *   MOSI -> 11     Jaune (pin 6)
 *   SCK ->  13      Bleu (pin 5)
 *
 * Configurable:
 *   CE -> 9       Jaune (pin 3)
 *   CSN -> 10      Vert (pin 4)
 */

#ifndef _GLOBALVAR_
#define _GLOBALVAR_

#include "Mirf.h" // gestion de la communication 
#include "Mirf_nRF24L01.h" // définition des registres du nRF24L01 
#include "MirfHardwareSpiDriver.h" // communication SPI nRF24L01

//Parametres Debug
bool debug = true;
bool debugHF = false;
bool debugUS = true;
bool bProcessing = true;
//long DebutDeMot = 0;
bool etatPin = 0;
int OscilloPin = 8;
//Fin Debug

const int T = 19;

/* Pour le HF */
const byte cePin = 9;
const byte csnPin = 10;
int motHF = 0;  // contient le mot HF à recu
byte motHF_octet[2]; // contient le mot HF découpée en octet pour la réception
long dateHFRecu;

/* Pour l'US */
const int interruptionPin = 2; // soit 2 soit 3
const int nbBits = 5;       //nb de bits + 1
const long iBaseTemps = 7000; // en microsecondes
const long fourchette = 7000;
const long bitStart = iBaseTemps * 6 - fourchette / 2;
const long bitUn = iBaseTemps * 8 - fourchette / 2;
const long bitZero = iBaseTemps * 4 - fourchette / 2;

int i = 1;
byte motUS = 0x00;
long dateAnalyse = 0;
long derniereDateAnalysee = 0;
long dateBitStart = 0;

/* Distance mesuree et position */
long tabDistances[] = {0, 0, 0, 0}; //Un drapeau pour connaitre l'état du tableau + 3 distances
long tabCoordonnee[] = {0, 0};

#endif /* _GLOBALVAR_ */
