/* Creates a bound to a polygon that camera cannot clip into 
 * When istancied it is impossible to disable the bounds
 * The Room object is separated from other objects because the camera is within the Room 
 * Actually, only the room has its bounds */

class Hitbox {

  /* globals */
  Polygon room;
  ArrayList<Polygon> polygons;

  /* constructor */
  Hitbox() {
    room = new Polygon();
    polygons = new ArrayList<Polygon>();
  }

  /* get room */
  Polygon getRoom() {
    return room;
  }

  /* check all directions and apply a bound (work only for Room) */
  void polygonCollision(POV camera) {
    PVector camView = camera.getViewCoords();
    /* Camera is within the Room so we check if it doesn't clip outside */
    int offset = 10;
    float[] dim = room.getDimensions();
    float[] coords = room.getCoords();
    if (camView.x < coords[0] + offset) { /* left */
      camera.setViewVector(coords[0] + offset, camView.y, camView.z);
    } else if (camView.x > coords[0] + dim[0] + dim[0] / 2 - offset) { /* right */
      camera.setViewVector(coords[0] + dim[0] + dim[0] / 2 - offset, camView.y, camView.z);
    }
    if (camView.y > coords[1] - offset) { /* bottom */
      camera.setViewVector(camView.x, coords[1] - offset, camView.z);
    } else if (camView.y < coords[1] - dim[1] - dim[1] / 2 + offset) { /* top */
      camera.setViewVector(camView.x, coords[1] - dim[1] - dim[1] / 2 + offset, camView.z);
    }
    if (camView.z > coords[2] - offset) { /* front */
      camera.setViewVector(camView.x, camView.y, coords[2] - offset);
    } else if (camView.z < coords[2] - dim[2] - dim[2] / 2 + offset) { /* back */
      camera.setViewVector(camView.x, camView.y, coords[2] - dim[2] - dim[2] / 2 + offset);
    }
    // Code for all objects not implemented
  }

  /* take a polygon and add it to the list 
   * if it's the Room, we copy it into variable */
  void take(Polygon p) {
    if (p.getClass().equals(Room.class)) {
      room = p;
    } else {
      polygons.add(p);
    }
  }
}
