public class Camera {
  float offsetX, offsetY;

  public void focus(Spaceship spaceship) {
    // update only if camera is enabled
    if (cameraEnabled) {
      offsetX = spaceship.rect.centerX;
      offsetY = spaceship.rect.centerY;
    }
  }
  
  public float getOffsetX() {
    return offsetX - 0.5 * width;
  }
  
  public float getOffsetY() {
    return offsetY - 0.5 * height;
  }
}
