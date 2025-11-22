
final int TILE_LENGTH = 80;
// RushHour
Wall[] walls;

Vehicle redCar;

void setup() {
  size(560, 560); // (6 + 1) x (6 + 1)
  int halfTile = TILE_LENGTH /2;
  walls = new Wall[] {
    new Wall(0, 0, 7 * TILE_LENGTH, halfTile), //oben
    new Wall(0, 0, halfTile, 7 * TILE_LENGTH), // links
    new Wall(0, 13 * halfTile, 7 * TILE_LENGTH, halfTile), // unten
    new Wall(13 * halfTile, 0, 
      halfTile, 5 * halfTile),
    new Wall(13 * halfTile, 7 * halfTile,
      halfTile, 7 * halfTile)
  };
  
  redCar = new Vehicle(
    indexToPos(2), indexToPos(2), 
      false, false, color(255, 0, 0));
}

void draw() {
  background(255);
  for (Wall wall: walls) {
    wall.draw();
  }
  redCar.draw();
}

int indexToPos(int index) {
  return TILE_LENGTH / 2 + TILE_LENGTH * index;
}
