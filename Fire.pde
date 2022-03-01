class Fire extends Sprite {
  boolean set = false;
  float pX, pY;
  Fire(String costumeName, int costumeNumb) {
    super(costumeName, costumeNumb);
    fixerRotation = true;
    changerTaille(150);
  }

  void draw() {
    montrer(); 
    if (!set) {
      allerA(lich.x, lich.y); 
      orienterVers(mc.x, mc.y);
      set = true;
    }
    avancer(5);
    ajouterX(moveX);
    ajouterY(moveY);
    if (touche(mc.x, mc.y, 32, 32)) {
      mc.life -= 10;
      set=false;
      lAttacking = false;
    }
    if (x > 800 || y > 600 || x < -800 || y< -600) {
      lAttacking = false;
      set=false;
    }
  }
}
