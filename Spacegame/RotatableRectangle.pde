public class RotatableRectangle implements CollidableEntity {
  float centerX, centerY, width, height, angle;
  
  public RotatableRectangle(float centerX, float centerY, float width, float height, float angle) {
    this.centerX = centerX;
    this.centerY = centerY;
    this.width = width;
    this.height = height;
    this.angle = angle;
  }
  
  public Shape getShape() {
      Rectangle2D rect = new Rectangle2D.Double(
        -width/2, -height /2,
        width, height);
      AffineTransform tx = new AffineTransform();
      tx.translate(centerX, centerY);
      tx.rotate(angle);
      return tx.createTransformedShape(rect);
    }
  
  public boolean intersects(Shape otherShape) {
    Area areaA = new Area(getShape());
    Area areaB = new Area(otherShape);
    areaA.intersect(areaB);
    return !areaA.isEmpty();
  }
  
}