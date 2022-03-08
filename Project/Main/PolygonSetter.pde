/* Class used for objects instancing */

class PolygonSetter {

  PShape global;

  PShape getGlobal() { 
    return global;
  }

  PShape addRoom(float x, float y, float z, float w, float h, float d, float t) {
    Room r = new Room();
    
    r.createRoom(w, h, d, t, 1, 1);
    PShape roomGroup = createShape(GROUP);
    roomGroup.addChild(r.getRoom());
    roomGroup.translate(x, y, z);

    r.polygonCoords(x, y, z);
    r.polygonDimension(w, h, d, t);
    hb.take(r);

    return roomGroup;
  }

  PShape addMouse(float x, float y, float z, float w, float h, float d, int i, int j) {
    Mouse m1 = new Mouse();
    Mouse m2 = new Mouse();

    PShape mouseGroup = createShape(GROUP);
    PShape subGroup1 = createShape(GROUP);

    m1.createMouse(w, h, d, 1, 1);
    subGroup1.addChild(m1.getMouse());
    subGroup1.rotateY(radians(5 * tan(i)));
    subGroup1.translate(x - deskW * HUMAN_SIZE * i, y, z - deskW * HUMAN_SIZE * j);
    mouseGroup.addChild(subGroup1);

    PShape subGroup2 = createShape(GROUP);
    m2.createMouse(w, h, d, 1, 1);
    subGroup2.addChild(m2.getMouse());
    subGroup2.rotateY(radians(5 * tan(j)));
    if (i == 2) i = 1;
    subGroup2.translate(x - moniW * 3.5 - deskW * HUMAN_SIZE * i, y, z - deskW * HUMAN_SIZE * j);

    mouseGroup.addChild(subGroup2);
    
    /* mouses coords and dimensions needed */
    m1.polygonCoords(x, y, z);
    m1.polygonDimension(w, h, d);
    hb.take(m1);
    
    m2.polygonCoords(x, y, z);
    m2.polygonDimension(w, h, d);
    hb.take(m2);
    
    return mouseGroup;
  }

  PShape addTelevision(float x, float y, float z, float w, float h, float d, float fw, float fh, float bw, float bh, int u, int v) {
    Monitor tele = new Monitor();
    PShape tv = createShape(GROUP);

    tele.createMonitor(w, h, d, fw, fh, bw, bh, u, v);

    tv.addChild(tele.getMonitor());
    tv.rotateY(radians(30));
    tv.translate(x, y, z);
    
    tele.polygonCoords(x, y, z);
    tele.polygonDimension(w, h, d, fw, fh, bw, bh);
    hb.take(tele);
    
    return tv;
  }

  PShape addMonitor(float x, float y, float z, float mw, float mh, float md, float bw, float bh, float fw, float fh, float t, int i, int j, PImage[] images) {
    Monitor monitor = new Monitor();
    Monitor monitor2 = new Monitor();

    PShape monitorGroup = createShape(GROUP);

    PShape subGroup1 = createShape(GROUP);
    monitor.changeTexture(monitor.getScreenTextures(), 0, images[int(random(images.length))]);
    monitor.createMonitor(mw, mh, md, fw, fh, bw, bh, 1, 1);
    subGroup1.addChild(monitor.getMonitor());
    subGroup1.rotateY(radians(5 * tan(i)));
    subGroup1.translate(x - deskW * HUMAN_SIZE * i, y, z - deskW * HUMAN_SIZE * j);
    monitorGroup.addChild(subGroup1);

    PShape subGroup2 = createShape(GROUP);
    monitor2.changeTexture(monitor2.getScreenTextures(), 0, images[int(random(images.length))]);
    monitor2.createMonitor(mw, mh, md, fw, fh, bw, bh, 1, 1);
    subGroup2.addChild(monitor2.getMonitor());
    subGroup2.rotateY(radians(5 * tan(j)));
    if (i == 2) i = 1;
    subGroup2.translate(x - t * 2 - mw * HUMAN_SIZE - deskW * HUMAN_SIZE * i, y, z - deskW * HUMAN_SIZE * j);
    monitorGroup.addChild(subGroup2);

    /* monitors coords and dimensions needed */
    monitor.polygonCoords(x, y, z);
    monitor.polygonDimension(mw, mh, md, bw, bh, fw, fh, t);
    hb.take(monitor);
    
    monitor2.polygonCoords(x, y, z);
    monitor2.polygonDimension(mw, mh, md, bw, bh, fw, fh, t);
    hb.take(monitor2);

    return monitorGroup;
  }

