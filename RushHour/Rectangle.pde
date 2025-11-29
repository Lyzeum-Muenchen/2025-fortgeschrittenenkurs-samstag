public class Rectangle {
  int x, y, width, height;
  
  public Rectangle(int x, int y, int width, int height) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }
  
  public Rectangle move(int diffX, int diffY) {
    return new Rectangle(x + diffX, y + diffY, width, height);
  }
  
  public boolean isPointInRectangle(Position pos) {
    return pos.x >= x && pos.x <= x + width && 
        pos.y >= y && pos.y <= y + height;
  }
  
  public boolean intersects(Rectangle other) {
    // Vergleiche, welche Nicht-Kolissionen erkennen
    if (x >= other.x + other.width) {
      return false; // A.links >= B.rechts
    } else if(x + width <= other.x) {
      return false; // A.rechts <= B.links
    } else if (y >= other.y + other.height) {
      return false; // A.oben >= B.unten
    } else if(y + height <= other.y) {
      return false; // A.unten <= B.oben
    } else {
      return true;
    }
    
    
  }

}
