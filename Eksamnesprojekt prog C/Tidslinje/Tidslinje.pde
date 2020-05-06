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

//Info
boolean ToVKover = false; //1. verdenskirg
boolean ToVKKlik;

boolean EnVKover = false; //2. verdenskrig 
boolean EnVKKlik;

boolean kansOver = false; //Kanslergadeforliget
boolean kansKlik;

boolean KSover = false; //kvindernes stemmeret
boolean KSklik;

//krig
int krigX, krigY;      // Position of square button
boolean krigOver = false; //Handler om knapperne
color krigColor=0;
color krigHighlight=#F29D14;
String krig = "Krig";
boolean krigKlik;

//politik
int polX, polY;
boolean polOver = false;
color polColor=0;
color polHighlight=#F29D14;
String pol="Politik";
boolean polKlik;

//Nazisme
int nazX, nazY;
boolean nazOver = false;
color nazColor=0;
color nazHighlight=#F29D14;
String naz = "Nazisme";
boolean nazKlik;

//Terror
int terX, terY;
boolean terOver = false;
color terColor =0;
color terHighlight=#F29D14;
String ter = "Terror";
boolean terKlik;

//kvinder
int kviX, kviY;
boolean kviOver = false;
color kviColor =0;
color kviHighlight=#F29D14;
String kvi = "Kvinder";
boolean kviKlik;


int SizeX = 30;
int SizeY= 30; 
int round = 7;// Diameter of rect

color pressColor=#F29D14;

void setup() {
  size(1600, 600); //(1600, 900)
  smooth();
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
    println(e.title);
  }

  Collections.sort(events);

  println(" ");
  println("After sorting");
  for (event e : events) {
    println(e.title);
  }

  int total = events.size();
  println(total);
  //println(events);
  //noLoop();
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

  pushMatrix();
  zoomer.transform();


  //KNAPPERNE:
  for (event i : events) {

    //knap krig
    //tegn:
    if (krigKlik) {
      if (i.tags.hasValue("Krig")) { //
        i.tegnEvent();
        fill(pressColor);
        krigColor=pressColor;
        krigHighlight=51;
      }
    }
    //remove:
    if (krigKlik==false && ToVKKlik==false) {
      krigHighlight=#F29D14;
      krigColor=0;
    }
    //Info:
    if (ToVKKlik) {
      info VKTO = new info(loadStrings("AndenVK.txt"), events.get(3).x2+((events.get(3).x4-events.get(3).x2)/2), events.get(3).y1);
      VKTO.tegnInfo();
    }

    //Info:
    if (EnVKKlik) {
      info VKEN = new info(loadStrings("firstVK.txt"), events.get(0).x2+((events.get(0).x4-events.get(0).x2)/2), events.get(0).y1);
      VKEN.tegnInfo();
    }

    //knap politik
    if (polKlik) {
      if (i.tags.hasValue("Politik")) {
        //noLoop();
        i.tegnEvent();
        fill (pressColor);
        polColor = pressColor;
        polHighlight=51;
      }
    }
    //remove
    if (polKlik==false) {
      polHighlight=#F29D14;
      polColor=0;
    }
    //INFO
    if (kansKlik) {
      info kans = new info(loadStrings("Kansler.txt"), events.get(2).x2+((events.get(2).x4-events.get(2).x2)/2), events.get(2).y1);
      kans.tegnInfo();
    }


    //knap nazisme
    if (nazKlik) {
      if (i.tags.hasValue("Nazisme")) { //
        i.tegnEvent();
        fill(pressColor);
        nazColor=pressColor;
        nazHighlight=51;
      }
    }
    //remove
    if (nazKlik==false) {
      nazHighlight=#F29D14;
      nazColor=0;
    }
    //knap terror
    if (terKlik) {
      if (i.tags.hasValue("Terror")) { //
        i.tegnEvent();
        fill(pressColor);
        terColor=pressColor;
        terHighlight=51;
      }
    }
    //remove
    if (terKlik==false) {
      terHighlight=#F29D14;
      terColor=0;
    }

    //knap kvinder
    if (kviKlik) {
      if (i.tags.hasValue("Kvinder")) { //
        i.tegnEvent();
        fill(pressColor);
        kviColor=pressColor;
        kviHighlight=51;
      }
    }
    //remove
    if (kviKlik==false) {
      kviHighlight=#F29D14;
      kviColor=0;
    }
    //INFO
    if (KSklik) {
      info KS = new info(loadStrings("kvinder.txt"), events.get(1).x2+((events.get(1).x4-events.get(1).x2)/2), events.get(1).y1);
      KS.tegnInfo();
    }
  }
  popMatrix();
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

    //INFO:
  } else if (overToVK(events.get(3).x1, events.get(3).x3, events.get(3).y2, events.get(3).y1)) {
    ToVKover=true;
    nazOver=false;
    krigOver=false;
    polOver=false;
    terOver=false;
    kviOver=false;
  } else if (overEnVK(events.get(0).x1, events.get(0).x3, events.get(0).y2, events.get(0).y1)) {
    EnVKover=true;
    ToVKover=false;
    nazOver=false;
    krigOver=false;
    polOver=false;
    terOver=false;
    kviOver=false;
  } else if (overKans(events.get(2).x1-10, events.get(2).x3+10, events.get(2).y2, events.get(2).y1)) {
    kansOver=true;
    EnVKover=false;
    ToVKover=false;
    nazOver=false;
    krigOver=false;
    polOver=false;
    terOver=false;
    kviOver=false;
  } else if (overKS(events.get(1).x1-10, events.get(1).x3+10, events.get(1).y2, events.get(1).y1)) {
    KSover=true;
    kansOver=false;
    EnVKover=false;
    ToVKover=false;
    nazOver=false;
    krigOver=false;
    polOver=false;
    terOver=false;
    kviOver=false;
  } else {
    krigOver=polOver=nazOver=terOver=kviOver=ToVKover=EnVKover=kansOver= KSover=false;
  }
}

