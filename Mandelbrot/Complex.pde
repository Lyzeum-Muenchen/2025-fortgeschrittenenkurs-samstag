public class Complex{
  float a;
  float b;
  public Complex(float a, float b){
    this.a = a;
    this.b = b;
  }
  
  public Complex add(Complex z){
    return new Complex(a + z.a, b + z.b);
  }
  public Complex mul(Complex z){
    return new Complex(a*z.a - b*z.b, b*z.a + a*z.b);
  }
  public float abs(){
    return sqrt(a*a + b*b);
  }
}
