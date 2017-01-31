class Menu {
  
  Menu(){
  
  }
  
  void displayBox() {
   // "makes it 2D" draw things that you want relative to the camera's position and orientation
   cam.beginHUD();
    fill(255);
    strokeJoin(ROUND);
    strokeWeight(3);
    stroke(20);
    rect(0, 0, width/8, height/4);
  cam.endHUD();
  }
}