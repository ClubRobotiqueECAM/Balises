/*
 * Ce programme contrôles les balises fixes aussi bien le HF que l'US
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
  if (debug) Serial.begin(115200);

  /* Definition LEDs, Boutons et le pin dpour la com US*/
  for (int i = 0; i <= 3; i++) {
    pinMode(ledPin[i], OUTPUT);  // setup leds
    digitalWrite(ledPin[i], HIGH); // setup leds OFF
    pinMode(btnPin[i], INPUT);   // setup bouttons
    digitalWrite(btnPin[i], HIGH); // setup pull-up pour btn
  }
  // Ses deux lignes sont les memes que le for au dessus.
  // C'est plus optimiser a l'execution mais moins facile a comprendre
  // Essayer de comprendre pour comprendre le Print configuartion
  //DDRC = B11000111; // SetBtn as in and Led as out
  //PORTC |= B00111111;// Set pull up resistance et led to high

  pinMode(sortieMotUSPin, OUTPUT);

  /* Différenciation des balises */
  bool btnActive = LOW;
  if (debug) Serial.println("Attente d'un bouton actif");
  while (!btnActive) {
    if (digitalRead(btnPin[0]) == 0) {
      idBalise = 1;
    } else if (digitalRead(btnPin[1]) == 0) {
      idBalise = 2;
    } else if (digitalRead(btnPin[2]) == 0) {
      idBalise = 3;
    }

    // Si un bouton a été détecté definitions des constantes de balise
    if (idBalise != 0) {
      btnActive = HIGH;
      byte idBaliseMoins = idBalise - 1; // initialisation pour éviter 2 modifications
      if (idBalise == 1) {
        idBaliseMoins = 3;
      }
      digitalWrite(ledPin[idBalise - 1], LOW);
      motTransmis = idBalise;
      MirfInit(cePin, csnPin, 2, myAdresses[idBaliseMoins] , myAdresses[idBalise]);
    }
  }
  // Valeur découpée en 2 octets pour l’envoi HF
  valeur_octet[0] = motTransmis & 0xFF;
  valeur_octet[1] = (motTransmis & 0xFF00) >> 8;

  /* Print Configuration */
  if (debug) {
    Serial.println("-------------------- Configuation  --------------------");
    Serial.println("Le PortC a pour direction: Valeur attendue= 11000111 ");
    Serial.println(DDRC, BIN);

    Serial.println("Le PortC est définie a la valeur: Valeur attendue= 00111111");
    Serial.println(PORTC, BIN);

    Serial.print("L'id balise est le: ");
    Serial.println(idBalise);
    Serial.println("------------------ End Configuation  ------------------");
  }
}

void loop() {
  if (debug) Serial.println("Listening...");
  long departAttente = millis();
  long timeout = departAttente + 1500 * idBalise;

  digitalWrite(ledPin[idBalise - 1], LOW); // Led allumée lors de l'écoute
  //Attente du top
  while (!Mirf.dataReady() && millis() < timeout)
  {
    // pas message reçu
    //delayMicroseconds(100);
    delay(1);
  }
  digitalWrite(ledPin[idBalise - 1], HIGH);
  
  if (debug) Serial.print("J'ai attendu ");
  if (debug) Serial.print(millis() - departAttente);
  if (debug) Serial.println(" ms");
  byte tabMotSignalDep[2]; // contient la valeur découpée en octet pour la réception
  Mirf.getData(tabMotSignalDep); // récupére 2 octets obligatoire sinon il ne sont pas effacé
  int valeur;
  if (debug) valeur = tabMotSignalDep[0] + (tabMotSignalDep[1] << 8); // transforme en int
  if (debug) Serial.println(valeur, DEC);

  //Changement et envoie HF à Mobile
  Mirf.setTADDR(myAdresses[0]);
  envoyerDataHF(100);
  if (debug) Serial.print("valeur HF emise: ");
  if (debug) Serial.println(valeur_octet[0] + (valeur_octet[1] << 8), DEC);

  //Attente pour decaler
  delay(25);
  
  //Envoi US
  mProtocoleEmetteur();
  if (debug) Serial.print("valeur US emise: ");
  if (debug) Serial.println(motTransmis, DEC);

  // Attente analyse de reception
  delay(250);

  //Changement et envoie HF au Suivant
  Mirf.setTADDR(myAdresses[motTransmis]);
  envoyerDataHF(100);
}

