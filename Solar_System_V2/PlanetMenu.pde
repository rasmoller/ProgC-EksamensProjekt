class Menu {
  
  Menu(){
  
  }
  
  void displayBox() {
    pushMatrix();
    rotateX(cameraRotations[0]);
    rotateY(cameraRotations[1]);
    rotateZ(cameraRotations[2]);
    translate(-1920/2, -960/2);
    //translate(); brug cam.getDistance(); og noget andet til at få menuen til at scalere
    pushStyle();
    fill(51);
    strokeJoin(ROUND);
    strokeWeight(3);
    stroke(20);
    rect(0, 0, width/8, height/4);
    popStyle();
    popMatrix();
  }
}