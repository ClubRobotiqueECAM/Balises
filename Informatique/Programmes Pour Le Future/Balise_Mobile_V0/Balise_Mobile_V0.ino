/*
 * Ce programme contrôles la balise mobile aussi bien le HF que l'US
 *  Ce programme a été remanié depuis les derniers tests.
 *
 * Objectif:
 *   Optimisation du sérial pour ne pas affecter le programme quand on ne l'utilise pas.
 *   Compréhension facile du code par des commentaires très détaillés
 *   Support pour les explications dans le dossier
 *
 * Si il fonctionne avec les balises (normalement c'est le cas) il est préférable de
 * l'utiliser.
 *
 * Si vous avez des questions contactez-nous:
 *   @auteur Maxence Beroujon
 *   @auteur Bruno Bellier    bru.bellier38@gmail.com
 *
 * Copyright (c) 2016
 *   Vous pouvez en faire ce que vous voulez! Mais surtout assez de ne pas le perdre :p
 *   Ce programme ne peut être responsable d'aucune détérioration matériel.
 *   Pour la distribution, consultez la licence de MIRF :p
 */

#include <SPI.h> // gestion du bus SPI 
#include "GlobalVar.h"
#include "Function.h"

void setup() {
  // Serial commence si il y a un debug actif
  if (debug || debugHF || debugUS || bProcessing) Serial.begin(115200);

  // Activation interruption
  attachInterrupt(digitalPinToInterrupt(interruptionPin), takeTheTime, FALLING);

  // Activation HF
  MirfInit(cePin, csnPin, 2, (byte *)"BFixe", (byte *)"BaliM");

  if (debug) Serial.println("Setup done.");
}

void loop() {
  /* Reception HF */
  if (debugHF) Serial.println("Listening...");
  long departAttente = millis();
  while (!Mirf.dataReady())
  {
    // pas prêt à recevoir
    delayMicroseconds(10);  //fonctionne en ne mettant pas de délai mais risque de surcharge
  }
  dateHFRecu = micros();
  Mirf.getData(motHF_octet); // récupére 2 octets
  motHF = motHF_octet[0] + (motHF_octet[1] << 8); // transforme en int
  if (debugHF) {
    Serial.print("Temps d'attente: ");
    Serial.print(millis() - departAttente, DEC);
    Serial.print(" ms.");
    Serial.print(" Le mot HF recu: ");
    Serial.println(motHF, DEC);
  }

  /* Reception US */
  long timeoutUS = dateHFRecu + 300000; // en microsecondes
  while (i <= nbBits && micros() < timeoutUS) {
    if (dateAnalyse != 0 && dateAnalyse > derniereDateAnalysee + bitZero) {
      noInterrupts();
      analyseUS();
      interrupts();
    }
  }
  if (debugUS) Serial.println(" ");

  /* Calculs */
  if (i > nbBits && motUS == motHF) {
    if (debug) Serial.println("Calcul distance");
    calculDistance();
    nettoyage();
    if (tabDistances[0] > 2) {
      if (debug) Serial.print("Calcul position");
      calculPosition();
    }
  } else {
    nettoyage();
  }
}
