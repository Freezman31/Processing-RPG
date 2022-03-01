MainCharacter mc;
BackgroundScene bs;
BorderScene bds;
Item staff;
Lich lich;
Ice ice;
Fire fire;
Dialog d;
NPC princess;


PFont robotoC;
int mcCostume = 0;
int mv = 5;
boolean up, down, right, left = false;

boolean showDialog = false;
boolean attacking, lAttacking, canMcAttack = false; // MainCharacter attacking & lich attacking

float moveX, moveY;

boolean cave, firstDialog = false;

void setup() {

  size(800, 600);
  surface.setTitle("èRPéGé");
  robotoC = createFont("RobotoCondensed-Regular.ttf", 16);

  d = new Dialog("", "");
  //Sprite init
  bs = new BackgroundScene("home", 2);
  bds = new BorderScene("cover_violet", 2);
  princess = new NPC("princess", 1);
  princess.allerA(bds.x-150, bds.y-100);
  mc = new MainCharacter("", 15);
  staff = new Item("staff", 1, -50, -143);
  ice = new Ice("ice", 1);
  fire = new Fire("fire", 1);
  lich = new Lich("lich", 1);
}

void draw() {
  mc.onKeyPressed(); // launch animation
  if (mc.life>0)bds.onKeyPressed(); // move the map

  bds.draw(); // fake map for hitbox
  if (mc.life>0)mc.draw(true); //hidded player for hitbox
  bs.draw(); // real map, nice

  if (showDialog)d.draw();

  if (!cave || lich.life <= 0) {
    princess.draw(); 
    if (!cave) {
      princess.allerA(bds.x-150, bds.y-100);
    } else {
      princess.allerA(bds.x+150, bds.y+150);
    }
  }



  if (mc.life>0)mc.draw(false); // real
  lich.draw();

  //Items drawing :
  if (!cave) {
    staff.draw();
  }

  //Attacks
  if (attacking && staff.collected && mc.life > 0) {
    ice.draw();
  }
  if (cave && lAttacking) {
    fire.draw();
  }
  if (mc.life<=0) {
    fill(255, 255, 255);
    textSize(64);
    text("You lose !", mc.y, mc.y);
  }
  if (frameCount % 45 == 0) {
    canMcAttack = true;
  }
}

//value of booleans for the movement
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP)up = true;
    if (keyCode == DOWN)down = true;
    if (keyCode == LEFT)left = true;
    if (keyCode == RIGHT)right = true;
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP)up = false;
    if (keyCode == DOWN)down = false;
    if (keyCode == LEFT)left = false;
    if (keyCode == RIGHT)right = false;
    mc.costume(1); // If the key is released, change the character's animation to waiting
  }
  if (key == 'n' ||key =='N') {
    showDialog = false;
  }
  if (key == 'f' ||key == 'F') {
    if (staff.collected && canMcAttack) {
      canMcAttack = false;
      attacking = true;
    }
  }
}


void mousePressed() {
  System.out.println("X : "+mouseX + "\nY : " + mouseY); // Print coordinate on mouse click, for debug purpose
}

void mouseReleased() {
}


void mouseMoved() {
}
