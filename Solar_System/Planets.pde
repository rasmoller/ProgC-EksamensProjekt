class planets{
int d;
int r;
PImage t;

planets(int Radius,int Distance, PImage Texture){
  r = Radius;
  d = Distance;
  t = Texture;
  
}
  void display(){
    beginShape();
    noStroke();
    sphere = createShape(SPHERE, r);
    sphere.setTexture(t);
    shape(sphere, 0,0);
    endShape();
  }


}