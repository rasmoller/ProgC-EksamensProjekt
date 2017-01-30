import peasy.*;

ArrayList<Planets> planets = new ArrayList<Planets>();

// planets
Planets sun;
Planets earth;

PeasyCam cam;

//global Var
boolean drawNames = false;
// orbit speed's
float earthSpeed = 0.005;
float marsSpeed;
float venusSpeed;
float mercurySpeed;
float jupiterSpeed;

// rotation speed's
float earthRotation;
float marsRotation;
float venusRotation;
float mercuryRotation;
float jupiterRotation;
float uranusRotation;

// textures
PImage sunMesh;
PImage venusMesh;
PImage jupiterMesh;
PImage marsMesh;
PImage mercuryMesh;
PImage saturnMesh;
PImage uranusMesh;

void setup() {
  size(700, 700, P3D);
  loadImages();
  // planets initializing
  sun = new Planets("Sun", 100, 0, sunMesh, 0, 0);
  earth = new Planets("Earth", 20, 150, earthMesh, earthSpeed, earthRotation);
  planets.add(earth);
  cam = new PeasyCam(this, 300);
}

void draw() {
    background(150);
  sun.display();
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

void loadImages(){
  sunMesh = loadImage("sun_texture.jpg");
  earthMesh = loadImage("earth_texture.jpg");
  marsMesh = loadImage("mars_texture.jpg");
  mercuryMesh = loadImage("mercury_texture.png");
  venusMesh = loadImage("venus_texture.jpg");
  //sunMesh = loadImage();
  //sunMesh = loadImage();

}