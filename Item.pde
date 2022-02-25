class Item extends Sprite {
  boolean collected = false;
  float defaultX, defaultY;
  Item(String costumeName, int costumeNumb, float defaultX, float defaultY) {
    super(costumeName, costumeNumb);
    colorDetection = false;
    this.defaultX = defaultX;
    this.defaultY = defaultY;
  }

  void draw() {
    if (!collected) {
      allerA(bs.x+defaultX, bs.y+defaultY);
      montrer();
    }
  }
}
