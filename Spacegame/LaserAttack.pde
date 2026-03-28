import java.awt.Shape;

public class LaserAttack implements Collidable {
  float x, y, width, height, angle, speed;
  
  public LaserAttack(float x, float y, float angle, float speed) {
    this.x = x;
    this.y = y;
    this.width = 50;
    this.height = 5;
    this.angle = angle;
    this.speed = speed;
  }
  
  public void move() {
    float diffX = cos(angle) * speed;
    float diffY = sin(angle) * speed;
    x += diffX;
    y += diffY;
  }
  public Shape getShape() {
    Rectangle2D rect = new Rectangle2D.Double(
      -width/2, -height /2,
      width, height);
    AffineTransform tx = new AffineTransform();
    tx.translate(x, y);
    tx.rotate(angle);
    return tx.createTransformedShape(rect);
  }
  public void draw() {
    pushMatrix();
    translate(-camera.getOffsetX(), -camera.getOffsetY());
    translate(x, y);
    rotate(angle);
    rectMode(CENTER);
    fill(255, 0, 0);
    rect(0, 0, width, height);
    popMatrix();
  }
}
