//do next: labeling dialogue options

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;

//OPTIMIZATION
float prevScroll;
float prevMus;
int prevXz;

//MUS
boolean pause;
int mus_count;
int snd_count;
AudioPlayer[] MUS;
AudioPlayer[] SND;
AudioMetaData[] MUS_DATA;
int current;
String MUS_DIR;
String SND_DIR;
String extension;
String file;
float scroll;
float scrollSpd;


//DIA
String[] dialogue;
int line;
int furthestLine;
boolean talkbox;
int dialogueLocation;
int soulLocation;
boolean sidebar;
int buttonCount;
int k;
int menuType;
int opt;
int menuY = 0;
boolean knight;
//TXT

float fontSize;
float decay;
int iWhile;
//setup
int[] charDisplay;
int xz = 1;
int hr = 11;
//float scrH = displayHeight;
//float scrW = displayWidth;
PFont common;
int frmc;
float scrH;
float scrW;


float cW;
float cH;// = scrH/hr;
//float popupY = random(0, scrH - 4*scrH/9 - cW);
//float popupX = random(cH + 2*cW, scrW - cW);

//float testing = scrH;

//FRAMERATE
float dt;
float frmr;
int prvScnd;
int pfrmc;
int pms;
String frmrLbl;
String frmrS;
float rndfrmr;

//song list
float songlistDivY;// = -scrW/250;
float songlistDivW;// = 2*cW;
float ratio;
int offset;


//spamton box
float spamDivX;// = 20*scrW/39;
float spamDivY;// = cH/2;
float spamDivW;// = 2.3*cW;
float spamDivH;// = 2.7*cW;

//exit button
float exitDivX;// = 24*scrW/25;
float exitDivWH;// = scrW/25;

//dialogue box
float dialogueDivX;// = cH + 1.9*cW;
float dialogueDivY;// = 24*scrH/45;
float dialogueDivW;// = scrW - (2*cH/3 + 2*cW);
float dialogueDivH;// = 12*scrH/25;

//options
float optDivX;// = 4*scrW/5;
float optDivY;// = 5*scrH/9;
float optDivW;// = scrW/5;

