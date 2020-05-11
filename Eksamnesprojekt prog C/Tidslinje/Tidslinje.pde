
import java.util.*;//Importerer java-libraries til comparison
import org.gicentre.utils.move.*; //importerer library til zoom

ZoomPan zoomer; //initialiserer zoom

//Herunder initialiseres og defineres nogel af de variabler, der bliver brugt i programmet

//Tidslinjens variabler:
int tidslinjeX1 = 200; //start
int tidslinjeY = 450; //Y-position
int tidslinjeX2 = 1400; //slut


//Variabler til events
int y1_1=450; //Øverste y-position for events 
int y2_1 = 400; //Nederste y-position for events

//Definerer arraylisten med events
ArrayList<event> events;


//Variabler til infoboksene
boolean ToVKover =false; //1. verdenskirg
boolean ToVKKlik;
color ToVKcolor = #F29D14;

boolean EnVKover; //2. verdenskrig 
boolean EnVKKlik;
color EnVKcolor = #F29D14;

boolean kansOver = false; //Kanslergadeforliget
boolean kansKlik;
color kansColor = #F29D14;

boolean KSover = false; //kvindernes stemmeret
boolean KSklik;
color KScolor = #F29D14;

boolean EFover = false; //DK i EF
boolean EFklik;
color EFcolor = #F29D14;

boolean sepOver = false; //9/11
boolean sepKlik;
color sepColor = #F29D14;

//Variabler til de forskellige knapper:

//reset zoom
int zoomX, zoomY;
boolean zoomOver=false;
color zoomColor=0;
color zoomHighlight=#F29D14;
String zoom = "Reset zoom";
boolean zoomKlik;
String [] zoomTekst;

//show/hide all events
int allX, allY;
boolean allOver=false;
color allColor=0;
color allHighlight=#F29D14;
String all = "Alle begivenheder";
boolean allKlik;

//krig
int krigX, krigY;      
boolean krigOver = false;
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

//Variabler der er ens for alle knapper:
int SizeX = 30;
int SizeY= 30; 
int round = 7;//gør at knapperne får runde hjørner
color pressColor=#F29D14; //den farve knapperne får, når der er blevet trykket på dem


void setup() {
  size(1600, 750); //(1600, 900)
  smooth();

  //Zoom
  zoomer = new ZoomPan(this); //zoomer ved at holde venstre musetast + SHIFT inde, pan ved at holde højre musetast og SHIFT inde
  zoomer.setMouseMask(SHIFT); //Gør sådan at man også skal trykke på shift for at zoome, så kan man bruge musen til andre ting også

  //ArrayList med events. Her kan man tilføje flere events
  events = new ArrayList<event>();
  events.add(new event("Anden Verdenskrig", new StringList("Krig", "Nazisme"), 1940, 1945));//andenVK
  events.add(new event("Første Verdenskrig", new StringList("Krig"), 1914, 1918));//firstVK
  events.add(new event("9/11", new StringList("Terror", "USA"), 2001, 2001));//twintowers
  events.add(new event("Kvinders Stemmeret", new StringList("Kvinder", "Stemmeret", "Politik"), 1915, 1915));//kvindeStem
  events.add(new event("Kanslergadeforliget", new StringList("Politik", "Danmark", "Økonomi"), 1933, 1933));//Kanslergade
  events.add(new event("Danmark bliver medled af EF", new StringList("Politik", "Danmark", "Europa", "økonomi"), 1973, 1973));//DKEF

  //Her sorteres eventsne i arrayet sådan at de er sorteret efter startår for begivenheden (hvilket svarer til x1-værdien)

  Collections.sort(events);

  println(" ");
  println("After sorting");
  for (event e : events) {
    println(e.title);
  }
}

