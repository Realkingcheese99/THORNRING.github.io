int scrH;
int scrW;
float cW;
float t0;
float t1;
float t2;
float t3;
float t4;
float t5;
float yOff;
float xOff;


void setup() {
fullScreen();
//var
scrH = displayHeight;
scrW = displayWidth;
cW = scrW/7;
t0 = cW+(9*cW/10); //x1
t1 = (cW/3); //y1
t2 = cW+(80*cW/100); //x2
t3 = (32*cW/100);//y2
t4 = cW + (93*cW/100);//x3
t5 = (cW/4);//y3
yOff = cW/8;
xOff = cW/20;

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
noFill();
//bezier(340, 80, 40, 40, 360, 360, 60, 320);


//loop stack
for(int i=0;i<3;i++) {
arc(3*cW/2, i*cW + cW, cW, 3*cW/2, 13*PI/10, 17*PI/10, OPEN);
arc(3*cW/2, i*cW +0, cW, 3*cW/2, 3*PI/10, 7*PI/10, OPEN);
triangle(t0-xOff, i*cW + t1+yOff, t2-xOff, i*cW + t3+yOff, t4-xOff, i*cW + t5+yOff);
triangle(t0-xOff-7*cW/10-cW/15, i*cW + t1+yOff-cW/20, t2-xOff-7*cW/10, i*cW + t3+yOff+cW/10, t4-xOff-7*cW/10, i*cW + t5+yOff+cW/10);
}
}
  
