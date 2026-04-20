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
int[] current;
if (mus_count > snd_count) {
  current = new int[mus_count];
} else {
  current = new int[snd_count];
}
current[0] = mus_count - mus_count;

//display
size(500,500);
//fullScreen();
