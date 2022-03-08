/* Class used for desk creation */

class Desk extends Polygon {
  
  /* globals */
  PShape desk, table, legs;
  PImage[] legsTexture, tableTexture;

  /* constructor */
  Desk() {
    super();
    this.desk = createShape(GROUP);
    this.table = createShape(GROUP);
    this.legs = createShape(GROUP);
    /* table and legs textures */
    legsTexture = arrayOfTextures(DESK_LEGS, DESK_LEGS, DESK_LEGS, DESK_LEGS, DESK_LEGS, DESK_LEGS);
    tableTexture = arrayOfTextures(TABLE, TABLE, TABLE, TABLE, TABLE, TABLE);
    tint(255, 255, 220); // slight yellow tint
  }

  /* get table and legs textures */
  PImage[] getLegsTextures() { return legsTexture;}
  PImage[] getTableTextures() { return tableTexture;}

  /* get shape */
  public PShape getDesk() {
    desk.addChild(legs);
    desk.addChild(table);

    return desk;
  }

  /* create table */
  void createTable(float w, float h, float d, float thickness, int u, int v) {
    PShape tableShape = createPolygon(w, thickness, d, u, v, tableTexture);
    tableShape.translate(0, -(h - thickness) * HUMAN_SIZE, 0);
    table.addChild(tableShape);
  }

  /* create table legs */
  void createLegs(float w, float h, float d, float thickness, float wLegs, int u, int v) {
    PShape legFLShape = createPolygon(wLegs, h-thickness, wLegs, u, v, legsTexture);

    PShape legFRShape = createPolygon(wLegs, h-thickness, wLegs, u, v, legsTexture);
    legFRShape.translate(w*HUMAN_SIZE - wLegs, 0, 0);

    PShape legBLShape = createPolygon(wLegs, h-thickness, wLegs, u, v, legsTexture);
    legBLShape.translate(0, 0, -d * HUMAN_SIZE + wLegs);

    PShape legBRShape = createPolygon(wLegs, h-thickness, wLegs, u, v, legsTexture);
    legBRShape.translate(w * HUMAN_SIZE - wLegs, 0, -d * HUMAN_SIZE + wLegs);

    legs.addChild(legFLShape);
    legs.addChild(legFRShape);
    legs.addChild(legBLShape);
    legs.addChild(legBRShape);
  }
}
