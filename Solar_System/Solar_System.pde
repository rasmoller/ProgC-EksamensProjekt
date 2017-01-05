//imports
import peasy.*;

//Classes
planets sun;

//Global Vars
PImage sunMesh;
PShape sphere;

void setup(){
size(900,900,P3D);
sunMesh = loadImage("sun_texture.jpg");
sun = new planets(100, 0, sunMesh);


}

void draw(){
  background(0);
  translate(height/2, width/2);
  rotateY(PI/3);
  sun.display();
  
  
}