// Quantité de cellules dans la grille
int amount = 4;
int[][] state = new int[amount][amount];
int mx, my; 
float wheelCount = 0;

void setup() {
size(600, 600);

  for(int x = 0; x < amount; x++) {
    for(int y = 0; y < amount; y++) {
      state[x][y] = int(random(0, 10));
    }
  }
}

void draw(){
background(0);

// Cellules de la grille
float tileW = width / amount;
float tileH = height / amount;

// Couleurs des formes et du fond de la grille
noStroke();

// Transformation des cellules
ellipseMode(CORNER);
rectMode(CORNER);

// Voir ou se situe la souris
mx = int(map(mouseX, 0, width, 0, amount));
my = int(map(mouseY, 0, width, 0, amount));

// Boucle de duplication des formes dans les cellules de la grille
  for(int x = 0; x < amount; x++) {
    for(int y = 0; y < amount; y++) {
      pushMatrix();
      translate(x * tileW, y * tileH);
      // Afficher des formes dans la grille
      if(state[x][y] == 0) {
        fill(#0F62FE);
        ellipse(0, 0, tileW, tileH);
      }else if(state[x][y] == 1) {
        fill(#001141);
        rect(0, 0, tileW, tileH);
      }
      else if(state[x][y] == 2) {
        fill(#EDF5FF);
        triangle(0, 0, tileW, tileH, 0, tileW);
      }
      else if(state[x][y] == 3) {
        fill(#EDF5FF);
        ellipse(0, 0, tileW, tileH);
      }
      else if(state[x][y] == 4) {
        fill(#0F62FE);
        rect(0, 0, tileW, tileH);
      }
      else if(state[x][y] == 5) {
        fill(#001141);
        triangle(tileW, tileH, 0, 0, tileW, tileH);
      }
      else {
        fill(#001141);
        rect(0, 0, tileW, tileH);
      }
      popMatrix();
    }
  }
}
void countUp(int x, int y){
  if(state[x][y] < 5){
    state[x][y]++;
  }else {
    state[x][y] = 0;
  }
}
void mouseReleased(){
  countUp(mx, my);
}
void mouseWheel(MouseEvent event) {
  int wp = event.getCount(); // Get the mousewheel movement direction (positive or negative)
  // Increase or decrease the amount of cells based on the mousewheel direction
  if (wp > 0) {
    amount+=4;
  } else if (wp < 0 && amount > 4) {
    amount-=4;
  }
  // Resize the state array to match the new amount of cells
  state = new int[amount][amount];
  
  // Repopulate the state array with random values
  for (int x = 0; x < amount; x++) {
    for (int y = 0; y < amount; y++) {
      state[x][y] = int(random(0, 10));
    }
  }
}
