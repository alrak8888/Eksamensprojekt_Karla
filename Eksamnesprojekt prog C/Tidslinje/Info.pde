class info {
  String [] tekst; 
  float infoX;
  float infoY;
  String tex;
  //int textRectX;
  //int textRectY;
  int textRectW = 90;
  int textRectH = 100;


  info (String [] _tekst, float _infoX, float _infoY) {//, int _textRectX, int _textRectY) {
    //this.textRectY=_textRectY;
    //this.textRectX=_textRectX;
    this.tekst=_tekst;
    this.infoX=_infoX;
    this.infoY=_infoY-200;
  }

  void tegnInfo() {
    String tex = join(tekst, " "); //loadStrings("TOVK.docx");
    //firkant
    stroke(255);
    rectMode(RADIUS);
    fill(255, 100, 49, 100);
    rect(infoX, infoY, textRectW, textRectH);

    //tekst
    fill(255);
    textAlign(CORNER);
    text(tex, infoX+4, infoY+4, textRectW, textRectH);
    textSize(12);
  }
}
