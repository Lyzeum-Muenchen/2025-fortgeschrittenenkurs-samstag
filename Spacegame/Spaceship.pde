import java.awt.Shape;

public class Spaceship implements CollidableEntity {
  float centerX, centerY, shipWidth, shipHeight;
  float angle, turnSpeed, accelerationSpeed;
  float currentSpeed;
  int currentHp, maxHp;
  Inventory inventory;
  
  public Spaceship(float centerX, float centerY, float shipWidth
    , float shipHeight) {
    this.centerX = centerX;
    this.centerY = centerY;
    this.shipWidth = shipWidth;
    this.shipHeight = shipHeight;
    angle = 0.0f;
    turnSpeed = PI / 128;
    accelerationSpeed = 0.02f;
    currentHp = 50;
    maxHp = 100;
    inventory = new Inventory();
    inventory.addItem(ItemType.MORX_ORE, 100);
  }

  public Shape getShape() {
    Rectangle2D rect = new Rectangle2D.Double(
      -shipWidth/2, -shipHeight /2,
      shipWidth, shipHeight);
    // verschiebe und rotiere Rechteck
    AffineTransform tx = new AffineTransform();
    tx.translate(centerX, centerY);
    tx.rotate(angle);
    return tx.createTransformedShape(rect);
  }
  
  public void turnLeft() {
    angle -= turnSpeed;
    if (angle < 0) {
      angle += 2 * PI; // waehle gleichen Winkel zwischen 0 und 2 * PI
    }
  }
  
  public void turnRight() {
    angle += turnSpeed;
    if (angle >= 2 * PI) {
      angle -= 2 * PI; // 2 * PI sind 360 Grad
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
    float diffX = cos(angle) * currentSpeed;
    float diffY = sin(angle) * currentSpeed;
    centerX += diffX;
    centerY += diffY;

    // spaceship - asteroid collision
    for (Asteroid asteroid: asteroids) {
      if (this.intersects(asteroid.getShape())) {
        this.currentHp = max(0, currentHp - 5);
        asteroids.remove(asteroid);
        break;
      }
    }
    
  }
  
  public void draw() {
    pushMatrix();
    
    translate(-camera.getOffsetX(), -camera.getOffsetY());
    translate(centerX, centerY);
    rotate(angle);
    rectMode(CENTER);
    fill(240);
    rect(0, 0, shipWidth, shipHeight);
    popMatrix();
  }
  
}
