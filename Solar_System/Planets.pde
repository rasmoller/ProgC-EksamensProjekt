class planets {
  float Distance;
  float Radius;
  PShape sphere;
  PImage Texture;
  float AU = 1496 * 2;
  String name;

  planets(String name,float Radius, float Distance, PImage Texture) {
    this.name = name;
    this.Radius = Radius;
    this.Distance = ((Distance * AU) / 10) + sunRadius/scl;
    this.Texture = Texture;
  }
  

  void display() {
    beginShape();
    noStroke();
    sphere = createShape(SPHERE, Radius/scl);
    sphere.setTexture(Texture);
    shape(sphere, Distance, 0);
    endShape();
  }
}