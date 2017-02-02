/* 
 Sources:
 https://en.wikipedia.org/wiki/Solar_System
 
 */
// library by Jonathan Feinberg
import peasy.*;

ArrayList<Planets> planets = new ArrayList<Planets>();

// planets
Planets sun, mercury, venus, earth, mars, jupiter, saturn, uranus, neptune;

PeasyCam cam;

//global Var
float camMinimum = 200;
float camMaximum = 10000;
boolean drawNames = false;
boolean drawOrbit = false;
boolean tiltTrue = false;
float[] cameraRotations;
float distanceScale = 500000;

// Planet sizes
float earthRadius = 6.378; // original størrelse = 6.378, noget km
float sunRadius = earthRadius * 15; // eneste der ikke er akkurat og bruger jorden til at definere de andre
float mercuryRadius = earthRadius * 0.383;
float venusRadius = earthRadius * 0.95;
float marsRadius = earthRadius * 0.532;
float jupiterRadius = earthRadius * 11;
float saturnRadius = earthRadius * 9;
float uranusRadius = earthRadius * 4;
float neptuneRadius = earthRadius * 3.86;

// planet distance
// AU = Astronomical Unit = 149,597,870,700 m ~ 149,597,870.7 km  https://en.wikipedia.org/wiki/Astronomical_unit
// using their Semi-Major axis (the medium of their orbits)
// Dividing AU with scale to make it fit the window
float AU = 149597870.7 / distanceScale;
float mercuryDistance = AU * 0.387;
float venusDistance = AU * 0.723;
float earthDistance = AU * 1;
float marsDistance = AU * 1.66;
float jupiterDistance = AU * 5.2;
float saturnDistance = AU * 10;
float uranusDistance = AU * 20.1;
float neptuneDistance = AU * 30.33;

// planet inclination to Sun's equator in degrees (hvor meget den hælder til siden) (BRUG DET HER TIL HÆLDNING!!!)
float mercuryInclination = 3.38;
float venusInclination = 3.86;
float earthInclination = 7.155;
float marsInclination = 5.65;
float jupiterInclination = 6.09;
float saturnInclination = 5.51;
float uranusInclination = 6.48;
float neptuneInclination = 6.43;

// orbit speed's ( earth's averag orbital speed = 29.78 km/s) (find more precise numbers!!)
float mercurySpeed = 0.0075;
float venusSpeed = 0.006;
float earthSpeed = 0.005;
float marsSpeed = 0.004;
float jupiterSpeed = 0.002;
float saturnSpeed =  0.00165;
float uranusSpeed = 0.00125;
float neptuneSpeed = 0.001;

// rotation speed's (find precise numbers!!)
float mercuryRotation = 0.005;
float venusRotation = 0.005;
float earthRotation = 0.05;
float marsRotation = 0.0075;
float jupiterRotation = 0.02;
float saturnRotation = 0.002;
float uranusRotation = 0.002;
float neptuneRotation = 0.002;

// textures
PImage background, sunMesh, mercuryMesh, venusMesh, earthMesh, marsMesh, jupiterMesh, saturnMesh, uranusMesh, neptuneMesh;

void setup() {
  size(1920, 960, P3D);
  frameRate(60);
  loadImages();
  // planets initializing
  // new Planets(name, radius, distance, texture, orbitSpeed, rotationSpeed, startingAngle);
  sun = new Planets("Sun", sunRadius, 0, sunMesh, 0, 0, 0, 0);
  mercury = new Planets("Mercury", mercuryRadius, mercuryDistance, mercuryMesh, mercurySpeed, mercuryRotation, 0, mercuryInclination);
  venus = new Planets("Venus", venusRadius, venusDistance, venusMesh, venusSpeed, venusRotation, 0, venusInclination);
  earth = new Planets("Earth", earthRadius, earthDistance, earthMesh, earthSpeed, earthRotation, 0, earthInclination);
  mars = new Planets("Mars", marsRadius, marsDistance, marsMesh, marsSpeed, marsRotation, 0, marsInclination);
  jupiter = new Planets("Jupiter", jupiterRadius, jupiterDistance, jupiterMesh, jupiterSpeed, jupiterRotation, 0, jupiterInclination);
  saturn = new Planets("Saturn", saturnRadius, saturnDistance, saturnMesh, saturnSpeed, saturnRotation, 0, saturnInclination);
  uranus = new Planets("Uranus", uranusRadius, uranusDistance, uranusMesh, uranusSpeed, uranusRotation, 0, uranusInclination);
  neptune = new Planets("Neptune", neptuneRadius, neptuneDistance, neptuneMesh, neptuneSpeed, neptuneRotation, 0, neptuneInclination);

  // adding objects to arraylist (im excluding the sun to make lighting works)
  planets.add(mercury);
  planets.add(venus);
  planets.add(earth);
  planets.add(mars);
  planets.add(jupiter);
  planets.add(saturn);
  planets.add(uranus);
  planets.add(neptune);


  // using peasycam library to get a controlled camera
  cam = new PeasyCam(this, 750);
  cam.setMinimumDistance(camMinimum);
  cam.setMaximumDistance(camMaximum);
  cam.setSuppressRollRotationMode();
}

void draw() {
  background(background);
  sun.display();
  pointLight(255, 255, 255, 0, 0, 0);
  cameraRotations = cam.getRotations();
  for (Planets planet : planets) {
    planet.display();
  }
  println(frameRate);
}

void keyReleased() {
  if (key == 't' || key == 'T') {
    drawNames = !drawNames;
  }
  if (key == ' ') {
    cam.reset();
  }
  if (key == 'f' || key == 'F') {
    drawOrbit = !drawOrbit;
  }
}

void loadImages() {
  background = loadImage("background.jpg");
  sunMesh = loadImage("sun_texture.jpg");
  mercuryMesh = loadImage("mercury_texture.png");
  venusMesh = loadImage("venus_texture.jpg");
  earthMesh = loadImage("earth_texture.jpg");
  marsMesh = loadImage("mars_texture.jpg");
  jupiterMesh = loadImage("jupiter_texture.jpg");
  saturnMesh = loadImage("saturn_texture.jpg");
  uranusMesh = loadImage("uranus_texture.jpg");
  neptuneMesh = loadImage("neptune_texture.jpg");
}