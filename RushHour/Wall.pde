public class Wall {
  
  int x, y, wallWidth, wallHeight; // Pixelkoordinaten
  Rectangle hitbox;
  
  public Wall(int x, int y, int width, int height) {
    this.x = x;
    this.y = y;
    wallWidth = width;
    wallHeight = height;
    hitbox = new Rectangle(x, y, width, height);
  }
  
  public void draw() {
    if (isLevelCompleted) {
      fill(14, 234, 74);
    } else {
      fill(125);
    }
    noStroke();
    rect(x, y, wallWidth, wallHeight);
  }
}
