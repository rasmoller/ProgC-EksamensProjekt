class UI 
{

  UI()
  {
  }

  void controller(boolean startScreen, boolean showUI)
  {
    // "makes it 2D" draw things that you want relative to the camera's position and orientation
    cam.beginHUD();
    if (startScreen)
    {
      startScreen();
    } 
    else
    {
      if (showUI)
      {
        if (settingsBox)
        {
          settingsBox();
        } else
        {
          planetBox();
          settingsButton();
        }
      }
    }
    cam.endHUD();
  }
  void startScreen()
  {
    
  }
  // choose what planet you want to look at
  void planetBox() 
  {
    pushStyle();
    fill(10);
    strokeJoin(ROUND);
    strokeWeight(3);
    stroke(20);
    rect(0, 0, width/8, height/4);
    popStyle();
  }

  void settingsBox()
  {
    pushStyle();
    fill(10);
    strokeJoin(ROUND);
    strokeWeight(3);
    stroke(20);
    rect(width/5, height/5, width/1.5, height/2);
    popStyle();
  }
  void settingsButton()
  {
    pushStyle();
    fill(10);
    strokeJoin(ROUND);
    strokeWeight(3);
    stroke(20);
    rect(0, height-height/15, width/19.5, height);
    popStyle();
    image(settingsButton, 0, height-height/15, width/19.5, height/15);
  }
}