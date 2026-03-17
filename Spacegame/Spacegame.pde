import java.util.HashSet;
// Spacegame
PlayerSpaceship player;
Camera camera = new Camera();
HashSet<Integer> pressedKeys = new HashSet<Integer>();
final int KEY_ACCELERATE = 'W';
final int KEY_BRAKE = 'S';
final int KEY_TURN_LEFT = 'A';
final int KEY_TURN_RIGHT = 'D';
final int KEY_PRIMARY_ATTACK = ' ';
final int KEY_TOGGLE_INVENTORY = 'E';
// Inventar
// Waffencooldown/Anzahl Schuesse
boolean cameraEnabled = true;
List<Point> waypoints = new ArrayList<Point>();

ProgressBar healthBar = new ProgressBar(
  100, 100, 250, 50, color(50), color(227, 46, 46)
);

List<Asteroid> asteroids;
InventoryMenu inventoryMenu;

void setup() {
  //fullScreen();
  size(1600, 900);
  frameRate(120);
  player = new PlayerSpaceship(500, 300, 80, 50);
  inventoryMenu = new InventoryMenu(player);
  AsteroidGenerator generator = new AsteroidGenerator();
  asteroids = generator.generate(1500, 500, 1000, 1000);
}

void keyPressed() {
  pressedKeys.add(keyCode);
  if (keyCode == ((int)'R')) {
    cameraEnabled = !cameraEnabled;
  }
  if (keyCode == KEY_TOGGLE_INVENTORY) {
    inventoryMenu.toggle();
  }

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
  if (pressedKeys.contains(KEY_PRIMARY_ATTACK)) {
    player.usePrimaryAttack();
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
  for (Asteroid asteroid: asteroids) {
    asteroid.draw();
  }
  healthBar.draw();
  inventoryMenu.draw();
}
