fullScreen();
int scrW = displayWidth;
int scrH = displayHeight;
int divW = scrW/5;
int divH = divW*3/2;
int[][] WH = new int[3][2];
int[][] WH_adj = new int[3][2];
String back = "../";
String assets = "Assets/";
String IMG = "z_prototyping/";
String[] images = new String[3];
images[0] = "deltarune"; images[1] = "silksong"; images[2] = "isaac";
String Open = "/";
String fileExtension = ".jpg";
String IMG_PATH = back + back + assets + IMG;
String[] pathway = new String[3];
pathway[0] = IMG_PATH + images[0] + fileExtension;
pathway[1] = IMG_PATH + images[1] + fileExtension;
pathway[2] = IMG_PATH + images[2] + fileExtension;
PImage[] img = new PImage[3];
for(int i = 0; i<3;i++) {
  img[i] = loadImage(pathway[i]);
  rect((divW)*(i+1), (scrH-divH)/2, divW, divH);
  WH[i][0] = img[i].width;
  WH[i][1] = img[i].height;
}
