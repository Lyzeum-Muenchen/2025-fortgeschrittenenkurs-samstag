public class InventoryMenu {
  Spaceship spaceship;
  boolean isOpen = false;
  
  public InventoryMenu(Spaceship spaceship) {
    this.spaceship = spaceship;
  }
  
  public void toggle() {
    isOpen = !isOpen;
  }
  
  public void draw() {
    if (!isOpen) return;
    
    fill(150, 150, 150, 150);
    rectMode(CENTER);
    rect(width / 2, height / 2, width * 0.8f, height * 0.8f);
    
    // draw inventory items
    fill(255);
    textSize(25);
    textAlign(LEFT, TOP);
    int yOffset = 50;
    for (Map.Entry<ItemType, Integer> entry : spaceship.inventory.getItems().entrySet()) {
        ItemType itemType = entry.getKey();
        int itemCount = entry.getValue();
      text("- " +itemType.name() + " (x" + itemCount + ")", width / 2 - width * 0.35f, height / 2 - height * 0.35f + yOffset);
      yOffset += 30;
    }
    }
    
}