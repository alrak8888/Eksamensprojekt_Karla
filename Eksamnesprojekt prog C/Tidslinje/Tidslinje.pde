//zoom
//int zoom = 400;
//final static byte increase = 2;


int tidslinjeX1 = 1400;
int tidslinjeY = 450;
int tidslinjeX2 = 200;
float y1_1=450;
int y2_1 = 400;
PFont myFont;

void setup() {
  size(1600, 900); 
  smooth();
  //String[] fontList = PFont.list();
  //printArray(fontList);
  myFont = createFont("trebuchet ms fed", 15); //"terminator two" fonten er god. "Trebuchet ms fed" er også fin. 
  textFont(myFont);
}

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
    int [] colours = {#A01D1D, #68C674, 0, 255};
    int index = int(random(colours.length));
    fill(colours[index], 100);
    rect(x1, y1, x4, y4);
    fill(255);
    //text("2. Verdenskrig", x1+10, x3+10);
  }
}

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


void draw() {
  background(0);
  stroke(255, 66, 86);
  strokeWeight(1);
  line (tidslinjeX1, tidslinjeY, tidslinjeX2, tidslinjeY); 
  fill(255);
  text("1901", tidslinjeX2-50, tidslinjeY);
  text("2020", tidslinjeX1+50, tidslinjeY);


  //Begivenheder. Udregning af årstal i pixels: (år fra 1900 - 1)*10 + 200 fx. 1945 (1945-1)*10+200 = 640
  event andenVK = new event(new StringList("krig", "Nazisme"),590.0, 640.0);
  andenVK.tegnEvent();

  event firstVK = new event(new StringList("krig"), 330.0, 370.0);
  firstVK.tegnEvent();

  event twintowers = new event(new StringList("terror", "USA"),1200, 1200);
  twintowers.tegnEvent();

  event kvindeStem = new event(new StringList("Kvinder", "Stemmeret"),340, 340);
  kvindeStem.tegnEvent();

  event Kanslergade = new event(new StringList("Politik"),520, 520);
  Kanslergade.tegnEvent();

  event DKEF = new event(new StringList("politik"),920, 920);
  DKEF.tegnEvent();
  
  //menu
  knap krig = new knap (1550,0,1600,15);
  krig.tegnKnap();
  
  


  //knapper
  knap reset = new knap (0, 0, 100, 100);
  reset.tegnKnap();





  //if (mousePressed)
  //if (mouseButton==LEFT) zoom+= increase;
  //else if (mouseButton==RIGHT) zoom -= increase;
}


//til zoom brug måske translate
