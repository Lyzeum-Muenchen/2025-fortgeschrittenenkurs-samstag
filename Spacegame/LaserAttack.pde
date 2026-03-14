public class LaserAttack {
  float x, y, angle, speed;
  
  public LaserAttack(float x, float y, float angle, float speed) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.speed = speed;
  }
  
  public void move() {
    float diffX = cos(angle) * speed;
    float diffY = sin(angle) * speed;
    x += diffX;
    y += diffY;
  }
}
