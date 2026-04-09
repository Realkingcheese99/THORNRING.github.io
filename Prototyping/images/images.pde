//images are three of my favourite games of all time
fullScreen();
int scrW = displayWidth;
int scrH = displayHeight;
int divW = scrW/5;
int divH = divW;
float[][] WH = new float[3][3];
float[][] WH_adj = new float[3][2];
String back = "../";
String assets = "Assets/";
String IMG = "z_prototyping/";
String[] images = new String[3];

String fileExtension = ".jpg";
images[0] = "deltarune"; images[1] = "silksong"; images[2] = "isaac";
String IMG_PATH = back + back + assets + IMG;
String[] pathway = new String[3];
pathway[0] = IMG_PATH + images[0] + fileExtension;
pathway[1] = IMG_PATH + images[1] + fileExtension;
pathway[2] = IMG_PATH + images[2] + fileExtension;
PImage[] img = new PImage[3];
println(divW + ", " + divH);
for(int i = 0; i<3;i++) {
  img[i] = loadImage  (pathway[i]);
  rect((divW)*(i+1), (scrH-divH)/2, divW, divH);
  WH[i][0] = img[i].width;
  WH[i][1] = img[i].height;
  WH[i][2] = WH[i][0]/WH[i][1]; //aspect ratio for each image
  println(i + ": " + WH[i][0] + ", " + WH[i][1] + ", " + WH[i][2]);
  // resizing
  WH_adj[i][0] = WH[i][0];
  WH_adj[i][1] = WH[i][1];
  if(WH[i][0] > divW || WH[i][1] > divH) {
    //reduction
    while(WH_adj[i][0] > divW || WH_adj[i][1] > divH) {
      WH_adj[i][1] *= 0.99;
      WH_adj[i][0] *= 0.99;
    }
    println(i + ": " + WH_adj[i][0] + ", " + WH_adj[i][1]);
  }
  else {
    //enlarging
    while(WH_adj[i][0] < divW && WH_adj[i][1] < divH) {
      WH_adj[i][1] *= 1.01;
      WH_adj[i][0] *= 1.01;
  }
}
image(img[i], ((divW)*(i+1))+(divW-WH_adj[i][0])/2, ((scrH-divH)+(divH-WH_adj[i][1]))/2, WH_adj[i][0], WH_adj[i][1]);
}
