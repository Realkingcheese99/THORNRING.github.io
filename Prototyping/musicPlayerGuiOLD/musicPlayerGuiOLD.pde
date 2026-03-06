//NOTE: I KNOW THAT IT'S BROKEN, I'M TRYING TO OPTIMIZE IT, HOLD OFF UNTIL TOMORROW TO JUDGE

//setup
int charDisplay = 0;
int xz = 0;
int hr = 11;
//float scrH = displayHeight;
//float scrW = displayWidth;
PFont common;
int frmc = frameCount;


void setup() {
fullScreen();
background(0);
exitImage = loadImage("IMG/BTN/Exit.png");
aCoverBox = loadImage("IMG/BOX/albumcover.png");
shop = loadImage("IMG/SPAM/shop.png");
neutral = loadImage("IMG/SPAM/spamNeutral.png");
dialogueBox = loadImage("IMG/BOX/DialogueBox.png");
popup = loadImage("IMG/BOX/Popup.png");
soul = loadImage("IMG/BTN/SOUL.png");
songTitleBox = loadImage("IMG/BOX/box.png");
FRIEND = loadImage("IMG/SPAM/IMAGE_FRIEND.png");
pause = loadImage("IMG/BTN/pause_1.png");
pause2 = loadImage("IMG/BTN/pause_2.png");
PFont common;
// scrH = displayHeight;
//float scrW = displayWidth;
}

//global setup
//float scrH = 0;
//float scrW = 0;
float scrH = displayHeight;
float scrW = displayWidth;
float cW = scrW/9;
float cH = scrH/hr;
float popupY = random(0, scrH - 4*scrH/9 - cW);
float popupX = random(cH + 2*cW, scrW - cW);

float testing = scrH;

//song list
float songlistDivY = -scrW/250;
float songlistDivW = 2*cW;


//spamton box
float spamDivX = 20*scrW/39;
float spamDivY = cH/2;
float spamDivW = 2.3*cW;
float spamDivH = 2.7*cW;

//exit button 
float exitDivX = 24*scrW/25;
float exitDivWH = scrW/25;

//dialogue box
float dialogueDivX = cH + 1.9*cW;
float dialogueDivY = 24*scrH/45;
float dialogueDivW = scrW - (2*cH/3 + 2*cW);
float dialogueDivH = 12*scrH/25;

//options
float optDivX = 4*scrW/5;
float optDivY = 5*scrH/9;
float optDivW = scrW/5;

//cH = common height
//cW = common width
//scrH = screen height
//scrW = screen width

