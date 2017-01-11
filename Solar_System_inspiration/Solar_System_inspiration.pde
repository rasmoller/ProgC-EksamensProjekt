/*///////////////////////////////////
Model of the Solar system. 
The relative size of planets, distance from sun and speed of rotation 
coincide with the real values.

Ivan Rybakov ivjunk@icloud.com
*////////////////////////////////////

Planet mr, vn, er, ms, jp, st, ur, np;
boolean wantTitle = true;

void setup(){
  size(900,900);  
  strokeWeight(0.5);
  colorMode(HSB, 360, 100, 100);
  
    //Planet(Title; diameter; dist. from the sun (au), start position (degrees), color)
    
    mr = new Planet("Mercury", 0.4,  0.4,  215,  color(130, 100, 90));
    vn = new Planet("Venus",   0.95, 0.7,  170,  color(50, 100, 90));
    er = new Planet("Earth",   1,    1,    0,    color(200, 100, 90));  
    ms = new Planet("Mars",    0.53, 1.7,  20,   color(360, 100, 90));
    jp = new Planet("Jupiter", 10.97,5.6,  100,  color(40, 100, 90));  
    st = new Planet("Saturn",  9.14, 10.1, 25,   color(26, 100, 90));
    ur = new Planet("Uran",    3.98, 20,   255,  color(170, 100, 90));  
    np = new Planet("Neptun",  3.87, 30,   290,  color(180, 100, 90));    
}

void draw(){
  background(360, 0, 0);
  
  pushMatrix();
  translate (width/2, height/2);
  drawSun();
  
  //motion(velosity)
  mr.motion(1/0.24);  mr.display();
  vn.motion(1/0.61);  vn.display();
  er.motion(1/1);     er.display();
  ms.motion(1/1.88);  ms.display();
  jp.motion(1/11.86); jp.display();
  st.motion(1/29.46); st.display();
  ur.motion(1/84);    ur.display();
  np.motion(1/164.79); np.display();
  
  popMatrix();
  
}

////////////////////////////////////////////////////////////////////////
void drawSun(){
  fill(51, 100, 90);
  ellipse(0,0,30,30);
}

class Planet{
    float adaptedSize;    
    float ang;
    float vel;
    float x, y;
    color colorPlanet;
    color colorOrbit;
    float realRadius; //real radius of orbit;
    float adaptedRadius; //adapted radius;
    float realSize; //diameter
    int year;
    float startRadius;
    String name;
    
  Planet(String name, float realSize, float realRadius, float ang, color colorPlanet){
    this.name = name;
    this.realSize = realSize;  
    this.realRadius = realRadius;  
    this.ang = ang;
    this.colorPlanet = colorPlanet;
    startRadius = 50;      
    colorOrbit = color(360, 0, 100);
    adaptedRadius = map(realRadius, 0, 30, startRadius, 450);    
    adaptedSize = map(realSize, 0.4, 11, 5, 20);    

    x = adaptedRadius;
    y = 0;
  }
  
  //slow
  void drawOrbit(){
    float ang2 = 0;
    for(int i = 0; i < 360; i++){
      stroke(colorOrbit);
      strokeWeight(0.1);
      point(cos(radians(ang2)) * adaptedRadius, sin(radians(ang2)) * adaptedRadius);
      ang2 = ang2 + 4;
    }
  }  
  
  void drawOrbit2(){
    strokeWeight(0.1);
    stroke(colorOrbit);
    noFill();
    ellipse(0,0,adaptedRadius*2,adaptedRadius*2);
  }  
  
  void display(){
    drawOrbit2();
    if(wantTitle){
      drawTitle();
    }
    strokeWeight(0.5);
    stroke(0);
    fill(colorPlanet);
    ellipse(x, y, adaptedSize, adaptedSize);  
  }
  
  void motion(float vel_){
//    drawOrbit();
    vel = vel_;
    if(ang>360) {
      ang = 1;
      year = year + 1;
    }
    x = cos(radians(ang)) * adaptedRadius;
    y = sin(radians(ang)) * adaptedRadius;
    ang = ang + (vel/2);
  }
  
  void drawTitle(){
    fill(360, 0, 100);
    text(name, x, y-10);
  }
}

void mousePressed(){
  wantTitle = !wantTitle;
}