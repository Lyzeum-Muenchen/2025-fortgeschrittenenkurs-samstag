int maxIter = 100;
float xlow = -3;
float xhigh = 1;
float ylow = -1;
float yhigh = 1;

color high = color(255, 0, 0);
color low = color(0, 0, 50);

void setup(){
  size(800, 400);
}

void mouseClicked() {
  float centerX = map(mouseX, 0, width, xlow, xhigh);
  float centerY = map(mouseY, 0, height, ylow, yhigh);
  
  float currentScale = xhigh - xlow;
  
  xlow = centerX - currentScale / 4;
  xhigh = centerX + currentScale / 4;
  ylow = centerY - currentScale / 8;
  yhigh = centerY + currentScale / 8;
}

void draw(){
  background(0);
  for(int i =0; i< width; i++){
    for(int j = 0; j <height; j++){
      float a = map(i, 0, width, xlow, xhigh);
      float b = map(j, 0, height, ylow, yhigh);
      
      int iter = iteration(new Complex(a, b));
      
      fill(lerpColor(low, high, float(iter)/maxIter));
      noStroke();
      rect(i, j, 1, 1);
    }
  }
}

int iteration(Complex c){
  Complex z = new Complex(0, 0);
  for(int i=0; i< maxIter; i++){
    z = z.mul(z).add(c); // z <- z^2 +c
    if(z.abs() > 1e12){
      return i;
    }
  }
  return maxIter;
}