//to-do list:
//mouse interaction
//spritework - partially done
//keyboard interaction - partially done
//adding songs
//adding dialogue - framework complete
//debug dialogue
void draw() {

  println("old: ",scrH);
scrH = displayHeight;
scrW = displayWidth;
frmc = frameCount;  
println("new: ",scrH);  

println(testing);

//variable declaration
//int hr = 11;
float scrH = displayHeight;
float scrW = displayWidth;
float cW = scrW/9;
float cH = scrH/hr;
//home
//common = createFont("common.ttf", 46);
//school
common = createFont("DIA/common.ttf", 32);
String[] dialogue;
dialogue = loadStrings("DIA/Dialogue.txt");
textFont(common);


//image loading




if(checker != 0) {
  println("test");
  image(FRIEND, (scrW-checker)/2, (scrH-checker)/2, 536, 497);
}
  

//shop background
  image(shop, cH + 2*cW, 0, scrW - (cH + 2*cW), 5*scrH/9);







//album and song stack

for(int z=1; z <= hr;z=z+1){
  //rect(0, albumDivY, cH, cH);
  image(aCoverBox, 0, songlistDivY, 5*cH/4, 5*cH/4);
  image(songTitleBox, 21*cH/20, songlistDivY, songlistDivW, 5*cH/4);
  //songlistDivY=z*cH;
  songlistDivY=songlistDivY+100*cH/101;
}


//rect(spamDivX, spamDivY, spamDivW, spamDivH); //old code for adding box placeholder

image(neutral, spamDivX, spamDivY, spamDivW, spamDivH);


//rect(exitDivX, 0, exitDivWH, exitDivWH);
image(exitImage, exitDivX, 0, exitDivWH, exitDivWH);


//rect(dialogueDivX, dialogueDivY, dialogueDivW, dialogueDivH);
image(dialogueBox, dialogueDivX, dialogueDivY, dialogueDivW, dialogueDivH);



//options stack
//for(int j=1; j<=5; j=j+1) {
 // rect(optDivX, optDivY, optDivW, cH);
//  optDivY = (5*scrH/9) + j*cH;
//}

//popop



//DIALOGUE

int totalD = (dialogue[0].length() + dialogue[1].length() + dialogue[2].length() + dialogue[3].length())/2;
int charSpd = 2;

//println(dialogue[xz].charAt(charDisplay+1));
if(xz < dialogue.length-1) {
if(str(dialogue[xz].charAt(charDisplay+1)).equals("-")) {
  xz++;
  charDisplay = 0;
  println(xz);
}

 if(charDisplay < dialogue[0].length()) { 
   charDisplay++;
 }

if(charDisplay*charSpd >= dialogue[0].length()) {
   charDisplay = (dialogue[0].length())/charSpd;}
text(dialogue[xz].substring(0, charSpd*charDisplay), cH+11*cW/5, (1.5*(xz+1))+(11*scrH/18), dialogueDivW-3*optDivW/2, dialogueDivH);

}

//String[] jD = new String[2];
//jD[0] = "";
//jD[1] = "";
//String cD = "";
//textFont(common);
//text(dialogue[0], cH+11*cW/5, 11*scrH/18);
//for(int z=0; z<dialogue[0].length(); z=z+1){
 // jD[1] = str(dialogue[0].charAt(z));
 // jD[0] = join(jD,"");
 // text(jD[0], cH+11*cW/5, (11)*scrH/18);
 // println(jD[0]);
//}

//text(dialogue[1], cH+11*cW/5, 12*scrH/18);
//text(dialogue[2], cH+11*cW/5, 13*scrH/18);
//text(dialogue[3], cH+11*cW/5, 14*scrH/18);

//popup
//image(popup, popupX, popupY, cW, cW);



//menu labels
text("I'M FEELING", 81*scrW/100, 5*scrH/9 + 3*cH/4);
text("LUCKY", 81*scrW/100, 5*scrH/9 + 5*cH/4);
text("SETTINGS", 81*scrW/100, 5*scrH/9 + 7*cH/4);
text("TALKING", 81*scrW/100, 5*scrH/9 + 11*cH/4);
text("ESCAPE", 81*scrW/100, 5*scrH/9 + 15*cH/4);
text("1997 KROMER", 39*scrW/50, 5*scrH/9 + 4.4*cH);


//menu movement
image(soul, 39*scrW/50, 53*scrH/90 + menuY*cH, cW/5, cW/5);

//image(pause, scrW/2, scrH/2, 3*cW/2, 3*cW/2);

//image(popup, popupX, popupY, cW, cW);
//println(popupX," , ",popupY);

text("frame: ",frmc, (92-(2.7128/2)*floor((log(frmc))/log(10))+1)*scrW/100, cH/2, cH/2);

} //END OF DRAW FUNCTION



//menu movement keyboard control
int menuY = 0;

void keyPressed(){
  if (key == CODED) {
    if(keyCode == UP) {
      menuY = menuY - 1;
      if(menuY < 0) {
        menuY = 3;
      }
    } else if (keyCode == DOWN) {
      menuY = menuY + 1;
      if(menuY > 3) {
        menuY = 0;
      }
    }
  } else if(key == 'z' || key == ENTER){
    if(menuY==0){
      luck();
    } else if(menuY==1) {
      options();
    }
    else if(menuY==2) {
      advanceDialogue();
    }
    else if(menuY==3) {
      escape();
    }
  }
  else if(key == 'c'){
  popupY = popupY+100;
  popupX = random(cH + 2*cW, scrW - cW);
  }
}
