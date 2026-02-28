import java.util.HashSet;
// Spacegame
PlayerSpaceship player;
Camera camera = new Camera();
HashSet<Integer> pressedKeys = new HashSet<Integer>();
final int KEY_ACCELERATE = 'W';
final int KEY_BRAKE = 'S';
final int KEY_TURN_LEFT = 'A';
final int KEY_TURN_RIGHT = 'D';
// Inventar
// Waffencooldown/Anzahl Schuesse
boolean cameraEnabled = true;

ProgressBar healthBar = new ProgressBar(
  100, 100, 250, 50, color(50), color(227, 46, 46)
);

Asteroid testAsteroid = new Asteroid(800, 300, ItemType.LYZEUM_ORE, 2);

void setup() {
  //fullScreen();
  size(1600, 900);
  frameRate(120);
  player = new PlayerSpaceship(500, 300, 80, 50);
}

void keyPressed() {
  pressedKeys.add(keyCode);
}

void keyReleased() {
  pressedKeys.remove(keyCode);
}

void handleKeypresses() {
  if (pressedKeys.contains(KEY_ACCELERATE)) {
    player.accelerate();
  }
  if (pressedKeys.contains(KEY_BRAKE)) {
    player.brake();
  }
  if (pressedKeys.contains(KEY_TURN_LEFT)) {
    player.turnLeft();
  }
  if (pressedKeys.contains(KEY_TURN_RIGHT)) {
    player.turnRight();
  }
}

void draw() {
  // --- UPDATE ---
  camera.focus(player);
  handleKeypresses();
  player.update();
  healthBar.setValues(player.currentHp, player.maxHp);
  // --- DRAW ---
  background(30);
  player.draw();
  testAsteroid.draw();
  healthBar.draw();
}
