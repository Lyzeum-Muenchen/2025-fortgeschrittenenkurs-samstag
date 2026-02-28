import java.util.List;
import java.util.Random;

public class AsteroidGenerator {

  List<Asteroid> generate(float x, float y, float width, float height) {
    List<Asteroid> results = new ArrayList<Asteroid>();
    // generiere x Punkte mit einem Mindestabstand zwischeneinander
    // Wandel Punkte in Asteroiden um
    Random r = new Random();
    for (int i = 0; i < 100; i++) { 
      float randomX = x + r.nextFloat(-width/2, width/2);
      float randomY = y + r.nextFloat(-height/2, height/2);
      int itemCount = r.nextInt(1, 4);
      results.add(
        new Asteroid(randomX, randomY, ItemType.IRON_ORE, itemCount)
      );
    }
    return results;
  }
  
  
}
