public class LaserAttack extends Attack {
  RotatableRectangle rect;
  float speed;
  
  public LaserAttack(float x, float y, float angle, float speed, int ttl) {
    super(ttl);
    this.rect = new RotatableRectangle(x, y, 50, 5, angle);
    this.speed = speed;
  }
  
  public void move() {
    float diffX = cos(rect.angle) * speed;
    float diffY = sin(rect.angle) * speed;
    rect.centerX += diffX;
    rect.centerY += diffY;
  }

  public void draw() {
    pushMatrix();
    translate(-camera.getOffsetX(), -camera.getOffsetY());   
    translate(rect.centerX, rect.centerY);
    rotate(rect.angle);
    rectMode(CENTER);
    fill(255, 0, 0);
    rect(0, 0, rect.width, rect.height);
    popMatrix();
  }

    public Shape getShape() {
      return rect.getShape();
    }
  
  public boolean intersects(Shape otherShape) {
    return rect.intersects(otherShape);
  }
}
