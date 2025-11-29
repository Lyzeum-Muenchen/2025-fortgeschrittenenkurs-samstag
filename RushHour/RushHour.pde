
final int TILE_LENGTH = 80;
// RushHour
Wall[] walls;

Vehicle[] vehicles;
Position prevMousePos;

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
  
  vehicles = new Vehicle[] {
    new Vehicle(indexToPos(2), indexToPos(2), false, false, color(255, 0, 0))
  };
}

void mousePressed() {
  prevMousePos = new Position(mouseX, mouseY);
}

void mouseDragged() {
  // calculate movement
  int offsetX = mouseX - prevMousePos.x;
  int offsetY = mouseY - prevMousePos.y;
  Vehicle v = vehicles[0]; // TODO default wert ersetzen
  
  // left or right
  do {
    int diff = offsetX > 0 ? 1 : -1;
    Rectangle newPos = v.hitbox.move(diff, 0);
    if (intersects(newPos)) {
      break;
    } else {
      // TODO Auto bewegen
      v.hitbox = newPos;
      offsetX -= diff;
      prevMousePos = prevMousePos.move(diff, 0);
    }
  } while(offsetX != 0);
}

boolean intersects(Rectangle newPos) {
  return false; // TODO echte Kolission implementieren
}


void draw() {
  background(255);
  for (Wall wall: walls) {
    wall.draw();
  }
  for (Vehicle vehicle: vehicles) {
    vehicle.draw();
  }
}

int indexToPos(int index) {
  return TILE_LENGTH / 2 + TILE_LENGTH * index;
}
