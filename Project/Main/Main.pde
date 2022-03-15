/* This main file loads all required files and creates needed objects with free dimensions and coords 
 * Lights and camera are not correctly set
 * There are things to improve also like making cylinder-shaped objects or more details in the room 
 * Hitbox works only for room 
 * Shape can only have textures and not color (but tint is possible) */

/* Instances of POV, PolygonSetter and Hitbox classes */
POV pov;
PolygonSetter setter;
Hitbox hb;

/* Variables for shaders and textures */
PShader shader;
PImage WALL, CEILING, SEAT, LEGS, TABLE, DESK_LEGS, DOOR, BACKDOOR, COMPUTER, BOARD, GROUND, KEYBOARD, FRONT, MOUSE, WINDOWS, LIGHT, THINLIGHT;
PImage CODE, DOC, CODE2, CODE3, CODE4, CODE5, CODE6, BLACKSCREEN, LESSON;

/* Desk count, row count */
final int desks_nb = 3, rows = 5;

/* Scaling, 1cm = 1.5px */
final float HUMAN_SIZE = 1.5;

/* Room dimensions */
final float roomW = 620, roomH = 280, roomD = 980, thickness = 2.0;
/* Room coords */
final float roomX = 0, roomY = thickness * HUMAN_SIZE, roomZ = 0;

/* Television dimensions */
final float teleH = 90.0, teleW = 160, teleD = 10.0, teleFootW = 10.0, teleFootH = 110.0, teleBaseW = 45.0, teleBaseH = 5.0;
/* Television coords */
final float teleX = 30, teleY = 0, teleZ = -roomD - roomD / 2 + teleBaseW * thickness * HUMAN_SIZE;

/* Board dimensions */
final float boardW = 400, boardH = 130, boardD = thickness * 2;
/* Board coords */
final float boardX = boardW / 2, boardY = -roomH / 3, boardZ = -roomD - roomD / 2 + boardD;

/* Desk dimensions */
final float deskW = 160, deskH = 70, deskD = 80, deskThickness = 2.0, deskWLegs = 3;
/* Desk coords */
final float deskX = roomW / 2 + (roomW / 2) + 50, deskY = 0, deskZ = roomD + (-roomD + deskD * 2.0) * HUMAN_SIZE;

/* Main desk dimensions */
final float mainDeskW = 160, mainDeskH = 70, mainDeskD = 80, mainDeskthickTable = 2.0, mainDeskWLegs = 3;
/* Main desk coords */
final float mainDeskX = roomW / 2, mainDeskY = 0, mainDeskZ = -roomD - roomD / 2 + deskW + deskW * 1.25;

/* Chair dimensions */
final float chairW = 35, chairH = 90, chairD = 50, chairWLegs = 3, chairHLegs = 40, chairThickSeat = 5.0, chairThickBack = 5.0;
/* Chair coords */
final float chairX = roomW / 2 + (roomW/2) + deskW * HUMAN_SIZE - chairW, chairY = 0, chairZ = roomD + (-roomD + deskD * 2.2) * HUMAN_SIZE;

/* Main chair dimensions */
final float mainChairW = 35, mainChairH = 90, mainChairD = 50, mainChairWLegs = 3, mainChairHLegs = 40, mainChairThickSeat = 5.0, mainChairThickBack = 5.0;
/* Main chair coords */
final float mainChairX = roomW / 2 + deskW, mainChairY = 0, mainChairZ = -roomD - roomD / 2 + deskW + deskW / 2.5;

/* Door dimensions */
final float doorW = 110, doorH = 200, doorD = thickness + 1.5;
/* Door coords */
final float doorX = roomW + roomW / 2, doorY = 0, doorZ = -roomD -(roomD / 2.2);

/* Computer dimensions */
final float compW = 10, compH = 30, compD = 30;
/* Computer coords */
final float compX = roomW / 2 + (roomW/2) + deskW * 1.70, compY = -deskH * HUMAN_SIZE, compZ = roomD + (-roomD + deskD * HUMAN_SIZE) * HUMAN_SIZE;

/* Monitor dimensions */
final float moniH = 35, moniW = 60, moniD = 2.5, moniFootW = 2.5, moniFootH = 15, moniBaseW = 20, moniBaseH = 3;
/* Monitor coords */
final float moniX = roomW / 2 + moniW / 3 + (roomW/2) * HUMAN_SIZE, moniY = -deskH * HUMAN_SIZE, moniZ = roomD + (-roomD + deskD + moniBaseW) * HUMAN_SIZE;

/* Keyboard dimensions */
final float keybW = 40.0, keybH = 2, keybD = 10.0;
/* Keyboard coords */
final float keybX = roomW / 2 + keybW / 2 + (roomW/2) * HUMAN_SIZE, keybY = -deskH * HUMAN_SIZE, keybZ = roomD + (-roomD + deskD * 1.70) * HUMAN_SIZE;

