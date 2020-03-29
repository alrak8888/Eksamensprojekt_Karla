//zoom
//int zoom = 400;
//final static byte increase = 2;

import java.util.*;


int tidslinjeX1 = 1400;
int tidslinjeY = 450;
int tidslinjeX2 = 200;
int y1_1=450;
int y2_1 = 400;
PFont myFont;
int i;

ArrayList<event> events;

void setup() {
  size(1600, 600); //(1600, 900)
  smooth();
  background(0);
  //String[] fontList = PFont.list();
  //printArray(fontList);
  myFont = createFont("trebuchet ms", 15); //"terminator two" fonten er god. "Trebuchet ms fed" er også fin. 
  textFont(myFont);
  //baseColor = color (0);
  //currentColor = baseColor;
  //rectColor = color(255);

  events = new ArrayList<event>();
  events.add(new event(new StringList("Krig", "Nazisme"), 1940, 1945));//andenVK
  events.add(new event(new StringList("Krig"), 1914, 1918));//firstVK
  events.add(new event(new StringList("Terror", "USA"), 2001, 2001));//twintowers
  events.add(new event(new StringList("Kvinder", "Stemmeret"), 1915, 1915));//kvindeStem
  events.add(new event(new StringList("Politik"), 1933, 1933));//Kanslergade
  events.add(new event(new StringList("Politik"), 1973, 1973));//DKEF


  println ("Before sorting");
  for (event e : events) {
    println(e.x1);
  }

  Collections.sort(events);

  println(" ");
  println("After sorting");
  for (event e : events) {
    println(e.x1);
  }

  int total = events.size();
  println(total);
  println(events);
}


void draw() {

  stroke(255, 66, 86);
  strokeWeight(1);
  line (tidslinjeX1, tidslinjeY, tidslinjeX2, tidslinjeY); 
  fill(255);
  text("1901", tidslinjeX2-50, tidslinjeY);
  text("2020", tidslinjeX1+50, tidslinjeY);

  //Begivenheder. Udregning af årstal i pixels: (år fra 1900 - 1)*10 + 200 fx. 1945 (1945-1901)*10+200 = 640
  event firstVK = new event(new StringList("Krig"), 1914, 1918);
  //firstVK.tegnEvent();

  event kvindeStem = new event(new StringList("Kvinder", "Stemmeret"), 1915, 1915);//340, 340);
  kvindeStem.tegnEvent();

  event Kanslergade = new event(new StringList("Politik"), 1933, 1933);//520, 520);
  Kanslergade.tegnEvent();

  event andenVK = new event(new StringList("Krig", "Nazisme"), 1940, 1945);//590.0, 640.0);
  andenVK.tegnEvent();

  event DKEF = new event(new StringList("Politik", "Økonimi"), 1973, 1973);//920, 920);
  DKEF.tegnEvent();

  event twintowers = new event(new StringList("Terror", "USA"), 2001, 2001);//1200, 1200);
  twintowers.tegnEvent();

  //knap nyKnap = new knap (100, 100);
  //nyKnap.tegnKnap();


  if (mousePressed) { 
    event e = events.get(0);
    e.tegnEvent();
  }
}















//til zoom brug måske translate
