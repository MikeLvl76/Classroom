/* Class used for chair creation */

class Chair extends Polygon {
  
  /* globals */
  PShape chair, legs, seat, back;
  PImage[] legsTexture, seatTexture;

  /* constructor */
  Chair() {
    super();
    this.chair = createShape(GROUP);
    this.legs = createShape(GROUP);
    this.seat = createShape(GROUP);
    this.back = createShape(GROUP);
    /* chair's legs and seat textures */
    legsTexture = arrayOfTextures(LEGS, LEGS, LEGS, LEGS, LEGS, LEGS);
    seatTexture = arrayOfTextures(SEAT, SEAT, SEAT, SEAT, SEAT, SEAT);
  }

  /* get legs and seat textures */
  PImage[] getLegsTextures() { return legsTexture;}
  PImage[] getSeatTextures() { return seatTexture;}

  /* get the shape */
  PShape getChair() {
    chair.addChild(legs);
    chair.addChild(seat);
    chair.addChild(back);
    return chair;
  }
  
  /* create seat of the chair */
  void createSeat(float w, float d, float hLegs, float seatThickness, int u, int v) {
    PShape seatShape = createPolygon(w, seatThickness, d, u, v, seatTexture);
    seatShape.translate(0, -hLegs * HUMAN_SIZE, 0);
    seat.addChild(seatShape);
  }

  /* create back of the chair */
  void createBack(float w, float h, float hLegs, float seatThickness, float backThickness, int u, int v) {
    PShape backShape = createPolygon(w, h - (hLegs+seatThickness), backThickness, u, v, seatTexture);
    backShape.translate(0, -(hLegs + seatThickness) * HUMAN_SIZE, 0);
    back.addChild(backShape);
  }

  /* create chair's legs */
  void createLegs(float w, float d, float wLegs, float hLegs, int u, int v) {
    PShape legFLShape = createPolygon(wLegs, hLegs, wLegs, u, v, legsTexture);

    PShape legFRShape = createPolygon(wLegs, hLegs, wLegs, u, v, legsTexture);
    legFRShape.translate(w * HUMAN_SIZE - wLegs, 0, 0);

    PShape legBLShape = createPolygon(wLegs, hLegs, wLegs, u, v, legsTexture);
    legBLShape.translate(0, 0, -d * HUMAN_SIZE + wLegs);

    PShape legBRShape = createPolygon(wLegs, hLegs, wLegs, u, v, legsTexture);
    legBRShape.translate(w * HUMAN_SIZE - wLegs, 0, -d * HUMAN_SIZE + wLegs);

    legs.addChild(legFLShape);
    legs.addChild(legFRShape);
    legs.addChild(legBLShape);
    legs.addChild(legBRShape);
  }
}
