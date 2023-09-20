PGraphics pg;

int bgColor = #000000;

int cols = 4;
int rows = cols;
int cellWidth, cellHeight;

int elX = 64;
int elY = elX;

int elWidth, elHeight;

void setup() {
  size(640, 640);
  background(bgColor);
  noStroke();
}
void draw() {
  
  cellWidth = width / cols;
  cellHeight = height / rows;
  
  elWidth = width / elX;
  elHeight = height / elY;
  
  
  for(int x = 0; x < cols; x++) {
    for(int y = 0; y < rows; y++) {
      pushMatrix();
      translate(x * cellWidth, y * cellHeight);
      int state = int(random(1, 4));
      frameRate(4);
      
      stroke(#00FF1A);
      fill(#000000);
      rect(0, 0, cellWidth, cellHeight);
      
      if(state == 1){
        fill(0, 255, 26, 40);
         rect(0, 0, cellWidth, cellHeight);
      }
      else if(state == 2){
        fill(#000000);
        rect(0, 0, cellWidth, cellHeight);
      }
      else if(state == 3){
        fill(0, 255, 26, 40);
         rect(0, 0, cellWidth, cellHeight);
      }
      else if(state == 4){
        fill(#000000);
        rect(0, 0, cellWidth, cellHeight);
      }
      
      popMatrix();
    }
  }
  
  for(int i = 0; i < elX; i++) {
    for(int j = 0; j < elY; j++) {
      pushMatrix();
      translate(i * elWidth, j * elHeight);

      fill(#ffffff);
      noStroke();
      ellipse(0, 0, 1, 1);
      
      popMatrix();
    }
  }
  for(int i = 0; i < elX; i++) {
    for(int j = 0; j < elY; j++) {
      pushMatrix();
      

      
      
      popMatrix();
    }
  }
  
}
void mouseWheel(MouseEvent event) {
  int delta = event.getCount();

  if (delta > 0) {
    cols = min(cols + 8, 16); // Increase by 8 or to a maximum of 32
    rows = min(rows + 8, 16); // Increase by 8 or to a maximum of 32
  } else if (delta < 0) {
    cols = max(cols - 8, 4); // Decrease by 8 or to a minimum of 1
    rows = max(rows - 8, 4); // Decrease by 8 or to a minimum of 1
  }
}
