class MainCharacter extends Sprite { //<>//

  private int count = 0;
  int[] cost = new int[3];
  int[] oldCost = new int[3];
  float life = 100;
  MainCharacter(String costumeName, int costumeNumb) {
    super(costumeName, costumeNumb);
    colorDetection = true;
  }

  void draw(boolean colorDetection) {
    montrer();

    //display health bar if in the cave
    if (cave) {
      fill(21, 200, 0);
      noStroke();
      rect(x-50, y-30, life, 5);
      fill(158, 5, 1);
      noStroke();
      rect(x-50+life, y-30, 100-life, 5);
    }

    if (colorDetection) { // enable or disable the color detection to prevent lags
      if (toucheCouleur(color(-5812331)) || toucheCouleur(-196407) || (touche(lich.x, lich.y, 100,100) && cave)) {
        bds.wallTouched = true;
      } else {
        bds.wallTouched = false;
      }
      if (toucheCouleur(color(-196385)) && !staff.collected) { // get the staff
        d.changeText("It's dangerous to go alone, take this !"); // nice
        d.changeAuthor("A note");
        showDialog = true;
        staff.collected = true;
        changeCostume("withstaff", 27);
      }
      if (toucheCouleur(color(-1892299)) && !cave) { // to go to the cave
        cave = true;
        bds.costume(1);
        bs.costume(1);
        bds.allerA(0, 0);
      }
      if (toucheCouleur(color(-196407)) && cave) { //LAVA, very hot
        life-=0.5;
      }
      if(touche(princess.x, princess.y, 32,32)){
        if(!firstDialog){
         firstDialog = true;
         d.changeText("Bonjour à toi jeune aventurier, aujourd'hui, tu vas devoir t'occuper de la liche de la grotte");
         d.changeAuthor("La princesse");
         showDialog = true;
        }
        bds.wallTouched = true;
      }

      life = constrain(life, 0, 100);
    }
  }

  void changeCostume(String costumeName, int costumeNumb) {
    PImage[] nC = new PImage[costumeNumb];
    int[] nT = new int[costumeNumb];
    for (int i = 0; i < costumeNumb; i++) { // répeter pour la longueur de la liste de charger les images contenant costume et le numéro correspondant à leur position dans le tableau
      nC[i] = loadImage(costumeName + i + ".png"); // charge les costumes
      nT[i] = nC[i].width;
    }
    costume=nC;
    taille=nT;
  }

  void onKeyPressed() {

    //simle system to change the costume according to its movement
    if (!attacking) {
      if (up) {
        cost[0] = 9;
        cost[1] = 10;
        cost[2] = 11;
      } else if (down) {
        cost[0] = 0;
        cost[1] = 1;
        cost[2] = 2;
      } else if (left) {
        cost[0] = 3;
        cost[1] = 4;
        cost[2] = 5;
      } else if (right) {
        cost[0] = 6;
        cost[1] = 7;
        cost[2] = 8;
      }
      if (!up && !right && !left && !down) { // if no movement, change the costume to the waiting one with the right orientation
        cost[0]= cost[1];
        cost[2] = cost[1];
      }
    } else {
      //if attacking, change costume
      if (up || cost[0] == 10) {
        cost[0] = 24;
        cost[1] = 25;
        cost[2] = 26;
      } else if (down || cost[0] == 1) {
        cost[0] = 21;
        cost[1] = 22;
        cost[2] = 23;
      } else if (left || cost[0] == 4) {
        cost[0] = 18;
        cost[1] = 19;
        cost[2] = 20;
      } else if (right || cost[0] == 7) {
        cost[0] = 15;
        cost[1] = 16;
        cost[2] = 17;
      }
    }

    if (keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT || attacking) { // if there is movement, change the animation or if the costume hasn't change
      if (frameCount % 10 == 0 || !isInArray(cost, this.costumeActuel)) {
        this.costume(cost[count]);
        count++;
        if (count == 3)count=0;
      }
    }
  }

  boolean isInArray(int[] array, int value) {
    for (int i : array) {
      if (value == i)return true;
    }
    return false;
  }
}
