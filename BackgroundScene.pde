// This is the real background scene, made with deepnight.net
class BackgroundScene extends Sprite {

  BackgroundScene(String costumeName, int costumeNumb) {
    super(costumeName, costumeNumb);
    colorDetection = false;
  }

  void draw() {
    background(0); // Change the background's color to black
    montrer();
    allerA(bds.x, bds.y); // follow the movement of the fake map
  }
}

// This is the fake map class, it's the real map but with border on hitbox
class BorderScene extends Sprite {
  boolean wallTouched = false; // to stop the movement if wall is touched
  float[] lastPos = new float[2]; // store the last position to rollback the player if he touched a wall
  BorderScene(String costumeName, int  costumeNumb) {
    super(costumeName, costumeNumb);
    colorDetection = false;
  }

  void draw() {
    montrer();
  }
  void onKeyPressed() {
    if (wallTouched) { // rollback the player if a wall is touched
      allerA(lastPos[0], lastPos[1]);
    } else {
      lastPos[0] = x;
      lastPos[1] = y;
    }

    moveY = 0;
    moveX = 0;
    //simle mouvement system, work with 4 booleans
    if (up) {
      this.ajouterY(mv);
      moveY += mv;
    } else if (down) {
      this.ajouterY(-mv);
      moveY += -mv;
    } else if (left) {
      this.ajouterX(mv);
      moveX += mv;
    } else if (right) {
      this.ajouterX(-mv);
      moveX += -mv;
    }
  }
}
