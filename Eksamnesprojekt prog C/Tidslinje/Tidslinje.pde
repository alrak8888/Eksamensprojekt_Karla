//zoom
//int zoom = 400;
//final static byte increase = 2;

import java.util.*;//Importerer java-libraries
import org.gicentre.utils.move.*;

ZoomPan zoomer; 

//Tidslinjens variabler:
int tidslinjeX1 = 200; //start
int tidslinjeY = 450; //Y-position
int tidslinjeX2 = 1400; //slut

//Events
int y1_1=450; //Øverste y-position for events 
int y2_1 = 400; //Nederste y-position for events

PFont myFont;

ArrayList<event> events;

boolean ToVKover = false;

//krig
int krigX, krigY;      // Position of square button
boolean krigOver = false; //Handler om knapperne
color krigColor=0;
color krigHighlight=#F29D14;
String krig = "Krig";

//politik
int polX, polY;
boolean polOver = false;
color polColor=0;
color polHighlight=#F29D14;
String pol="Politik";

//Nazisme
int nazX, nazY;
boolean nazOver = false;
color nazColor=0;
color nazHighlight=#F29D14;
String naz = "Nazisme";

//Terror
int terX, terY;
boolean terOver = false;
color terColor =0;
color terHighlight=#F29D14;
String ter = "Terror";

//kvinder
int kviX, kviY;
boolean kviOver = false;
color kviColor =0;
color kviHighlight=#F29D14;
String kvi = "Kvinder";


int SizeX = 30;
int SizeY= 30; 
int round = 7;// Diameter of rect

color pressColor=#F29D14;

void setup() {
  size(1600, 600); //(1600, 900)
  smooth();
  background(0);
  //String[] fontList = PFont.list();
  //printArray(fontList);
  myFont = createFont("trebuchet ms", 15); //"terminator two" fonten er god. "Trebuchet ms fed" er også fin. 
  textFont(myFont);

  //Zoom
  zoomer = new ZoomPan(this); //zoomer ved at holde venstre musetast + SHIFT inde, pan ved at holde højre musetast og SHIFT inde
  zoomer.setMouseMask(SHIFT); //Gør sådan at man også skal trykke på shift for at zoome, så kan man bruge musen til andre ting også

  //ArrayList med events. Her kan man tilføje flere events
  events = new ArrayList<event>();
  events.add(new event("Anden Verdenskrig", new StringList("Krig", "Nazisme"), 1940, 1945));//andenVK
  events.add(new event("Første Verdenskrig", new StringList("Krig"), 1914, 1918));//firstVK
  events.add(new event("9/11", new StringList("Terror", "USA"), 2001, 2001));//twintowers
  events.add(new event("Kvinders Stemmeret", new StringList("Kvinder", "Stemmeret"), 1915, 1915));//kvindeStem
  events.add(new event("Kanslergadeforliget", new StringList("Politik", "Danmark", "Økonomi"), 1933, 1933));//Kanslergade
  events.add(new event("Danmark bliver medled af EF", new StringList("Politik", "Danmark", "Europa", "økonomi"), 1973, 1973));//DKEF

  //Her sorteres sådan at de står i den rækkefølge som de er i i arrayet. Det her kode bruges egentlig ikke til noget, men man kan ses at programmet virker, hvis disse ting sker
  println ("Before sorting");
  for (event e : events) {
    println(e.tags);
  }

  Collections.sort(events);

  println(" ");
  println("After sorting");
  for (event e : events) {
    println(e.x1);
  }

  int total = events.size();
  println(total);
  //println(events);
}


void draw() {

  background(0);

  pushMatrix();
  zoomer.transform();

  //Her tegnes selve tidslinjen
  stroke(255, 66, 86);
  strokeWeight(1);
  line (tidslinjeX1, tidslinjeY, tidslinjeX2, tidslinjeY); 
  fill(255);
  //Her tegnes teksten i enderne
  text("1901", tidslinjeX1-50, tidslinjeY);
  text("2020", tidslinjeX2+50, tidslinjeY);

  krigX=1450;
  krigY= 50;

  polX=krigX;
  polY=krigY+50;

  nazX=krigX;
  nazY=polY+50;

  terX=krigX;
  terY=nazY+50;

  kviX=krigX;
  kviY=terY+50;

  for (event e : events) {
    //e.tegnEvent();
  }
  /*
  //Begivenheder. Udregning af årstal i pixels: (år - 1901)*10 + 200 fx. 1945 = (1945-1901)*10+200 = 640
   event firstVK = new event("Første Verdenskrig", new StringList ("Krig"), 1914, 1918);
   //firstVK.tegnEvent();
   
   event kvindeStem = new event("Kvinders stemmeret", new StringList("Kvinder", "Stemmeret", "Danmark"), 1915, 1915);//340, 340);
   //kvindeStem.tegnEvent();
   
   event Kanslergade = new event("Kanslergadeforliget", new StringList("Politik", "Danmark", "Økonomi"), 1933, 1933);//520, 520);
   //Kanslergade.tegnEvent();
   
   event andenVK = new event("Anden Verdenskrig", new StringList("Krig", "Nazisme"), 1940, 1945);//590.0, 640.0);
   //andenVK.tegnEvent();
   
   event DKEF = new event("Danmark bliver medlem af EF", new StringList("Politik", "Økonimi", "Danmark", "Europa"), 1973, 1973);//920, 920);
   //DKEF.tegnEvent();
   
   event twintowers = new event("9/11", new StringList("Terror", "USA"), 2001, 2001);//1200, 1200);
   //twintowers.tegnEvent();
   */
  popMatrix();

  update(mouseX, mouseY);
  //pushMatrix();

  if (krigOver) {
    fill(krigHighlight);
  } else {
    fill(krigColor);
  }
  rectMode(CORNER);
  rect(krigX, krigY, SizeX, SizeY, round);
  fill(255);
  textAlign(CORNER, CENTER);
  text(krig, krigX+40, krigY+(SizeY/2)-3);

  if (polOver) {
    fill(polHighlight);
  } else {
    fill(polColor);
  }
  rectMode(CORNER);
  rect(polX, polY, SizeX, SizeY, round);
  fill(255);
  textAlign(CORNER, CENTER);
  text(pol, polX+40, polY+(SizeY/2)-3);

  if (nazOver) {
    fill(nazHighlight);
  } else {
    fill(nazColor);
  }
  rectMode(CORNER);
  rect(nazX, nazY, SizeX, SizeY, round);
  fill(255);
  textAlign(CORNER, CENTER);
  text(naz, nazX+40, nazY+(SizeY/2)-3);

  if (terOver) {
    fill(terHighlight);
  } else {
    fill(terColor);
  }
  rectMode(CORNER);
  rect(terX, terY, SizeX, SizeY, round);
  fill(255);
  textAlign(CORNER, CENTER);
  text(ter, terX+40, terY+(SizeY/2)-3);

  if (kviOver) {
    fill(kviHighlight);
  } else {
    fill(kviColor);
  }
  rectMode(CORNER);
  rect(kviX, kviY, SizeX, SizeY, round);
  fill(255);
  textAlign(CORNER, CENTER);
  text(kvi, kviX+40, kviY+(SizeY/2)-3);
}

