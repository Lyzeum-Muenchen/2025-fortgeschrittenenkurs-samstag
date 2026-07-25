ArrayList<Obstacle> obstacles;
Platform platform;
Player player;

long points;
boolean isGameActive;
float difficultyMultiplier = 1.0;
long generateNextObstacle;

void setup() {
  //fullScreen();
  size(1200, 800);
  frameRate(120);
  resetGame();
}

void resetGame() {
  player = new Player(xval(0.1), yval(0.2), xval(0.08), yval(0.16));
  platform = new Platform(xval(0.0), yval(0.9), xval(1.0), yval(0.1));
  obstacles = new ArrayList<Obstacle>();
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
  // obstacle logic
  handleObstacleGeneration();
  for (Obstacle o: obstacles) {
    o.update();
    if (o.intersects(player)) {
      isGameActive = false;
    }
  }
  // player logic
  player.updateSpeed();
  Rectangle nextPos = player.nextPos();
  if (platform.intersects(nextPos)) {
    nextPos = nextPos.withY(platform.pos.y - nextPos.h);
    player.resetSpeed();
  }
  player.pos = nextPos;
  // points logic
  
  if (isGameActive) {
    points++;
  }
}

public void handleObstacleGeneration() {
  if (millis() >= generateNextObstacle && isGameActive) {
    float obsWidth = random(xval(0.05), xval(0.1));
    float obsHeight = random(yval(0.08), yval(0.15));
    Obstacle obstacle = new Obstacle(width, platform.pos.y - obsHeight,
      obsWidth, obsHeight);
    obstacles.add(obstacle);
    float minDelay = 800;
    float maxDelay = 2000;
    generateNextObstacle = millis() + int(random(minDelay, maxDelay));
  }
}

float getObstacleSpeed() {
  return -1 * xval(0.01);
}

void keyPressed() {
  player.keyPressed();
  if (keyCode == 10 && !isGameActive) {
    resetGame();
  }
}

void keyReleased() {
  player.keyReleased();
}

void draw() {
  updateGame();
  background(200);
  player.draw();
  platform.draw();
  for (Obstacle o: obstacles) {
    o.draw();
  }
  fill(0);
  textSize(40);
  textAlign(RIGHT);
  text(points + "", xval(0.95), yval(0.1));
  if (!isGameActive) {
    textAlign(CENTER);
    textSize(55);
    text("PRESS ENTER TO RESTART...", xval(0.5), yval(0.6));
  }
}
