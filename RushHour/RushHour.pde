
final int TILE_LENGTH = 80;
// RushHour
Wall[] walls;

Vehicle[] vehicles;
Position prevMousePos;
int selectedVehicle;
Rectangle exitArea;
boolean isLevelCompleted;

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
  exitArea = new Rectangle(
    indexToPos(6), indexToPos(2), TILE_LENGTH, TILE_LENGTH
  );

  loadLevel();
}

void loadLevel() {
  String[] lines = loadStrings("level_27.csv");
  vehicles = new Vehicle[lines.length - 1];
  for (int i = 1; i < lines.length; i++) {
    String[] parts = lines[i].split(","); // Werte am Komma trennen
    int x = indexToPos(int(parts[0]));
    int y = indexToPos(int(parts[1]));
    boolean isTruck = boolean(parts[2]);
    boolean movesVertically = boolean(parts[3]);
    color fillColor = unhex("FF" + parts[4]); // "FF" damit Farbe nicht transparent wird

    vehicles[i - 1] = new Vehicle(x, y, isTruck, movesVertically, fillColor);
  }
}

void mousePressed() {
  prevMousePos = new Position(mouseX, mouseY);
  selectedVehicle = -1;
  for (int i = 0; i < vehicles.length; i++) {
    if (vehicles[i].hitbox.isPointInRectangle(prevMousePos)) {
      selectedVehicle = i;
    }
  }
}

void mouseDragged() {
  // calculate movement
  int offsetX = mouseX - prevMousePos.x;
  int offsetY = mouseY - prevMousePos.y;
  if (selectedVehicle != -1) {
    Vehicle v = vehicles[selectedVehicle];
    if (v.movesVertically) {
      moveVehicleUpOrDown(offsetY);
    } else {
      moveVehicleLeftOrRight(offsetX);
    }
  }
 
}

void moveVehicleUpOrDown(int offsetY) {
  Vehicle v = vehicles[selectedVehicle];
  do {
    int diff = offsetY > 0 ? 1 : -1;
    Rectangle newPos = v.hitbox.move(0, diff);
    if (intersects(newPos)) {
      break;
    } else {
      v.hitbox = newPos;
      offsetY -= diff;
      prevMousePos = prevMousePos.move(0, diff);
    }
  } while (offsetY != 0);
}

void moveVehicleLeftOrRight(int offsetX) {
  Vehicle v = vehicles[selectedVehicle];
  do {
    int diff = offsetX > 0 ? 1 : -1;
    Rectangle newPos = v.hitbox.move(diff, 0);
    if (intersects(newPos)) {
      break;
    } else {
      v.hitbox = newPos;
      offsetX -= diff;
      prevMousePos = prevMousePos.move(diff, 0);
    }
  } while (offsetX != 0);
  
  if (!isLevelCompleted && v.hitbox.intersects(exitArea)) {
    isLevelCompleted = true;
  }
}

boolean intersects(Rectangle newPos) {
  for (Wall wall : walls) {
    if (wall.hitbox.intersects(newPos)) {
      return true;
    }
  }
  for (int i = 0; i < vehicles.length; i++) {
    if (selectedVehicle != i && vehicles[i].hitbox.intersects(newPos)) {
      return true;
    }
  }
  return false;
}


void draw() {
  background(255);
  for (Wall wall : walls) {
    wall.draw();
  }
  for (Vehicle vehicle : vehicles) {
    vehicle.draw();
  }
}

int indexToPos(int index) {
  return TILE_LENGTH / 2 + TILE_LENGTH * index;
}
