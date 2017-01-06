

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
  for (int i=led1Pin; i<=led3Pin; i++){// setup leds
    pinMode(i, OUTPUT);
    digitalWrite(i,HIGH);
  }
  for (int i=btn1Pin; i<=btn3Pin; i++){//setup bouttons
    pinMode(i, INPUT);
    digitalWrite(i,HIGH);
  }
  byte* myAdresses[]={(byte*)"BaliM", (byte*)"Bali1", (byte*)"Bali2",(byte*) "Bali3"};

  /* Pour HF */
  bool btnActive= LOW;
  while(!btnActive){
    //void MirfInit(cePin, csnPin, iTaille MAX 32Octets, sAEcouter*MAX 5, sEmise);
    if (digitalRead(btn1Pin)==0){
      MirfInit(cePin, csnPin, 2, myAdresses[2], myAdresses[3], myAdresses[0], myAdresses[1]);
      motTransmis=0x01;
      motSignalDep=0x02; //03; valeur reelle hors test
      digitalWrite(led1Pin,LOW);
      btnActive= HIGH;
    }else if(digitalRead(btn2Pin)==0){
      MirfInit(cePin, csnPin, 2, myAdresses[1], myAdresses[3], myAdresses[0], myAdresses[2]);
      motTransmis=0x02;
      motSignalDep=0x01;
      digitalWrite(led2Pin,LOW);
      btnActive= HIGH;
    }else if(digitalRead(btn3Pin)==0){
      MirfInit(cePin, csnPin, 2, myAdresses[0], myAdresses[1], myAdresses[2], myAdresses[3]);
      motTransmis=0x03;
      motSignalDep=0x02;
      //digitalWrite(led3Pin,LOW);
      //btnActive= HIGH;
    }
    /*MirfInit(cePin, csnPin, 2, myAdresses[0], myAdresses[1], myAdresses[2], myAdresses[3]);
    digitalWrite(led3Pin,LOW);
    btnActive= HIGH;*/
  }
  valeur_octet[0]=motTransmis & 0xFF;// contient la valeur découpée en octet pour l’envoi
  valeur_octet[1]=(motTransmis & 0xFF00) >> 8;
  /*Pour US*/
  pinMode(iNumPin, OUTPUT);
}

void loop() {

  long now = millis();
  lastUpdate = millis();
  Serial.println("Listening...");
  while(!Mirf.dataReady() && ((now - lastUpdate) < 5000)) 
  { 
    // pas message reçu 
    delayMicroseconds(100);
    now = millis();
  }
  Serial.println(now - lastUpdate);
  Mirf.getData(tabMotSignalDep); // récupére 2 octets 
  int valeur = tabMotSignalDep[0] + (tabMotSignalDep[1] << 8); // transforme en int 
  Serial.println(valeur, DEC);
  delay(500);
  now=millis();
  if ((now - lastUpdate >= 200 && ( motSignalDep == tabMotSignalDep[0] + (tabMotSignalDep[1] << 8))) || now - lastUpdate >= 5000) { //Rentre dans la boucle toutes les 200ms
    Mirf.send(valeur_octet);
    while(Mirf.isSending()) 
    { 
      // en cours d’émission 
      delay(5); 
    }
    delay(25);
    mProtocoleEmetteur();
    ///lastUpdate = millis();
  }
}

