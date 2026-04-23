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
AudioMetaData[] MUS_DATA;

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
  MUS_DATA = new AudioMetaData[mus_count];
  current = new int[2];
  current[0] = 0;
  current[1] = 0;
  minim = new Minim(this);
  MUS_DIR = "../../Assets/MUS/";
  SND_DIR = "../../Assets/SND/";
  extension = ".mp3";

  pause = false;
  song = new String[mus_count];

  /*
  song[0] = "A_CYBER'S_WORLD" ; //Field_of_Hopes_and_Dreams
   song[1] = "BIG_SHOT"; //Chaos_King
   song[2] = "Chaos_King" ; //The_World_Revolving
   song[3] = "Don't_Forget" ; //Don't_Forget
   song[4] = "FINDHER" ; //A_CYBER'S_WORLD
   song[5] = "Hammer_of_Justice" ; //NOWS_YOUR_CHANCE_TO_BE_A
   song[6] = "Last_Prophecy"; //Attack_of_the_Killer_Queen
   song[7] = "Raise_up_Your_Bat" ; //BIG_SHOT
   song[8] = "Third_Sanctuary"; //Raise_up_Your_Bat
   song[9] = "Waltz_of_Seccom_Masada"; //TV_World
   song[10] = "Attack_of_the_Killer_Queen"; //It's_TV_Time!
   song[11] = "Black_Knife"; //Black_Knife
   song[12] = "Dark_Sanctuary"; //Dark_Sanctuary
   song[13] = "Field_of_Hopes_and_Dreams"; //Hammer_of_Justice
   song[14] = "GUARDIAN"; //Third_Sanctuary
   song[15] = "It's_TV_Time!"; //GUARDIAN
   song[16] = "NOWS_YOUR_CHANCE_TO_BE_A"; //Last_Prophecy
   song[17] = "The_World_Revolving"; //FINDHER
   song[18] = "TV_World"; //Waltz_of_Seccom_Masada
   song[19] = "HIM"; //HIM
   */
  for (int i = 0; i<mus_count; i++) {
    song[i] = str(i);
    file = MUS_DIR + song[i] + extension;
    MUS[i] = minim.loadFile(file);
    MUS_DATA[i] = MUS[i].getMetaData();
  }
}

//global var

//AudioPlayer[] MUS = new AudioPlayer[mus_count];
//AudioPlayer[] SND = new AudioPlayer[snd_count];


//display

//fullScreen();

//minim = new Minim(this);
void draw() {

  //println(MUS_DATA[1].title());
  //MUS[current[0]] = minim.loadFile(file);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      MUS[current[0]].pause();
      if (current[0]<mus_count-1) {
        current[0]++;
        MUS[current[0]].play(0);
      } else {
        current[0]=0;
        MUS[current[0]].play(0);
      }
    }
    if (keyCode == LEFT) {
      MUS[current[0]].pause();
      if (current[0]>0) {
        current[0]--;
        MUS[current[0]].play(0);
      } else {
        current[0]=mus_count-1;
        MUS[current[0]].play(0);
      }
    }
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
