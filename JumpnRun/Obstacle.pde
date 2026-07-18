public class Obstacle {
  Rectangle pos;
  
  public Obstacle(float x, float y, float w, float h) {
    this.pos = new Rectangle(x, y, w, h);
  }
  
  public void update() {
    // TODO
  }
  
  public boolean isRemovable() {
    return pos.x + pos.w < 0;
  }
  
  public void draw() {
    // TODO
  }
  
  public boolean intersects(Player player) {
    return pos.intersects(player.pos);
  }
}
