class Planets {
  float radius, angle, distance;
  String name;
  PImage texture;
  PShape planet;
  PVector position;
  color c;

  Planets(String name ,float radius, float x, float y, float z, color c) {
    //this.texture = texture;
    position = new PVector(x,y,z);
    this.radius = radius;
    this.c = c;
  }
  
  void moons(String name, float size, float distance){
    
  
  }
  
  void display(){
  beginShape();
  noStroke();
  fill(c);
  planet = createShape(SPHERE, radius);
  //planet.setTexture(texture);
  
  endShape();
  shape(planet, position.x, position.y);
  if(drawNames){
    printName();
  }
  }
  
  void printName(){
    //pushMatrix();
     //translate(position.x, position.y - (radius + (radius * 0.5)), position.z);
    //text(name, position.x, position.y);
    //popMatrix();
  }
}