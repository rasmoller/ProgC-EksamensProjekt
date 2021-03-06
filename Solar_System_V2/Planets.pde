class Planets 
{
   float radius, orbitSpeed, rotationSpeed, distance = 0;
   String name;
   PImage texture;
   PShape planet;
   float angle = 0;
   float rotation = 0;
   float inclination;


   Planets(String name, float radius, float distance, PImage texture, float orbitSpeed, float rotationSpeed, float startAngle) 
   {
      this.texture = texture;
      this.orbitSpeed = orbitSpeed;
      this.rotationSpeed = rotationSpeed;
      this.name = name;
      this.distance = distance;
      this.radius = radius;
      this.angle = 0 + startAngle;
   }

   void display() 
   {
      // the angle of the orbit
      if (angle < TWO_PI*2) {
         pushMatrix();
         beginShape();
         noStroke();
         planet = createShape(SPHERE, radius);
         planet.setTexture(texture);
         endShape();
         rotateY(angle);
         translate(distance, 0);

         // the planets own rotation
         if (rotation < TWO_PI*2) 
         {
            pushMatrix();
            rotateY(rotation);
            shape(planet, 0, 0);
            popMatrix();
            rotation += rotationSpeed * scaling;
         } else 
         {
            rotation = 0;
         }
         //drawing a planets moon(s)
         //moons();
         popMatrix();

         //drawing the planets name
         if (drawNames) 
         {
            printName();
         }

         angle+= orbitSpeed * scaling;
      } else 
      {
         angle = 0;
      }
      if (drawOrbit) 
      {
         drawOrbit();
      }
   }

   void printName() 
   {
      noLights();
      pushStyle();
      stroke(2);
      pushMatrix();
      //rotates the names with camera rotations
      rotateY(angle);
      translate(distance, 0);
      rotateY(-angle);
      rotateX(cameraRotations[0]);
      rotateY(cameraRotations[1]);
      rotateZ(cameraRotations[2]);
      // places the text above the planet
      translate(0, 0 - (radius + (radius * 0.4)));
      textSize(constrain(radius * 4, 5, 40));
      textAlign(CENTER);
      fill(255);
      text(name, 0, 0, 0);
      popMatrix();
      popStyle();
      pointLight(255, 255, 255, 0, 0, 0);
   }

   void drawOrbit() 
   {
      pushMatrix();
      pushStyle();
      rotateX(PI/2);
      strokeWeight(orbitThickness);
      stroke(255, 60);
      noFill();
      ellipse(0, 0, distance*2, distance*2);
      popStyle();
      popMatrix();
   }
   float getAngle() {
      return angle;
   }
   float getDistance() {
      return distance;
   }
}