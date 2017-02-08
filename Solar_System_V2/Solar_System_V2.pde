/*
Notes:
Orrery model of the solar system Heliocentric
*/

/* 
 Sources:
 https://en.wikipedia.org/wiki/Solar_System
 http://mrfeinberg.com/peasycam/
 */
// library by Jonathan Feinberg - http://mrfeinberg.com/peasycam/
import peasy.*;

// My array of planets
ArrayList<Planets> planets = new ArrayList<Planets>();

// Planets
Planets sun, mercury, venus, earth, mars, jupiter, saturn, uranus, neptune;

// Textures
PImage background, sunMesh, mercuryMesh, venusMesh, earthMesh, marsMesh, jupiterMesh, saturnMesh, uranusMesh, neptuneMesh;

// Classes
PeasyCam cam;
UI ui;

// Global Variables
float camMinimum = 200;
float camMaximum = 10000;
boolean drawNames = false;
boolean drawOrbit = false;
boolean tiltTrue = false;
boolean debug = false;
boolean startScreen = true;
boolean showUI = true;
float[] cameraRotations;
float debugDistance = 3000;
int imageQual = 3;
int imageQualTemp = imageQual;

// Planet sizes
float earthRadius = 6.378; // original størrelse = 6.378, noget km
float sunRadius = earthRadius * 13; // eneste der ikke er akkurat og bruger jorden til at definere de andre
float mercuryRadius = earthRadius * 0.383;
float venusRadius = earthRadius * 0.95;
float marsRadius = earthRadius * 0.532;
float jupiterRadius = earthRadius * 11;
float saturnRadius = earthRadius * 9;
float uranusRadius = earthRadius * 4;
float neptuneRadius = earthRadius * 3.86;

// Planet distance
// AU = Astronomical Unit = 149,597,870,700 m ~ 149,597,870.7 km  https://en.wikipedia.org/wiki/Astronomical_unit
// using their Semi-Major axis (the medium of their orbits)
// Dividing AU with scale to make it fit the window
float distanceScale = 660000;
float AU = 149597870.7 / distanceScale;
float mercuryDistance = AU * 0.387;
float venusDistance = AU * 0.723;
float earthDistance = AU * 1;
float marsDistance = AU * 1.52;
float jupiterDistance = AU * 5.2;
float saturnDistance = AU * 10;
float uranusDistance = AU * 20.1;
float neptuneDistance = AU * 30.33;

// Planets inclination to Sun's equator in degrees (hvor meget den hælder til siden) (BRUG DET HER TIL HÆLDNING!!!)
float mercuryInclination = 3.38;
float venusInclination = 3.86;
float earthInclination = 7.155;
float marsInclination = 5.65;
float jupiterInclination = 6.09;
float saturnInclination = 5.51;
float uranusInclination = 6.48;
float neptuneInclination = 6.43;

// Orbit speed ( earth's averag orbital speed = 29.78 km/s) (find more precise numbers!!)
float mercurySpeed = 0.0075;
float venusSpeed = 0.006;
float earthSpeed = 0.005;
float marsSpeed = 0.004;
float jupiterSpeed = 0.002;
float saturnSpeed =  0.00165;
float uranusSpeed = 0.00125;
float neptuneSpeed = 0.001;

// Rotation speed (find precise numbers!!)
float mercuryRotation = 0.005;
float venusRotation = 0.005;
float earthRotation = 0.05;
float marsRotation = 0.0075;
float jupiterRotation = 0.02;
float saturnRotation = 0.002;
float uranusRotation = 0.002;
float neptuneRotation = 0.002;



void setup() 
{
  fullScreen(P3D);
  //size(900, 700, P3D);
  frameRate(60);
  surface.setTitle("Solar System V2");
  loadImages(imageQual);

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
  cam.setCenterDragHandler(null);

  // Menu initializing
  ui = new UI();
}

