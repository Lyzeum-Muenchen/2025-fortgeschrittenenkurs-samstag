public abstract class Attack implements CollidableEntity {
    int ttl;
    public Attack(int ttl) {
        this.ttl = ttl;
    }
  
  void update() {
    ttl--;
    move();
  }

    abstract void move();
    abstract void draw();
}