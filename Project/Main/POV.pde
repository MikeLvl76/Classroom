/* This class manages camera and allow moving with ZQSD keys and mouse use */
class POV {
  float radius, theta, phi;
  PVector view, eye, d;

  /* construct object with default camera view and eye
   * the perspective is modified to avoid uggly clipping into polygons */
  POV() {
    view = new PVector(roomW / 2, -roomH, -roomD);
    eye = new PVector(0, 1, 0);
    d = new PVector();
    radius = 200;
    theta = 0;
    phi = 0;
    perspective(PI/2, (float) width / height, 0.1, 10000);
  }

  /* return view coords */
  PVector getViewCoords() {
    return view;
  }

  /* modify view vector values */
  void setViewVector(float x, float y, float z) {
    view.set(x, y, z);
  }

  /* return eye coords */
  PVector getEyeCoords() {
    return eye;
  }

  /* modify eye vector values */
  void setEyeVector(float x, float y, float z) {
    eye.set(x, y, z);
  }

  /* update view and eye coords */
  void refresh() {
    camera( 
      view.x, view.y, view.z, 
      eye.x, eye.y, eye.z, 
      0, 1, 0);
  }

  /* update eye coords depending of mouse position */
  void moveCamera() {
    eye.set(radius * cos(phi) * cos(theta), -radius * sin(phi), radius * cos(phi) * sin(theta)).add(view);
    theta = (float(mouseX)/width) * TWO_PI;
    phi = (float(mouseY)/width) * TWO_PI;
  }

  /* check if keys are pressed, focus on ZQSD keys
   * vectors are updated to keep correct distance between seen objects and their position */
  void keyHold() {
    int distance = 0;
    if (keyPressed) {
      if (key == 'z') { // move forward
        d = new PVector(eye.x - view.x, eye.y - view.y, eye.z - view.z).normalize();
        distance = 2;
      } else if (key == 'q') { // move to the left
        d = new PVector(eye.x - view.x, eye.y - view.y, eye.z - view.z).normalize();
        PVector i = new PVector(0, 1, 0);
        d.set(d.copy().cross(i));
        distance = -2;
      } else if (key == 's') { // move back
        d = new PVector(eye.x - view.x, eye.y - view.y, eye.z - view.z).normalize();
        distance = -2;
      } else if (key == 'd') { // move to the right
        d = new PVector(eye.x - view.x, eye.y - view.y, eye.z - view.z).normalize();
        PVector i = new PVector(0, 1, 0);
        d.set(d.copy().cross(i));
        distance = 2;
      }
      view.add(d.mult(distance));
      eye.add(d.mult(distance));
    }
  }
}
