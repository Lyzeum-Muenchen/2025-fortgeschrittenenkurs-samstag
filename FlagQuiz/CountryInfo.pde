public class CountryInfo {
  
  String filename;
  PImage flag;
  String[] names;
  float width, height;
  
  public CountryInfo(String filename, String[] names) {
    this.filename = filename;
    this.flag = loadImage("jpg/" + filename);
    this.names = names;
    if (flag.width > flag.height) {
      width = 600;
      height = 600 * ((float)flag.height) / ((float)flag.width);
    } else {
      height = 600;
      width = 600 * ((float)flag.width) / ((float)flag.height);
    }
  }
  
  public String getDefaultName() {
    return names[0];
  }
  
  public boolean matchesName(String textInput) {
    return false; // TODO
  }
  

}
