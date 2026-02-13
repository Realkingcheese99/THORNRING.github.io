fullScreen();

//cH = common height
//cW = common width
//scrH = screen height
//scrW = screen width


//variable declaration
int hr = 11;
float scrH = displayHeight;
float scrW = displayWidth;
float cW = scrW/9;
float cH = scrH/hr;

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
rect(exitDivX, 0, exitDivWH, exitDivWH);

//dialogue box
float dialogueDivX = cH + 2*cW;
float dialogueDivY = 5*scrH/9;
float dialogueDivW = (26*scrW/45) - cH;
float dialogueDivH = 4*scrH/9;
rect(dialogueDivX, dialogueDivY, dialogueDivW, dialogueDivH);

//options
float optDivX = 4*scrW/5;
float optDivY = 5*scrH/9;
float optDivW = scrW/5;

//options stack
for(int j=1; j<=5; j=j+1) {
  rect(optDivX, optDivY, optDivW, cH);
  optDivY = (5*scrH/9) + j*cH;
}

//popop
float popupY = 0;
float popupX = 0;
popupX = random(cH + 2*cW, scrW - cW);
popupY = random(0, scrH - 4*scrH/9 - cW);

println(popupX);
println(popupY);
