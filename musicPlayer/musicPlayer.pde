/*
Music App, Final Project
 Make sure to install the minim library on your computer for this program to work
 
 CREDITS:
 Most sprites from Deltarune by Toby Fox
 Music from Deltarune by Toby Fox
 Sprites are ripped from spriters-resource.com
 Chapter label sprites by me
 
 to-do list:
 - mouse interaction - partially done
 - spritework - partially done
 - keyboard interaction - partially done
 - adding dialogue - need to flesh out
 - finish popup
 */

//minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;

// --global var

//settings
int submenu;
int menuX;
float sliderW;
float volPercent;

//keybinds
String[] keybinds;
int bindKey;
int targetKeybind;

//mus control
int shuffle;
float scale;
float progress;
float position;
float length;
float startPosX;
float startPosY;
int[] buttons;
int shift;
PImage[][][] button;
int[] buttonType;
int[] buttonActive;
int[] buttonShift;
int[] counter;
float buttonSize;
int[] songList;
int currentSong;
IntList shuffledList;
int shuffleIndex;
int loopCount;
IntList prevSongs;



//popup
int popupstatus;
float popupX;
float popupY;
String[] clickbait;
int clickbait_num;
int clickbait_random;

//OPTIMIZATION
float prevScroll;
float prevMus;
int prevXz;
float prevpopupX;
float prevpopupY;

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
int prevSong;
float prevPos;

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
int[] charDisplay;
int xz = 1;
int hr = 11;
PFont common;
int frmc;
float scrH;
float scrW;


float cW;
float cH;


//FRAMERATE
float dt;
float frmr;
int prvScnd;
int pfrmc;
int pms;
String frmrLbl;
String frmrS;
float rndfrmr;
int showFps;

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
  snd_count = 17;
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
  exitImage = loadImage("../Assets/IMG/BTN/Exit.png");
  aCoverBox = loadImage("../Assets/IMG/BOX/albumcover.png");
  shop = loadImage("../Assets/IMG/SPAM/shop.png");
  neutral = loadImage("../Assets/IMG/SPAM/spamNeutral.png");
  dialogueBox = loadImage("../Assets/IMG/BOX/DialogueBox.png");
  popup = loadImage("../Assets/IMG/BOX/popup.png");
  soul = loadImage("../Assets/IMG/BTN/SOUL.png");
  songTitleBox = loadImage("../Assets/IMG/BOX/box.png");
  talk = loadImage("../Assets/IMG/BOX/talk.png");
  FRIEND = loadImage("../Assets/IMG/SPAM/IMAGE_FRIEND.png");
  // pauseButton = loadImage("../Assets/IMG/BTN/pause_1.png");
  // pause2 = loadImage("../Assets/IMG/BTN/pause_2.png");
  speechBubble = loadImage("../Assets/IMG/BOX/speechBubble.png");
  slider0 = loadImage("../Assets/IMG/BTN/slider_0.png");
  slider1 = loadImage("../Assets/IMG/BTN/slider_1.png");
  labels = new PImage[5];
  for (int i = 1; i<6; i++) {
    String file = "../Assets/IMG/BOX/label_"+str(i)+".png";
    labels[i-1] = loadImage(file);
  }
  button = new PImage[5][3][2];
  for (int x = 0; x < 5; x++) {
    for (int y = 0; y < 3; y++) {
      for (int z = 0; z < 2; z++) {
        String file = "../Assets/IMG/BTN/MUS/" + x + "_" + y + "_" + z + ".png";
        button[x][y][z] = loadImage(file);
        if (button[x][y][z] == null) {
          button[x][y][z] = loadImage("../Assets/IMG/SPAM/error.png");
        }
      }
    }
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
  popupstatus = 0;
  shuffle = 0;
  scale = scrW/7;
  startPosX = dialogueDivX+(dialogueDivW-1.3*(optDivW)-scale)/2;
  buttons = new int[2];
  shift = 0;
  clickbait_num = 18;
  clickbait = loadStrings("../Assets/TXT/popupTitles.txt");
  buttonActive = new int[5];
  buttonType = new int[5];
  buttonShift = new int[5];
  buttonShift[1] = 1;
  buttonShift[2] = 2;
  buttonShift[3] = 1;
  buttonShift[4] = 1;
  for (int i = 0; i < 5; i++) {
    buttonType[i] = 0;
    buttonActive[i] = 0;
  }
  counter = new int[3];
  counter[0] = 0;
  counter[1] = 0;
  counter[2] = 0;
  bindKey = 0;
  targetKeybind = 0;
  menuX = 0;
  showFps = 0;
  sliderW = 3*cH;
  volPercent = 1;
  prevPos = 0;

  buttonSize = 13*scrW/450;
  shuffledList = new IntList();
  for ( int i = 0; i<mus_count; i++) {
    shuffledList.append(i);
  }
  loopCount = 0;
  prevSongs = new IntList();
  keybinds = loadStrings("../Assets/TXT/keybinds.txt");

  //TXT
  textAlign(LEFT, BASELINE);
  dialogue = loadStrings("../Assets/TXT/Dialogue.txt");
  decay = 0.9;
  common = createFont("../Assets/TXT/common.ttf", 32);
  iWhile = 0;
  fontSize = scrH;
  textFont(common, fontSize);
  while (textWidth(dialogue[1]) > 3*(dialogueDivW)/4) {
    textFont(common, fontSize);
    fontSize *= decay;
    iWhile++;
    if (iWhile > 1000) {
      println("TimeoutException");
    }
  }
  charDisplay = new int[10];
  charDisplay[0] = 0;
  charDisplay[1] = 0;
  furthestLine = 0;
  k = 48;
  image(shop, cH + 2*cW, 0, scrW - (cH + 2*cW), 5*scrH/9);
  image(neutral, spamDivX, spamDivY, spamDivW, spamDivH);

  println("ignore the 'file is inaccessible error', it's the product of a shortcut from line 206-208");
}