  PShape addKeyboard(float x, float y, float z, float w, float h, float d, int i, int j) {

    Keyboard keyboard = new Keyboard();
    Keyboard keyboard2 = new Keyboard();

    PShape keyboardGroup = createShape(GROUP);
    PShape subGroup1 = createShape(GROUP);
    keyboard.createKeyboard(w, h, d, 1, 1);
    subGroup1.addChild(keyboard.getKeyboard());
    subGroup1.rotateY(radians(5 * sin(i)));
    subGroup1.translate(x - deskW * HUMAN_SIZE * i, y, z - deskW * HUMAN_SIZE * j);

    PShape subGroup2 = createShape(GROUP);
    keyboard2.createKeyboard(w, h, d, 1, 1);
    subGroup2.addChild(keyboard2.getKeyboard());
    subGroup2.rotateY(radians(5 * cos(j)));
    if (i == 2) i = 1;
    subGroup2.translate(x - moniW * HUMAN_SIZE - deskW * HUMAN_SIZE * i, y, z - deskW * HUMAN_SIZE * j);

    keyboardGroup.addChild(subGroup1);
    keyboardGroup.addChild(subGroup2);
    
    /* keyboards coords and dimensions needed */
    keyboard.polygonCoords(x, y, z);
    keyboard.polygonDimension(w, h, d);
    hb.take(keyboard);
    
    keyboard2.polygonCoords(x, y, z);
    keyboard2.polygonDimension(w, h, d);
    hb.take(keyboard2);

    return keyboardGroup;
  }

  PShape addLight(float x, float y, float z, float w, float d, float h, int i, int j) {
    Light l1 = new Light();
    Light l2 = new Light();
    
    l1.createLight(w, d, h, 1, 1);
    l2.createLight(w, d, h, 1, 1);
    
    l2.changeTexture(l2.getTextures(), 2, THINLIGHT);
    
    PShape lightGroup = createShape(GROUP);
    PShape subGroup1 = createShape(GROUP);
    
    subGroup1.addChild(l1.getLight());
    if(i >= 2)i = 1;
    if(j >= 3)j = 2;
    subGroup1.translate(x - 400 * i, y, z - 1.25 * 300 * j);
    lightGroup.addChild(subGroup1);
    
    PShape subGroup2 = createShape(GROUP);
    subGroup2.addChild(l2.getLight());
    subGroup2.rotateY(radians(-90));
    subGroup2.translate(x - roomW / 2, y, z - roomD * 1.25);
    lightGroup.addChild(subGroup2);
    
    /* lights coords and dimensions needed */
    l1.polygonCoords(x, y, z);
    l1.polygonDimension(w, h, d);
    hb.take(l1);
    
    l2.polygonCoords(x, y, z);
    l2.polygonDimension(w, h, d);
    hb.take(l2);
    
    return lightGroup;
  }

  PShape addDoor(float x, float y, float z, float w, float h, float d) {
    Door door = new Door();
    Door door2 = new Door();
    Door door3 = new Door();
    
    door.changeTexture(door.getTextures(), 0, BACKDOOR);

    door.createDoor(w, h, d, 1, 1);
    door2.createDoor(w, h, d, 1, 1);
    door3.createDoor(w, h, d, 1, 1);

    PShape doorGroup = createShape(GROUP);
    PShape subGroup1 = createShape(GROUP), subGroup2 = createShape(GROUP), subGroup3 = createShape(GROUP);
    /* Entry door */
    subGroup1.addChild(door.getDoor());
    subGroup1.rotateY(radians(-90));
    subGroup1.translate(x - d * HUMAN_SIZE, y, z);

    /* Door at the back */
    subGroup2.addChild(door2.getDoor());
    subGroup2.translate(x - x + 10, y, z - z - HUMAN_SIZE);

    /* Door behind the television */
    subGroup3.addChild(door3.getDoor());
    subGroup3.translate(doorX - doorX + 10, y, z - z - roomD - roomD / 2 + d);

    doorGroup.addChild(subGroup1);
    doorGroup.addChild(subGroup2);
    doorGroup.addChild(subGroup3);
    
    /* doors coords and dimensions needed */
    door.polygonCoords(x, y, z);
    door.polygonDimension(w, h, d);
    hb.take(door);
    
    door2.polygonCoords(x, y, z);
    door2.polygonDimension(w, h, d);
    hb.take(door2);
    
    door3.polygonCoords(x, y, z);
    door3.polygonDimension(w, h, d);
    hb.take(door3);

    return doorGroup;
  }

