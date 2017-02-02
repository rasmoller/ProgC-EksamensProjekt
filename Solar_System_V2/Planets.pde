class Planets {
  float radius, orbitSpeed, rotationSpeed, distance;
  String name;
  PImage texture;
  PShape planet;
  color c;
  float angle = 0;
  float rotation = 0;
  float inclination;


  Planets(String name, float radius, float distance, PImage texture, float orbitSpeed, float rotationSpeed, float startAngle, float inclination) {
    this.texture = texture;
    this.orbitSpeed = orbitSpeed;
    this.rotationSpeed = rotationSpeed;
    this.name = name;
    this.distance = distance;
    this.radius = radius;
    this.angle = startAngle;
    this.inclination = inclination;
  }

  void moons(String name, float size, float distance) {
  }

  void display() {
    // find a way to make speed a multiplier for angle
    if (angle < TWO_PI*2) {
      pushMatrix();
      beginShape();
      noStroke();
      //fill(c);
      planet = createShape(SPHERE, radius);
      planet.setTexture(texture);
      endShape();
      rotateY(angle);
      translate(distance, 0);
      
      if (rotation < TWO_PI*2) {
        pushMatrix();
        rotateY(rotation);
        shape(planet, 0, 0);
        popMatrix();
        rotation += rotationSpeed;
      } else {
        rotation = 0;
      }
      if (drawNames) {
        printName();
      }
      popMatrix();
      angle+= orbitSpeed;
    } else {
      angle = 0;
    }
    if (drawOrbit) {
      drawOrbit();
    }
  }

  void printName() {
    pushStyle();
    stroke(2);
    pushMatrix();
    rotateX(cameraRotations[0]);
    rotateY(cameraRotations[1]);
    rotateY(-angle);
    //rotateZ(cameraRotations[2]);
    translate(0, 0 - (radius + (radius * 0.4)));
    textSize(30);
    textAlign(CENTER);
    fill(255);
    text(name, 0, 0, 0);
    popMatrix();
    popStyle();
  }
  void drawOrbit() {
    pushMatrix();
    pushStyle();
    rotateX(PI/2);
    strokeWeight(0.8);
    stroke(255, 60);
    noFill();
    ellipse(0, 0, distance*2, distance*2);
    popStyle();
    popMatrix();
  }
}