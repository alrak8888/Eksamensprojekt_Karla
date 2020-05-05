/*

class knap {
  int krigX, krigY;      // Position of square button
  int krigSizeX, krigSizeY;          // Diameter of rect
  //color rectColor, baseColor;
  //color rectHighlight, pressColor;
  String navn;
  // color currentColor;

  //rectColor = color(0);
  //rectHighlight = color(51);
  //rectX = width/2-rectSize-10;
  //rectY = height/2-rectSize/2;

  knap (int _rectX, int  _rectY, int _rectSizeX, int _rectSizeY, String _navn) {
    this.rectX=_rectX;
    this.rectY=_rectY;
    this.rectSizeX=_rectSizeX;
    this.rectSizeY=_rectSizeY;
    this.navn=_navn;
  }

  

  boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }

  void tegnKnap() {
    update(mouseX, mouseY);

    if (rectOver) {
      fill(rectHighlight);
    } else {
      fill(rectColor);
    }
    //tegne knapperne
    stroke(255);
    rectMode(CORNER);
    rect(rectX, rectY, rectSizeX, rectSizeY);

    //navn på kanpperne
    fill(255);
    textAlign(CENTER, CENTER);
    text(navn, rectX+(rectSizeX/2), rectY+(rectSizeY/2)-3);
  }
}
*/
