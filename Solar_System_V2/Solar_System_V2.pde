import peasy.*;

ArrayList<Planets> planets = new ArrayList<Planets>();

// planets
Planets sun;
Planets earth;

PeasyCam cam;

//global Var
boolean drawNames = false;

void setup() {
  size(700, 700, P3D);
  // planets initializing
  sun = new Planets("Sun", 100, 0, 0, 0, #B46666);
  earth = new Planets("Earth", 20, 0, 150, 0, #31B41D);
  planets.add(sun);
  planets.add(earth);
  cam = new PeasyCam(this, 300);
}

void draw() {
  background(150);
  pointLight(255, 255, 255, 0, 0, 0);
  for (Planets planet : planets) {
    planet.display();
  }
}

void keyReleased() {
  if (key == 't' || key == 'T') {
    drawNames = !drawNames;
  }
}