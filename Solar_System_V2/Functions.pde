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
  
  //Utility
  settingsButton = loadImage("utility/SettingsButton.png");
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
void disableCam(){


}

void enableCam(){



}