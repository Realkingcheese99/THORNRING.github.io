import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//LIB



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

  pause = true;
  song = new String[mus_count];


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
      println(MUS_DATA[current[0]].title());
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
