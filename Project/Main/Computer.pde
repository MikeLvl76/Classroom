/* Class used for computer creation */

class Computer extends Polygon {
  
  /* globals */
  PShape computer;
  PImage[] textures;

  /* constructor */
  Computer() {
    super();
    this.computer = createShape(GROUP);
    /* keyboard textures */
    textures = arrayOfTextures(FRONT, COMPUTER, COMPUTER, COMPUTER, COMPUTER, COMPUTER);
  }
  
  /* get the shape */
  PShape getComputer() {
    return computer;
  }

  /* inheritance used here to create shape */
  void createComputer(float w, float h, float d, int u, int v) {
    PShape computerShape = createPolygon(w, h, d, u, v, textures);
    computer.addChild(computerShape);
  }
}
