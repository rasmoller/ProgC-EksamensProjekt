// My array of planets
ArrayList<Planets> planets = new ArrayList<Planets>();

// Planets
Planets sun, mercury, venus, earth, mars, jupiter, saturn, uranus, neptune;
slider scalingSlider;

// Textures
PImage background, sunMesh, mercuryMesh, venusMesh, earthMesh, marsMesh, jupiterMesh, saturnMesh, uranusMesh, neptuneMesh, settingsButton, escape;

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
boolean settingsBox = false;
float[] cameraRotations;
float debugDistance = 3000;
int imageQual = 3;
int imageQualTemp = imageQual;
float scaling = 1;
float orbitThickness = 1;


// Text Settings
int titleSize = 55;
int generalTextSize = 30;

// Text Placeholders
String title = "Welcome to our solar system";
String mainText = "In this simulation of the universe, you have the ability to look around our local solar system and see the orbits of the planets";