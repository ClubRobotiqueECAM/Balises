import processing.serial.*;

Serial myPort;
int largeurFenetre;
int hauteurFenetre;
int centreX;
int centreY;
int largeurMillimetre = 3000;
int hauteurMillimetre = 2000;
int largeurBaliseMillimetre = 80;
float d1=0;
float d2=0;
float d3=0;
float baliseMobileX;
float baliseMobileY;
float mobileX;
float mobileY;
long tempo =0;
long lastTempo=0;


void setup () {
  largeurFenetre = int(displayWidth*0.8);     //Largeur de la fenêtre : 70% de la largeur de l'écran
  hauteurFenetre = int(displayHeight*0.8);    //hauteur de la fenêtre : 70% de la hauteur de l'écran
  centreX = int(largeurFenetre/2);
  centreY = int(hauteurFenetre/2);
  surface.setSize(largeurFenetre, hauteurFenetre);             //setup de la fenêtre
  background(100);// 0 = noir - 255 = blanc -> background

  println(Serial.list()); //************************************************************************* C'est ici qu'il faut décommenter pour que ça marche !!!! ********************************************************************
  myPort = new Serial(this, Serial.list()[0], 115200); //création d'un port série, sélectionne automatiquement le dernier COM installé
  myPort.bufferUntil('\n');
}

void draw () {
   background(100);// 0 = noir - 255 = blanc -> background
  tempo = millis()-lastTempo;
  float largeurPixel = map(largeurMillimetre, 0, 3000, 0, 800);
  float hauteurPixel = map(hauteurMillimetre, 0, 3000, 0, 800);
  fill(150);
  strokeWeight(1);
  stroke(0);
  rectMode(CENTER);
  rect(centreX, centreY, largeurPixel, hauteurPixel);
  
  int balise2X = -parseInt(map(largeurBaliseMillimetre, 0, 3000, 0, 800)/2); //Balise 2
  int balise2Y = -parseInt(map(largeurBaliseMillimetre, 0, 3000, 0, 800)/2);
  drawBalise(balise2X, balise2Y, centreX-largeurPixel/2, centreY-hauteurPixel/2, d2, 0, 255, 0); // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Distance balise en haut à gauche
  
  int balise1X = -parseInt(map(largeurBaliseMillimetre, 0, 3000, 0, 800)/2); //Balise 1
  int balise1Y = parseInt(hauteurPixel+map(largeurBaliseMillimetre, 0, 3000, 0, 800)/2);
  drawBalise(balise1X, balise1Y, centreX-largeurPixel/2, centreY-hauteurPixel/2,d1, 255, 0, 0); // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Distance balise en bas à gauche
  
  int balise3X = parseInt(largeurPixel+map(largeurBaliseMillimetre, 0, 3000, 0, 800)/2); //Balise 3
  int balise3Y = parseInt(hauteurPixel/2);
  drawBalise(balise3X, balise3Y, centreX-largeurPixel/2, centreY-hauteurPixel/2,d3, 0, 0, 255); // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Distance balise au milieu à droite
  
  drawBalise(parseInt(baliseMobileX), parseInt(largeurPixel-baliseMobileY), centreX-largeurPixel/2, centreY-hauteurPixel/2,0,0,0,0);
}

void drawBalise(int x, int y, float origineTableX, float origineTableY, float r, int red, int g, int b) {
  float largeurPixel = map(largeurBaliseMillimetre, 0, 3000, 0, 800);
  fill(red,g,b);
  strokeWeight(1);
  stroke(0);
  rectMode(CENTER);
  rect(x+origineTableX, y+origineTableY, largeurPixel, largeurPixel);
  drawCircleBalise(parseInt(x + origineTableX ), parseInt(y + origineTableY), r);
}

void drawCircleBalise(int x, int y, float r) {
  noFill();
  strokeWeight(4);
  stroke(0);
  ellipse(x, y, r*2, r*2);
}

void serialEvent (Serial myPort) {
  println(tempo);
  lastTempo = tempo;
  // mémorise la chaîne de caractères reçue
  String inString = myPort.readStringUntil('\n');
  String[] q = splitTokens(inString);

  if (inString != null) {
    // convertit la chaîne en valeur numérique 
    d1 = float(q[0])-190; 
    print("d1 : ");
    println(d1);
    d2 = float(q[1])-190;
    print("d2 : ");
    println(d2);
    d3 = float(q[2])-190;
    print("d3 : ");
    println(d3);
    mobileX = float(q[3]);
    mobileY = float(q[4]);
    baliseMobileX = map(mobileX, 0, 3000, 0, 800);
    baliseMobileY = map(mobileY, 0, 3000, 0, 800);
    print("X : ");
    println(mobileX);
    print("Y : ");
    println(mobileY);
    
    // ré-échelonne la valeur pour affichage
    //inByte = map(inByte, 0, 1023, 0, height);
    d1 = map(d1, 0, 3000, 0, 800);
    d2 = map(d2, 0, 3000, 0, 800);
    d3 = map(d3, 0, 3000, 0, 800);
  }
}