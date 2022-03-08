/* Class used for neon light creation */

class Light extends Polygon {

  /* globals */
  PShape light;
  PImage[] textures;

  /* constructor */
  Light() {
    this.light = createShape(GROUP);
    /* neon light textures */
    textures = arrayOfTextures(WALL, WALL, LIGHT, WALL, WALL, WALL);
  }

  /* get shape */
  PShape getLight() {
    return light;
  }
  
  /* get shape textures */
  PImage[] getTextures() { 
    return textures;
  }

  /* inheritance used here to create shape */
  void createLight(float w, float h, float d, int u, int v) {
    PShape lightShape = createPolygon(w, h, d * HUMAN_SIZE, u, v, textures);
    light.addChild(lightShape);
  }
}
