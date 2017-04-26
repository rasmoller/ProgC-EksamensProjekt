//startScreen
float startScreenX, startScreenY, startScreenWidth, startScreenHeight;
//startButton
float startButtonWidth, startButtonHeight, startButtonX, startButtonY;
//infoBox
float infoBoxHeight, infoBoxWidth;

void loadSizes() {
   //startScreen
   startScreenX = width/5;
   startScreenY = height/5;
   startScreenWidth = width/1.5;
   startScreenHeight = height/2;
   //startButton
   startButtonWidth = startScreenWidth;
   startButtonHeight = startScreenHeight/5;
   startButtonX = startScreenX;
   startButtonY = startScreenY + (startButtonHeight * 4);
   //infoBox
   infoBoxHeight = height/15;
   infoBoxWidth = width/10;
}