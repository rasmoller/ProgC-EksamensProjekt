// loads images with the fitting quality
void loadImages() 
{
   background = loadImage("meshes/background.jpg");
   sunMesh = loadImage("meshes/sun_texture.jpg");
   mercuryMesh = loadImage("meshes/mercury_texture.png");
   venusMesh = loadImage("meshes/venus_texture.jpg");
   earthMesh = loadImage("meshes/earth_texture.jpg");
   marsMesh = loadImage("meshes/mars_texture.jpg");
   jupiterMesh = loadImage("meshes/jupiter_texture.jpg");
   saturnMesh = loadImage("meshes/saturn_texture.jpg");
   uranusMesh = loadImage("meshes/uranus_texture.jpg");
   neptuneMesh = loadImage("meshes/neptune_texture.jpg");

   //Utility
   settingsButton = loadImage("utility/SettingsButton.png");
   escape = loadImage("utility/EscapeButton.png");
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
// cam settings
void camSettings() {
   // using peasycam library to get a controlled camera
   cam = new PeasyCam(this, 500);
   cam.setMinimumDistance(camMinimum);
   cam.setMaximumDistance(camMaximum);
   cam.setSuppressRollRotationMode();
   cam.setCenterDragHandler(null);
   cam.setResetOnDoubleClick(false);
}
// homemade functions for enabling and disabling the camera
void disableCam()
{
   cam.setActive(false);
}
void enableCam()
{
   cam.setActive(true);
}

boolean hover(float x1, float y1, float x2, float y2) {
   if (mouseX > x1 && mouseX < x2 + x1 && mouseY > y1 && mouseY < y2 + y1)
   {
      return true;
   } else {
      return false;
   }
}