void update(int x, int y) {
  if ( overKrig(krigX, krigY, SizeX, SizeY) ) {
    krigOver = true;
    polOver= false;
    nazOver=false;
    terOver=false;
    kviOver=false;
  } else if ( overPol(polX, polY, SizeX, SizeY) ) {
    polOver = true;
    krigOver=false;
    nazOver=false;
    terOver=false;
    kviOver=false;
  } else if (overNaz(nazX, nazY, SizeX, SizeY)) {
    nazOver=true;
    krigOver=false;
    polOver=false;
    terOver=false;
    kviOver=false;
  } else if (overTer(terX, terY, SizeX, SizeY)) {
    nazOver=false;
    krigOver=false;
    polOver=false;
    terOver=true;
    kviOver=false;
  } else if (overKvi(kviX, kviY, SizeX, SizeY)) {
    nazOver=false;
    krigOver=false;
    polOver=false;
    terOver=false;
    kviOver=true;
  } else if (overToVK(events.get(3).x1, events.get(3).x3, events.get(3).y2, events.get(3).y1)) {
    ToVKover=true;
    nazOver=false;
    krigOver=false;
    polOver=false;
    terOver=false;
    kviOver=false;
  } else {
    krigOver=polOver=nazOver=terOver=kviOver=ToVKover=false;
  }
}

boolean overToVK (int x, int y, int z, int q) {
  if (mouseX >= x && mouseX <= y && 
    mouseY >= z && mouseY <= q) {
    return true;
  } else {
    return false;
  }
}
boolean overKrig (int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overPol (int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overNaz (int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overTer (int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overKvi (int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}


void mousePressed() {
  //zoomer.transform();

  //INFO
  if (mousePressed && ToVKover==true && mouseButton==LEFT) {
    info VKTO = new info(loadStrings("AndenVK.txt"), events.get(3).x2+((events.get(3).x4-events.get(3).x2)/2), events.get(3).y1);
    VKTO.tegnInfo();
    println("WOW");
  }


  //Events og knapper
  for (event i : events) {

    if (mousePressed && polOver==true && mouseButton==LEFT) {
      if (i.tags.hasValue("Politik")) {
        i.tegnEvent();
        fill (pressColor);
        polColor = pressColor;
        polHighlight=51;
      }
    }
    //}

    //for (event i : events) {

    if (mousePressed  && krigOver==true && mouseButton==LEFT) { 
      if (i.tags.hasValue("Krig")) { //
        i.tegnEvent();
        fill(pressColor);
        krigColor=pressColor;
        krigHighlight=51;
      }
    }
    /*
    if (mousePressed && krigOver==true && mouseButton==LEFT && krigHighlight==51) {
     if (i.tags.hasValue("Krig")) { //
     i.y2=y2_1+y2_1;
     //i.x2=100;
     krigHighlight=255;
     println("WOW");
     }
     }
     */
    // }

    //for (event i : events) {

    if (mousePressed  && nazOver==true && mouseButton==LEFT) { 
      if (i.tags.hasValue("Nazisme")) { //
        i.tegnEvent();
        fill(pressColor);
        nazColor=pressColor;
        nazHighlight=51;
      }
    }
    //}

    //for (event i : events) {

    if (mousePressed  && terOver==true && mouseButton==LEFT) { 
      if (i.tags.hasValue("Terror")) { //
        i.tegnEvent();
        fill(pressColor);
        terColor=pressColor;
        terHighlight=51;
      }
    }
  }

  for (event i : events) {

    if (mousePressed  && kviOver==true && mouseButton==LEFT) { 
      if (i.tags.hasValue("Kvinder")) { //
        i.tegnEvent();
        fill(pressColor);
        kviColor=pressColor;
        kviHighlight=51;
      }
    }
  }
}








//til zoom brug måske translate
