//Det her er den klasse, der laver alle events
class event implements Comparable<event> { //comparable er med sådan at eventsne kan sammenlignes med hinanden og dermed sorteres
  StringList tags;
  int x1, y1, x2, y2, x3, y3, x4, y4;
  String title;


  event (String _title, StringList _tags, int x, int z) {
    //Udregning af årstal i pixels: (år - 1901)*10 + 200 fx. 1945 = (1945-1901)*10+200 = 640
    //Dette gørres sådan at programmet selv regner pixel-positionen ud
    //Så kan man, når man laver eventet som objekt bare skrive startår og slutår direkte ind
    this.x1=x=(x-1901)*10+200; //
    this.y1=y1_1;
    this.x2=x1;
    this.y2=y2_1;
    this.x3=z=(z-1901)*10+200;
    this.y3=y1_1;
    this.x4=x3;
    this.y4=y2_1;
    this.tags=_tags;
    this.title=_title;

    //Hvis begivenheden kun varer 1 år gøres den højere, 
    //så begivenhederner ikke ligger ind over hinanden
    if (x==z) { 
      y2=y2-30;
    }
  }

  //Sortering og sammenligning
  @Override 
    int compareTo(event other) {
    return this.x1 - other.x1;
  }

  //her tegnes eventsne
  void tegnEvent() {
    stroke(255);
    line (x1, y1, x2, y2);
    line(x3, y1, x4, y2);
    rectMode(CORNERS);
    noStroke();
    fill(#FF6431, 100); //den orange farve, de 100 er alpha (gennemsigtighed)
    rect(x1, y1, x4, y2);
    fill(255);
    textAlign(CENTER, CENTER);
    text(title, x2+((x4-x2)/2), y2-15);
  }
}
