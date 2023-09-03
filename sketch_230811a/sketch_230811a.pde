PImage[] img;
int n = 10;

void setup() {
  size(640, 640);
  
  img = new PImage[n];
  
  for(int i = 1; i < img.length; i++){
    img[i] = loadImage(str(i) + ".jpg");
    img[i].resize(width, 0);
    img[i].filter(GRAY);
   
    //img[i].save(str(i) + "_grayscale.jpg");
    
  }
}

void draw(){
}
