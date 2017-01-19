//imports
import peasy.*;

//Classes
//planets sun;
planets mercury;
planets venus;
planets earth;
planets mars;
planets jupiter;

PeasyCam cam;

//Global Vars
float scl = 1000;
float earthRadius = 6378.1; //real radius = 6378.1
float sunRadius = earthRadius * 109;
float mercuryRadius = earthRadius * 0.3829;
float venusRadius = earthRadius * 0.902;
float marsRadius = earthRadius * 0.533;
float jupiterRadius = earthRadius * 11.209;
PShape sun;
boolean drawName;


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

  // planets(radius, distance (from center), texture);
  //sun = new planets(sunRadius, 0, sunMesh);
  mercury = new planets("Mercury", mercuryRadius, 0.4, mercuryMesh);
  venus = new planets("Venus", venusRadius, 0.7, venusMesh);
  earth = new planets("Earth", earthRadius, 1, earthMesh);
  mars = new planets("Mars", marsRadius, 1.5, marsMesh);
  jupiter = new planets("Jupiter", jupiterRadius, 5.2, earthMesh);

  cam = new PeasyCam(this, 4000);
}

void draw() {
  background(background);
  //sun.display();
  drawSun();
  // pointLight(r, g, b, x, y, z);
  pointLight(200, 200, 200, 0, 0, 0);
  earth.display();
  mercury.display();
  venus.display();
  mars.display();
  jupiter.display();
  sphere(10);
  drawNames();
}

void drawSun() {
  beginShape();
  noStroke();
  sun = createShape(SPHERE, sunRadius/scl);
  sun.setTexture(sunMesh);
  shape(sun, 0, 0);
  endShape();
}
void drawNames() {
  if (keyPressed) {
    if (key == 't') {
      drawName = !drawName;
    }
  }
}