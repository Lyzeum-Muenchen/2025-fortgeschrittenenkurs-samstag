boolean[][] tiles;
int tileLength = 80;
void setup() {
  size(800, 800);
  startGame();
  clickTile(5, 5); // nur fuer Testzwecke
}
void mousePressed() {
}

void draw() {
  for (int x = 0; x < tiles.length; x++) {
    for (int y = 0; y < tiles[0].length; y++) {
      if (tiles[x][y]) {
        fill(220); // Grauton
      } else {
        fill(50);
      }
      
      rect(tileLength * x, tileLength * y, tileLength, tileLength);
    }
  }
}
void startGame() {
  tiles = new boolean[10][10];
}
void clickTile(int x, int y) {
  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      int newX = x + i;
      int newY = y + j;
      if (tileExists(newX, newY)) {
        // invertiere boolean Wert
        tiles[newX][newY] = !tiles[newX][newY];
      }
    }
  }
}
boolean tileExists(int newX, int newY) {
  return newX >= 0 && newY >= 0 && newX < tiles.length && newY < tiles.length;
}
