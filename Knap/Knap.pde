int rectX, rectY;
int rectSize =90;
color rectColor;
boolean rectOver = false;


class knap {
  float x1, y1, x2, y2;

  knap (float x, float y, float z, float q) {
    x1=x;
    y1=y;
    x2=z;
    y2=q;
  }
  void tegnKnap() {
    if (mouseX>x1&&mouseX<x2 == true) {
      fill (0);
    } else {
      fill (255);
    }
    if (mousePressed&&mouseButton ==LEFT ==true) {

      fill (100, 76, 85);
    } else {
      fill (255);
    }
    rectMode(CORNERS);
    rect(x1, y1, x2, y2);
  }
}

void update (int x, int y) {
  if (overRect(rectX, rectY, rectSize, rectSize)) {
    rectOver = true;
  } else {
    rectOver = false;
  }
}

void mousePressed() {
  
  if (rectOver) {
    currentColor = rectColor;
  }
}

  boolean overRect (int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
