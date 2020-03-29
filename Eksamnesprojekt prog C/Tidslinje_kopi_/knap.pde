

int rectX, rectY;
int rectSize =90;
color rectColor, baseColor;
color currentColor;
boolean rectOver = false;

class knap {
  float x1, y1;

  knap (int rectX, int rectY) {
    x1=rectX;
    y1=rectY;
  }
  void tegnKnap() {
    update (mouseX, mouseY);
    //background(currentColor);
    rect (rectX, rectY, rectSize, rectSize);
  }

  void update (int x, int y) {
    if (overRect(rectX, rectY, rectSize, rectSize)) {
      rectOver = true;
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
}
