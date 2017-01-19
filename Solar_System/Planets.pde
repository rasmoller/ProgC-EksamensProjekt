class planets {
  float Distance;
  float Radius;
  PShape sphere;
  PImage Texture;
  float AU = 1496 * 2;
  String name;
  float rotation = 0;

  planets(String name, float Radius, float Distance, PImage Texture) {
    this.name = name;
    this.Radius = Radius;
    this.Distance = ((Distance * AU) / 10) + sunRadius/scl;
    this.Texture = Texture;
  }


  void display() {
    beginShape();
    noStroke();
    sphere = createShape(SPHERE, Radius/scl);
    pushMatrix();
    rotate(rotation);
    sphere.setTexture(Texture);
    popMatrix();
    shape(sphere, Distance, 0);
    if (drawName) {
      pushStyle();
      textSize(50);
      fill(#FFFFFF);
      textAlign(CENTER);
      text(name, Distance, -((Radius/scl)+ 10), 0);
      println(Radius/scl);
      popStyle();
    }
    endShape();
    rotation+= 0.0005;
  }
}