void draw() 
{
  
  //Using its rotations to place name of planets
  cameraRotations = cam.getRotations();
  
  //First resizing the background so it fits all resolutions then applying it
  background.resize(width, height);
  background(background);
  //Menu for information about the planets
  ui.controller(startScreen, showUI);
  
  // make you able to change image quality
  if(imageQual != imageQualTemp)
  {
    loadImages(imageQual);
    imageQualTemp = imageQual;
  }
  
  //Drawing sun before light cause otherwise the inside of the sun would light up
  sun.display();
  
  //Lights (r, g, b, x, y, z) it shines outwards
  pointLight(255, 255, 255, 0, 0, 0);
  
  //Enhanced for loop to go through all planets created
  for (Planets planet : planets) 
  {
    planet.display();
  }

  //DEBUGGING
  if(debug){
  debug();
  }
}

void keyReleased() {
  if (key == 't' || key == 'T') 
  {
    drawNames = !drawNames;
  }
  if (key == ' ') 
  {
    cam.reset();
  }
  if (key == 'f' || key == 'F') 
  {
    drawOrbit = !drawOrbit;
  }
  if(key == '+' || key == '?')
  {
    debug = !debug;
  }
}


// loads images with the fitting quality
void loadImages(int imageQual) 
{
  
  //Low - Standard
  if(imageQual == 1)
  {
  background = loadImage("low/background.jpg");
  sunMesh = loadImage("low/sun_texture.jpg");
  mercuryMesh = loadImage("low/mercury_texture.png");
  venusMesh = loadImage("low/venus_texture.jpg");
  earthMesh = loadImage("low/earth_texture.jpg");
  marsMesh = loadImage("low/mars_texture.jpg");
  jupiterMesh = loadImage("low/jupiter_texture.jpg");
  saturnMesh = loadImage("low/saturn_texture.jpg");
  uranusMesh = loadImage("low/uranus_texture.jpg");
  neptuneMesh = loadImage("low/neptune_texture.jpg");
  }
  
  //Medium
  if(imageQual == 2)
  {
  background = loadImage("medium/background.jpg");
  sunMesh = loadImage("medium/sun_texture.jpg");
  mercuryMesh = loadImage("medium/mercury_texture.png");
  venusMesh = loadImage("medium/venus_texture.jpg");
  earthMesh = loadImage("medium/earth_texture.jpg");
  marsMesh = loadImage("medium/mars_texture.jpg");
  jupiterMesh = loadImage("medium/jupiter_texture.jpg");
  saturnMesh = loadImage("medium/saturn_texture.jpg");
  uranusMesh = loadImage("medium/uranus_texture.jpg");
  neptuneMesh = loadImage("medium/neptune_texture.jpg");
  }
  
  //High
  if(imageQual == 3)
  {
  background = loadImage("high/background.jpg");
  sunMesh = loadImage("high/sun_texture.jpg");
  mercuryMesh = loadImage("high/mercury_texture.png");
  venusMesh = loadImage("high/venus_texture.jpg");
  earthMesh = loadImage("high/earth_texture.jpg");
  marsMesh = loadImage("high/mars_texture.jpg");
  jupiterMesh = loadImage("high/jupiter_texture.jpg");
  saturnMesh = loadImage("high/saturn_texture.jpg");
  uranusMesh = loadImage("high/uranus_texture.jpg");
  neptuneMesh = loadImage("high/neptune_texture.jpg");
  }
}


void debug() 
{
  pushStyle();
  stroke(200);
  //X-axis
  line(0, 0, 0, debugDistance, 0, 0);
  line(0, 0, 0, -debugDistance, 0, 0);
  //Y-axis
  line(0, 0, 0, 0, debugDistance, 0);
  line(0, 0, 0, 0, -debugDistance, 0);
  //Z-axis
  line(0, 0, 0, 0, 0, debugDistance);
  line(0, 0, 0, 0, 0, -debugDistance);
  popStyle();
  
  //Information about how the program is running and the camera
  println(frameRate);
  println(cam.getDistance());
  println(cameraRotations);
}