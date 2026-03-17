public class ProgressBar {
  int x, y, width, height;
  int currentValue, maxValue;
  color backgroundColor, fillColor;
  
  public ProgressBar(int x, int y, int width, int height, 
    color backgroundColor, color fillColor) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.backgroundColor = backgroundColor;
    this.fillColor = fillColor;
    currentValue = 0;
    maxValue = 1;
  }
  
  public void setValues(int currentValue, int maxValue) {
    this.currentValue = currentValue;
    this.maxValue = maxValue;
  }
  public void draw() {
    float percentage = Math.max(0, Math.min(1, (float) currentValue / maxValue));
    rectMode(CORNER);
    fill(backgroundColor);
    rect(x, y, width, height);
    fill(fillColor);
    rect(x, y, width * percentage, height);
    textSize(20);
    fill(255);
    textAlign(CENTER, CENTER);
    text(currentValue + " / " + maxValue, x + width / 2, y + height / 2);
  }
}
