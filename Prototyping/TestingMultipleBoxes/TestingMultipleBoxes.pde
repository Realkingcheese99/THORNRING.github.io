println(displayWidth, displayHeight);
size(displayWidth, displayHeight);
fullScreen();
int scrW = displayWidth;
int scrH = displayHeight;

float exitDivX = 24*(scrW)/25;
float exitDivY = 0;
float exitDivW = scrW/25;
float exitDivH = scrW/25;

//exit button
rect(exitDivX, exitDivY, exitDivW,exitDivH);

//rect stacks
int z = 1;
float coverDivX = 0;
float coverDivY = 0;
float coverDivW = scrH/11;
float coverDivH = scrH/11;
for(z <= 11);
 { rect(coverDivX,coverDivY,coverDivW,coverDivH); }
  
