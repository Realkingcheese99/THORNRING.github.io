//LIB

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//global var

int scrH = displayHeight;
int scrW = displayWidth;
Minim minim; //init entire class
int mus_count = 20;
int snd_count = 1;
AudioPlayer[] MUS = new AudioPlayer[mus_count];
AudioPlayer[] SND = new AudioPlayer[snd_count];
int[] current = new int[2];
current[0] = 0;
current[1] = 0;

//display
size(500,500);
//fullScreen();

minim = new Minim(this);
String MUS_DIR = "../../Assets/MUS/";
String SND_DIR = "../../Assets/SND/";
String extension = ".mp3";
String file = MUS_DIR + "BIG_SHOT" + extension;



MUS[current[0]] = minim.loadFile(file);
MUS[current[0]].play();
