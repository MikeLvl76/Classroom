/* Class used for board creation */

class Board extends Polygon {
  
  /* globals */
  PShape board;
  PImage[] textures;
  
  /* constructor */
  Board(){
    super();
    this.board = createShape(GROUP);
    /* board textures */
    textures = arrayOfTextures(BOARD, BOARD, BOARD, BOARD, BOARD, BOARD);
  }
  
  /* get the shape  */
  PShape getBoard() {
    return board;
  }

  /* inheritance used here to create shape */
  void createBoard(float w, float h, float d, int u, int v) {
    PShape boardShape = createPolygon(w, h, d, u, v, textures);
    board.addChild(boardShape);
  }
}
