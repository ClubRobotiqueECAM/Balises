

/*Balise fixe mono emetteur complet (HF + ultrason)
 *test avec deux balises en utilisant que les boutons 1 et 2 en partant de la led
 *https://itechnofrance.wordpress.com/2013/05/24/utilisation-du-module-nrf24l01-avec-larduino/
 */

#include <SPI.h>      // gestion du bus SPI 
#include "Cons_Vars.h"
#include "Methodes.h" 


void setup() {
  // Debug
  Serial.begin(115200);
  
  /*Pour selection et affichage Nom balise*/
  /*for (int i=0; i<=3; i++){ 
    pinMode(ledPin[i], OUTPUT);  // setup leds
    digitalWrite(ledPin[i],HIGH);// setup leds
    pinMode(btnPin[i], INPUT);   // setup bouttons
    digitalWrite(btnPin[i],HIGH);// setup pull up pour btn
  }*/
  DDRC = B11000111; // SetBtn as in and Led as out
  PORTC |= B00111111;// Set pull up resistance et led to high
  
  /* Pour HF */
  //byte* myAdresses[]={(byte*)"BFixe", (byte*)"Bali1", (byte*)"Bali2",(byte*) "Bali3"};
  bool btnActive= LOW;
  Serial.println("Attente d'un bouton actif");
  while(!btnActive){
    if (digitalRead(btnPin[0])==0){
      idBalise=1;
    }else if(digitalRead(btnPin[1])==0){
      idBalise=2;
    }else if(digitalRead(btnPin[2])==0){
      idBalise=3;
    }
    if (idBalise != 0){// Si un bouton a été détecté definitions des constantes de balise
      digitalWrite(ledPin[idBalise-1],LOW);
      btnActive= HIGH;
      byte idBaliseMoins=idBalise-1; // initialisation pour éviter 2 modifications
      if (idBalise == 1) {
        idBaliseMoins=3;
      }
      MirfInit(cePin, csnPin, 2,myAdresses[idBaliseMoins] , myAdresses[idBalise]);
      motTransmis=idBalise;
    }
  }
  valeur_octet[0]=motTransmis & 0xFF;// contient la valeur découpée en octet pour l’envoi
  valeur_octet[1]=(motTransmis & 0xFF00) >> 8;

  /*Pour US*/
  pinMode(iNumPin, OUTPUT);
  
  //
  //Print Configuration
  //
  Serial.print("Le PortC a pour direction: ");
  Serial.println(DDRC,BIN);
  
  Serial.print("Le PortC est définie a la valeur: ");
  Serial.println(PORTC,BIN);
  
  Serial.print("L'id balise est le: ");
  Serial.println(idBalise);
}

void loop() {
  
  long DepartAttente=millis();
  long timeout=DepartAttente + 1500*idBalise;
  
  Serial.println("Listening...");
  while(!Mirf.dataReady() && millis() < timeout) 
  { 
    // pas message reçu 
    //delayMicroseconds(100);
    delay(1);
    
  }
  Serial.println(millis() - DepartAttente);
  byte tabMotSignalDep[2]; // contient la valeur découpée en octet pour la réception
  Mirf.getData(tabMotSignalDep); // récupére 2 octets obligatoire sinon il ne sont pas effacé
  //int valeur = tabMotSignalDep[0] + (tabMotSignalDep[1] << 8); // transforme en int 
  //Serial.println(valeur, DEC);

  //Changement de destinataire: Mobile
  Mirf.setTADDR(myAdresses[0]);
  //Envoi HF pour mobile
  envoyerData(100);
  //Attente pour decalé
  /*Serial.print("valeur HF emise: ");
  Serial.println(valeur_octet[0]+(valeur_octet[1]<<8), DEC);*/
  delay(25);
  //Envoi US
  mProtocoleEmetteur();
  /*Serial.print("valeur US emise: ");
  Serial.println(motTransmis, DEC);*/
  // Attente analyse de reception
  delay (100);
  
  //Changement de destinataire: Suivant
  Mirf.setTADDR(myAdresses[motTransmis]);
  //Envoi HF pour suivant
  envoyerData(100);
}

