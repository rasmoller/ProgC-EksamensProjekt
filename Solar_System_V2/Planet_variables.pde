void planetInitialization() {
   // planets initializing
   // new Planets(name, radius, distance, texture, orbitSpeed, rotationSpeed, startingAngle, Inclination);
   sun = new Planets("Sun", sunRadius, 0, sunMesh, 0, 0, 0);
   mercury = new Planets("Mercury", mercuryRadius, mercuryDistance, mercuryMesh, mercurySpeed, mercuryRotation, random(0, TWO_PI));
   venus = new Planets("Venus", venusRadius, venusDistance, venusMesh, venusSpeed, venusRotation, random(0, TWO_PI));
   earth = new Planets("Earth", earthRadius, earthDistance, earthMesh, earthSpeed, earthRotation, random(0, TWO_PI));
   mars = new Planets("Mars", marsRadius, marsDistance, marsMesh, marsSpeed, marsRotation, random(0, TWO_PI));
   jupiter = new Planets("Jupiter", jupiterRadius, jupiterDistance, jupiterMesh, jupiterSpeed, jupiterRotation, random(0, TWO_PI));
   saturn = new Planets("Saturn", saturnRadius, saturnDistance, saturnMesh, saturnSpeed, saturnRotation, random(0, TWO_PI));
   uranus = new Planets("Uranus", uranusRadius, uranusDistance, uranusMesh, uranusSpeed, uranusRotation, random(0, TWO_PI));
   neptune = new Planets("Neptune", neptuneRadius, neptuneDistance, neptuneMesh, neptuneSpeed, neptuneRotation, random(0, TWO_PI));

   // adding objects to arraylist (im excluding the sun to make lighting works)
   planets.add(mercury);
   planets.add(venus);
   planets.add(earth);
   planets.add(mars);
   planets.add(jupiter);
   planets.add(saturn);
   planets.add(uranus);
   planets.add(neptune);
}

// Planet sizes
float earthRadius = 6.378; // original størrelse = 6.378, noget km
float sunRadius = earthRadius * 13; // eneste der ikke er akkurat og bruger jorden til at definere de andre
float mercuryRadius = earthRadius * 0.383;
float venusRadius = earthRadius * 0.95;
float marsRadius = earthRadius * 0.532;
float jupiterRadius = earthRadius * 11;
float saturnRadius = earthRadius * 9;
float uranusRadius = earthRadius * 4;
float neptuneRadius = earthRadius * 3.86;

// Planet distance
// AU = Astronomical Unit = 149,597,870,700 m ~ 149,597,870.7 km  https://en.wikipedia.org/wiki/Astronomical_unit
// using their Semi-Major axis (the medium of their orbits)
// Dividing AU with scale to make it fit the window
float distanceScale = 660000;
float AU = 149597870.7 / distanceScale;
float mercuryDistance = AU * 0.387;
float venusDistance = AU * 0.723;
float earthDistance = AU * 1;
float marsDistance = AU * 1.52;
float jupiterDistance = AU * 5.2;
float saturnDistance = AU * 10;
float uranusDistance = AU * 20.1;
float neptuneDistance = AU * 30.33;

// Orbit speed ( earth's averag orbital speed = 29.78 km/s)
float mercurySpeed = 0.0075;
float venusSpeed = 0.006;
float earthSpeed = 0.005;
float marsSpeed = 0.004;
float jupiterSpeed = 0.002;
float saturnSpeed =  0.00165;
float uranusSpeed = 0.00125;
float neptuneSpeed = 0.001;

// Rotation speed
float mercuryRotation = 0.005;
float venusRotation = 0.005;
float earthRotation = 0.05;
float marsRotation = 0.0075;
float jupiterRotation = 0.02;
float saturnRotation = 0.002;
float uranusRotation = 0.002;
float neptuneRotation = 0.002;