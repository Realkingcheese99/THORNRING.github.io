fullScreen();

println("Start of console");
println("");

float scrH = displayHeight;
float scrW = displayWidth;
float hr = 11;
float cW = scrW/9;
float cH = scrH/hr;

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
float dialogueDivX = cH+songlistDivW;
float dialogueDivY = 5*scrH/9;
float dialogueDivW = 26*scrW/45;
float dialogueDivH = 4*scrH/9;

//options
float optDivX = 4*scrW/5;
float optDivY = 5*scrH/9;
float optDivW = scrW/5;

//song list and album cover stack
for(int z=0; z <= hr;z=z+1){
  songlistDivY=z*cH;
  rect(0, songlistDivY, cH, cH);
  rect(cH, songlistDivY, songlistDivW, cH);
  songlistDivY=songlistDivY+100*cH/101;
}

//spamton
rect(spamDivX, spamDivY, spamDivW, spamDivH);

//exit button
rect(exitDivX, 0, exitDivWH, exitDivWH);

//dialogue box
rect(dialogueDivX, dialogueDivY, dialogueDivW, dialogueDivH);

//dialogue buttons and options stack
for(int j=1; j<=5; j=j+1) {
 rect(optDivX, optDivY, optDivW, cH);
 optDivY = (5*scrH/9) + j*cH;
}

//TEXT
String text = "DELTARUNE TOMORROW";
String[] titles = new String[11];
titles[0] = "Field of Hopes and Dreams";
titles[1] = "THE WORLD REVOLVING";
titles[2] = "Chaos King";
titles[3] = "A CYBER'S WORLD?";
String[] DEVICE_FONTS = PFont.list();
printArray(DEVICE_FONTS);
float fontSize;
PFont font;
String sitka = "Sitka Small";
float songTitleH = cH;
//float stikaRatio = fontSize/songlistDivW;
//fontSize = songlistDivW*stikaRatio*0.7;
font = createFont(sitka,cH);
for(int i = 0; i<3; i++){
  fontSize = cH;
while(fontSize*text.length() > songlistDivW) {
  fontSize *= 0.99;
}
textFont(font, fontSize);
textSize(fontSize);
color white = #FFFFFF;
color yellow = #FFFF00;
color normal = white;
color black = #000000;
println(fontSize);
fill(black);
text(titles[i],cH,(2*cH/3)+i*cH);
}
