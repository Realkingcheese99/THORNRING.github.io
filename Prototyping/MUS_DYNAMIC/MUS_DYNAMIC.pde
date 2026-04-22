//LIB

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim; //init entire class

int scrH;
int scrW;
boolean pause;

int mus_count;
int snd_count;

AudioPlayer[] MUS;// = new AudioPlayer[mus_count];
AudioPlayer[] SND;// = new AudioPlayer[snd_count];

int[] current;// = new int[2];
String[] song;

String MUS_DIR;// = "../../Assets/MUS/";
String SND_DIR;// = "../../Assets/SND/";
String extension;// = ".mp3";
String file;// = MUS_DIR + "BIG_SHOT" + extension;


void setup() {
  size(500, 500);
  scrH = displayHeight;
  scrW = displayWidth;
  mus_count = 20;
  snd_count = 1;
  MUS = new AudioPlayer[mus_count];
  SND = new AudioPlayer[snd_count];
  current = new int[2];
  current[0] = 0;
  current[1] = 0;
  minim = new Minim(this);
  MUS_DIR = "../../Assets/MUS/";
  SND_DIR = "../../Assets/SND/";
  extension = ".mp3";
  
  pause = false;
  song = new String[mus_count];
  song[0] = "A_CYBER'S_WORLD" ;
  song[1] = "BIG_SHOT";
  song[2] = "Chaos_King" ;
  song[3] = "Don't_Forget" ;
  song[4] = "FINDHER" ;
  song[5] = "Hammer_of_Justice" ;
  song[6] = "Last_Prophecy";
  song[7] = "Raise_up_Your_Bat" ;
  song[8] = "Third_Sanctuary";
  song[9] = "Waltz_of_Seccom_Masada" ;
  song[10] = "Attack_of_the_Killer_Queen" ;
  song[11] = "Black_Knife";
  song[12] = "Dark_Sanctuary";
  song[13] = "Field_of_Hopes_and_Dreams" ;
  song[14] = "GUARDIAN" ;
  song[15] = "It's_TV_Time!" ;
  song[16] = "NOWS_YOUR_CHANCE_TO_BE_A" ;
  song[17] = "The_World_Revolving" ;
  song[18] = "TV_World" ;
  song[19] = "HIM" ;
  file = MUS_DIR + song[15] + extension;
  MUS[current[0]] = minim.loadFile(file);
}

//global var

//AudioPlayer[] MUS = new AudioPlayer[mus_count];
//AudioPlayer[] SND = new AudioPlayer[snd_count];


//display

//fullScreen();

//minim = new Minim(this);
void draw() {

  if (frameCount == 1) {
    for (int i = 0; i<20; i++) {
      println("song["+i+"] = ;");
    }
  }

  //MUS[current[0]] = minim.loadFile(file);
}

void keyPressed() {
  if (key == CODED) {
  } else {
    //for (int i = 0; i < 10; i++) {
    if (key == 'z') {
      MUS[current[0]].play(0);
    }
    //}
    if (key == ' ') {
      if (pause == true) {
        pause = false;
        MUS[current[0]].play();
      } else {
        pause = true;
        MUS[current[0]].pause();
      }
    }
  }
}
