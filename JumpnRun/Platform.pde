public class Platform {
  Rectangle pos;
  
  public Platform(float x, float y, float w, float h) {
    pos = new Rectangle(x, y, w, h);
  }
  
  
  public boolean intersects(Rectangle rect) {
    return pos.intersects(rect);
  }
  
  public void draw() {
    fill(#F2BC25);
    rect(pos.x, pos.y, pos.w, pos.h);
  }
}
