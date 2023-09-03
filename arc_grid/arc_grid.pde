int bgColor = #ffffff;

// Grid A
int cols = 4;
int rows = cols;
int cellWidth;
int cellHeight;

// Grid B
int miniCols = 2;
int miniRows = miniCols;
int miniCellWidth;
int miniCellHeight;

int miniColSize;
int miniRowSize;

void setup() {
  size(640, 640);
  frameRate(60);
}

void draw() {
  background(bgColor);
  fill(#00FF1A);
  noStroke();

  cellWidth = width / cols;
  cellHeight = height / rows;

  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      float wave = sin(radians(frameCount + x * 10 + y * 20));
      float mappedWave = map(wave, -1, 1, 0, 5);
      int selector = int(mappedWave);

      pushMatrix();
      translate(cellWidth * x, cellHeight * y);

      if (selector == 0) {
        arc(0, 0, cellWidth * 2, cellHeight * 2, radians(0), radians(90));
      } else if (selector == 1) {
        // Draw Grid B (inside each cell of Grid A)
        miniCellWidth = cellWidth / miniCols;
        miniCellHeight = cellHeight / miniRows;

        for (int i = 0; i < miniCols; i++) {
          for (int j = 0; j < miniRows; j++) {
            int selector2 = int(random(4));

            pushMatrix();
            translate(i * miniCellWidth, j * miniCellHeight);

            if (selector2 == 0) {
              arc(0, 0, miniCellWidth * 2, miniCellHeight * 2, radians(0), radians(90));
            } else if (selector2 == 1) {
              arc(miniCellWidth, 0, miniCellWidth * 2, miniCellHeight * 2, radians(90), radians(180));
            } else if (selector2 == 2) {
              arc(miniCellWidth, miniCellHeight, miniCellWidth * 2, miniCellHeight * 2, radians(180), radians(270));
            } else if (selector2 == 3) {
              arc(0, miniCellHeight, miniCellWidth * 2, miniCellHeight * 2, radians(270), radians(360));
            } else {
              arc(0, miniCellHeight, miniCellWidth * 2, miniCellHeight * 2, radians(270), radians(360));
            }
            popMatrix();
          }
        }
      } else if (selector == 2) {
        arc(cellWidth, 0, cellWidth * 2, cellHeight * 2, radians(90), radians(180));
      } else if (selector == 3) {
        arc(cellWidth, cellHeight, cellWidth * 2, cellHeight * 2, radians(180), radians(270));
      } else {
         arc(0, cellHeight, cellWidth * 2, cellHeight * 2, radians(270), radians(360));
      }
      popMatrix();
    }
  }
}
