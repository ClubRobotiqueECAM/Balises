/* 
    réception d’une valeur integer via module nRF24L01 
    Programme de Reception HF uniquement
 *
 * Pins:
 * Hardware SPI:
 * GND             Noir (pin 1)
 * Alim (3.3V)    Rouge (pin 2)
 * MISO -> 50      Vert (pin 7)
 * MOSI -> 51     Jaune (pin 6)
 * SCK -> 52       Bleu (pin 5)
 *
 * Configurable:
 * CE -> 9        Jaune (pin 3)
 * CSN -> 53       Vert (pin 4)
*/

#include <SPI.h> // gestion du bus SPI 
#include "Mirf.h" // gestion de la communication 
#include "Mirf_nRF24L01.h" // définition des registres du nRF24L01 
#include "MirfHardwareSpiDriver.h" // communication SPI nRF24L01

int valeur = 0;  // contient la valeur à recevoir 
byte valeur_octet[2]; // contient la valeur découpée en octet pour la réception
bool debug = true;

void setup() {
  // put your setup code here, to run once:
  if (debug) Serial.begin(115200);
  /* Non nécéssaire
  Mirf.cePin = 8; // CE sur broche 8 
  Mirf.csnPin = 7; // CSN sur broche 7
  */
   /* To change CE / CSN Pins:
   * 
   * Mirf.csnPin = 9;
   * Mirf.cePin = 7;
   */
  
  Mirf.cePin = 9;
  Mirf.csnPin = 10;
  
  Mirf.spi = &MirfHardwareSpi; // utilisation du port SPI hardware 
  Mirf.init(); // initialise le module SPI 
    /*
   * To change channel:
   * NB: Make sure channel is legal in your area.
  Mirf.channel = 0; // utilisation canal 0 pour communiquer (128 canaux disponible, de 0 à 127)
  */ 
  Mirf.payload = sizeof(unsigned int); // = 2, déclaration taille du message à transmettre, max 32 octets 
  // RF_SETUP=0000abcd : a=1–>2Mb/s, a=0–>1Mb/s; puissance émission bc=00–>-18 dBm, bc=01–>-12dBm, bc=10–>-6dBm, bc=11–>0dBm; 
  // d=0 pas de gain sur le bruit en réception 
  /* Non Necessaire
  Mirf.configRegister(RF_SETUP, 0x06); // 1 Mb/s et 0 dBm (puissance maximum)
  */ 
  Mirf.config(); // configure le canal et la taille du message 
  Mirf.setMultiRADDR((byte *)"BFixe",1); // définition adresse sur 5 octets de la 2ème carte Arduino
  /*Mirf.setMultiRADDR((byte *)"Bali2",2); 
  Mirf.setMultiRADDR((byte *)"Bali3",3); */
  Mirf.setTADDR((byte *)"BaliM"); // définition adresse sur 5 octets de la 1ere carte Arduino ("N" pour "nous")
  Serial.println("Setup done."); 
}

void loop() {
  long lastUpdate = millis();
  // put your main code here, to run repeatedly:
  Serial.print("Listening...");
  while(!Mirf.dataReady()) 
  { 
    // pas prêt à recevoir 
    delayMicroseconds(10);  //fonctionne en ne mettant pas de délai mais risque de surcharge
  } 
  Mirf.getData(valeur_octet); // récupére 2 octets 
  valeur = valeur_octet[0] + (valeur_octet[1] << 8); // transforme en int
  Serial.print("Temps ecoule depuis le dernier message recu : "); 
  Serial.print(millis()-lastUpdate, DEC); 
  Serial.print(" ms ");
  Serial.print(" ; Valeur recu : ");
  Serial.println(valeur, DEC); 
  /*Serial.print(" Valeur des deux octets: "); 
  Serial.print(valeur_octet[0],HEX); 
  Serial.print(" "); 
  Serial.println(valeur_octet[1],HEX); */
  //delay(1000); 
}
