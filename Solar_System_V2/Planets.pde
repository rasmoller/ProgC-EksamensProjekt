class Planets {
  float radius, orbitSpeed, rotationSpeed, distance;
  String name;
  PImage texture;
  PShape planet;
  color c;
  float angle = 0;


  Planets(String name, float radius, float distance, PImage texture, float orbitSpeed, float rotationSpeed, float startAngle) {
    this.texture = texture;
    this.orbitSpeed = orbitSpeed;
    this.rotationSpeed = rotationSpeed;
    this.name = name;
    this.distance = distance;
    this.radius = radius;
    this.angle = startAngle;
  }

  void moons(String name, float size, float distance) {
  }

  void display() {
    // find a way to make speed a multiplier for angle
    if (angle < 360) {
      pushMatrix();
      beginShape();
      noStroke();
      //fill(c);
      planet = createShape(SPHERE, radius);
      planet.setTexture(texture);
      endShape();
      rotateY(angle);
      translate(distance, 0);
      shape(planet, 0, 0);
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
    translate(0, 0 - (radius + (radius * 0.4)));
    pushMatrix();
    rotateX(cameraRotations[0]);
    rotateY(-angle);
    rotateY(cameraRotations[1]);
    rotateZ(cameraRotations[2]);
    textSize(10);
    textAlign(CENTER);
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