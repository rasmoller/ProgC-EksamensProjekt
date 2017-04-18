class slider {
  //class vars
  float x;
  float y;
  float w, h;
  float initialY;
  boolean lock = false;
  float value;
 
  //constructors
 
  //default
  slider () {
  }
 
  slider (float _x, float _y, float _w, float _h) {
 
    x=_x;
    y=_y;
    initialY = y;
    w=_w;
    h=_h;
  }
 
 
  void run() {
 
    // bad practice have all stuff done in one method...
    float lowerY = height - h - initialY;
 
    // map value to change color..
    value = map(y, initialY, lowerY, 0, 255);
 
    // map value to display
    float value2 = map(value, 0, 255, 100, 0);
 
    //set color as it changes
    
    fill(0);
 
    // draw base line
    rect(x, initialY, 4, lowerY);
 
    // draw knob
    fill(200);
    rect(x, y, w, h);
 
    // display text
    fill(0);
    text(int(value2) +"%", x+5, y+15);
 
    //get mouseInput and map it
    float my = constrain(mouseY, initialY, height - h - initialY );
    if (lock) y = my;
  }
 
  // is mouse ove knob?
  boolean isOver()
  {
    return (x+w >= mouseX) && (mouseX >= x) && (y+h >= mouseY) && (mouseY >= y);
  }
  float returnValue(){
    return value;
  }
}