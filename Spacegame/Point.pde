public class Point {
  float x, y;
  public Point(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  public float getDistance(Point p) {
    float diffX = p.x - x;
    float diffY = p.y - y;
    // Satz des Pythagoras
    return (float) Math.sqrt(diffX * diffX + diffY * diffY);
  }
}
