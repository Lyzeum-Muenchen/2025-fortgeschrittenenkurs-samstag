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
      float angle = r.nextFloat(0, 2 * PI);
      int itemCount = r.nextInt(1, 4);
      Asteroid newAsteroid = new Asteroid(
        randomX, randomY, angle, ItemType.IRON_ORE, itemCount
      );
      boolean hasColission = false;
      for (Asteroid existingAsteroid: results) {
        if (existingAsteroid.intersects(newAsteroid.getShape())) {
          hasColission = true;
          break;
        }
      }
      if (!hasColission) {
        results.add(
          newAsteroid
        );
      }
    }
    return results;
  }
  
  
}
