PImage img;

void setup() {
  size(640, 640);
    img = loadImage("3.jpg");
    img.resize(width, 0);
    img.filter(GRAY);
   
    //img[i].save(str(i) + "_grayscale.jpg");
}

void draw(){
  image(img, 0, 0);
}
