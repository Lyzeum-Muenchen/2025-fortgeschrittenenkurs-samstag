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
    fill(125);
    rect(x, y, wallWidth, wallHeight);
  }
}
