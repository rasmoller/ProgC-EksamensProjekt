//imports
import peasy.*;

//Classes
planets sun;
planets mercury;
planets venus;
planets earth;
planets mars;
planets jupiter;

PeasyCam cam;

//Global Vars
float earthRadius = 6378.1 /2;
float sunRadius = earthRadius * 109;
float mercuryRadius = earthRadius * 0.3829;
float venusRadius = earthRadius * 0.902;
float marsRadius = earthRadius * 0.533;
float jupiterRadius = earthRadius * 11.209;

//Textures
PImage sunMesh;
PImage mercuryMesh;
PImage venusMesh;
PImage earthMesh;
PImage marsMesh;
PImage background;


void setup() {
  size(1920, 960, P3D);
  //loading images
  background = loadImage("background.jpg");
  sunMesh = loadImage("sun_texture.jpg");
  earthMesh = loadImage("earth_texture.jpg");
  venusMesh = loadImage("venus_texture.jpg");
  mercuryMesh = loadImage("mercury_texture.png");
  marsMesh = loadImage("mars_texture.jpg");

  sun = new planets(sunRadius, 0, sunMesh, 10);
  mercury = new planets(mercuryRadius, 0.4, mercuryMesh);
  venus = new planets(venusRadius, 0.7, venusMesh);
  earth = new planets(earthRadius, 1, earthMesh);
  mars = new planets(marsRadius, 1.5, marsMesh);
  jupiter = new planets(jupiterRadius, 5.2, earthMesh, true);
  
  cam = new PeasyCam(this, 4900);
}

void draw() {
  background(background);
  rotateY(PI/3);
  sun.display();
  earth.display();
  mercury.display();
  venus.display();
  mars.display();
  jupiter.display();
  sphere(10);
  rotateY(PI/4);
}