// My array of planets
ArrayList<Planets> planets = new ArrayList<Planets>();

// Planets
Planets sun, mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, activePlanet;

// Textures
PImage background, sunMesh, mercuryMesh, venusMesh, earthMesh, marsMesh, jupiterMesh, saturnMesh, uranusMesh, neptuneMesh, settingsButton, escape;

// Classes
PeasyCam cam;
UI ui;

// Global Variables
float camMinimum = 200;
float camMaximum = 7600;
double distance;
boolean drawNames = false;
boolean drawOrbit = true;
boolean debug = false;
boolean startScreen = true;
float[] cameraRotations;
float debugDistance = 3000;
int imageQual = 3;
int imageQualTemp = imageQual;
float scaling = 1;
float scalingTemp;
float orbitThickness = 1;


// Text Settings
int titleSize;
int generalTextSize;
PFont standardFont;

// Text Placeholders
String title = "Welcome to our local solar system!";
String mainText = "In this simulation of the universe, you have the ability to look around our local solar system and see the orbits of the planets.\nTo toggle different information about the planets use the following buttons:\nOrbits = F\nNames = T\nReset camera = Spacebar\nFaster time = .(period)\nSlower time = ,(comma)\nReset time = M\nTo look around just drag with the mouse and zoom with the mousewheel.";
String startButtonText = "Press this button to start the simulation!";