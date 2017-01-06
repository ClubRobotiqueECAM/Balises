/*
 
 * Code de validation des mots US recu avec debug
  * Marche pas, temps moyen entre chaque frond : 20000micros
  * quand ça marche, ça marche bien
 */

const int interruptionPin=2;   // soit 2 soit 3
const int nbBits=5;//nb de bits + 1 
const long iBaseTemps=7000; // en microsecondes
const long fourchette=7000;
const long bitStart=iBaseTemps*6;
const long bitUn=iBaseTemps*8-fourchette/2;    
const long bitZero=iBaseTemps*4-fourchette/2;


byte donneeRecu=0x00;

int i=1;

long dateAnalyse=0;
long derniereDateAnalysee=0;
long dateBitStart=0;

//Debug
  long DebutDeMot=0;
  bool etatPin=0;
  int OscilloPin=8;

 
void setup()
{
  // Communication USB à 9600 bauds
  Serial.begin(115200);
  attachInterrupt(digitalPinToInterrupt(interruptionPin), takeTheTime, FALLING);
}

void loop()
{

  long lTime=micros();
  if (dateAnalyse!= 0 && dateAnalyse>derniereDateAnalysee+12000){
    noInterrupts();
    etatPin=!etatPin;
    digitalWrite(OscilloPin,etatPin);
    long lDeltaFront = (long)(dateAnalyse-derniereDateAnalysee);    // Ecart de temps entre deux fronts
    //Serial.println(lDeltaFront);
    //Serial.println(dateAnalyse);
    //Serial.println(derniereDateAnalysee);
    if (i==1){//Il n'y a pas eu de start
      if (lDeltaFront < bitStart || lDeltaFront > bitStart+fourchette){//SI Non Start
        dateBitStart=dateAnalyse;
        i=0;
        donneeRecu=0;
        //Serial.print(micros()-lTime);
        //Serial.print(bitStart);
        Serial.print(lDeltaFront);
        Serial.println(" En attente du start");
      }else{
        Serial.print(lDeltaFront);
        Serial.print(" ms: S ");
      }
    }else{ //Il y a eu un Start
      if (lDeltaFront >= bitUn && lDeltaFront <= bitUn+fourchette){//Si c'est un 1
          bitSet(donneeRecu, i-2);
          Serial.print(lDeltaFront);
          Serial.print(" bit:1 ");
      }else if (lDeltaFront < bitZero || lDeltaFront > bitZero+fourchette){//Si ce N'est PAS un 0
          dateBitStart=dateAnalyse;
          i=0;
          donneeRecu=0;
          Serial.print(lDeltaFront);
          Serial.println(" Erreur de duree du bit");
        }else{ //si c'est un 0
          Serial.print(lDeltaFront);
          Serial.print(" bit:0 ");
      }
    }
    //fin du si
    i++;
    derniereDateAnalysee=dateAnalyse;
    dateAnalyse=0;
    interrupts();
  } //fin Grand Si US
  
  if (i>nbBits) {
    finDeMot();
  }
}
void takeTheTime() //déclaration de la fonction d'interruption sur voie UL
{
    dateAnalyse=micros();  
}
void finDeMot(){
    i=1;
    Serial.print (donneeRecu);
    Serial.print (" en ");
    Serial.print (micros()-DebutDeMot);
    Serial.println(" ms");
    donneeRecu=0;
    DebutDeMot=micros();
}

