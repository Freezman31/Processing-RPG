class Ice extends Sprite {
  int _mv = 0;
  boolean _x = false;
  boolean set = false;
  Ice(String costumeName, int costumeNumb) {
    super(costumeName, costumeNumb);
  }

  void draw() {

    montrer();
    if (!set) {
      println(mc.cost);
      if (mc.cost[0] == 18 || mc.cost[0]== 4) {
        println("18");
        _x=true;
        _mv=-10;
      } else if (mc.cost[0] == 15) {
        _x=true;
        _mv=10;
      } else if (mc.cost[0] == 24 || mc.cost[0] == 10) {
        _x=false;
        _mv=-10;
      } else if (mc.cost[0] == 21) {
        _x=false;
        _mv=10;
      } else {
        _x=true;
        _mv=10;
      }
      set = true;
    }
    if (_x) {
      this.ajouterX(_mv);
    } else {
      this.ajouterY(_mv);
    }
    if (touche(lich.x, lich.y, 100, 100) && cave) {
      lich.life -= 10;
      attacking = false;
      ice.x=mc.x;
      ice.y=mc.y;
      set=false;
    }

    if (x > 800 || y > 600 || x < -800 || y< -600) {
      attacking = false;
      ice.x=mc.x;
      ice.y=mc.y;
      set=false;
    }
  }
}
