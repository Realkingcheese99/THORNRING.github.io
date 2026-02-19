//setup


int charDisplay = 0;
int xz = 0;


void setup() {
fullScreen();
background(0);
}


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
void draw() {

//variable declaration
int hr = 11;
float scrH = displayHeight;
float scrW = displayWidth;
float cW = scrW/9;
float cH = scrH/hr;
PFont common;
common = createFont("common.ttf", 32);
String[] dialogue;
dialogue = loadStrings("Dialogue.txt");

PImage exit;
exit = loadImage("Exit.png");

luck();



//shop background
PImage shop; 
shop = loadImage("shop.png");
  image(shop, cH + 2*cW, 0, scrW - (cH + 2*cW), 5*scrH/9);





//album cover list
float albumDivY = 0;

//song list
float songlistDivY = 0;
float songlistDivW = 2*cW;


//album and song stack

for(int z=1; z <= hr;z=z+1){
  rect(0, albumDivY, cH, cH);
  albumDivY=z*cH;
  rect(cH, songlistDivY, songlistDivW, cH);
  songlistDivY=z*scrH/hr;
}

//spamton box
float spamDivX = 20*scrW/39;
float spamDivY = cH/2;
float spamDivW = 2.3*cW;
float spamDivH = 2.7*cW;
//rect(spamDivX, spamDivY, spamDivW, spamDivH); //old code for adding box placeholder

PImage neutral;
neutral = loadImage("spamNeutral.png");
image(neutral, spamDivX, spamDivY, spamDivW, spamDivH);

//exit button 
float exitDivX = 24*scrW/25;
float exitDivWH = scrW/25;
//rect(exitDivX, 0, exitDivWH, exitDivWH);
image(exit, exitDivX, 0, exitDivWH, exitDivWH);

//dialogue box
float dialogueDivX = cH + 1.9*cW;
float dialogueDivY = 24*scrH/45;
float dialogueDivW = scrW - (2*cH/3 + 2*cW);
float dialogueDivH = 12*scrH/25;
//rect(dialogueDivX, dialogueDivY, dialogueDivW, dialogueDivH);

PImage dialogueBox;
dialogueBox = loadImage("DialogueBox.png");
  image(dialogueBox, dialogueDivX, dialogueDivY, dialogueDivW, dialogueDivH);

//options
float optDivX = 4*scrW/5;
float optDivY = 5*scrH/9;
float optDivW = scrW/5;

//options stack
//for(int j=1; j<=5; j=j+1) {
 // rect(optDivX, optDivY, optDivW, cH);
//  optDivY = (5*scrH/9) + j*cH;
//}

//popop
float popupY = 0;
float popupX = 0;
popupX = random(cH + 2*cW, scrW - cW);
popupY = random(0, scrH - 4*scrH/9 - cW);



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

 if(charDisplay < totalD) { 
   charDisplay++;
 }

if(charDisplay >= totalD) {
   charDisplay = floor(totalD/charSpd) -charSpd;}

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
PImage popup;
popup = loadImage("Popup.png");
//image(popup, popupX, popupY, cW, cW);



//menu labels
textFont(common);
text("I'M FEELING", 81*scrW/100, 5*scrH/9 + 3*cH/4);
text("LUCKY", 81*scrW/100, 5*scrH/9 + 5*cH/4);
text("SETTINGS", 81*scrW/100, 5*scrH/9 + 7*cH/4);
text("TALKING", 81*scrW/100, 5*scrH/9 + 11*cH/4);
text("ESCAPE", 81*scrW/100, 5*scrH/9 + 15*cH/4);
text("1997 KROMER", 39*scrW/50, 5*scrH/9 + 4.4*cH);


//menu movement
PImage soul;
soul = loadImage("SOUL.png");
image(soul, 39*scrW/50, 53*scrH/90 + menuY*cH, cW/5, cW/5);

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
}


float scrW = displayWidth;
float scrH = displayHeight;
//menu buttons


//I'm feeling lucky
void luck(){
  text("TESTING", scrW/2, scrH/2);
}

//Settings
void options(){
  
}

//Talking
void advanceDialogue(){
  
}

//Escape
void escape(){
  exit();
}