void draw() {

  background(0);

  //Teksten der fortæller om hvordan man zoomer
  zoomTekst = loadStrings("zoom.txt");
  String zoomtex = join(zoomTekst, " ");
  fill(255);
  textAlign(TOP);
  text(zoomtex, 10, height-10);

  pushMatrix(); //der sætten en push og pop matrix udenom de ting, der skal zoomes
  // så man kan vælge hvilke objekter der skla zoomes på.
  zoomer.transform(); //her enables zoom

  //Her tegnes selve tidslinjen
  stroke(255, 66, 86);
  strokeWeight(1);
  line (tidslinjeX1, tidslinjeY, tidslinjeX2, tidslinjeY); 
  fill(255);
  //Her tegnes teksten i enderne
  text("1901", tidslinjeX1-50, tidslinjeY);
  text("2020", tidslinjeX2+50, tidslinjeY);

  //Herunder gives variablerne for knapperne værdier
  krigX=1400;
  krigY= 50;

  polX=krigX;
  polY=krigY+50;

  nazX=krigX;
  nazY=polY+50;

  terX=krigX;
  terY=nazY+50;

  kviX=krigX;
  kviY=terY+50;

  allX=krigX;
  allY=kviY+50;

  zoomX=100;
  zoomY=100;

  popMatrix(); //Under denne zoomes der ikke mere

  update(mouseX, mouseY); //opdatering af musens position

  //Herunder tegnes alle knapperne
  if (krigOver) {//krig
    fill(krigHighlight);
  } else {
    fill(krigColor);
  }
  rectMode(CORNER);
  rect(krigX, krigY, SizeX, SizeY, round);
  fill(255);
  textAlign(CORNER, CENTER);
  text(krig, krigX+40, krigY+(SizeY/2)-3);

  if (polOver) { //politik
    fill(polHighlight);
  } else {
    fill(polColor);
  }
  rectMode(CORNER);
  rect(polX, polY, SizeX, SizeY, round);
  fill(255);
  textAlign(CORNER, CENTER);
  text(pol, polX+40, polY+(SizeY/2)-3);

  if (nazOver) { //nazisme
    fill(nazHighlight);
  } else {
    fill(nazColor);
  }
  rectMode(CORNER);
  rect(nazX, nazY, SizeX, SizeY, round);
  fill(255);
  textAlign(CORNER, CENTER);
  text(naz, nazX+40, nazY+(SizeY/2)-3);

  if (terOver) { //terror
    fill(terHighlight);
  } else {
    fill(terColor);
  }
  rectMode(CORNER);
  rect(terX, terY, SizeX, SizeY, round);
  fill(255);
  textAlign(CORNER, CENTER);
  text(ter, terX+40, terY+(SizeY/2)-3);

  if (kviOver) { //kvinder
    fill(kviHighlight);
  } else {
    fill(kviColor);
  }
  rectMode(CORNER);
  rect(kviX, kviY, SizeX, SizeY, round);
  fill(255);
  textAlign(CORNER, CENTER);
  text(kvi, kviX+40, kviY+(SizeY/2)-3);


  if (allOver) { //se alle begivenheder
    fill(allHighlight);
  } else {
    fill(allColor);
  }
  rectMode(CORNER);
  rect(allX, allY, SizeX, SizeY, round);
  fill(255);
  textAlign(CORNER, CENTER);
  text(all, allX+40, allY+(SizeY/2)-3);

  if (zoomOver) { //reset zoom
    fill(zoomHighlight);
  } else {
    fill(zoomColor);
  }
  rectMode(CORNER);
  rect(zoomX, zoomY, SizeX, SizeY, round);
  fill(255);
  textAlign(CORNER, CENTER);
  text(zoom, zoomX+40, zoomY+(SizeY/2)-3);

  pushMatrix();//Herunder zoomes igen
  zoomer.transform();

  //Der itereres over alle events i arraylisten
  //for at se om der er blevet trykket på en knap, der har noget med dem at gøre
  for (event i : events) {

    //KNAPPERNE:
    //knap zoom
    if (zoomKlik) {
      zoomer.reset();
      zoomKlik=false;
    }

    //knap all
    if (allKlik) {
      i.tegnEvent();
      fill(pressColor);
      allColor=pressColor;
      allHighlight=51;
    }
    //remove: 
    if (allKlik==false) {
      allHighlight=#F29D14;
      allColor=0;
    }

    //knap krig
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


    //INFO:
    //anden verdenskrig
    if (ToVKKlik) {
      info VKTO = new info(loadStrings("AndenVK.txt"), events.get(3).x2+((events.get(3).x4-events.get(3).x2)/2), events.get(3).y1, ToVKcolor);
      VKTO.tegnInfo();
      ToVKcolor = #FF6431;
    }
    //remove
    if (ToVKKlik==false) {
      ToVKcolor=#F29D14;
    }

    //første verdenskrig
    if (EnVKKlik) {
      info VKEN = new info(loadStrings("firstVK.txt"), events.get(0).x2+((events.get(0).x4-events.get(0).x2)/2), events.get(0).y1, EnVKcolor);
      VKEN.tegnInfo();
      EnVKcolor=#FF6431;
    }
    //remove
    if (EnVKKlik==false) {
      EnVKcolor=#F29D14;
    }

    //kanslergadeforliget
    if (kansKlik) {
      info kans = new info(loadStrings("Kansler.txt"), events.get(2).x2+((events.get(2).x4-events.get(2).x2)/2), events.get(2).y1, kansColor);
      kans.tegnInfo();
      kansColor=#FF6431;
    }
    //remove
    if (kansKlik==false) {
      kansColor=#F29D14;
    }

    //kvindernes stemmeret
    if (KSklik) {
      info KS = new info(loadStrings("kvinder.txt"), events.get(1).x2+((events.get(1).x4-events.get(1).x2)/2), events.get(1).y1, KScolor);
      KS.tegnInfo();
      KScolor=#FF6431;
    }
    //remove
    if (KSklik==false) {
      KScolor=#F29D14;
    }

    //DK i EF
    if (EFklik) {
      info EF = new info(loadStrings("EF.txt"), events.get(4).x2+((events.get(4).x4-events.get(4).x2)/2), events.get(4).y1, EFcolor);
      EF.tegnInfo();
      EFcolor=#FF6431;
    }
    //remove
    if (EFklik==false) {
      EFcolor=#F29D14;
    }

    //9/11
    if (sepKlik) {
      info sep = new info(loadStrings("911.txt"), events.get(5).x2+((events.get(5).x4-events.get(5).x2)/2), events.get(5).y1, sepColor);
      sep.tegnInfo();
      sepColor=#FF6431;
    }
    //remove
    if (sepKlik==false) {
      sepColor=#F29D14;
    }
  }
  popMatrix();
}

