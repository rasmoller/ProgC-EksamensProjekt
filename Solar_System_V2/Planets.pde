class Planets {
  float radius, angle, distance;
  PImage texture;
  PShape planet;
  color c;

  Planets(float radius, float angle, float distance, color c) {
    //this.texture = texture;
    this.distance = distance;
    this.radius = radius;
    this.angle = angle;
    this.c = c;
  }
  
  void moons(String name, float size, float distance){
    
  
  }
  
  void display(){
  beginShape();
  noStroke();
  fill(c);
  planet = createShape(SPHERE, radius);
  //planet.setTexture(texture);
  
  endShape();
  shape(planet, distance, 0);
  }
}