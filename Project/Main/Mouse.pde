/* Class used for mouse creation */

class Mouse extends Polygon {
  
  /* globals */
  PShape mouse;
  PImage[] mouseTextures;

  /* constructor */
  Mouse() {
    super();
    this.mouse = createShape(GROUP);
    /* mouse textures */
    mouseTextures = arrayOfTextures(COMPUTER, COMPUTER, COMPUTER, MOUSE, COMPUTER, COMPUTER);
  }

  /* get mouse textures */
  PImage[] getMouseTextures() {
    return mouseTextures;
  }

  /* get mouse */
  PShape getMouse() {
    return mouse;
  }

  /* inheritance used here to create shape */
  void createMouse(float w, float h, float d, int u, int v) {
    PShape mouseShape = createPolygon(w, h, d, u, v, getMouseTextures());
    mouse.addChild(mouseShape);
  }
}
