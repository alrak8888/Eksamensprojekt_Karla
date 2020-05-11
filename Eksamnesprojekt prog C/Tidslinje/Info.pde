//Denne klasse danner objekterne infobokse, for hvert event
class info { //Først defineres de variabler klassen består af 
  String [] tekst; //Den tekstfil, der bliver hentet ned ved hver infoboks
  float infoX; //x og y position
  float infoY;
  String tex; //Når tekstfilen sammensættes til én string
  int textRectW = 90; //størrelse på boksen
  int textRectH = 100;
  color textColor; //farven på boksen


  //constructor
  info (String [] _tekst, float _infoX, float _infoY, color _textColor) {
    this.textColor=_textColor;
    this.tekst=_tekst;
    this.infoX=_infoX;
    this.infoY=_infoY-200;
  }

  //Her tegnes boksene
  void tegnInfo() {
    String tex = join(tekst, " ");
    
    //firkant
    stroke(255);
    rectMode(RADIUS);
    fill(textColor, 100);
    rect(infoX, infoY, textRectW, textRectH);

    //tekst
    fill(255);
    textAlign(CORNER);
    text(tex, infoX+4, infoY+4, textRectW-4, textRectH);
    textSize(12);
  }
}
