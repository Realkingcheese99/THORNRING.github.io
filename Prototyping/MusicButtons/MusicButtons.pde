int scrH;
int scrW;
float cW;


void setup() {
fullScreen();
//var
scrH = displayHeight;
scrW = displayWidth;
cW = scrW/7;

}

void draw() {
  

//btn boxes
for(int i = 1; i<6; i++) {
  
  rect(i*cW, 0, cW, cW);
  if(i<5) {
    rect(i*cW, cW, cW, cW);
  } 
  
if(i==1 | i==3) {
  rect(i*cW, 2*cW, cW, cW);
}
}


//btn symbols

//loop stack
for(int i=0;i<3;i++) {
arc(3*cW/2, i*cW + cW, cW, 3*cW/2, 13*PI/10, 17*PI/10, OPEN);
arc(3*cW/2, i*cW +0, cW, 3*cW/2, 3*PI/10, 7*PI/10, OPEN);
triangle(cW+(9*cW/10), i*cW + (cW/3), cW+(80*cW/100), i*cW + (32*cW/100),cW + (93*cW/100), i*cW + (cW/4));
}
}
  
