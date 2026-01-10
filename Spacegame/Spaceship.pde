
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
  
  }
}
