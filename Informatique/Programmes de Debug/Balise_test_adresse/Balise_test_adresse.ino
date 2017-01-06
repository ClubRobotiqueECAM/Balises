

/*Balise fixe mono emetteur complet (HF + ultrason)
 *test avec deux balises en utilisant que les boutons 1 et 2 en partant de la led
 *https://itechnofrance.wordpress.com/2013/05/24/utilisation-du-module-nrf24l01-avec-larduino/
 *
 *programme de test adresse module nrf
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
  // conserver les 4 premiers caractères identique pour P1,2,3,4,5
  byte* myAdresses[]={(byte*)"BaliM", (byte*)"Bali1", (byte*)"Bali2",(byte*) "Bali3"};

  /* Pour HF */
  bool btnActive= LOW;
  while(!btnActive){
    //void MirfInit(cePin, csnPin, iTaille MAX 32Octets, sAEcouter*MAX 5, sEmise);
    if (digitalRead(btn1Pin)==0){
      MirfInit(cePin, csnPin, 2, myAdresses[0], myAdresses[3], myAdresses[2], myAdresses[1]);
      motTransmis=0x01;
      motSignalDep=0x02; //03; valeur reelle hors test
      digitalWrite(led1Pin,LOW);
      btnActive= HIGH;
    }else if(digitalRead(btn2Pin)==0){
      MirfInit(cePin, csnPin, 2, myAdresses[0], myAdresses[1], myAdresses[3], myAdresses[2]);
      motTransmis=0x02;
      motSignalDep=0x01;
      digitalWrite(led2Pin,LOW);
      btnActive= HIGH;
    }else if(digitalRead(btn3Pin)==0){
      MirfInit(cePin, csnPin, 2, myAdresses[0], myAdresses[1], myAdresses[2], myAdresses[3]);
      motTransmis=0x03;
      motSignalDep=0x02;
      digitalWrite(led3Pin,LOW);
      btnActive= HIGH;
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
  Serial.println("Listenning....");


Serial.println("Mobile ");
Serial.print('B',DEC);Serial.print(" ");
Serial.print('a',DEC);Serial.print(" ");
Serial.print('l',DEC);Serial.print(" ");
Serial.print('i',DEC);Serial.print(" ");
Serial.println('M',DEC);
Serial.println("Fixe 1 ");
Serial.print('B',DEC);Serial.print(" ");
Serial.print('a',DEC);Serial.print(" ");
Serial.print('l',DEC);Serial.print(" ");
Serial.print('i',DEC);Serial.print(" ");
Serial.println('1',DEC);

for (byte i=RX_ADDR_P0; i<RX_ADDR_P0+4;i++){
  uint8_t adresse[5];
  
  Mirf.readRegister(i,adresse,5);
Serial.print(adresse[0]);Serial.print(" ");
Serial.print(adresse[1]);Serial.print(" ");
Serial.print(adresse[2]);Serial.print(" ");
Serial.print(adresse[3]);Serial.print(" ");
Serial.println(adresse[4]);
}

 
}

