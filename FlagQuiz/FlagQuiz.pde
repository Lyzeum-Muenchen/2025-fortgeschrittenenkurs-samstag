import java.util.Collections;
import java.util.Random;

String input = "";
ArrayList<CountryInfo> countries = new ArrayList<CountryInfo>();
int index = 0;

void setup () {
  size(1500, 1000);
  String[] filenames = loadStrings("list_images.csv");
  String[] countrynames = loadStrings("countries.csv");
  // TODO Ländernamen lesen
  for (int i = 0; i < filenames.length; i++) {
    CountryInfo info = new CountryInfo(filenames[i], countrynames[i].split(","));
    countries.add(info);
  }
  
  Collections.shuffle(countries, new Random());
}

void keyTyped() {
  // println(int(key) + ", " + key);
  if (int(key) == 8 && input.length() > 0) {
    input = input.substring(0, input.length() - 1);
  }
  boolean isLowercaseLetter = key >= 'a' && key <= 'z';
  boolean isUppercaseLetter = key >= 'A' && key <= 'Z';
  boolean isSpecialCharacter = "öäüÖÄÜ- ".contains(key + "");
  if (isLowercaseLetter || isUppercaseLetter || isSpecialCharacter) {
    input += key;
  }
  checkInput();
}

void checkInput() {
  if (countries.get(index).matchesName(input)) {
     input = "";
     index = (index + 1) % countries.size();
  }
}

void draw() {
  background(180);
  CountryInfo info = countries.get(index);
  
  image(info.flag, (width - info.width) / 2, 100, info.width, info.height);
  
  fill(0);
  textSize(40);
  textAlign(CENTER);
  text(input.toUpperCase(), width/2, 750);
  
}