void setup() {
  fullScreen();
  background(0);

  //MUS
  mus_count = 20;
  snd_count = 15;
  MUS = new AudioPlayer[mus_count];
  SND = new AudioPlayer[snd_count];
  MUS_DATA = new AudioMetaData[mus_count];
  current= 0;
  minim = new Minim(this);
  MUS_DIR = "../../Assets/MUS/";
  SND_DIR = "../../Assets/SND/";
  extension = ".mp3";
  pause = false;
  for (int i = 0; i<mus_count; i++) {
    file = MUS_DIR + str(i) + extension;
    MUS[i] = minim.loadFile(file);
    MUS_DATA[i] = MUS[i].getMetaData();
  }
  for ( int i = 0; i<snd_count; i++) {
    file = SND_DIR + str(i) + extension;
    SND[i] = minim.loadFile(file);
  }


  scrollSpd = 30;

  //IMG
  exitImage = loadImage("../../Assets/IMG/BTN/Exit.png");
  aCoverBox = loadImage("../../Assets/IMG/BOX/albumcover.png");
  shop = loadImage("../../Assets/IMG/SPAM/shop.png");
  neutral = loadImage("../../Assets/IMG/SPAM/spamNeutral.png");
  dialogueBox = loadImage("../../Assets/IMG/BOX/DialogueBox.png");
  popup = loadImage("../../Assets/IMG/BOX/Popup.png");
  soul = loadImage("../../Assets/IMG/BTN/SOUL.png");
  songTitleBox = loadImage("../../Assets/IMG/BOX/box.png");
  talk = loadImage("../../Assets/IMG/BOX/talk.png");
  FRIEND = loadImage("../../Assets/IMG/SPAM/IMAGE_FRIEND.png");
  pauseButton = loadImage("../../Assets/IMG/BTN/pause_1.png");
  pause2 = loadImage("../../Assets/IMG/BTN/pause_2.png");
  labels = new PImage[5];
  for (int i = 1; i<6; i++) {
    String file = "../../Assets/IMG/BOX/label_"+str(i)+".png";
  // println(file);
    labels[i-1] = loadImage(file);
  }



  //VAR
  scrH = displayHeight;
  scrW = displayWidth;
  cW = scrW/9;
  cH = scrH/hr;
  songlistDivY = -scrW/250;
  songlistDivW = 2*cW;
  spamDivX = 19*scrW/39;
  spamDivY = cH/2;
  spamDivW = 2.3*cW;
  spamDivH = 2.7*cW;
  exitDivX = 24*scrW/25;
  exitDivWH = scrW/25;
  dialogueDivX = cH + 1.9*cW;
  dialogueDivY = 24*scrH/45;
  dialogueDivW = scrW - (2*cH/3 + 2*cW);
  dialogueDivH = 12*scrH/25;
  optDivX = 4*scrW/5;
  optDivY = 5*scrH/9;
  optDivW = scrW/5;
  dt = 1000/frameRate;
  frmr = 0;
  prvScnd = 0;
  pfrmc = 0;
  pms = 0;
  line = 0;
  scroll = 0;
  ratio = 1;
  prevScroll = 1;
  prevMus = 0;
  prevXz = 0;
  talkbox = false;
  soulLocation = 0;
  sidebar = true;
  buttonCount = 4;
  offset = 0;
  knight = false;


  //TXT
  textAlign(LEFT, BASELINE);
  dialogue = loadStrings("../../Assets/DIA/Dialogue.txt");
  decay = 0.9;
  common = createFont("../../Assets/DIA/common.ttf", 32);
  iWhile = 0;
  fontSize = scrH;
  textFont(common, fontSize);
  while (textWidth(dialogue[1]) > 3*(dialogueDivW)/4) {
    textFont(common, fontSize);
    fontSize *= decay;
    iWhile++;
    // println(fontSize);
    if (iWhile > 1000) {
      println("TimeoutException");
    }
    //println(textWidth(dialogue[0]) + "; " + 3*(dialogueDivW)/4);
  }
  // fontSize = fontSize*=pow(decay, 8);
  charDisplay = new int[10];
  charDisplay[0] = 0;
  charDisplay[1] = 0;
  furthestLine = 0;
  //fontSize /= 2;
  k = 48;
}
//cH = common height
//cW = common width
//scrH = screen height
//scrW = screen width

//to-do list:
//mouse interaction - partially done
//spritework - partially done
//keyboard interaction - partially done
//adding dialogue - need to flesh out
//custom keybinds (maybe)



