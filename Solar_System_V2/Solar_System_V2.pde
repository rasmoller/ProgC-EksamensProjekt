import peasy.*;

ArrayList<Planets> planets = new ArrayList<Planets>();

// planets
Planets sun;
Planets earth;

PeasyCam cam;

//global Var
boolean drawNames;

void setup() {
  size(700, 700, P3D);
  // planets initializing
  sun = new Planets(10, 0, 0);
  earth = new Planets(2, 0, 30);
  planets.add(sun);
  planets.add(earth);
  cam = new PeasyCam(this, 100);
}

void draw() {
  background(255);
}

class Planets {
  float radius, angle, distance;
  PImage texture;
  PShape planet;

  Planets(float radius, float angle, float distance) {
    //this.texture = texture;
    this.distance = distance;
    this.radius = radius;
    this.angle = angle;
  }
  
  void moons(String name, float size, float distance){
    
  
  }
  
  void display(){
  beginShape();
  planet = createShape(SPHERE, radius);
  //planet.setTexture(texture);
  
  endShape();
    
  }
}