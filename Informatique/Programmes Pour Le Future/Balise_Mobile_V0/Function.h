/*
 *
 * Objectifs:
 *   Toutes les methodes pour le balise mobile
 *
 * Les methodes sont declaree puis definies, cela permet une vision globale
 * et d'inserer du code
 *
 * Si vous avez des questions contactez-nous:
 *   @auteur Maxence Beroujon
 *   @auteur Bruno Bellier    bru.bellier38@gmail.com
 *
 * Copyright (c) 2016
 *   Vous pouvez en faire ce que vous voulez! Mais surtout assez de ne pas le perdre :p
 *   Ce programme ne peut etre responsable d'aucune deterioration materiel.
 *   Pour la distribution, consultez la licence de MIRF :p
 */


#ifndef _METHODES
#define _METHODES

//
// Prototypage
//

// Cette void permet l'initialisation des parmettre du Module HF
void MirfInit(int cePin, int csnPin, int iTaille, byte * sAEcouter1, byte * sEmise);
//déclaration de la fonction d'interruption sur voie UL
void takeTheTime();
void analyseUS();
void calculDistance();
void calculPosition();
// Initialistation des variables pour le reception HF
void nettoyage();
long carre(long X);



//
// Declaration
//
void MirfInit(int cePinP, int csnPinP, int iTaille, byte * sAEcouter1, byte * sEmise) {
  Mirf.cePin = cePinP;
  Mirf.csnPin = csnPinP;

  Mirf.spi = &MirfHardwareSpi; // Utilisation du port SPI hardware
  Mirf.init(); // initialise le module SPI

  Mirf.payload = iTaille; //  Déclaration taille du message à transmettre, max 32 octets
  // Non Necessaire:
  // RF_SETUP_V=0000abcd : a=1–>2Mb/s, a=0–>1Mb/s; puissance émission bc=00–>-18 dBm, bc=01–>-12dBm, bc=10–>-6dBm, bc=11–>0dBm;
  // d=0 pas de gain sur le bruit en réception
  // RF_SETUP_V = 0x06 // 1 Mb/s et 0 dBm (puissance maximum)
  // Mirf.configRegister(RF_SETUP, RF_SETUP_V);

  Mirf.config(); // configure le canal et la taille du message
  Mirf.setTADDR(sEmise); // définition adresse sur 5 octets pour moi
  Mirf.setRADDR(sAEcouter1);  // definition adresse sur 5 octets des autres
}
//******************************************************************************************************
void takeTheTime() //déclaration de la fonction d'interruption sur voie UL
{
  dateAnalyse = micros();
}
//******************************************************************************************************
void analyseUS() {
  if (debugUS) etatPin = !etatPin;
  if (debugUS) digitalWrite(OscilloPin, etatPin);

  long lDeltaFront = (long)(dateAnalyse - derniereDateAnalysee);  // Ecart de temps entre deux fronts

  if (i == 1) { //Il n'y a pas eu de start
    if (lDeltaFront < bitStart || lDeltaFront > bitStart + fourchette) { //Si NON Start
      dateBitStart = dateAnalyse;
      i = 0;
      motUS = 0;
      /*if (debugUS) Serial.print(lDeltaFront);
      if (debugUS) Serial.println(" En attente du start");*/
    } else {
      if (debugUS) Serial.print(lDeltaFront);
      if (debugUS) Serial.print(" ms: S ");
    }
  } else { //Il y a eu un Start
    if (lDeltaFront >= bitUn && lDeltaFront <= bitUn + fourchette) { // Si c'est un 1
      bitSet(motUS, i - 2);
      if (debugUS) Serial.print(lDeltaFront);
      if (debugUS) Serial.print(" bit:1 ");
    } else if (lDeltaFront >= bitZero && lDeltaFront <= bitZero + fourchette) { // Si c'est un 0
      if (debugUS) Serial.print(lDeltaFront);
      if (debugUS) Serial.print(" bit:0 ");
    } else { // Si ce N'est PAS un 0
      dateBitStart = dateAnalyse;
      i = 0;
      motUS = 0;
      if (debugUS) Serial.print(lDeltaFront);
      if (debugUS) Serial.println(" Erreur de duree du bit");
    }
  }//fin du si
  i++;
  derniereDateAnalysee = dateAnalyse;
  dateAnalyse = 0;
}
//******************************************************************************************************
void calculDistance() {
  unsigned int DureeVoyag;
  unsigned int Dist;
  //int T=19; //temperature en degre celsus dans GlobalVar.h
  DureeVoyag = dateBitStart - (dateHFRecu + 25000);
  Dist = (331.5 + 0.607 * T) * (DureeVoyag) / 1000; //distance en mm    331.5+0.607*T(en °C)   donne des m/s (vit son 340m/s)

  if (tabDistances[motUS] == 0) {
    tabDistances[0]++;
  }
  tabDistances[motUS] = Dist;

  if (debug) {
    Serial.print(DureeVoyag);
    Serial.print(" on mesure une distance de ");
    Serial.print(Dist);
    Serial.println(" mm");
    Serial.println(" ");
  }
}
//******************************************************************************************************
void calculPosition() {
  long x = ((carre(tabDistances[1]) + carre(tabDistances[2])) / 2 - carre(tabDistances[3]) + 80000) / 600;
  long y = (carre(tabDistances[1]) - carre(tabDistances[2]) + 40000) / 400;

  tabCoordonnee[0] = x;
  tabCoordonnee[1] = y;

  if (bProcessing) {
    //Serial.print(millis()-DernierePosition);Serial.print(" ");
    // Dist1 Dist2 Dist3 x y
    Serial.print(tabDistances[1]); Serial.print(" ");
    Serial.print(tabDistances[2]); Serial.print(" ");
    Serial.print(tabDistances[3]); Serial.print(" ");
    Serial.print(tabCoordonnee[0]); Serial.print(" ");
    Serial.println(tabCoordonnee[1]);
  }

  //long DernierePosition = millis();
  tabDistances[0] = 0;
  tabDistances[1] = 0;
  tabDistances[2] = 0;
  tabDistances[3] = 0;
}
//******************************************************************************************************
void nettoyage() {
  i = 1;
  motUS = 0;
}
//******************************************************************************************************
long carre(long X) {
  return X * X;
}

#endif // _METHODES
