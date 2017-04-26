/*
 Sources:
 https://en.wikipedia.org/wiki/Solar_System
 http://mrfeinberg.com/peasycam/
 */
// library by Jonathan Feinberg - http://mrfeinberg.com/peasycam/
import peasy.*;

void setup()
{
   fullScreen(P3D);
   //title of the program
   surface.setTitle("Solar System V2");
   loadImages();
   loadSizes();
   titleSize = width/40;
   generalTextSize = width/88;
   standardFont = createFont("Carlito-48.vwl", 50, true);
   textFont(standardFont);

   //initializing all planets and putting them into the arraylist
   planetInitialization();
   //Resizing the background so it fits all displays
   background.resize(width, height);

   // Initializing cam settings and the cam itself
   camSettings();

   // Menu initializing
   ui = new UI();
}

void draw() 
{
   //Using its rotations to place name of planets
   cameraRotations = cam.getRotations();
   distance = cam.getDistance();

   //First resizing the background so it fits all resolutions then applying it
   background(background);

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
   if (debug)
   {
      debug();
   }
   //Menu for information about the planets
   ui.controller(startScreen);
}

void keyReleased() 
{
   if (!startScreen) {
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
      if (key == '+' || key == '?')
      {
         debug = !debug;
      }
      if (key == '.' || key == ':')
      {
         scaling +=1;
      }
      if (key == ',' || key == ';')
      {
         scaling -=1;
      }
      if (key == 'm' || key == 'M')
      {
         scaling = 1;
      }
      if (key == 'p' || key == 'P')
      {
         if (scaling != 0) {
            scalingTemp = scaling;
            scaling = 0;
         } else
            if (scaling == 0) {
               scaling = scalingTemp;
            }
      }
   }
}
void mousePressed()
{

   if (startScreen && mouseX > startButtonX 
      && mouseX < startButtonX + startButtonWidth 
      && mouseY > startButtonY 
      && mouseY < startButtonY + startButtonHeight)
   {
      startScreen = !startScreen;
      enableCam();
   }
}