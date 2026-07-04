

ArrayList<CountryInfo> countries = new ArrayList<CountryInfo>();

void setup () {
  size(1500, 1000);
  // TODO Flaggen-Dateinamen lesen
  String[] filenames = loadStrings("list_images.csv");
  String[] countrynames = loadStrings("countries.csv");
  // TODO Ländernamen lesen
  for (int i = 0; i < filenames.length; i++) {
    CountryInfo info = new CountryInfo(filenames[i], countrynames[i].split(","));
    countries.add(info);
  }
}

void draw() {
  background(120);
  CountryInfo info = countries.get(0);
  
  image(info.flag, (width - info.width) / 2, 100, info.width, info.height);
  
  fill(0);
  textSize(40);
  textAlign(CENTER);
  text(info.getDefaultName(), width/2, 800);
  
}