  PShape addDesk(float x, float y, float z, float w, float h, float d, float dw, float t, int i, int j) {
    Desk desk = new Desk();

    desk.createTable(w, h, d, t, 1, 1);
    desk.createLegs(w, h, d, t, dw, 1, 1);

    PShape deskGroup = createShape(GROUP);
    deskGroup.addChild(desk.getDesk());
    deskGroup.translate(x - w * HUMAN_SIZE * i, y, z + HUMAN_SIZE * w - w * HUMAN_SIZE * j);
    
    desk.polygonCoords(x, y, z);
    desk.polygonDimension(w, h, d, dw, t);
    hb.take(desk);

    return deskGroup;
  }

  PShape addComputer(float x, float y, float z, float w, float h, float d, int i, int j) {
    Computer computer = new Computer();
    Computer computer2 = new Computer();

    computer.createComputer(w, h, d, 1, 1);
    computer2.createComputer(w, h, d, 1, 1);

    PShape computerGroup = createShape(GROUP);
    PShape subGroup1 = createShape(GROUP), subGroup2 = createShape(GROUP);

    subGroup1.addChild(computer.getComputer());
    subGroup1.rotateY(radians(5 * cos(i)));
    subGroup1.translate(x - deskW * HUMAN_SIZE * i, y, z - deskW * HUMAN_SIZE * j);

    subGroup2.addChild(computer2.getComputer());
    subGroup2.rotateY(radians(5 * sin(j)));
    if (i == 2) i = 1;
    subGroup2.translate(x - moniW * 3.5 - deskW * HUMAN_SIZE * i, y, z - deskW * HUMAN_SIZE * j);

    computerGroup.addChild(subGroup1);
    computerGroup.addChild(subGroup2);
    
    /* computers coords and dimensions needed */
    computer.polygonCoords(x, y, z);
    computer.polygonDimension(w, h, d);
    hb.take(computer);
    
    computer2.polygonCoords(x, y, z);
    computer2.polygonDimension(w, h, d);
    hb.take(computer2);
    
    return computerGroup;
  }

  PShape addBoard(float x, float y, float z, float w, float h, float d) {
    Board board = new Board();
    board.createBoard(w, h, d, 1, 1);

    board.polygonCoords(x, y, z);
    board.polygonDimension(w, h, d);
    hb.take(board);

    PShape boardGroup = createShape(GROUP);
    boardGroup.addChild(board.getBoard());
    boardGroup.translate(x, y, z);
    
    board.polygonCoords(x, y, z);
    board.polygonDimension(w, h, d);
    hb.take(board);

    return boardGroup;
  }

  PShape addChair(float x, float y, float z, float w, float h, float d, float lw, float lh, float ts, float tb, int i, int j) {
    Chair chair = new Chair();
    Chair chair2 = new Chair();

    chair.createSeat(w, d, lh, ts, 1, 1);
    chair.createBack(w, h, lh, ts, tb, 1, 1);
    chair.createLegs(w, d, lw, lh, 1, 1);

    chair2.createSeat(w, d, lh, ts, 1, 1);
    chair2.createBack(w, h, lh, ts, tb, 1, 1);
    chair2.createLegs(w, d, lw, lh, 1, 1);

    PShape chairGroup = createShape(GROUP);
    PShape subGroup1 = createShape(GROUP), subGroup2 = createShape(GROUP);

    subGroup1.addChild(chair.getChair());
    subGroup1.rotateY(radians(10 * cos(i)));
    subGroup1.translate(x - deskW * HUMAN_SIZE * i, y, z - deskW * HUMAN_SIZE * j);

    subGroup2.addChild(chair2.getChair());
    subGroup2.rotateY(radians(10 * sin(j)));
    subGroup2.translate(x - w * 3 - deskW * HUMAN_SIZE * i, y, z - deskW * HUMAN_SIZE * j);

    chairGroup.addChild(subGroup1);
    chairGroup.addChild(subGroup2);
    
    /* chairs coords and dimensions needed */
    chair.polygonCoords(x, y, z);
    chair.polygonDimension(w, h, d, lw, lh, ts, tb);
    hb.take(chair);
    
    chair2.polygonCoords(x, y, z);
    chair2.polygonDimension(w, h, d, lw, lh, ts, tb);
    hb.take(chair2);

    return chairGroup;
  }

