class UI 
{
   PFont standardFont;
  void controller(boolean startScreen, boolean showUI)
  {
    // "makes it 2D" draw things that you want relative to the camera's position and orientation
    cam.beginHUD();
    // I draw this because otherwise the menu will be affected by the light
    noLights();
    pushStyle();
    // design of HUD
    strokeJoin(ROUND);
    standardFont = createFont("Carlito-48.vwl", 50, true);
    textFont(standardFont);
    strokeWeight(3);
    stroke(20);
    fill(10);
    textAlign(CENTER, CENTER);
    textSize(generalTextSize);
    if (startScreen)
    {
      startScreen();
    } else
    {
      if (showUI)
      {
        if (settingsBox)
        {
          settingsBox();
          escSettingsBox();
        } else
        {
          planetSelect();
          settingsButton();
        }
      }
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
    textAlign(CENTER,CENTER);
    text(title,startScreenX, startScreenY, startScreenWidth, startButtonHeight);
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
    pushStyle();
    fill(255);
    //Start button
    text(startButtonText,startButtonX, startButtonY, startButtonWidth, startButtonHeight);
    popStyle();
    popStyle();
  }

  // choose what planet you want to look at (yet to get implemented)
  void planetSelect() 
  {
    rect(0, 0, planetSelectWidth, planetSelectHeight);
    for(int x=0;x<planets.size();x++){
    pushStyle();
    fill(255);
    textAlign(CENTER,TOP);
    text(planets.get(x).getPlanetName(),0,((height/4)/planets.size())*x,planetSelectWidth, planetSelectHeight) ;
    popStyle();
    }
  }
  
  // the settings menu
  void settingsBox()
  {
    rect(settingsBoxX, settingsBoxY, settingsBoxWidth, settingsBoxHeight);
  }
  
  // used for closing the settings
  void escSettingsBox()
  {
    rect(escSettingsBoxX, escSettingsBoxY, escSettingsBoxWidth, escSettingsBoxHeight);
    image(escape, escSettingsBoxX, escSettingsBoxY, escSettingsBoxWidth, escSettingsBoxHeight);
  }
  
  // used for getting into the settings
  void settingsButton()
  {
    if(hover(settingsButtonX, settingsButtonY, settingsButtonWidth, settingsButtonHeight)){
    pushStyle();
    fill(60);
    rect(settingsButtonX, settingsButtonY, settingsButtonWidth, settingsButtonHeight);
    popStyle();
    }else{
    rect(settingsButtonX, settingsButtonY, settingsButtonWidth, settingsButtonHeight);
    }
    pushStyle();
    fill(255);
    image(settingsButton, settingsButtonX, settingsButtonY, settingsButtonWidth, settingsButtonHeight);
    popStyle();
  }
}