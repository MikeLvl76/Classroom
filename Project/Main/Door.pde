/* Class used for door creation */

class Door extends Polygon {
  
  /* globals */
  PShape door;
  PImage[] textures;

  /* constructor */
  Door() {
    super();
    this.door = createShape(GROUP);
    /* door textures */
    textures = arrayOfTextures(DOOR, DOOR, DOOR, DOOR, DOOR, DOOR);
  }

  /* get shape */
  PShape getDoor() {
    return door;
  }

  /* get door textures */
  PImage[] getTextures() {
    return textures;
  }

  /* inheritance used here to create shape */
  void createDoor(float w, float h, float d, int u, int v) {
    PShape doorShape = createPolygon(w, h, d, u, v, textures);
    door.addChild(doorShape);
  }
}
