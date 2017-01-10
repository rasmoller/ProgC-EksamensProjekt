class planets {
  float d;
  float r;
  PShape sphere;
  PImage t;
  float scl = 75;
  float AU = 1496 * 2;
  float outerAU = AU / 2;

  planets(float Radius, float Distance, PImage Texture) {
    r = Radius / scl;
    d = (Distance * AU) / (scl/50);
    t = Texture;
  }
  planets(float Radius, float Distance, PImage Texture, float scale) {
    r = Radius / (scl * scale);
    d = Distance * AU;
    t = Texture;
  }
  planets(float Radius, float Distance, PImage Texture, boolean outer) {
    r = Radius / scl;
    d = (Distance * outerAU) / (scl/50);
    t = Texture;
  }
  

  void display() {
    beginShape();
    noStroke();
    sphere = createShape(SPHERE, r);
    sphere.setTexture(t);
    shape(sphere, d, 0);
    endShape();
  }
}