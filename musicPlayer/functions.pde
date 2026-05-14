void menu0() {
  if (menuType == 1) {
    popupstatus = abs(popupstatus-1);
    if (popupstatus == 1) {
      popupX = cH+songlistDivW + random(scrW-cH-songlistDivW-scrW/5);
      popupY = random(scrH-dialogueDivH-scrW/5);
      clickbait_random = round(random(clickbait_num));
      //  clickbait_random = clickbait_num;
    } else {
      refresh();
    }
  } else if (menuType == 2) {
    xz = 9;
  } else if (menuType == 4) {
    if (submenu == 0) {
      xz = 150;
      submenu = 1;
      buttonCount = 6;
    } else if (submenu == 3) {
      showFps = toggle(showFps);
    }
  }
}

//Settings
void menu1() {
  if (menuType == 1) {
    buttonCount = 5;
    menuType = 4;
    xz = 147;
    menuY = 0;
  } else if (menuType == 2) {
    xz = 68;
  } else if (menuType == 4) {
    if (submenu == 0) {
      menuY = 0;
      submenu = 2;
      xz = 159;
    }
  }
}

//Talking
void menu2() {
  if (menuType == 1) {
    xz = 6;
    buttonCount = 5;
    menuY = 0;
  } else if (menuType == 2) {
    if (knight == false) {
      xz = 96;
      knight = true;
    } else {
      xz = 108;
    }
  } else if (menuType == 4) {
    if (submenu == 0) {
      menuY = 0;
      submenu = 3;
      xz = 156;
      //showFps = toggle(showFps);
    }
  }
}

int checker = 0;
int z;

//Escape
void menu3() {
  if (menuType == 1) {
    exit();
  } else if (menuType == 2) {
    xz = 131;
  }
}

void menu4() {
  if (menuType==1) {
  } else if (menuType == 2) {
    xz = 1;
    buttonCount = 4;
    menuY = 0;
  } else if (menuType == 4) {
    if(submenu == 0) {
      xz = 1;
      buttonCount = 4;
      menuY = 0;
    }
  }
}


void popup() {
}

//menuType = 2
void refresh() {
  image(shop, cH + 2*cW, 0, scrW - (cH + 2*cW), 5*scrH/9);
  image(neutral, spamDivX, spamDivY, spamDivW, spamDivH);
  image(exitImage, exitDivX, 0, exitDivWH, exitDivWH);
  // image(speechBubble, spamDivX-1.7*cH*150/86, spamDivY+3*cH, 2*cH*150/86, 2*cH);
  if (menuType != 3) {
    image(dialogueBox, dialogueDivX, dialogueDivY, dialogueDivW, dialogueDivH);
  } else {
    image(talk, dialogueDivX, dialogueDivY, dialogueDivW, dialogueDivH);
  }
}

//music buttons
void button0() {
  counter[0]++;
  buttonType[0] = counter[0] % 3;
}

void button1() {
  if (currentSong > 0) {
    current = songList[currentSong-1];
  }
}

void button2() {
  if (shift == 0) {
    if (pause == true) {
      pause = false;
      MUS[current].play();
      buttonType[2] = 1;
    } else {
      pause = true;
      MUS[current].pause();
      buttonType[2] = 0;
    }
  } else {
    MUS[current].rewind();
    MUS[current].pause();
  }
}

void button3() {
  prevSongs.append(current);
  prevMus = current;
  MUS[current].rewind();
  MUS[current].pause();
  buttonType[2] = 1;
  if (pause == true) {
    pause = false;
  }
  if (shuffle == 0) {
    if (current<mus_count-1) {
      current++;
    } else {
      current=0;
    }
  } else if (shuffle == 1) {
    current = round(random(mus_count-1));
  } else if (shuffle == 2) {
    if (counter[2]+1 == mus_count) {
      shuffledList.shuffle();
      counter[2] = 0;
    } else {
      counter[2]++;
    }
    current = shuffledList.get(counter[2]);
  }
  playMus();
  buttonActive[3] = 1;
}

void button4() {
  counter[1]++;
  buttonType[4] = counter[1]%3;
  shuffle = counter[1]%3;
  if (shuffle == 0) {
  } else if (shuffle == 1) {
  } else if (shuffle == 2) {
    shuffledList.shuffle();
  }
}

int toggle(int variable) {
  variable = abs(variable-1);
  return(variable);
}

void pauseToggle() {
  if (pause == true) {
    pause = false;
    MUS[current].play();
    buttonType[2] = 1;
  } else {
    pause = true;
    MUS[current].pause();
    buttonType[2] = 0;
  }
}

void playMus() {
  if (buttonType[0] == 0) {
    MUS[current].play();
  } else if ( buttonType[0] == 1) {
    MUS[current].loop(1);
  } else if (buttonType[0] == 2) {
    MUS[current].loop();
  }
  MUS[current].setGain((volPercent*35)-35);
}
