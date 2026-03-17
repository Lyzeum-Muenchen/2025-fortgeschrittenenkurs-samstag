
// Spaceship
public class Spaceship implements CollidableEntity {
  RotatableRectangle rect;
  float turnSpeed, accelerationSpeed;
  float currentSpeed;
  int currentHp, maxHp;
  Inventory inventory;
  List<Attack> attacks;
  int primaryAttackCooldown;
  int regenerationCooldown;
  
  public Spaceship(float centerX, float centerY, float shipWidth
    , float shipHeight) {
    this.rect = new RotatableRectangle(centerX, centerY, shipWidth, shipHeight, 0.0f);
    this.turnSpeed = PI / 128;
    this.accelerationSpeed = 0.02f;
    currentHp = 50;
    maxHp = 100;
    inventory = new Inventory();
    inventory.addItem(ItemType.MORX_ORE, 100);
    attacks = new ArrayList<Attack>();
  }
  
  public void turnLeft() {
    rect.angle -= turnSpeed;
    if (rect.angle < 0) {
      rect.angle += 2 * PI; // waehle gleichen Winkel zwischen 0 und 2 * PI
    }
  }
  
  public void turnRight() {
    rect.angle += turnSpeed;
    if (rect.angle >= 2 * PI) {
      rect.angle -= 2 * PI; // 2 * PI sind 360 Grad
    }
  }
  // beschleunigen
  public void accelerate() {
    final float MAX_SPEED = 7;
    currentSpeed = min(currentSpeed + accelerationSpeed, MAX_SPEED);
  }
  public void brake() {
    currentSpeed = max(currentSpeed - accelerationSpeed, 0);
  }
  public void update() {
    // move spaceship
    float diffX = cos(rect.angle) * currentSpeed;
    float diffY = sin(rect.angle) * currentSpeed;
    rect.centerX += diffX;
    rect.centerY += diffY;
    // health regeneration
    if (regenerationCooldown > 0) {
      regenerationCooldown--;
    } else if (currentHp < maxHp) {
      currentHp++;
      regenerationCooldown = 120;
    }
    // update attacks
    if (primaryAttackCooldown > 0) {
      primaryAttackCooldown--;
    }
    for (Attack attack: attacks) {
      attack.update();
    }
    // colissions attacks and asteroids
    for (Attack attack: attacks) {
      for (Asteroid asteroid: asteroids) {
        if (attack.intersects(asteroid.getShape())) {
          attack.ttl = 0;
          asteroid.itemCount -= 1;
          inventory.addItem(asteroid.itemType, 1);
          if (asteroid.itemCount <= 0) {
            asteroids.remove(asteroid);
          }
          break;
        }
      }
    }
    // colissions spaceship and asteroids
    for (Asteroid asteroid: asteroids) {
      if (asteroid.intersects(getShape())) {
        currentHp -= 5;
        asteroids.remove(asteroid);
        break;
      }
    }

    // cleanup list
    attacks.removeIf(attack -> attack.ttl <= 0);
  }

  public void usePrimaryAttack() {
    if (primaryAttackCooldown == 0) {
      float laserSpeed = 15;
      int laserTtl = 120;
      LaserAttack newAttack = new LaserAttack(
        rect.centerX, rect.centerY, rect.angle, laserSpeed, laserTtl
      );
      attacks.add(newAttack);
      primaryAttackCooldown = 30;
    }
  }
  
  public void draw() {
    pushMatrix();
    
    translate(-camera.getOffsetX(), -camera.getOffsetY());
    translate(rect.centerX, rect.centerY);
    rotate(rect.angle);
    rectMode(CENTER);
    fill(240);
    rect(0, 0, rect.width, rect.height);
    popMatrix();
    for (Attack attack: attacks) {
      attack.draw();
    }
  }

  public Shape getShape() {
    return rect.getShape();
  }
  
  public boolean intersects(Shape otherShape) {
    return rect.intersects(otherShape);
  }
}
