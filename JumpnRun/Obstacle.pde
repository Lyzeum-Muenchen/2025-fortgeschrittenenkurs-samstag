public class Obstacle {
  Rectangle pos;
  
  public Obstacle(float x, float y, float w, float h) {
    this.pos = new Rectangle(x, y, w, h);
  }
  
  public void update() {
    this.pos = pos.move(getObstacleSpeed(), 0);
  }
  
  public boolean isRemovable() {
    return pos.x + pos.w < 0;
  }
  
  public void draw() {
    if (pos.intersects(player.pos)) {
      fill(255, 0, 0);
    } else {
      fill(50, 255, 50);
    }
    rect(pos.x, pos.y, pos.w, pos.h);
  }
  
  public boolean intersects(Player player) {
    return pos.intersects(player.pos);
  }
}
