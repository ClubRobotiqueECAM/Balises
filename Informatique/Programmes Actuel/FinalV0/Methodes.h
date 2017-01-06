/*
 * Ici les méthodes correspondants
 * 
 * Headers puis Codes
 */
 
 
#ifndef _METHODES
#define _METHODES


  void MirfInit(int cePin, int csnPin, int iTaille, byte * sAEcouter1, byte * sEmise);
  void takeTheTime(); //déclaration de la fonction d'interruption sur voie UL
  void analyseUS();
  void calculDistance();
  void calculPosition();
  void nettoyage();
  long carre(long X);

// Declaration
  void MirfInit(int cePinP, int csnPinP, int iTaille, byte * sAEcouter1, byte * sEmise){
    Mirf.cePin = cePinP;
    Mirf.csnPin = csnPinP;
    
    Mirf.spi = &MirfHardwareSpi; // utilisation du port SPI hardware 
    Mirf.init(); // initialise le module SPI 
  
    Mirf.payload = iTaille; //  declaration taille du message a  transmettre, max 32 octets 
    // RF_SETUP=0000abcd : a=1->2Mb/s, a=0->1Mb/s; puissance emission bc=00->-18 dBm, bc=01->-12dBm, bc=10->-6dBm, bc=11->0dBm; 
    // d=0 pas de gain sur le bruit en reception 
    /* Non Necessaire
    Mirf.configRegister(RF_SETUP, 0x06); // 1 Mb/s et 0 dBm (puissance maximum)
    */ 
    Mirf.config(); // configure le canal et la taille du message 
    Mirf.setTADDR(sEmise); // definition adresse sur 5 octets pour moi
    Mirf.setRADDR(sAEcouter1);  // definition adresse sur 5 octets des autres   
  }
  /***********************************************************************************/
  void takeTheTime() //déclaration de la fonction d'interruption sur voie UL
  {
      dateAnalyse=micros();  
  }
  /***********************************************************************************/
  void analyseUS(){
    etatPin=!etatPin;
    digitalWrite(OscilloPin,etatPin);
    
    long lDeltaFront = (long)(dateAnalyse-derniereDateAnalysee);    // Ecart de temps entre deux fronts
  
    if (i==1){//Il n'y a pas eu de start
      if (lDeltaFront < bitStart || lDeltaFront > bitStart+fourchette){//SI Non Start
        dateBitStart=dateAnalyse;
        i=0;
        donneeRecu=0;
        if (debugUS) Serial.print(lDeltaFront);
        if (debugUS) Serial.println(" En attente du start");
      }else{
        if (debugUS) Serial.print(lDeltaFront);
        if (debugUS) Serial.print(" ms: S ");
      }
    }else{ //Il y a eu un Start
      if (lDeltaFront >= bitUn && lDeltaFront <= bitUn+fourchette){//Si c'est un 1
          bitSet(donneeRecu, i-2);
          if (debugUS) Serial.print(lDeltaFront);
          if (debugUS) Serial.print(" bit:1 ");
      }else if (lDeltaFront < bitZero || lDeltaFront > bitZero+fourchette){//Si ce N'est PAS un 0
          dateBitStart=dateAnalyse;
          i=0;
          donneeRecu=0;
          if (debugUS) Serial.print(lDeltaFront);
          if (debugUS) Serial.println(" Erreur de duree du bit");
        }else{ //si c'est un 0
          if (debugUS) Serial.print(lDeltaFront);
          if (debugUS) Serial.print(" bit:0 ");
      }
    }
    //fin du si
    i++;
    derniereDateAnalysee=dateAnalyse;
    dateAnalyse=0;
  }
  
  /***********************************************************************************/
  void calculDistance(){
    unsigned int DureeVoyag;
    unsigned int Dist;
    //int T=19; //temperature en degre celsus
    DureeVoyag=dateBitStart-(dateHFRecu+25000);
    Dist=(331.5+0.607*T)*(DureeVoyag)/1000; //distance en mm    331.5+0.607*T(en °C)   donne des m/s (vit son 340m/s)

    if (tabDistances[donneeRecu] == 0){
      tabDistances[0]++;
    }
    tabDistances[donneeRecu]=Dist;
       
    if (debug){
      Serial.print(DureeVoyag);
      Serial.print(" on mesure une distance de ");
      Serial.print(Dist);
      Serial.println(" mm");
      Serial.println(" ");
    }
  }
  /***********************************************************************************/
  void calculPosition(){
    long x=((carre(tabDistances[1])+carre(tabDistances[2]))/2-carre(tabDistances[3])+80000)/600;
    long y=(carre(tabDistances[1])-carre(tabDistances[2])+40000)/400;

    
    tabCoordonnee[0]=x;
    tabCoordonnee[1]=y;

    if (bProcessing){
      //Serial.print(millis()-DernierePosition);Serial.print(" ");
      Serial.print(tabDistances[1]);Serial.print(" ");
      Serial.print(tabDistances[2]);Serial.print(" ");
      Serial.print(tabDistances[3]);Serial.print(" ");
      Serial.print(tabCoordonnee[0]);Serial.print(" ");
      Serial.println(tabCoordonnee[1]);
    }

    long DernierePosition=millis();
    tabDistances[0]=0;
    tabDistances[1]=0;
    tabDistances[2]=0;
    tabDistances[3]=0;
  } 
  /***********************************************************************************/ 
  void nettoyage(){
      i=1;
      donneeRecu=0;
      //derniereDateAnalysee=0; //ou pas ?
  }
  /***********************************************************************************/ 
  long carre(long X){
    return X*X;
  }

#endif // _METHODES
