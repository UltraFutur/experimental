int mouseOverX, mouseOverY;
int[][] state;
float tileW, tileH;
int tilesX, tilesY;
int tiles = 30;

void setup() {
  size(900, 900);

  tilesX = 3;
  tilesY = 3;
  tileW = width / tilesX;
  tileH = height / tilesY;

  state = new int[tilesX][tilesY];

  for (int x = 0; x < tilesX; x++) {
    for (int y = 0; y < tilesY; y++) {
      state[x][y] = 0;
    }
  }
}

void draw() {

  background(0);

  mouseOverX = int(map(mouseX, 0, width, 0, tilesX));
  mouseOverY = int(map(mouseY, 0, height, 0, tilesY));
  
  println(mouseOverX);
  ellipseMode(CORNER);
  noStroke();
  
  for (int x = 0; x < tilesX; x++) {
    for (int y = 0; y < tilesY; y++) {

      if (mouseOverX == x && mouseOverY == y) {
        fill(#00FF00);
      } else {
        fill(#F1F1F1);
      }

      if (state[x][y] == 0) {
        rect(x * tileW, y * tileH, tileW, tileH);
      } else if (state[x][y] == 1) {
        ellipse(x * tileW, y * tileH, tileW, tileH);
      } else if (state[x][y] == 2){
         square(x * tileW, y * tileH, tileW);
      }
    }
  }
}
void mouseReleased() {
  state[mouseOverX][mouseOverY] = (state[mouseOverX][mouseOverY] + 1) % 3;
}
