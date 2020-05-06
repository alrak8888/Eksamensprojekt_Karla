//Det her er den klasse, der laver alle events
class event implements Comparable<event> { //comparable er med sådan at eventsne kan sammenlignes med hinanden og dermed sorteres
  StringList tags;
  int x1, y1, x2, y2, x3, y3, x4, y4;
  String title;

  event (String _title, StringList _tags, int x, int z) {
    this.x1=x=(x-1901)*10+200;
    this.y1=y1_1;
    this.x2=x1;
    this.y2=y2_1;
    this.x3=z=(z-1901)*10+200;
    this.y3=y1_1;
    this.x4=x3;
    this.y4=y2_1;
    this.tags=_tags;
    this.title=_title;

    if (x==z) {
      y2=y2-30;
    }
  }

  //Sortering og sammenligning
  @Override 
    int compareTo(event other) {
    return this.x1 - other.x1;
  }


  void tegnEvent() {
    stroke(255);
    line (x1, y1, x2, y2);
    line(x3, y1, x4, y2);
    rectMode(CORNERS);
    noStroke();
    fill(255, 100, 49, 100); //den orange farve
    rect(x1, y1, x4, y2);
    fill(255);
    textAlign(CENTER, CENTER);
    text(title, x2+((x4-x2)/2), y2-15);
  }
}
