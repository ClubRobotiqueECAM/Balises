

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
  //byte* myAdresses[]={(byte*)"BaliM", (byte*)"Bali1", (byte*)"Bali2",(byte*) "Bali3"};

  /* Pour HF */
  bool btnActive= LOW;
  while(!btnActive){
    //void MirfInit(cePin, csnPin, iTaille MAX 32Octets, sAEcouter*MAX 5, sEmise);
    //MirfInit(cePin, csnPin, 2,adressEmiss , adressEmiss);
    if (digitalRead(btn1Pin)==0){
      MirfInit(cePin, csnPin, 2,/*adressEmiss */myAdresses[0], myAdresses[2], myAdresses[3], myAdresses[1]);//myAdresses[2], myAdresses[3], myAdresses[0]);
      motTransmis=0x01;
      motSignalDep=0x03; //03; valeur reelle hors test
      digitalWrite(led1Pin,LOW);
      btnActive= HIGH;
    }else if(digitalRead(btn2Pin)==0){
      MirfInit(cePin, csnPin, 2,/*adressEmiss */ myAdresses[0], myAdresses[1], myAdresses[3], myAdresses[2]);//myAdresses[1], myAdresses[0], myAdresses[3]);
      motTransmis=0x02;
      motSignalDep=0x01;
      digitalWrite(led2Pin,LOW);
      btnActive= HIGH;
    }else if(digitalRead(btn3Pin)==0){
      MirfInit(cePin, csnPin, 2,/*adressEmiss */myAdresses[0], myAdresses[1], myAdresses[2], myAdresses[3]);//myAdresses[0], myAdresses[1], myAdresses[2]);
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

  uint8_t test=0x3F;
  Mirf.writeRegister(EN_RXADDR,&test,1);
  Serial.println(test,BIN);

  /*Pour US*/
  pinMode(iNumPin, OUTPUT);

  lastUpdate = millis();
}

void loop() {
  uint8_t test=NOP;
  /*Mirf.readRegister(CONFIG,&test,1);
  Serial.println(test,BIN);
  Mirf.readRegister(EN_AA,&test,1);
  Serial.println(test,BIN);
  Mirf.readRegister(EN_RXADDR,&test,1);
  Serial.println(test,BIN);*/
  Mirf.readRegister(RX_PW_P0,&test,1);
  Serial.print("RX_PW_P0 ");Serial.println(test,BIN);
  Mirf.readRegister(RX_PW_P1,&test,1);
  Serial.print("RX_PW_P1 ");Serial.println(test,BIN);
  Mirf.readRegister(RX_PW_P2,&test,1);
  Serial.print("RX_PW_P2 ");Serial.println(test,BIN);
  Mirf.readRegister(RX_PW_P3,&test,1);
  Serial.print("RX_PW_P3 ");Serial.println(test,BIN);
  Mirf.readRegister(RX_PW_P4,&test,1);
  Serial.print("RX_PW_P4 ");Serial.println(test,BIN);
  Mirf.readRegister(RX_PW_P5,&test,1);
  Serial.print("RX_PW_P5 ");Serial.println(test,BIN);
  long now = millis();
  Serial.println("Listening...");
  while(!Mirf.dataReady() && ((now - lastUpdate) < 5000)) 
  { 
    // pas message reçu 
    delayMicroseconds(100);
    now = millis();
    //Mirf.readRegister(STATUS,&test,1);
    //Serial.println(test,BIN);
  }
  Serial.println(now - lastUpdate);
  Mirf.getData(tabMotSignalDep); // récupére 2 octets 
  int valeur = tabMotSignalDep[0] + (tabMotSignalDep[1] << 8); // transforme en int 
  Serial.println(valeur, DEC);
  
  //now=millis();
  if ((/*now - lastUpdate >= 200 && */( motSignalDep == tabMotSignalDep[0] + (tabMotSignalDep[1] << 8))) || now - lastUpdate >= 5000) { //Rentre dans la boucle toutes les 200ms
    delay(500);
    //Serial.print(valeur_octet[1]);
    //Serial.println(valeur_octet[0]);
    Mirf.send(valeur_octet);
    while(Mirf.isSending()) 
    { 
      // en cours d’émission 
      delayMicroseconds(100);
    }
    delay(25);
    mProtocoleEmetteur();
    lastUpdate = millis();
  }
  //Mirf.setTADDR(myAdresses[motTransmis]);
  /*Mirf.send(valeur_octet);
  while(Mirf.isSending()) 
  { 
    // en cours d’émission 
    delay(1); 
  }
  */
/*Serial.println("Fixe 1 ");
Serial.print('B',DEC);Serial.print(" ");
Serial.print('a',DEC);Serial.print(" ");
Serial.print('l',DEC);Serial.print(" ");
Serial.print('i',DEC);Serial.print(" ");
Serial.println('1',DEC);
uint8_t adresse[5];
 Mirf.readRegister(RX_ADDR_P0,adresse,5);
Serial.print(adresse[0]);Serial.print(" ");
Serial.print(adresse[1]);Serial.print(" ");
Serial.print(adresse[2]);Serial.print(" ");
Serial.print(adresse[3]);Serial.print(" ");
Serial.println(adresse[4]);*/
}

