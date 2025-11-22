public class Vehicle {
  Rectangle hitbox;
  boolean movesVertically; // up or down
  color fillColor;
  
  public Vehicle(int x, int y, boolean isTruck, 
  boolean movesVertically, color fillColor) {
    // Bedingung ? <Positiver Fall> : <Negativer Fall>
    int vehicleLength = TILE_LENGTH * (isTruck ?  3 : 2);
    int vehicleWidth = movesVertically ? TILE_LENGTH : vehicleLength;
    int vehicleHeight = movesVertically ? vehicleLength : TILE_LENGTH; 
    hitbox = new Rectangle(x, y, vehicleWidth, vehicleHeight);
    this.movesVertically = movesVertically;
    this.fillColor = fillColor;
  }
  
  public void draw() {
    fill(fillColor);
    rect(hitbox.x, hitbox.y, hitbox.width, hitbox.height);
  }
}
