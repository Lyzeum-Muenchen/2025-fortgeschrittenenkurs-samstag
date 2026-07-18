public class Player {
  Rectangle pos;
  int jumpsRemaining;
  int maxJumps = 1;
  float ySpeed = 0;
  boolean isJumpPressed;
  
  public Player(float x, float y, float w, float h) {
    this.pos = new Rectangle(x, y, w, h);
    jumpsRemaining = 0;
  }
  
  public void keyPressed() {
    println(keyCode);
    if (keyCode == 32) {
      isJumpPressed = true;
    }
  }
  
  public void keyReleased() {
    if (keyCode == 32) {
      isJumpPressed = false;
    }
  }
  
  public void updateSpeed() {
    ySpeed = ySpeed + yval(0.005);
    if (isJumpPressed && jumpsRemaining > 0) {
      jumpsRemaining --;
      ySpeed = - yval(0.08);
    }
  }
  
  public void resetSpeed() {
    ySpeed = 0;
    jumpsRemaining = maxJumps;
  }
  
  public Rectangle nextPos() {
    return pos.move(0, ySpeed);
  }
  
  public void draw() {
    fill(0, 0, 255);
    rect(pos.x, pos.y, pos.w, pos.h);
  }
}
