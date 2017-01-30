// library by Jonathan Feinberg
import peasy.*;

ArrayList<Planets> planets = new ArrayList<Planets>();

// planets
Planets sun;
Planets earth;

PeasyCam cam;

//global Var
float camMinimum = 130;
float camMaximum = 1300;
boolean drawNames = false;
boolean drawOrbit = false;
float[] cameraRotations;


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
PImage background;
PImage earthMesh;
PImage sunMesh;
PImage venusMesh;
PImage jupiterMesh;
PImage marsMesh;
PImage mercuryMesh;
PImage saturnMesh;
PImage uranusMesh;

void setup() {
  size(1920, 960, P3D);
  loadImages();
  // planets initializing
  // new Planets(name, radius, distance, texture, orbitSpeed, rotationSpeed, startingAngle);
  sun = new Planets("Sun", 40, 0, sunMesh, 0, 0, 0);
  earth = new Planets("Earth", 5, 150, earthMesh, earthSpeed, earthRotation, 0);

  // adding objects to arraylist (im excluding the sun to make lighting work)
  planets.add(earth);

  // using peasycam library to get a controlled camera
  cam = new PeasyCam(this, 300);
  cam.setMinimumDistance(camMinimum);
  cam.setMaximumDistance(camMaximum);
  cam.setSuppressRollRotationMode();
}

void draw() {
  background(background);
  sun.display();
  pointLight(255, 255, 255, 0, 0, 0);
  for (Planets planet : planets) {
    planet.display();
  }
  cameraRotations = cam.getRotations();
}

void keyReleased() {

  if (key == 't' || key == 'T') {
    drawNames = !drawNames;
  }
  if (key == ' ') {
  cam.reset();
  }
  if(key == 'f' || key == 'F'){
  drawOrbit = !drawOrbit;
  }
}

void loadImages() {
  background = loadImage("background.jpg");
  sunMesh = loadImage("sun_texture.jpg");
  earthMesh = loadImage("earth_texture.jpg");
  marsMesh = loadImage("mars_texture.jpg");
  mercuryMesh = loadImage("mercury_texture.png");
  venusMesh = loadImage("venus_texture.jpg");
  //sunMesh = loadImage();
  //sunMesh = loadImage();
}