/*
 *
 * Objectifs:
 *   Toutes les methodes pour les balises fixes
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


#ifndef _METHODES_
#define _METHODES_

//
//Prototypage
//

//void MirfInit(cePin, csnPin, iTaille MAX 32, sAEcouter*MAX 5, sEmise);
// Cette void permet l'initialisation des parmettre du Module HF
void MirfInit(int cePin, int csnPin, int iTaille, byte * sAEcouter1, byte * sEmise);
// void MirfInit(int cePin, int csnPin, int iTaille, byte * sAEcouter1, byte * sAEcouter2, byte * sEmise);
// void MirfInit(int cePin, int csnPin, int iTaille, byte * sAEcouter1, byte * sAEcouter2, byte * sAEcouter3, byte * sEmise);
// void MirfInit(int cePin, int csnPin, int iTaille, byte * sAEcouter1, byte * sAEcouter2, byte * sAEcouter3, byte * sAEcouter4, byte * sEmise);
// void MirfInit(int cePin, int csnPin, int iTaille, byte * sAEcouter1, byte * sAEcouter2, byte * sAEcouter3, byte * sAEcouter4, byte * sAEcouter5, byte * sEmise);

// Methode qui gère le protocole de communication unifilaire pour transmettre 8 bits ou moins
// Elle utilise iLength et motTransmis
void mProtocoleEmetteur();

//Envoyer les données contenues dans valeur_octet avec une tempo de check en µs
void envoyerDataHF(int iTempo);


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
  Mirf.setRADDR(sAEcouter1); // définition adresse sur 5 octets des autres
}
//******************************************************************************************************
/*void MirfInit(int cePin,int csnPin, int iTaille, byte * sAEcouter1, byte * sAEcouter2, byte * sEmise){
  MirfInit(cePin, csnPin, iTaille, sAEcouter1, sEmise);
  Mirf.setMultiRADDR(sAEcouter2,2);
}
//******************************************************************************************************
void MirfInit(int cePin,int csnPin, int iTaille, byte * sAEcouter1, byte * sAEcouter2, byte * sAEcouter3, byte * sEmise){
  MirfInit(cePin, csnPin, iTaille, sAEcouter1, sAEcouter2, sEmise);
  Mirf.setMultiRADDR(sAEcouter3,3);
}
//******************************************************************************************************
void MirfInit(int cePin,int csnPin, int iTaille, byte * sAEcouter1, byte * sAEcouter2, byte * sAEcouter3, byte * sAEcouter4, byte * sEmise){
  MirfInit(cePin, csnPin, iTaille, sAEcouter1, sAEcouter2, sAEcouter3, sEmise);
  Mirf.setMultiRADDR(sAEcouter4,4);
}
//******************************************************************************************************
void MirfInit(int cePin,int csnPin, int iTaille, byte * sAEcouter1, byte * sAEcouter2, byte * sAEcouter3, byte * sAEcouter4, byte * sAEcouter5, byte * sEmise){
  MirfInit(cePin, csnPin, iTaille, sAEcouter1, sAEcouter2, sAEcouter3, sAEcouter4, sEmise);
  Mirf.setMultiRADDR(sAEcouter5,5);
}*/
//******************************************************************************************************
void mProtocoleEmetteur() {
  long lDebut;
  int iTaille;                                 //indique le temps HAUT en fonction du bit à transmettre
  lDebut = millis();
  digitalWrite(sortieMotUSPin, HIGH);
  while (millis() - lDebut <= iBitStart) {}      //creation du temps HAUT pour un start

  lDebut = millis();
  digitalWrite(sortieMotUSPin, LOW);
  while (millis() - lDebut <= iBaseTemps) {}     //création du temps BAS

  for (int iBitDonnee = 0; iBitDonnee < iLength; iBitDonnee++) {
    if (bitRead(motTransmis, iBitDonnee) == 0) { //étude du bit à transmettre
      iTaille = iBitZero;
    } else {
      iTaille = iBitUn;
    }
    lDebut = millis();
    digitalWrite(sortieMotUSPin, HIGH);
    while (millis() - lDebut <= iTaille) {}     //creation du temps HAUT pour un bit de donnee

    lDebut = millis();
    digitalWrite(sortieMotUSPin, LOW);
    while (millis() - lDebut <= iBaseTemps) {}  //création du temps BAS
  }
  lDebut = millis();
  digitalWrite(sortieMotUSPin, HIGH);
  while (millis() - lDebut <= iBitFin) {}       //creation du temps HAUT de fin

  digitalWrite(sortieMotUSPin, LOW);                 //remise BAS de la ligne
}

//******************************************************************************************************
void envoyerDataHF(int iTempo) {
  Mirf.send(valeur_octet);
  while (Mirf.isSending())
  {
    // en cours d’émission
    delayMicroseconds(iTempo);
    //delay(iTempo);
  }
}

#endif /* _METHODES_ */
