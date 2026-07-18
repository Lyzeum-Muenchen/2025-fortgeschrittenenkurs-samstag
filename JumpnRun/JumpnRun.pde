ArrayList<Obstacle> obstacles;
Platform platform;
Player player;

long points;
boolean isGameActive;
float difficultyMultiplier = 1.0;
long generateNextObstacle;

void setup() {
  fullScreen(2);
  frameRate(120);
  resetGame();
}

void resetGame() {
  player = new Player(xval(0.1), yval(0.2), xval(0.08), yval(0.16));
  platform = new Platform(xval(0.0), yval(0.9), xval(1.0), yval(0.1));
  //obstacles = new ArrayList<Obstacle>();
  points = 0;
  isGameActive = true;
  generateNextObstacle = millis() + 300;
}

float xval(float ratio) {
  return ratio * width;
}

float yval(float ratio) {
  return ratio * height;
}

void updateGame() {
  player.updateSpeed();
  Rectangle nextPos = player.nextPos();
  if (platform.intersects(nextPos)) {
    nextPos = nextPos.withY(platform.pos.y - nextPos.h);
    player.resetSpeed();
  }
  player.pos = nextPos;
}

public void handleObstacleGeneration() {
  
}

float getObstacleSpeed() {
  return -1 * xval(0.01);
}

boolean landsOnPlatform(Platform platform, Player player, Rectangle nextPos) {
  return false; // TODO
}

void keyPressed() {
  player.keyPressed();
}

void keyReleased() {
  player.keyReleased();
}

void draw() {
  updateGame();
  background(200);
  player.draw();
  platform.draw();
}
