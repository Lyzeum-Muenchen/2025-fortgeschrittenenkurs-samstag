import java.awt.Shape;
import java.awt.geom.*;

public class Asteroid {
  float x, y, width, height, angle;
  ItemType itemType;
  int itemCount;
  PImage ironOre = loadImage("data/iron_ore.png");
  
  public Asteroid (float x, float y, float angle, ItemType itemType, int itemCount) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.width = 50;
    this.height = 50;
    this.itemType = itemType;
    this.itemCount = itemCount;
  }
  
  public Shape getShape() {
    Rectangle2D rect = new Rectangle2D.Double(
      -width/2, -height /2,
      width, height);
    // verschiebe und rotiere Rechteck
    AffineTransform tx = new AffineTransform();
    tx.translate(x, y);
    tx.rotate(angle);
    return tx.createTransformedShape(rect);
  }
  
  public boolean intersects(Shape otherShape) {
    Area areaA = new Area(getShape());
    Area areaB = new Area(otherShape);
    areaA.intersect(areaB);
    return !areaA.isEmpty();
  }
  
  public void draw() {
    pushMatrix();
    translate(-camera.getOffsetX(), - camera.getOffsetY());
    
    translate(x, y);
    rotate(angle);
    rectMode(CENTER);
    fill(0, 0, 240);
    image(ironOre, 0, 0, width, height);
    // rect(0, 0, width, height);
    popMatrix();
  }

}
