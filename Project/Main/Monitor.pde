/* Class used for monitor creation */

class Monitor extends Polygon {
  
  /* globals */
  PShape monitor;
  PImage[] monitorTexture, screenTexture;

  /* constructor */
  Monitor() {
    super();
    this.monitor = createShape(GROUP);
    /* monitor and screen textures */
    monitorTexture = arrayOfTextures(COMPUTER, COMPUTER, COMPUTER, COMPUTER, COMPUTER, COMPUTER);
    screenTexture = arrayOfTextures(LESSON, COMPUTER, COMPUTER, COMPUTER, COMPUTER, COMPUTER);
  }

  /* get screen textures */
  PImage[] getScreenTextures() { 
    return screenTexture;
  }
  
  /* get monitor textures */
  PImage[] getMonitorTextures() { 
    return monitorTexture;
  }

  /* get shape */
  PShape getMonitor() {
    return monitor;
  }

  /* inheritance used here to create shape */
  void createMonitor(float w, float h, float d, float footW, float footH, float baseW, float baseH, int u, int v) {
    PShape screenShape = createPolygon(w, h, d, u, v, screenTexture);
    screenShape.translate(0, -(footH + baseH) * HUMAN_SIZE, 0);

    PShape frameworkFoot1Shape = createPolygon(footW, footH, footW, u, v, monitorTexture);
    frameworkFoot1Shape.translate(((w/2) - (footW/2)) * HUMAN_SIZE, -baseH * HUMAN_SIZE, 0);

    PShape frameworkFoot2Shape = createPolygon(baseW, baseH, baseW, u, v, monitorTexture);
    frameworkFoot2Shape.translate(((w/2) - (baseW/2)) * HUMAN_SIZE, 0, (baseW/2) * HUMAN_SIZE);

    monitor.addChild(screenShape);
    monitor.addChild(frameworkFoot1Shape);
    monitor.addChild(frameworkFoot2Shape);
  }
}
