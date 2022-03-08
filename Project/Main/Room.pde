/* Class used for mouse creation */

class Room extends Polygon {

  /* globals */
  PShape room;
  PImage[] roomTextures;

  /* constructor */
  Room() {
    super();
    room = createShape(GROUP);
    /* room textures */
    roomTextures = arrayOfTextures(WALL, WALL, CEILING, GROUND, WINDOWS, WALL);
    tint(200); // slight gray tint
  }

  /* get shape */
  PShape getRoom() {
    return room;
  }

  /* get room textures */
  PImage[] getRoomTextures() {
    return roomTextures;
  }

  /* inheritance used here to create shape */
  void createRoom(float w, float h, float d, float thickness, int u, int v) {
    PShape wall1Shape = createPolygon(w, h, thickness, u, v, getRoomTextures());

    PShape wall2Shape = createPolygon(w, h, thickness, u, v, getRoomTextures());
    wall2Shape.translate(0, 0, -d * HUMAN_SIZE);

    PShape wall3Shape = createPolygon(1.0, h, d - thickness, u, v, getRoomTextures());
    wall3Shape.translate(0, 0, -(thickness) * HUMAN_SIZE);

    PShape wall4Shape = createPolygon(1.0, h, d - thickness, u, v, getRoomTextures());
    wall4Shape.translate((w -thickness) * HUMAN_SIZE, 0, -(thickness)  * HUMAN_SIZE);

    PShape ceilingShape = createPolygon(w, thickness, d, u, v, getRoomTextures());
    ceilingShape.translate(0, -h * HUMAN_SIZE, 0);

    PShape groundShape = createPolygon(w, thickness, d, u, v, getRoomTextures());

    room.addChild(wall1Shape);
    room.addChild(wall2Shape);
    room.addChild(wall3Shape);
    room.addChild(wall4Shape);
    room.addChild(ceilingShape);
    room.addChild(groundShape);
  }
}
