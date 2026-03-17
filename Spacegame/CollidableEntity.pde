import java.awt.Shape;

public interface CollidableEntity {
  Shape getShape();
  boolean intersects(Shape otherShape);
}