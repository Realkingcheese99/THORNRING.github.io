// - menuType = 1
//I'm feeling lucky
void menu0() {
  if (menuType == 1) {
    //text("hot singles in your area", scrW/2, scrH/2);
    popupstatus = abs(popupstatus-1);
    if(popupstatus == 1) {
    popupX = cH+songlistDivW + random(scrW-cH-songlistDivW-scrW/5);
    popupY = random(scrH-dialogueDivH-scrW/5);
    clickbait_random = round(random(clickbait_num));
  //  clickbait_random = clickbait_num;
    } else {
      refresh();
    }
  } else { 
    xz = 9;
  }
}

//Settings
void menu1() {
  if (menuType == 1) {
  } else {
    xz = 68;
  }
}

//Talking
void menu2() {
  if (menuType == 1) {
    xz = 6;
    buttonCount = 5;
    menuY = 0;
  } else {
    if (knight == false) {
      xz = 96;
      knight = true;
    } else {
      xz = 108;
    }
  }
}

int checker = 0;
int z;

//Escape
void menu3() {
  if (menuType == 1) {

    //if(random(1,10) == 10) {
    //for(z=0; z<=scrH/10; z++){
    //checker = z;
    //image(FRIEND, (scrW-z)/2, (scrH-z)/2, 536, 497);
    exit();
    //}
  } else {
    xz = 131;
  }
}

  void menu4() {
    if (menuType==1) {
    } else {
      xz = 1;
      buttonCount = 4;
      menuY = 0;
    }
  }


  void popup() {
  }

  //menuType = 2
  void refresh() {
    image(shop, cH + 2*cW, 0, scrW - (cH + 2*cW), 5*scrH/9);
    image(neutral, spamDivX, spamDivY, spamDivW, spamDivH);
    image(exitImage, exitDivX, 0, exitDivWH, exitDivWH);
     if (menuType != 3) {
    image(dialogueBox, dialogueDivX, dialogueDivY, dialogueDivW, dialogueDivH);
  } else {
    image(talk, dialogueDivX, dialogueDivY, dialogueDivW, dialogueDivH);
  }
  }
  
  //music buttons
  void button0(){
  }
  
  void button1() {
  }
  
  void button2() {
  }
  
  void button3() {
  }
  
  void button4() {
  }
  
    int toggle(int variable) {
    variable = abs(variable-1);
    return(variable);
  }
