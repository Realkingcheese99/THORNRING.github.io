// - menuType = 1
//I'm feeling lucky
void menu0() {
  if (menuType == 1) {
    //text("hot singles in your area", scrW/2, scrH/2);
    popupstatus = true;
    popupX = cH+songlistDivW + random(scrW-cH-songlistDivW-scrW/5);
    popupY = random(scrH-dialogueDivH-scrW/5);
    println(popupX);
    println(popupY);
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