void update(int x, int y) {//her opdateres musepositionen
  pushMatrix(); //der zoomes igen
  zoomer.transform();

  //herunder defineres det hvornår bollean "over knappen" er true for de forskellige knapper
  //det defienres også at, hvis én af dem er true, så er de andre false
  //dette gøres for alle knapper
  if ( overKrig(krigX, krigY, SizeX, SizeY) ) { //krig
    krigOver = true;

    polOver= false;
    nazOver=false;
    terOver=false;
    kviOver=false;
    KSover=false;
    kansOver=false;
    EnVKover=false;
    ToVKover=false;
    EFover=false;
    sepOver=false;
    allOver=false;
    zoomOver=false;
  } else if ( overPol(polX, polY, SizeX, SizeY) ) { //politik
    polOver = true;

    krigOver=false;
    nazOver=false;
    terOver=false;
    kviOver=false;
    KSover=false;
    kansOver=false;
    EnVKover=false;
    ToVKover=false;
    EFover=false;
    sepOver=false;
    allOver=false;
    zoomOver=false;
  } else if (overNaz(nazX, nazY, SizeX, SizeY)) { //nazisme
    nazOver=true;

    krigOver=false;
    polOver=false;
    terOver=false;
    kviOver=false;
    KSover=false;
    kansOver=false;
    EnVKover=false;
    ToVKover=false;
    EFover=false;
    sepOver=false;
    allOver=false;
    zoomOver=false;
  } else if (overTer(terX, terY, SizeX, SizeY)) { //terror
    terOver=true;

    nazOver=false;
    krigOver=false;
    polOver=false;
    kviOver=false;
    KSover=false;
    kansOver=false;
    EnVKover=false;
    ToVKover=false;
    EFover=false;
    sepOver=false;
    allOver=false;
    zoomOver=false;
  } else if (overKvi(kviX, kviY, SizeX, SizeY)) { //kvinder
    kviOver=true;

    allOver=false;
    nazOver=false;
    krigOver=false;
    polOver=false;
    terOver=false; 
    KSover=false;
    kansOver=false;
    EnVKover=false;
    ToVKover=false;
    EFover=false;
    sepOver=false;
    allOver=false;
    zoomOver=false;
  } else if (overAll(allX, allY, SizeX, SizeY)) { //se alle begivenheder
    allOver=true;

    nazOver=false;
    krigOver=false;
    polOver=false;
    terOver=false;
    kviOver=false;
    KSover=false;
    kansOver=false;
    EnVKover=false;
    ToVKover=false;
    EFover=false;
    sepOver=false;
    zoomOver=false;
  } else if (overZoom(zoomX, zoomY, SizeX, SizeY)) { //reset zoom
    zoomOver=true;

    nazOver=false;
    krigOver=false;
    polOver=false;
    terOver=false;
    kviOver=false;
    KSover=false;
    kansOver=false;
    EnVKover=false;
    ToVKover=false;
    EFover=false;
    sepOver=false;
    allOver=false;

    //Herunder gøres det samme for alle infoboksene

    //Anden verdenskrig
  } else if (overToVK(events.get(3).x1, events.get(3).x3, events.get(3).y2, events.get(3).y1)) { 
    ToVKover=true;

    nazOver=false;
    krigOver=false;
    polOver=false;
    terOver=false;
    kviOver=false;
    KSover=false;
    kansOver=false;
    EnVKover=false;
    EFover=false;
    sepOver=false;
    allOver=false;
    zoomOver=false;

    //første verdenskrig
  } else if (overEnVK(events.get(0).x1, events.get(0).x3, events.get(0).y2, events.get(0).y1)) {
    EnVKover=true;

    nazOver=false;
    krigOver=false;
    polOver=false;
    terOver=false;
    kviOver=false;
    KSover=false;
    kansOver=false;
    ToVKover=false;
    EFover=false;
    sepOver=false;
    allOver=false;
    zoomOver=false;

    //Kanslergadeforliget
  } else if (overKans(events.get(2).x1-10, events.get(2).x3+10, events.get(2).y2, events.get(2).y1)) {
    kansOver=true;

    EnVKover=false;
    ToVKover=false;
    nazOver=false;
    krigOver=false;
    polOver=false;
    terOver=false;
    kviOver=false;
    KSover=false;
    EFover=false;
    sepOver=false;
    allOver=false;
    zoomOver=false;

    //Kvindernes stemmeret
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
    EFover=false;
    sepOver=false;
    allOver=false;
    zoomOver=false;

    //DK i EF
  } else if (overEF(events.get(4).x1-10, events.get(4).x3+10, events.get(4).y2, events.get(4).y1)) {
    EFover=true;

    KSover=false;
    kansOver=false;
    EnVKover=false;
    ToVKover=false;
    nazOver=false;
    krigOver=false;
    polOver=false;
    terOver=false;
    kviOver=false;
    sepOver=false;
    allOver=false;
    zoomOver=false;

    //9/11
  } else if (overSep(events.get(5).x1-10, events.get(5).x3+10, events.get(5).y2, events.get(5).y1)) {
    sepOver=true;

    KSover=false;
    kansOver=false;
    EnVKover=false;
    ToVKover=false;
    nazOver=false;
    krigOver=false;
    polOver=false;
    terOver=false;
    kviOver=false;
    EFover=false;
    allOver=false;
    zoomOver=false;

    //Herunder defineres det at hvis ingen af det ovenstående er true
    //så er de alle false
  } else {
    krigOver=polOver=nazOver=terOver=kviOver=ToVKover=EnVKover=kansOver=KSover=EFover=sepOver=allOver=zoomOver=false;
  }
  popMatrix();
}
//Herunder defineres de booleans, der siger om musen er over knappen eller ej
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

