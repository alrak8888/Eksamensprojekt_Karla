//zoom
//int zoom = 400;
//final static byte increase = 2;

import java.util.*;//Importerer java-libraries

//Tidslinjens variabler:
int tidslinjeX1 = 200; //start
int tidslinjeY = 450; //Y-position
int tidslinjeX2 = 1400; //slut

//Events
int y1_1=450; //Øverste y-position for events 
int y2_1 = 400; //Nederste y-position for events

PFont myFont;

ArrayList<event> events;

boolean rectOver = false; //Handler om 

//Farver til knapper:
color pressColor=#F29D14;
color rectColor=0;
color rectHighlight=#F29D14;

void setup() {
  size(1600, 600); //(1600, 900)
  smooth();
  background(0);
  //String[] fontList = PFont.list();
  //printArray(fontList);
  myFont = createFont("trebuchet ms", 15); //"terminator two" fonten er god. "Trebuchet ms fed" er også fin. 
  textFont(myFont);

  events = new ArrayList<event>();
  events.add(new event("Anden Verdenskrig", new StringList("Krig", "Nazisme"), 1940, 1945));//andenVK
  events.add(new event("Første Verdenskrig", new StringList("Krig"), 1914, 1918));//firstVK
  events.add(new event("9/11", new StringList("Terror", "USA"), 2001, 2001));//twintowers
  events.add(new event("Kvinders Stemmeret", new StringList("Kvinder", "Stemmeret"), 1915, 1915));//kvindeStem
  events.add(new event("Kanslergadeforliget", new StringList("Politik", "Danmark", "Økonomi"), 1933, 1933));//Kanslergade
  events.add(new event("Danmark bliver medled af EF", new StringList("Politik", "Danmark", "Europa", "økonomi"), 1973, 1973));//DKEF

  println ("Before sorting");
  for (event e : events) {
    println(e.tags);
  }

  Collections.sort(events);

  println(" ");
  println("After sorting");
  for (event e : events) {
    println(e.tags);
  }

  int total = events.size();
  println(total);
  //println(events);
}


void draw() {

  stroke(255, 66, 86);
  strokeWeight(1);
  line (tidslinjeX1, tidslinjeY, tidslinjeX2, tidslinjeY); 
  fill(255);
  text("1901", tidslinjeX1-50, tidslinjeY);
  text("2020", tidslinjeX2+50, tidslinjeY);

  //Begivenheder. Udregning af årstal i pixels: (år fra 1900 - 1)*10 + 200 fx. 1945 (1945-1901)*10+200 = 640
  event firstVK = new event("Første Verdenskrig", new StringList ("Krig"), 1914, 1918);
  //firstVK.tegnEvent();

  event kvindeStem = new event("Kvinders stemmeret", new StringList("Kvinder", "Stemmeret"), 1915, 1915);//340, 340);
  //kvindeStem.tegnEvent();

  event Kanslergade = new event("Kanslergadeforliget", new StringList("Politik", "Danmark", "Økonomi"), 1933, 1933);//520, 520);
  //Kanslergade.tegnEvent();

  event andenVK = new event("Anden Verdenskrig", new StringList("Krig", "Nazisme"), 1940, 1945);//590.0, 640.0);
  //andenVK.tegnEvent();

  event DKEF = new event("Danmark bliver medlem af EF", new StringList("Politik", "Økonimi", "Danmark", "Europa"), 1973, 1973);//920, 920);
  //DKEF.tegnEvent();

  event twintowers = new event("9/11", new StringList("Terror", "USA"), 2001, 2001);//1200, 1200);
  //twintowers.tegnEvent();

  //Knapper:
  knap krig = new knap(1500, 50, 90, 30, "Krig");
  krig.tegnKnap();
  
  //Hvad der sker hvis knap "krig" trykkes på
  for (event i : events) {

    if (mousePressed  && rectOver==true && mouseButton==LEFT) { 
      if (i.tags.hasValue("Krig")) { //
        i.tegnEvent();
        rectColor=pressColor;
        rectHighlight=51;
      }
    }
  }


  knap politik = new knap(1500, 100, 90, 30, "Politik");
  politik.tegnKnap();

  for (event i : events) {

    if (mousePressed && rectOver==true && mouseButton==LEFT) {
      if (i.tags.hasValue("Politik")) {
        i.tegnEvent();
      }
    }
  }
}


//Næste step er at lave knapper sådan at brugeren kan trykke på knapper og på den måde sortere i hvilke events han/hun ser
//Det kunne være fedt hvis man kunne lave det sådan at brugeren selv kunne indtaste nye events, men det er ikke prioritet










//til zoom brug måske translate
