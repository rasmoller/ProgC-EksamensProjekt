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
   generalTextSize = width/65;

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

   //First resizing the background so it fits all resolutions then applying it
   background(background);

   // make you able to change image quality
   //if (imageQual != imageQualTemp)
   //{
   //   loadImages(imageQual);
   //   imageQualTemp = imageQual;
   //}

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
   ui.controller(startScreen, showUI);
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
         if (debug == false && showUI == false) {
            showUI = true;
         }
      }
      //if (key == 'z' || key == 'Z')
      //{
      //   if (debug==true) {
      //      showUI = !showUI;
      //   } else {
      //      showUI = true;
      //   }
      //}
   }
}
void mousePressed()
{
   //if (showUI)
   //{
   //   if (!settingsBox) {
   //      // activating settingsBox
   //      if (mouseX > settingsButtonX && mouseX < settingsButtonX + settingsButtonWidth && mouseY > settingsButtonY)
   //      {
   //         disableCam();
   //         settingsBox = !settingsBox;
   //      }
   //   }
   //   if (settingsBox) {
   //      if (mouseX > escSettingsBoxX && mouseX < escSettingsBoxX + escSettingsBoxWidth && mouseY > escSettingsBoxY) {
   //         settingsBox = !settingsBox;
   //         enableCam();
   //      }
   //   }
   //}

   if (startScreen && mouseX > startButtonX && mouseX < startButtonX + startButtonWidth && mouseY > startButtonY && mouseY < startButtonY + startButtonHeight)
   {
      startScreen = !startScreen;
      enableCam();
   }
}