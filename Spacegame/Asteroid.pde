public class Asteroid {
  float x, y, width, height, angle;
  ItemType itemType;
  int itemCount;
  
  public Asteroid (float x, float y, ItemType itemType, int itemCount) {
    this.x = x;
    this.y = y;
    this.width = 50;
    this.height = 50;
    this.itemType = itemType;
    this.itemCount = itemCount;
  }
  
  public void draw() {
    pushMatrix();
    
    translate(-camera.getOffsetX(), - camera.getOffsetY());
    translate(x, y);
    rectMode(CENTER);
    fill(0, 0, 240);
    rect(0, 0, width, height);
    popMatrix();
  }

}
