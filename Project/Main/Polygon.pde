/* This class is used for polygon creation and managing it
* It is recommended to create an object inheriting this class for simple use in a case of specific creation */
class Polygon {

  PShape polygon;
  float[] dimensions, coords;
  
  /* return textures array */
  PImage[] arrayOfTextures(PImage... texs) {
    return texs;
  }

  /* change texxture value by index */
  void changeTexture(PImage[] texs, int index, PImage img) {
    if (index >= texs.length) {
      index = texs.length - 1;
    } else if (index < 0) {
      index = 0;
    }
    texs[index] = img;
  }

  /* return as array width, height and depth of a polygon 
  * it is possible to put something else but the behaviour will be bad */
  void polygonDimension(float... dim) {
    dimensions = dim;
  }

  /* return as array x, y, z coords of a polygon
  * it is possible to put something else but the behaviour will be bad */
  void polygonCoords(float... coord) {
    coords = coord;
  } 

  /* return dimensions of a polygon */
  float[] getDimensions() { 
    return dimensions;
  }
  
  /* return coords of a polygon */
  float[] getCoords() { 
    return coords;
  }

  /* return polygon */
  PShape getPolygon() {
    return polygon;
  }

  /* create box-shaped polygon with texture on each face 
  * we add the HUMAN_SIZE factor for better scaling */ 
  PShape createPolygon(float w, float h, float d, int u, int v, PImage[] textures) {
    noStroke();

    w *= HUMAN_SIZE;
    h *= HUMAN_SIZE;
    d *= HUMAN_SIZE;

    polygon = createShape(GROUP);

    PShape face_1 = createShape();
    face_1.beginShape();
    face_1.textureMode(NORMAL);
    face_1.texture(textures[0]);
    face_1.shininess(200.0);
    face_1.emissive(0, 0, 0);
    face_1.normal(0, 0, 1);
    face_1.vertex(0, 0, 0, 0, v);
    face_1.vertex(w, 0, 0, u, v);
    face_1.vertex(w, -h, 0, u, 0);
    face_1.vertex(0, -h, 0, 0, 0);
    face_1.endShape(CLOSE);

    PShape face_2 = createShape();
    face_2.beginShape();
    face_2.textureMode(NORMAL);
    face_2.texture(textures[1]);
    face_2.shininess(200.0);
    face_2.emissive(0, 0, 0);
    face_2.normal(0, 0, 1);
    face_2.vertex(0, -h, -d, u, 0);
    face_2.vertex(w, -h, -d, 0, 0);
    face_2.vertex(w, 0, -d, 0, v);
    face_2.vertex(0, 0, -d, u, v);
    face_2.endShape(CLOSE);

    PShape face_3 = createShape();
    face_3.beginShape();
    face_3.textureMode(NORMAL);
    face_3.texture(textures[2]);
    face_3.shininess(200.0);
    face_3.emissive(0, 0, 0);
    face_3.normal(0, 0, 1);
    face_3.vertex(w, 0, 0, 0, 0);
    face_3.vertex(0, 0, 0, u, 0);
    face_3.vertex(0, 0, -d, u, v);
    face_3.vertex(w, 0, -d, 0, v);
    face_3.endShape(CLOSE);

    PShape face_4 = createShape();
    face_4.beginShape();
    face_4.textureMode(NORMAL);
    face_4.texture(textures[3]);
    face_4.shininess(200.0);
    face_4.emissive(0, 0, 0);
    face_4.normal(0, 0, 1);
    face_4.vertex(w, -h, 0, u, v);
    face_4.vertex(0, -h, 0, 0, v);
    face_4.vertex(0, -h, -d, 0, 0);
    face_4.vertex(w, -h, -d, u, 0);
    face_4.endShape(CLOSE);

    PShape face_5 = createShape();
    face_5.beginShape();
    face_5.textureMode(NORMAL);
    face_5.texture(textures[4]);
    face_5.shininess(200.0);
    face_5.emissive(0, 0, 0);
    face_5.normal(0, 0, 1);
    face_5.vertex(w, -h, 0, 0, 0);
    face_5.vertex(w, 0, 0, 0, v);
    face_5.vertex(w, 0, -d, u, v);
    face_5.vertex(w, -h, -d, u, 0);
    face_5.endShape(CLOSE);
    
    PShape face_6 = createShape();
    face_6.beginShape();
    face_6.textureMode(NORMAL);
    face_6.texture(textures[5]);
    face_6.shininess(200.0);
    face_6.emissive(0, 0, 0);
    face_6.normal(0, 0, 1);
    face_6.vertex(0, -h, 0, 0, 0);
    face_6.vertex(0, 0, 0, 0, v);
    face_6.vertex(0, 0, -d, u, v);
    face_6.vertex(0, -h, -d, u, 0);
    face_6.endShape(CLOSE);

    polygon.addChild(face_1);
    polygon.addChild(face_2);
    polygon.addChild(face_3);
    polygon.addChild(face_4);
    polygon.addChild(face_5);
    polygon.addChild(face_6);
    return polygon;
  }
}
