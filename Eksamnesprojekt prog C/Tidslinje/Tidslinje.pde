//zoom
//int zoom = 400;
//final static byte increase = 2;

int tidslinjeX1 = 1400;
int tidslinjeY = 450;
int tidslinjeX2 = 200;
float y1_1=450;
int y2_1 = 400;
PFont myFont;

ArrayList<event> events;

void setup() {
  size(1600, 600); //(1600, 900)
  smooth();
  //String[] fontList = PFont.list();
  //printArray(fontList);
  myFont = createFont("trebuchet ms fed", 15); //"terminator two" fonten er god. "Trebuchet ms fed" er også fin. 
  textFont(myFont);

  events = new ArrayList<event>();
  events.add(new event(new StringList("Krig", "Nazisme"), 1940,1945));//andenVK
  events.add(new event(new StringList("Krig"), 1914,1918));//firstVK
  events.add(new event(new StringList("Terror", "USA"), 2001,2001));//twintowers
  events.add(new event(new StringList("Kvinder", "Stemmeret"), 1915,1915));//kvindeStem
  events.add(new event(new StringList("Politik"), 1933,1933));//Kanslergade
  events.add(new event(new StringList("Politik"), 1973,1973));//DKEF

  int total = events.size();
  println(total);
}

void draw() {
  background(0);
  stroke(255, 66, 86);
  strokeWeight(1);
  line (tidslinjeX1, tidslinjeY, tidslinjeX2, tidslinjeY); 
  fill(255);
  text("1901", tidslinjeX2-50, tidslinjeY);
  text("2020", tidslinjeX1+50, tidslinjeY);

  //Begivenheder. Udregning af årstal i pixels: (år fra 1900 - 1)*10 + 200 fx. 1945 (1945-1901)*10+200 = 640
  event andenVK = new event(new StringList("Krig", "Nazisme"), 1940,1945);//590.0, 640.0);
  andenVK.tegnEvent();

  event firstVK = new event(new StringList("Krig"), 1914, 1918);
  firstVK.tegnEvent();

  event twintowers = new event(new StringList("Terror", "USA"), 2001, 2001);//1200, 1200);
  twintowers.tegnEvent();

  event kvindeStem = new event(new StringList("Kvinder", "Stemmeret"), 1915, 1915);//340, 340);
  kvindeStem.tegnEvent();

  event Kanslergade = new event(new StringList("Politik"), 1933,1933);//520, 520);
  Kanslergade.tegnEvent();

  event DKEF = new event(new StringList("Politik"), 1973, 1973);//920, 920);
  DKEF.tegnEvent();


  //menu
  knap krig = new knap (1550, 0, 1600, 15);
  krig.tegnKnap();


  //knapper
  knap reset = new knap (0, 0, 100, 100);
  reset.tegnKnap();


  //if (mousePressed)
  //if (mouseButton==LEFT) zoom+= increase;
  //else if (mouseButton==RIGHT) zoom -= increase;
}


//til zoom brug måske translate
