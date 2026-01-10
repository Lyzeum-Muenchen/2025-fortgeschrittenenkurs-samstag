
// Spaceship
public class Spaceship {
  float centerX, centerY, shipWidth, shipHeight;
  float angle, turnSpeed, accelerationSpeed;
  float currentSpeed;
  public Spaceship(float centerX, float centerY, float shipWidth
    , float shipHeight) {
    this.centerX = centerX;
    this.centerY = centerY;
    this.shipWidth = shipWidth;
    this.shipHeight = shipHeight;
    angle = 0.0f;
    turnSpeed = PI / 128;
    accelerationSpeed = 0.02f;
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
  }
  public void draw() {
    pushMatrix();
    translate(centerX, centerY);
    rotate(angle);
    rectMode(CENTER);
    fill(240);
    rect(0, 0, shipWidth, shipHeight);
    popMatrix();
  }
}
