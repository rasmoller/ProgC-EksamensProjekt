class Planets {
  float radius, orbitSpeed, rotationSpeed, distance;
  String name;
  PImage texture;
  PShape planet;
  PVector position;
  color c;
  float angle = 0;
  
  Planets(String name, float radius, float distance, PImage texture, float orbitSpeed, float rotationSpeed) {
    this.texture = texture;
    this.orbitSpeed = orbitSpeed;
    this.rotationSpeed = rotationSpeed;
    this.name = name;
    this.distance = distance;
    position = new PVector(1, 0);
    position.normalize();
    this.radius = radius;
    //this.c = c;
  }

  void moons(String name, float size, float distance) {
  }

  void display() {
    // find a way to make speed a multiplier for angle
    if(angle < 360){
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
      popMatrix();
      if (drawNames) {
        printName();
      }
      angle+= orbitSpeed;
    }
    else{
    angle = 0;
    }
  }

  void printName() {
    //pushMatrix();
    //translate(position.x, position.y - (radius + (radius * 0.5)), position.z);
    //text(name, position.x, position.y);
    //popMatrix();
  }
}