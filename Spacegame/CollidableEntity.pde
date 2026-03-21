import java.awt.Shape;
import java.awt.geom.Area;

public interface CollidableEntity {
    Shape getShape();
    
    default boolean intersects(Shape otherShape) {
        Area areaA = new Area(getShape());
        Area areaB = new Area(otherShape);
        areaA.intersect(areaB);
        return !areaA.isEmpty();
    }
}