public class Rectangle {
  float x, y, w, h;
  
  public Rectangle(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public Rectangle move(float diffX, float diffY) {
    return new Rectangle(x + diffX, y + diffY, w, h);
  }
  
  public Rectangle withX(float newX) {
    return new Rectangle(newX, y, w, h);
  }
  
  public Rectangle withY(float newY) {
    return new Rectangle(x, newY, w, h);
  }
  
  public boolean intersects(Rectangle other) {
    // Vergleiche, welche Nicht-Kolissionen erkennen
    if (x >= other.x + other.w) {
      return false; // A.links >= B.rechts
    } else if(x + w <= other.x) {
      return false; // A.rechts <= B.links
    } else if (y >= other.y + other.h) {
      return false; // A.oben >= B.unten
    } else if(y + h <= other.y) {
      return false; // A.unten <= B.oben
    } else {
      return true;
    }
    
  }
}
