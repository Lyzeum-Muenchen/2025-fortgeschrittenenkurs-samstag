public class Camera {
  float offsetX, offsetY;
  public void focus(Spaceship spaceship) {
    offsetX = spaceship.centerX;
    offsetY = spaceship.centerY;
  }
  
  public float getOffsetX() {
    return offsetX - 0.5 * width;
  }
  
  public float getOffsetY() {
    return offsetY - 0.5 * height;
  }
}