  PShape addMainDesk(float x, float y, float z, float w, float h, float d, float lw, float t) {
    Desk main = new Desk();

    main.createTable(w, h, d, t, 1, 1);
    main.createLegs(w, h, d, t, lw, 1, 1);

    PShape mainDeskGroup = createShape(GROUP);
    mainDeskGroup.addChild(main.getDesk());
    mainDeskGroup.translate(x, y, z);

    main.polygonCoords(x, y, z);
    main.polygonDimension(w, h, d, lw, t);
    hb.take(main);

    return mainDeskGroup;
  }

  PShape addMainChair(float x, float y, float z, float w, float h, float d, float lw, float lh, float ts, float tb) {
    Chair mainChair = new Chair();

    mainChair.createSeat(w, d, lh, ts, 1, 1);
    mainChair.createBack(w, h, lh, ts, tb, 1, 1);
    mainChair.createLegs(w, d, lw, lh, 1, 1);

    PShape mainChairGroup = createShape(GROUP);
    mainChairGroup.rotateY(radians(-180));
    mainChairGroup.addChild(mainChair.getChair());
    mainChairGroup.translate(x, y, z);
    
    mainChair.polygonCoords(x, y, z);
    mainChair.polygonDimension(w, h, d, lw, lh, ts, tb);
    hb.take(mainChair);

    return mainChairGroup;
  }

  void createGlobal() {
    PImage[] all = {CODE, DOC, CODE2, CODE3, CODE4, CODE5, CODE6, BLACKSCREEN, LESSON};
    global = createShape(GROUP);

    global.addChild(addRoom(roomX, roomY, roomZ, roomW, roomH, roomD, thickness));
    global.addChild(addTelevision(teleX, teleY, teleZ, teleW, teleH, teleD, teleFootW, teleFootH, teleBaseW, teleBaseH, 1, 1));
    global.addChild(addBoard(boardX, boardY, boardZ, boardW, boardH, boardD));
    global.addChild(addDoor(doorX, doorY, doorZ, doorW, doorH, doorD));
    global.addChild(addMainDesk(mainDeskX, mainDeskY, mainDeskZ, mainDeskW, mainDeskH, mainDeskD, mainDeskthickTable, mainDeskWLegs));
    global.addChild(addMainChair(mainChairX, mainChairY, mainChairZ, mainChairW, mainChairH, mainChairD, mainChairWLegs, mainChairHLegs, mainChairThickSeat, mainChairThickBack));
    for (int i = 0; i < desks_nb; i++) {
      for (int j = 0; j < rows; j++) { 
        global.addChild(addDesk(deskX, deskY, deskZ, deskW, deskH, deskD, deskWLegs, deskThickness, i, j));
        global.addChild(addLight(lightX, lightY, lightZ, lightW, lightH, lightD, i, j));
        if (j < 4) {
          global.addChild(addChair(chairX, chairY, chairZ, chairW, chairH, chairD, chairWLegs, chairHLegs, chairThickSeat, chairThickBack, i, j));
          global.addChild(addMonitor(moniX, moniY, moniZ, moniW, moniH, moniD, moniBaseW, moniBaseH, moniFootW, moniFootH, thickness, i, j, all));
          global.addChild(addComputer(compX, compY, compZ, compW, compH, compD, i, j));
          global.addChild(addKeyboard(keybX, keybY, keybZ, keybW, keybH, keybD, i, j));
          global.addChild(addMouse(mX, mY, mZ, mouseW, mouseH, mouseD, i, j));
        }
      }
    }
  }
}
