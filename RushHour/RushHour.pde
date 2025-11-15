
final int TILE_LENGTH = 80;
// RushHour
Wall[] walls;
void setup() {
  size(560, 640); // (6 + 1) x (7 + 1) 
  walls = new Wall[] {
    new Wall(0, 0, 7 * TILE_LENGTH, TILE_LENGTH / 2)
  };
}

void draw() {
  background(255);
  walls[0].draw();
}