void draw() {


  frmc = frameCount;
  //dt = millis()-dt;
  if (millis() != 0) {
    dt = millis()-pms;
    pms = millis();
  }
  frmr = 1/(dt/1000);
  textFont(common, fontSize/2);

  menuType = int(dialogue[xz-1].charAt(0))-k;
  if (menuType % 2 == 0) {
    soulLocation = 1;
    dialogueLocation = 1;
    opt = menuType/2;
  } else {
    dialogueLocation = 0;
    soulLocation = (-1*menuType)+1;
  }

   if (current != prevMus ||scroll != prevScroll) {
    //image loading
    offset = 0;
    for (int z=0; z < floor(5*mus_count/4); z=z+1) {
      //rect(0, albumDivY, cH, cH);
      if(z % 5 != 0) {
      image(aCoverBox, -cH/20, scroll+cH*z*ratio, 5*cH/4, 5*cH/4);
      image(songTitleBox, 21*cH/20, scroll+cH*z*ratio, songlistDivW, 5*cH/4);

      if (z-offset==current && pause == false) {
        fill(#FFFF00);
      } else {
        fill(#FFFFFF);
      }
      text(MUS_DATA[z-offset].title(), 6*cH/5, scroll+((2*cH/3)+((z)*cH*ratio))-cH/2, decay*songlistDivW, cH);
      } else if(floor((z-offset)/4) < 5){
       image(labels[floor((z-offset)/4)], -cH/20, scroll+cH*z*ratio, (songlistDivW+cH)*1.02, cH*1.2);
       offset++;
      }
      fill(#FFFFFF);
    }
  }
        //image(labels[floor(z-offset/4)], 0, scroll+cH*z*ratio*5, (songlistDivW+cH), cH/decay);
        
      
    
      
      /*
        if (z==current && pause == false) {
       fill(#FFFF00);
       } else {
       fill(#FFFFFF);
       }
       */
      // text(MUS_DATA[z].title(), 6*cH/5, scroll+((2*cH/3)+((z)*cH*ratio))-cH/2, decay*songlistDivW, cH);
      fill(#FFFFFF);
    

  if (prevXz != xz) {
    for (int i = 0; i<6; i++) {
      charDisplay[i] = 0;
    }
    furthestLine = 0;
  }

  //text(frmc, (92-(2.7128/2)*floor((log(frmc))/log(10))+1)*scrW/100, cH/2);
  //float frmr = 1/(dt/1000);
  float afrmr = frmc/((millis()+1/1000));
  //text(frmr, (92-(2.7128/2)*floor((log(frmr))/log(10))+1)*scrW/100, cH);
  //println(dt);


  int scnd = second();
  if (scnd != prvScnd) {
    frmr = frmc-pfrmc;
    pfrmc = frmc;
    prvScnd = scnd;
  }



  //shop background
  image(shop, cH + 2*cW, 0, scrW - (cH + 2*cW), 5*scrH/9);
  //image(shop, 0, 0, scrW - (cH + 2*cW), scrH+100);







  image(neutral, spamDivX, spamDivY, spamDivW, spamDivH);


  //rect(exitDivX, 0, exitDivWH, exitDivWH);
  image(exitImage, exitDivX, 0, exitDivWH, exitDivWH);


  //rect(dialogueDivX, dialogueDivY, dialogueDivW, dialogueDivH);
  if (menuType != 3) {
    image(dialogueBox, dialogueDivX, dialogueDivY, dialogueDivW, dialogueDivH);
  } else {
    image(talk, dialogueDivX, dialogueDivY, dialogueDivW, dialogueDivH);
  }




  //DIALOGUE
  textFont(common, fontSize);
  int charSpd = 1;

  //println(dialogue[xz].charAt(charDisplay+1));
  if (xz < dialogue.length-3 ) {
    for (int i = 0; i<int(dialogue[xz-1].charAt(2))-k; i++) {
      if (charDisplay[i]+2<dialogue[i+xz].length()) {

        if (str(dialogue[xz+furthestLine].charAt(charDisplay[furthestLine]+1)).equals("+")) {
          furthestLine++;
          charDisplay[i]--;
        } else {
          if (furthestLine+1 > i) {
            charDisplay[i]++;
          }
        }
      }
      if (charDisplay[i] < 0) {
        charDisplay[i] = 0;
      } else {
        if (charDisplay[i] > dialogue[i+xz].length()) {
          charDisplay[i] = dialogue[i+xz].length() -1;
        }
      }
      // println(furthestLine + "; " + charDisplay[i] + "; " + i); //form of furthestLine; charDisplay[i];
      if (dialogueLocation == 0) {
        text(dialogue[xz+i].substring(0, charSpd*charDisplay[i]), cH+11*cW/5, dialogueDivH/6*i+(11*scrH/18), dialogueDivW, dialogueDivH);
      } else if (dialogueLocation == 1) {
        text(dialogue[xz+i].substring(0, charSpd*charDisplay[i]), cH+11*cW/5+dialogueDivW-5*optDivW/4, dialogueDivH/6*i+(11*scrH/18), dialogueDivW, dialogueDivH);
      }
    }
  }



  if (menuType == 1) {
    //menu labels
    textFont(common, 3*fontSize/4);
    text("I'M FEELING", 81*scrW/100, 5*scrH/9 + 3*cH/4);
    text("LUCKY", 81*scrW/100, 5*scrH/9 + 5*cH/4);
    text("SETTINGS", 81*scrW/100, 5*scrH/9 + 7*cH/4);
    text("TALKING", 81*scrW/100, 5*scrH/9 + 11*cH/4);
    text("ESCAPE", 81*scrW/100, 5*scrH/9 + 15*cH/4);
    text("1997 KROMER", 39*scrW/50, 5*scrH/9 + 4.4*cH);
  } else if(menuType == 2) {
    textFont(common, fontSize);
    text("OUR DEAL", (cH+songlistDivW)*1.2, 53*scrH/90 +cH*2/5);
    text("ABOUT YOU", (cH+songlistDivW)*1.2,53*scrH/90 + cH*9/10 +cH*2/5);
    text("KNIGHT", (cH+songlistDivW)*1.2, 53*scrH/90 + 2*cH*9/10 +cH*2/5);
    text("FEAR", (cH+songlistDivW)*1.2, 53*scrH/90 + 3*cH*9/10 +cH*2/5);
    text("EXIT AND BUY MORE!!", (cH+songlistDivW)*1.2, 53*scrH/90 + 4*cH*9/10 +cH*2/5);
  }

  if (soulLocation == 0) {
    image(soul, 39*scrW/50, 53*scrH/90 + menuY*cH, cW/5, cW/5);
  } else if (soulLocation == 1) {
    image(soul, (cH+songlistDivW)*1.1, 53*scrH/90 + menuY*cH*9/10, cW/5, cW/5);
  }



  if (millis() < 1) {
    afrmr = frmc/((millis())/1000);
  } else {
    afrmr = 0;
  }

  //fps label
  rndfrmr = round(frmr*10);
  frmrLbl = "fps: "+rndfrmr/10;
  text(frmrLbl, ((92-(2.7128/2)*floor((log(frmr)))/log(10.000))-10)*scrW/100, 3*cH/2);
  text("framecount: ", frmc, (92-(2.7128/2)*floor((log(frmc))/log(10))+11)*scrW/100, cH/2, cH/2);

  prevMus = current;
  prevScroll = scroll;
  prevXz = xz;
} //END OF DRAW FUNCTION


//menu movement keyboard control

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      if (talkbox == false) {
        SND[8].play(0);
        menuY = menuY - 1;
        if (menuY < 0) {
          menuY = buttonCount-1;
        }
      }
    } else if (keyCode == DOWN) {
      if (talkbox == false) {
        SND[8].play(0);
        menuY++;
        if (menuY > buttonCount-1) {
          menuY = 0;
        }
      }
    }
    if (keyCode == RIGHT) {
      MUS[current].rewind();
      MUS[current].pause();
      if (current<mus_count-1) {
        current++;
        MUS[current].loop();
      } else {
        current=0;
        MUS[current].loop();
      }
    }
    if (keyCode == LEFT) {
      MUS[current].rewind();
      MUS[current].pause();
      if (current>0) {
        current--;
        MUS[current].loop();
      } else {
        current=mus_count-1;
        MUS[current].loop();
      }
    }
  } else if (key == 'z' || key == ENTER || key == 'Z') {
    if (menuType % 3 != 0) {
      SND[9].play(0);
      if (menuY==0) {
        menu0();
      } else if (menuY==1) {
       menu1();
      } else if (menuY==2) {
        menu2();
      } else if (menuY==3) {
        menu3();
      } else if (menuY==4) {
        menu4();
      }
    } else if (charDisplay[furthestLine] == dialogue[furthestLine+xz].length() -2) {
      xz = xz + int(dialogue[xz-1].charAt(2))-k+1;
    }
  } else if (key == 'c') {
    //popupY = popupY+100;
    //popupX = random(cH + 2*cW, scrW - cW);
  } else if (key == ' ') {
    if (pause == true) {
      pause = false;
      MUS[current].play();
    } else {
      pause = true;
      MUS[current].pause();
    }
  } else if (key == '+') {
    xz = xz + 5;
  } else if (key == 'x' || keyCode == SHIFT) {
    if (menuType % 2 == 0) {
      //back
    } else {
      charDisplay[furthestLine] = dialogue[furthestLine+xz].length() -3;
    }
  }
}




void mouseWheel(MouseEvent event) {
  float dir = event.getCount();
  if (abs(dir) == dir && abs(scroll) < (cH*(5*mus_count/4-hr))-scrollSpd) {
    scroll = scroll-scrollSpd;
  } else if (-1*abs(dir) == dir && abs(scroll) > scrollSpd) {
    scroll = scroll + scrollSpd;
    if (abs(scroll)<cH) {
      scroll = scrH/216;
    }
  }
}
