/* Class used for keyboard creation */

class Keyboard extends Polygon {
  
  /* globals */
  PShape keyboard;
  PImage[] textures;

  /* constructor */
  Keyboard() {
    this.keyboard = createShape(GROUP);
    /* keyboard textures */
    textures = arrayOfTextures(COMPUTER, COMPUTER, COMPUTER, KEYBOARD, COMPUTER, COMPUTER);
  }

  /* get shape */
  PShape getKeyboard() {
    return keyboard;
  }

  /* inheritance used here to create shape */
  void createKeyboard(float w, float h, float d, int u, int v) {
    PShape keyboardShape = createPolygon(w, h, d, u, v, textures);
    keyboard.addChild(keyboardShape);
  }
}
