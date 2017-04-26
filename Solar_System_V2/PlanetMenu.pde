class UI 
{
   void controller(boolean startScreen)
   {
      // "makes it 2D" draw things that you want relative to the camera's position and orientation
      cam.beginHUD();
      // I draw this because otherwise the menu will be affected by the light
      noLights();
      pushStyle();
      // design of HUD
      strokeJoin(ROUND);
      strokeWeight(3);
      stroke(20);
      fill(10);
      textAlign(CENTER, CENTER);
      textSize(generalTextSize);
      if (startScreen)
      {
         startScreen();
      } 
      popStyle();
      cam.endHUD();
   }
   // the welcome menu
   void startScreen()
   {
      disableCam();
      rect(startScreenX, startScreenY, startScreenWidth, startScreenHeight);
      pushStyle();
      fill(255);
      //Title
      pushStyle();
      textSize(titleSize);
      text(title, startScreenX, startScreenY, startScreenWidth, startButtonHeight);
      textAlign(CENTER, CENTER);
      popStyle();
      //Main text
      text(mainText, startScreenX, startScreenY+startButtonHeight/3, startScreenWidth, startScreenHeight-startButtonHeight);
      popStyle();
      startButton();
   }
   // the button to start the simulation
   void startButton() 
   {
      pushStyle();
      if (hover(startButtonX, startButtonY, startButtonWidth, startButtonHeight)) {
         fill(180);
      } else 
      {
         fill(90);
      }
      rect(startButtonX, startButtonY, startButtonWidth, startButtonHeight);
      popStyle();
      pushStyle();
      fill(255);
      //Start button
      text(startButtonText, startButtonX, startButtonY, startButtonWidth, startButtonHeight);
      popStyle();
   }
}