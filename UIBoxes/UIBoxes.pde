class uiBoxes {
   float x, y, w, h;
   boolean escapeButton, button;
   String buttonText;

   uiBoxes(float x, float y, float h, float w, boolean escapeButton, boolean button, String buttonText) {
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
      this.escapeButton = escapeButton;
      this.button = button;
      this.buttonText = buttonText;
   }
   uiBoxes(float x, float y, float h, float w, boolean escapeButton, boolean button) {
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
      this.escapeButton = escapeButton;
      this.button = button;
   }

   void show() {
      pushStyle();
      fill(10);
      // checks if this is going to be a button
      if (button)
      {
         if (hover(x, y, w, h))
         {
            fill(180);
         } else
         {
            fill(90);
         }
      }
      rect(x, y, w, h);
      if (buttonText != null) {
         pushStyle();
         fill(255);
         text(buttonText, x, y, w, h);
         popStyle();
      }
      popStyle();
      // checks if this is going to be a menu so I give it an escape button
      if (escapeButton) {
         if (hover(x+w-(w/10), y, w/10, h/10)) {
            fill(180);
         } else
         {
            fill(90);
         }
         rect(x+w-(w/10), y, w/10, h/10);
      }
   }
   boolean hover(float x, float y, float w, float h) {
      if (mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h) {
         return true;
      } else {
         return false;
      }
   }
}