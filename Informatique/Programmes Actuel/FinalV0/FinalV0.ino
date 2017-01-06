/* 
  Programme de récéption HF et US 
*/

#include <SPI.h> // gestion du bus SPI 
#include "Const.h"
#include "Methodes.h"

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  
  // activation interruption
  attachInterrupt(digitalPinToInterrupt(interruptionPin), takeTheTime, FALLING);
  // activation HF
  MirfInit(cePin, csnPin, 2, (byte *)"BFixe", (byte *)"BaliM");
  
  if (debug) Serial.println("Setup done."); 
}

void loop() {
  //
  // Reception HF
  //
  if (debugHF) Serial.println("Listening...");
  long lDebutAttente = millis();
  while(!Mirf.dataReady()) 
  { 
    // pas prêt à recevoir 
    delayMicroseconds(10);  //fonctionne en ne mettant pas de délai mais risque de surcharge
  }
  dateHFRecu=micros();
  Mirf.getData(valeur_octet); // récupére 2 octets 
  valeur = valeur_octet[0] + (valeur_octet[1] << 8); // transforme en int
  if (debugHF) {
    Serial.print("Temps d'attente: "); 
    Serial.print(millis()-lDebutAttente, DEC); 
    Serial.print(" ms.");
    Serial.print(" Valeur recu: ");
    Serial.println(valeur, DEC);
  } 

  //
  // Reception US
  //
  while (i<=nbBits && micros()<(dateHFRecu+300000)) {
    if (dateAnalyse!= 0 && dateAnalyse>derniereDateAnalysee+bitZero){
      noInterrupts();
      analyseUS();
      interrupts();
    }
  }
  if (debugUS) Serial.println(" ");
  if (i>nbBits && donneeRecu==valeur) {
    //Serial.println("Calcul distance");
    calculDistance();
    nettoyage();
    if (tabDistances[0]>2){
      calculPosition();
      //Serial.print("Calcul position");
    }
    
  }else{
    nettoyage();
  }
  
}
