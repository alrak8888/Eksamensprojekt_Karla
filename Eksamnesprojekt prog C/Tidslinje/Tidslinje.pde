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
  size(600, 900); //1600
  smooth();
  //String[] fontList = PFont.list();
  //printArray(fontList);
  myFont = createFont("trebuchet ms fed", 15); //"terminator two" fonten er god. "Trebuchet ms fed" er også fin. 
  textFont(myFont);
  
  events = new ArrayList<event>();
  
 // event [] events = new event[10];
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
  event andenVK = new event(new StringList("Krig", "Nazisme"), 590.0, 640.0);
  andenVK.tegnEvent();
  

  event firstVK = new event(new StringList("Krig"), 330.0, 370.0);
  firstVK.tegnEvent();
 

  event twintowers = new event(new StringList("Terror", "USA"), 1200, 1200);
  twintowers.tegnEvent();
  

  event kvindeStem = new event(new StringList("Kvinder", "Stemmeret"), 340, 340);
  kvindeStem.tegnEvent();
 

  event Kanslergade = new event(new StringList("Politik"), 520, 520);
  Kanslergade.tegnEvent();

  event DKEF = new event(new StringList("Politik"), 920, 920);
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