void draw() {

  if (popupX<cH+songlistDivW) {
    popupX=cH+songlistDivW;
  }
  if (popupY>scrH-dialogueDivH-scrW/6) {
    popupY=scrH-dialogueDivH-scrW/6;
  }


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

  if (current != int(prevMus) ||scroll != prevScroll) {
    //image loading
    offset = 0;
    for (int z=0; z < floor(5*mus_count/4); z=z+1) {
      //rect(0, albumDivY, cH, cH);
      if (z % 5 != 0) {
        image(aCoverBox, -cH/20, scroll+cH*z*ratio, 5*cH/4, 5*cH/4);
        image(songTitleBox, 21*cH/20, scroll+cH*z*ratio, songlistDivW, 5*cH/4);

        if (z-offset==current && pause == false) {
          fill(#FFFF00);
        } else {
          fill(#FFFFFF);
        }
        text(MUS_DATA[z-offset].title(), 6*cH/5, scroll+((2*cH/3)+((z)*cH*ratio))-cH/2, decay*songlistDivW, cH);
      } else if (floor((z-offset)/4) < 5) {
        image(labels[floor((z-offset)/4)], -cH/20, scroll+cH*z*ratio, (songlistDivW+cH)*1.02, cH*1.2);
        offset++;
      }
      fill(#FFFFFF);
    }
  }
  fill(#FFFFFF);


  if (prevXz != xz) {
    for (int i = 0; i<6; i++) {
      charDisplay[i] = 0;
    }
    furthestLine = 0;
  }

  float afrmr = frmc/((millis()+1/1000));



  int scnd = second();
  if (scnd != prvScnd) {
    frmr = frmc-pfrmc;
    pfrmc = frmc;
    prvScnd = scnd;
  }



  if (menuType != 3) {
    image(dialogueBox, dialogueDivX, dialogueDivY, dialogueDivW, dialogueDivH);
  } else {
    image(talk, dialogueDivX, dialogueDivY, dialogueDivW, dialogueDivH);
  }
  if (popupstatus == 1 && popupX != prevpopupX || popupY != prevpopupY) {  //&& popupX != prevpopupX || popupY != prevpopupY
    refresh();
    image(popup, popupX, popupY, scrW/5, scrW/5);

    startPosX = popupX + cW/4;
    startPosY = popupY+scrW/6;

    textFont(common, 2*fontSize/5);
    text(clickbait[(clickbait_random*2)+1], startPosX, popupY+cH/2, scrW/7, scrW/5);
  }
  if (popupstatus == 1) {

    strokeWeight(20);
    stroke(#ff7f27);
    line(startPosX, startPosY, startPosX+scale, startPosY);
    position = (float(MUS[current].position())/0.995);
    length = MUS[current].length();
    progress = 2*position/length;
    //println(progress);
    strokeWeight(10);
    stroke(#FFFF00);
    line(startPosX, startPosY, startPosX+scale*progress, startPosY);
    buttonShift[0] = buttonType[0];
    for (int i = 0; i <5; i++) {
      if (shift == 0) {
        image(button[i][buttonType[i]][buttonActive[i]], startPosX+i*buttonSize, startPosY-2*cW/5, buttonSize, buttonSize);
      } else {
        image(button[i][buttonShift[i]][buttonActive[i]], startPosX+i*buttonSize, startPosY-2*cW/5, buttonSize, buttonSize);
      }
    }
  }

  prevpopupX = popupX;
  prevpopupY = popupY;

  //DIALOGUE
  textFont(common, fontSize);
  int charSpd = 1;


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
    text("CLICK HERE !", 81*scrW/100, 5*scrH/9 + 3*cH/4);
    // text("LUCKY", 81*scrW/100, 5*scrH/9 + 5*cH/4);
    text("SETTINGS", 81*scrW/100, 5*scrH/9 + 7*cH/4);
    text("TALKING", 81*scrW/100, 5*scrH/9 + 11*cH/4);
    text("ESCAPE", 81*scrW/100, 5*scrH/9 + 15*cH/4);
    text("1997 KROMER", 39*scrW/50, 5*scrH/9 + 4.4*cH);
  } else if (menuType == 2) {
    textFont(common, fontSize);
    text("OUR DEAL", (cH+songlistDivW)*1.2, 53*scrH/90 +cH*2/5);
    text("ABOUT YOU", (cH+songlistDivW)*1.2, 53*scrH/90 + cH*9/10 +cH*2/5);
    if (knight == false) {
      text("KNIGHT", (cH+songlistDivW)*1.2, 53*scrH/90 + 2*cH*9/10 +cH*2/5);
    } else {
      text("FRIENDS", (cH+songlistDivW)*1.2, 53*scrH/90 + 2*cH*9/10 +cH*2/5);
    }
    text("FEAR", (cH+songlistDivW)*1.2, 53*scrH/90 + 3*cH*9/10 +cH*2/5);
    text("EXIT AND BUY MORE!!", (cH+songlistDivW)*1.2, 53*scrH/90 + 4*cH*9/10 +cH*2/5);
  } else if (menuType == 4) {
    if (submenu == 0) {
      textFont(common, fontSize);
      text("KEYBINDS", (cH+songlistDivW)*1.2, 53*scrH/90 +cH*2/5);
      text("MUSIC", (cH+songlistDivW)*1.2, 53*scrH/90 + cH*9/10 +cH*2/5);
      text("DEBUG", (cH+songlistDivW)*1.2, 53*scrH/90 + 2*cH*9/10 +cH*2/5);
      text("BUTTON4", (cH+songlistDivW)*1.2, 53*scrH/90 + 3*cH*9/10 +cH*2/5);
      text("EXIT AND BUY MORE!!", (cH+songlistDivW)*1.2, 53*scrH/90 + 4*cH*9/10 +cH*2/5);
    } else if (submenu == 1) {
      textFont(common, 3*fontSize/4);
      for (int x = 0; x < 2; x++) {
        for (int y = 0; y < 6; y++) {
          String display;
          String keybind;
          if (keybinds.length > 6*x+y) {
            if (keybinds[6*x+y].charAt(0) != ' ') {
              keybind = str(keybinds[6*x+y].charAt(0));
            } else {
              keybind = "SPACE";
            }
            display = keybinds[6*x+y].substring(7) + ": " + keybind;
          } else {
            display = "empty";
          }

          text(display, (cH+songlistDivW)*1.2+x*4*cH, 56*scrH/90 +2*y*cH*35/100);
        }
      }
    } else if (submenu == 2) {
      text("Volume", (cH+songlistDivW)*1.2, 56*scrH/90 +2*0*cH*35/100);
      image(slider0, (cH+songlistDivW)*1.2, 56*scrH/90 + cH*7/20, sliderW, sliderW/8);
      image(slider1, ((cH+songlistDivW)*1.2) + volPercent * sliderW*0.9, 56*scrH/90 +1*cH*35/100 - sliderW/16, sliderW/8, sliderW/4);
    } else if (submenu == 3) {
      textFont(common, 3*fontSize/4);
      if (showFps == 0) {
        text("fps: off", (cH+songlistDivW)*1.2, 56*scrH/90 +2*0*cH*35/100);
      } else {
        text("fps: on", (cH+songlistDivW)*1.2, 56*scrH/90 +2*0*cH*35/100);
      }
    }
  }

  if (soulLocation == 0) {
    image(soul, 39*scrW/50, 53*scrH/90 + menuY*cH, cW/5, cW/5);
  } else if (soulLocation == 1) {
    if (submenu == 1) {
      image(soul, (cH+songlistDivW)*1.1+menuX*4*cH, 53*scrH/90 +2*menuY*cH*35/100, cW/5, cW/5);
    } else {
      image(soul, (cH+songlistDivW)*1.1, 53*scrH/90 + menuY*cH*9/10, cW/5, cW/5);
    }
  }



  if (millis() > 1) {
    afrmr = frmc/((millis())/1000);
  } else {
    afrmr = 0;
  }

  //fps label
  if (showFps == 1) {
    textFont(common, 2*fontSize/3);
    textAlign(LEFT);
    rndfrmr = round(frmr*10);
    frmrLbl = "fps: "+rndfrmr/10;
    text(frmrLbl, 3*scrW/5, 9*scrH/10);// y = 3*cH/2
  }
  //text("framecount: ", frmc, (92-(2.7128/2)*floor((log(frmc))/log(10))+11)*scrW/100, cH/2, cH/2);
  for (int i = 0; i<5; i++) {
    if (mouseX>=startPosX+i*buttonSize && mouseX<startPosX+(i+1)*buttonSize && mouseY>=startPosY-2*cW/5 && mouseY <= startPosY-2*cW/5+buttonSize) { //&& mouseY <= startPosY+buttonSize
      buttonActive[i] = 1;
    } else {
      buttonActive[i] = 0;
    }
  }

  if (position == prevPos && position != 0) {
    if (pause == false) {
      if (buttonType[0] == 0) {
        button3();
      } else if (buttonType[0] == 1) {
        loopCount++;
        if (loopCount == 2) {
          button3();
          loopCount = 0;
        }
      }
    }
  }


  prevScroll = scroll;
  prevXz = xz;
  prevSong = current;
  prevpopupX = popupX;
  prevpopupY = popupY;
  prevPos = position;
} //END OF DRAW FUNCTION

//menu movement keyboard control

void keyPressed() {
  if (key == CODED) {
    if (keyCode == SHIFT) {
      shift = 1;
    }
  } else {
    if (key == keybinds[4].charAt(0)) {
      MUS[current].setGain(MUS[current].getGain() - 1);
      volPercent = (MUS[current].getGain()+35)/35;
      println((MUS[current].getGain()+35)/35);
    } else if (key == keybinds[5].charAt(0)) {
      MUS[current].setGain(MUS[current].getGain() + 1);
      volPercent = (MUS[current].getGain()+35)/35;
      println((MUS[current].getGain()+35)/35);
    }
  }
}


void keyReleased() {

  if (key == CODED) {
    if (keyCode == SHIFT) {
      shift = 0;
    } else if (keyCode == UP) {
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
      if (submenu == 0) {
        button3();
      } else {
        menuX = toggle(menuX);
        SND[8].play(0);
      }
    }
    if (keyCode == LEFT) {
      if (submenu == 0) {
        MUS[current].rewind();
        MUS[current].pause();
        if (current>0) {
          current--;
          playMus();
        } else {
          current=mus_count-1;
          playMus();
        }
      } else {
        menuX = toggle(menuX);
        SND[8].play(0);
      }
    }
  } else if (key == keybinds[0].charAt(0) || key == ENTER || key == keybinds[0].charAt(2)) {
    if (menuType == 4) {
      if (submenu == 1) {
        targetKeybind = menuY + 6*menuX;
        bindKey = 1;
        xz = 153;
      }
    }
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
      if (int(dialogue[xz-1].charAt(4))-k != 1) {
        xz = xz + int(dialogue[xz-1].charAt(2))-k+1;
      } else {
        xz = 6;
      }
    }
  } else if (key == 'c') {
    //popupY = popupY+100;
    //popupX = random(cH + 2*cW, scrW - cW);
  } else if (key == keybinds[1].charAt(0)) {
    button2();
  } else if (key == keybinds[2].charAt(0)) {
    xz = 1;
  } else if (key == keybinds[3].charAt(0)) {
    if (menuType % 2 == 0) {
      //  println("test");
      SND[16].play(0);
      menuY = 0;
      if (menuType == 4 && submenu != 0) {
        xz = 150;
      } else {
        xz = 1;
        buttonCount = 4;
      }
      submenu = 0;
      buttonCount = 5;
    } else {
      charDisplay[furthestLine] = dialogue[furthestLine+xz].length() -3;
    }
  } else if (key == keybinds[6].charAt(0)) {
    button4();
    // buttonType[4] = counter[2]%3;
  } else if (key == keybinds[7].charAt(0) || key == keybinds[7].charAt(2)) {
    counter[0]++;
    buttonType[0] = counter[0] % 3;
  } /*else if (key == keybinds[9].charAt(0) || key == keybinds[9].charAt(2)) {
   if (shift == 1) {
   targetKeybind++;
   } else {
   targetKeybind--;
   }
   println(targetKeybind);
   }*/
  if (key != CODED) {
    if (bindKey == 2) {
      if (keybinds.length > targetKeybind) {
        keybinds[targetKeybind] = str(key).toLowerCase() + "-" + str(key).toUpperCase() +  keybinds[targetKeybind].substring(3);
        saveStrings("../Assets/TXT/keybinds.txt", keybinds);
        xz = 150;
        bindKey = 0;
      }
    }
    if (bindKey == 1) {
      bindKey = 2;
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

void mouseDragged() {
  if (popupX<=mouseX && mouseX<=popupX+scrW/5 && popupY <= mouseY && mouseY<= popupY+scrW/25 && popupstatus == 1) {
    popupX = mouseX-scrW/10;
    popupY = mouseY-cW/5;
  }
  if (menuType == 4 && submenu == 2) {
    if ((cH+songlistDivW)*1.2 <= mouseX && mouseX <(cH+songlistDivW)*1.2+sliderW && 56*scrH/90 +cH*7/20 - sliderW/16 <= mouseY && mouseY < 56*scrH/90 +cH*7/20 + 3*sliderW/16) {
      MUS[current].setGain(((35*(mouseX-(cH+songlistDivW)*1.2)/(sliderW)))-35); //((cH+songlistDivW)*1.2) + volPercent * sliderW*0.9 // (mouseX-(cH+songlistDivW)*1.2)
      volPercent = (MUS[current].getGain()+35)/35;
    }
  }
}

void mouseReleased() {
  for (int i = 0; i<5; i++) {
    if (mouseX>=startPosX+i*buttonSize && mouseX<startPosX+(i+1)*buttonSize && mouseY>=startPosY-2*cW/5 && mouseY <= startPosY-2*cW/5+buttonSize) { //&& mouseY <= startPosY+buttonSize
      if (i == 0) {
        button0();
      } else if (i == 1) {
        button1();
      } else if (i == 2) {
        button2();
      } else if (i == 3) {
        button3();
      } else if (i == 4) {
        button4();
      }
    }
  }
}