boolean overEF (int x, int y, int z, int q) {
  if (mouseX >= x && mouseX <= y && 
    mouseY >= z && mouseY <= q) {
    return true;
  } else {
    return false;
  }
}

boolean overSep (int x, int y, int z, int q) {
  if (mouseX >= x && mouseX <= y && 
    mouseY >= z && mouseY <= q) {
    return true;
  } else {
    return false;
  }
}

//KNAPPER:
boolean overZoom (int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overAll (int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
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


void mousePressed() { //Her defineres de ting, der sker når brugeren bruger musen
  zoomer.transform();

  //INFO
  //anden verdenskrig
  if (ToVKover==true && mouseButton==LEFT && (krigKlik==true || nazKlik==true || allKlik==true)) {
    ToVKKlik = true;
    kansKlik = false;
  }
  //remove
  if (ToVKover==true && ToVKcolor==#FF6431 && mouseButton==LEFT ) {
    ToVKKlik = false;
  }

  //første verdenskrig
  if (EnVKover==true && mouseButton==LEFT && (krigKlik==true || nazKlik==true|| allKlik==true)) {
    EnVKKlik = true;
    KSklik=false;
  }
  //remove
  if (EnVKover==true && EnVKcolor==#FF6431 && mouseButton==LEFT) {//EnVKcolor==#FF6431
    EnVKKlik = false;
  }

  //kanslergadeforliget
  if (kansOver==true && mouseButton==LEFT && (polKlik==true|| allKlik==true)) {
    kansKlik = true;
    ToVKKlik=false;
  }
  //remove
  if (kansOver==true && kansColor==#FF6431 && mouseButton==LEFT) {
    kansKlik = false;
  }

  //Kvindernes stemmeret
  if (KSover==true && mouseButton==LEFT && (polKlik==true || kviKlik==true || allKlik==true)) {
    KSklik = true;
    EnVKKlik=false;
  }
  //remove
  if (KSover==true && KScolor==#FF6431 && mouseButton==LEFT) {
    KSklik = false;
  }

  // DK i EF
  if (EFover==true && mouseButton==LEFT && (polKlik==true|| allKlik==true)) {
    EFklik = true;
  }
  //remove
  if (EFover==true && EFcolor==#FF6431 && mouseButton==LEFT) {
    EFklik = false;
  }

  // 9/11
  if (sepOver==true && mouseButton==LEFT && (terKlik==true|| allKlik==true)) {
    sepKlik = true;
  }
  //remove
  if (sepOver==true && sepColor==#FF6431 && mouseButton==LEFT) {
    sepKlik = false;
  }

  //KNAPPER:
  //reset zoom
  if (zoomOver==true && mouseButton==LEFT) {
    zoomKlik=true;
  }
  //Show all events
  if (allOver==true && mouseButton==LEFT) {
    allKlik=true;
  }
  //remove
  if (allOver==true && mouseButton==LEFT && allHighlight==51) {
    allKlik=false;
    ToVKKlik=false;
    EnVKKlik=false;
    kansKlik=false;
    EFklik=false;
    KSklik=false;
    sepKlik=false;
  }

  //krig
  if (krigOver==true && mouseButton==LEFT) { 
    krigKlik = true;
    allKlik=false;
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
    allKlik=false;
  }
  //remove
  if (polOver==true && mouseButton==LEFT && polHighlight==51) {
    polKlik=false;
    kansKlik=false;
    EFklik=false;
    KSklik=false;
  }

  //nazisme
  if (nazOver==true && mouseButton==LEFT) {
    nazKlik = true;
    allKlik=false;
  }
  //remove
  if (nazOver==true && mouseButton==LEFT && nazHighlight==51) {
    nazKlik=false;
    ToVKKlik=false;
  }

  //terror
  if (terOver==true && mouseButton==LEFT) { 
    terKlik = true;
    allKlik=false;
  }
  //remove
  if (terOver==true && mouseButton==LEFT && terHighlight==51) {
    terKlik=false;
    sepKlik=false;
  }

  //kvinder
  if (kviOver==true && mouseButton==LEFT) { 
    kviKlik = true;
    allKlik=false;
  }
  //remove
  if (kviOver==true && mouseButton==LEFT && kviHighlight==51) {
    kviKlik=false;
    KSklik=false;
  }
}
