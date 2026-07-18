# Aufgabenblatt 18.07.2026

## Anforderungen

- Das Spiel besteht aus einem Spieler, einer Platform als Boden und einem oder mehreren Hindernissen.
- Die Hindernisse bewegen sich mit einer gleichmäßigen Geschwindigkeit auf dem Spieler zu.
- Der Spieler kann vom Boden aus einen Sprung ausführen.
- Es werden in zufälligen Abständen Hindernisse in verschiedenen Größen generiert.
- Das Spiel ist vorbei sobald der Spieler ein Hindernis berührt.
- Das Spiel kann neugestartet werden.
- Es wird ein Highscore erfasst und persistiert.

## Setup

Das Projekt wird aus folgenden Klassen bestehen:
- JumpnRun (Hauptdatei)
- Obstacle
- Platform
- Player
- Rectangle

### JumpnRun-Hauptdatei

Initial werden zwingend erforderliche Variablen deklariert und wichtige Funktionen bereits definiert.

Die Hilfsfunktionen `xval()` und `yval()` erleichtern die Platzierung von Spieler, Hindernissen und der Platform in einem Vollbildmodus.

```java
ArrayList<Obstacle> obstacles;
Platform platform;
Player player;

long points;
boolean isGameActive;
float difficultyMultiplier = 1.0;

void setup() {
  fullScreen();
  frameRate(60);
  resetGame();
}

void resetGame() {
  //player = new Player(xval(0.1), -yval(0.2), xval(0.08), yval(0.16));
  //platform = new Platform(xval(0.0), yval(0.9), xval(1.0));
  //obstacles = new ArrayList<Obstacle>();
  points = 0;
  isGameActive = true;
  generateNextObstacle = millis() + 300;
}

float xval(float ratio) {
  return ratio * width;
}

float yval(float ratio) {
  return ratio * height;
}

void updateGame() {

}

public void handleObstacleGeneration() {
  
}

float getObstacleSpeed() {
  return -1 * xval(0.01);
}

boolean landsOnPlatform(Platform platform, Player player, Rectangle nextPos) {
  return false; // TODO
}

void keyPressed() {
  
}

void keyReleased() {
  
}

void draw() {
  updateGame();
  background(200);
  
}
```

### Rectangle-Klasse

Diese Klasse bietet Methoden zur Kolissionserkennung und Verschiebung der Form an.

```java
public class Rectangle {
  float x, y, w, h;
  
  public Rectangle(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public Rectangle move(float diffX, float diffY) {
    return new Rectangle(x + diffX, y + diffY, w, h);
  }
  
  public Rectangle withX(float newX) {
    return new Rectangle(newX, y, w, h);
  }
  
  public Rectangle withY(float newY) {
    return new Rectangle(x, newY, w, h);
  }
  
  public boolean intersects(Rectangle other) {
    // Vergleiche, welche Nicht-Kolissionen erkennen
    if (x >= other.x + other.w) {
      return false; // A.links >= B.rechts
    } else if(x + w <= other.x) {
      return false; // A.rechts <= B.links
    } else if (y >= other.y + other.h) {
      return false; // A.oben >= B.unten
    } else if(y + h <= other.y) {
      return false; // A.unten <= B.oben
    } else {
      return true;
    }
    
  }
}
```

### Player-Klasse

```java
public class Player {
  Rectangle pos;
  int jumpsRemaining;
  int maxJumps = 1;
  float ySpeed = 0;
  boolean isJumpPressed;
  
  public Player(float x, float y, float w, float h) {
    this.pos = new Rectangle(x, y, w, h);
    jumpsRemaining = 0;
  }
  
  public void keyPressed() {
    // TODO
  }
  
  public void keyReleased() {
    // TODO
  }
  
  public void updateSpeed() {
    // TODO
  }
  
  public Rectangle nextPos() {
    return pos.move(0, ySpeed);
  }
  
  public void draw() {
    // TODO
  }
}
```

### Obstacle-Klasse

```java
public class Obstacle {
  Rectangle pos;
  
  public Obstacle(float x, float y, float w, float h) {
    this.pos = new Rectangle(x, y, w, h);
  }
  
  public void update() {
    // TODO
  }
  
  public boolean isRemovable() {
    return pos.x + pos.w < 0;
  }
  
  public void draw() {
    // TODO
  }
  
  public boolean intersects(Player player) {
    return pos.intersects(player.pos);
  }
}
```

### Platform-Klasse

```java
public class Platform {
  Rectangle pos;
  
  public Platform(float x, float y, float w, float h) {
    pos = new Rectangle(x, y, w, h);
  }
  
  
  public boolean intersects(Rectangle rect) {
    return pos.intersects(rect);
  }
  
  public void draw() {
    // TODO
  }
}
```

## Zeichnen von Spieler und Platform

1. Fülle die `draw()`-Methoden von Platform und Player aus
2. In Rufe die neugeschriebene Implementierung in `JumpnRun` an der geeigneten Stelle

## Implementierung der Sprung-Funktion des Spielers

1. Implementiere eine Logik, welche das Drücken der Sprungtaste (z.B. Leerzeichen) erkennt. Je nach Zustand soll die Variable in player.`isJumpPressed` auf true oder false gesetzt werden.
2. Fülle die Funktion `updateSpeed()` in der Player-Klasse aus. 
    - Die Variable `ySpeed` bestimmt die Geschwindigkeit des Spielers in y-Richtung.
    - Es soll immer ein Graviationseffekt auf den Spieler wirken, welcher den Spieler immer schneller nach unten ziehen soll.
    - Beim Drücken eines Sprungs soll `ySpeed` auf einen Wert gesetzt werden, welcher den Spieler nach oben fliegen lässt.
    - Hinweis: Die Kolission mit der Platform soll später implementiert werden.
    - Hinweis: Eine maximale Anzahl erlaubter Sprünge soll noch nicht implementiert werden.
3. Rufe updateSpeed() in der Klasse JumpnRun an geeigneter Stelle auf.