//INFO:
boolean overToVK (int x, int y, int z, int q) {
  if (mouseX >= x && mouseX <= y && 
    mouseY >= z && mouseY <= q) {
    return true;
  } else {
    return false;
  }
}

boolean overEnVK (int x, int y, int z, int q) {
  if (mouseX >= x && mouseX <= y && 
    mouseY >= z && mouseY <= q) {
    return true;
  } else {
    return false;
  }
}

boolean overKans (int x, int y, int z, int q) {
  if (mouseX >= x && mouseX <= y && 
    mouseY >= z && mouseY <= q) {
    return true;
  } else {
    return false;
  }
}

boolean overKS (int x, int y, int z, int q) {
  if (mouseX >= x && mouseX <= y && 
    mouseY >= z && mouseY <= q) {
    return true;
  } else {
    return false;
  }
}

//KNAPPER:
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
  zoomer.transform();

  //INFO
  //anden verdenskrig
  if (ToVKover==true && mouseButton==LEFT) {
    ToVKKlik = true;
  }

  //første verdenskrig
  if (EnVKover==true && mouseButton==LEFT) {
    EnVKKlik = true;
  }
  //kanslergadeforliget
  if (kansOver==true && mouseButton==LEFT) {
    kansKlik = true;
  }

  //Kvindernes stemmeret
  if (KSover==true && mouseButton==LEFT) {
    KSklik = true;
  }
  //KNAPPER:

  //krig
  if (krigOver==true && mouseButton==LEFT) {// && krigHighlight==#F29D14) { 
    krigKlik = true;
  }
  //remove
  if (krigOver==true && mouseButton==LEFT && krigHighlight==51) {
    krigKlik=false;
    ToVKKlik=false;
    EnVKKlik=false;
  }

  //Politik
  if (polOver==true && mouseButton==LEFT) {
    polKlik = true;
  }
  //remove
  if (polOver==true && mouseButton==LEFT && polHighlight==51) {
    polKlik=false;
    kansKlik=false;
  }

  //nazisme
  if (nazOver==true && mouseButton==LEFT) {
    nazKlik = true;
  }
  //remove
  if (nazOver==true && mouseButton==LEFT && nazHighlight==51) {
    nazKlik=false;
  }
  //terror
  if (terOver==true && mouseButton==LEFT) { 
    terKlik = true;
  }
  //remove
  if (terOver==true && mouseButton==LEFT && terHighlight==51) {
    terKlik=false;
  }
  //kvinder
  if (kviOver==true && mouseButton==LEFT) { 
    kviKlik = true;
  }
  //remove
  if (kviOver==true && mouseButton==LEFT && kviHighlight==51) {
    kviKlik=false;
  }
}
//redraw();





//til zoom brug måske translate