/* Mouse dimensions */
final float mouseW = 6, mouseH = 4, mouseD = 8;
/* Mouse coords */
final float mX = roomW / 2 + (roomW/2) + deskW * 1.70, mY = -deskH * HUMAN_SIZE, mZ = roomD + (-roomD + deskD * 1.80) * HUMAN_SIZE;

/* Neon lights dimensions */
final float lightW = 50, lightH = 20, lightD = 150;
/* Neon lights coords */
final float lightX = roomW, lightY = -roomH - roomH / 2 + 10, lightZ = -roomD / 2 + 400;

/* Lights position and color settings 
* the lights boxes are hidden inside neoon lights */
float lx = roomW + 50, ly = -roomH - roomH / 2 - 10, lz = -roomD / 2 - 100;
PVector[] lightPos = {
  new PVector(lx, ly, lz - 350), 
  new PVector(lx - 400, ly, lz - 350), 
  new PVector(lx, ly, lz), 
  new PVector(lx - 400, ly, lz), 
  new PVector(lx, ly, lz + 350), 
  new PVector(lx - 400, ly, lz + 350), 
  new PVector(lx - 200, ly, lz - 700)};

PVector[] lightColor = {
  new PVector(100, 100, 100), 
  new PVector(100, 100, 100),
  new PVector(100, 100, 100),
  new PVector(100, 100, 100), 
  new PVector(100, 100, 100),
  new PVector(100, 100, 100), 
  new PVector(100, 100, 100)};

/* Load textures and objects */
void setup() {
  size(1200, 900, P3D);
  surface.setTitle("Room A106");
  loadAllTextures();
  pov = new POV();
  setter = new PolygonSetter();
  hb = new Hitbox();
  setter.createGlobal();
}

/* Construct objects and set camera and lights */
void draw() {
  background(0);
  
  pov.keyHold();
  pov.moveCamera();
  pov.refresh();
  hb.polygonCollision(pov);
  
  shader(shader);
  shape(setter.getGlobal());
  resetShader();
  lights();
}

/* Load all textures from textures directory */
void loadAllTextures() {
  shader = loadShader("../shaders/LightShaderTexFrag.glsl", "../shaders/LightShaderTexVert.glsl");
  WALL = loadImage("../textures/wall.png");
  CEILING = loadImage("../textures/ceiling.png");
  SEAT = loadImage("../textures/seat.png");
  LEGS = loadImage("../textures/legs.png");
  TABLE = loadImage("../textures/desk.png");
  DESK_LEGS = loadImage("../textures/deskLegs.png");
  DOOR = loadImage("../textures/door.png");
  BACKDOOR = loadImage("../textures/backDoor.png");
  COMPUTER = loadImage("../textures/gray.png");
  BOARD = loadImage("../textures/board.png");
  GROUND = loadImage("../textures/ground.png");
  KEYBOARD = loadImage("../textures/keyboard.png");
  FRONT = loadImage("../textures/computerFront.png");
  MOUSE = loadImage("../textures/mouse.png");
  WINDOWS = loadImage("../textures/windows.png");
  LIGHT = loadImage("../textures/lights.png");
  THINLIGHT = loadImage("../textures/thinlight.png");
  CODE = loadImage("../textures/CODE.png");
  DOC = loadImage("../textures/doc.png");
  CODE2 = loadImage("../textures/CODE2.png");
  CODE3 = loadImage("../textures/processing.png");
  CODE4 = loadImage("../textures/pshape.png");
  CODE5 = loadImage("../textures/geode.png");
  CODE6 = loadImage("../textures/cube.png");
  BLACKSCREEN  = loadImage("../textures/blackscreen.png");
  LESSON = loadImage("../textures/lesson.png");
}

/* Specify lights attributes */
void lights() {
  /* creating light boxes */
  for (int i = 0; i < lightPos.length; i++) {
    pushMatrix();
    noStroke();
    emissive(lightColor[i].x, lightColor[i].y, lightColor[i].z);
    translate(lightPos[i].x, lightPos[i].y, lightPos[i].z);
    if (i == lightPos.length - 1) rotateY(radians(-90));
    box(20, 20, 20);
    popMatrix();
  }
  emissive(0, 0, 0);
  ambientLight(10, 10, 10);
  /* set colors and point lights */
  for (int i = 0; i < lightPos.length; i++) {
    lightSpecular(lightColor[i].x, lightColor[i].y, lightColor[i].z);
    pointLight(lightColor[i].x, lightColor[i].y, lightColor[i].z, 
      lightPos[i].x, lightPos[i].y, lightPos[i].z);
  }
}
