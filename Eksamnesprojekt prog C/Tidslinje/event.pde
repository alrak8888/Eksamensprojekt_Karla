class event {
  StringList tags;
  float x1, y1, x2, y2, x3, y3, x4, y4, q1;


  event (StringList _tags, float x, float z) {
    this.x1=x;
    this.y1=y1_1;
    this.x2=x1;
    this.y2=y2_1;
    this.x3=z;
    this.y3=y1_1;
    this.x4=x3;
    this.y4=y2_1;
    this.tags=_tags;
  }
  void tegnEvent() {
    //strokeWeight(8);
    stroke(255);
    line (x1, y1, x2, y2);
    line(x3, y1, x4, y4);
    rectMode(CORNERS);
    noStroke();
    fill(255, 100, 49, 100);
    //int [] colours = {#A01D1D, #68C674, 0, 255};
    //int index = int(random(colours.length));
    //fill(colours[index], 100);
    rect(x1, y1, x4, y4);
    fill(255);
    //text("2. Verdenskrig", x1+10, x3+10);
  }
}