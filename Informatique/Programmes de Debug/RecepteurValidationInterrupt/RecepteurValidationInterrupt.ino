/*
 
 * Code de validation des interruption US recu 
  

 */

const int interruptionPin=2;   // soit 2 soit 3

//Debug
  
long dateAnalyse=0;
long dateAnalysedavant=0;
  bool etatPin=0;
  int OscilloPin=8;
 
void setup()
{
  // Communication USB à 9600 bauds
  Serial.begin(115200);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for Leonardo only
  }
  
  attachInterrupt(digitalPinToInterrupt(interruptionPin), takeTheTime, FALLING);
}

void loop()
{
  if (dateAnalyse!= 0 && dateAnalyse>dateAnalysedavant+30){
    //Serial.println("Je suis interrompu");
    noInterrupts();
    etatPin=!etatPin;
    digitalWrite(OscilloPin,etatPin);
    dateAnalysedavant=dateAnalyse;
    dateAnalyse=0;
    interrupts();
  }
}
void takeTheTime() //déclaration de la fonction d'interruption sur voie UL
{
    dateAnalyse=millis();  
}

