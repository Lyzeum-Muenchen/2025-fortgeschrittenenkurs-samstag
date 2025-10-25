import java.util.Random;

boolean[][] tiles;
int tileLength = 80;
int DIFFICULTY = 8; // Anzahl Klicks zur Generierung

void setup() {
  size(800, 800);
  startGame();
}
// Github: https://github.com/Lyzeum-Muenchen/2025-fortgeschrittenenkurs-samstag
// --> Suche nach Gruppe Lyzeum-Muenchen
void mousePressed() {
  if (isGameCompleted()) {
    startGame();
  } else {
    int x = mouseX / tileLength;
    int y = mouseY / tileLength;
    clickTile(x, y);
  }
}

void draw() {
  boolean isGameCompleted = isGameCompleted();
  for (int x = 0; x < tiles.length; x++) {
    for (int y = 0; y < tiles[0].length; y++) {
      if (isGameCompleted) {
        fill(0, 255, 0);
      }else if (tiles[x][y]) {
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
  
  Random r = new Random();
  for (int i = 0; i < DIFFICULTY; i++) {
    clickTile(r.nextInt(10), r.nextInt(10));// zwei Zufallszahlen exklusive 10 generieren
  }
  
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

boolean isGameCompleted() {
  // Spiel ist vorbei, falls alle Felder auf false gesetzt sind
  for (int i = 0; i < tiles.length; i++) {
    for (int j = 0; j < tiles[i].length; j++) {
      if (tiles[i][j]) {
        return false; // aktive Kachel --> Spiel ist nicht vorbei
      }
    }
  }
  return true;
}
