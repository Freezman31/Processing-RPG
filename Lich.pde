class Lich extends Sprite {
  float life = 150;
  Lich(String costumeName, int costumeNumb) {
    super(costumeName, costumeNumb); 
    changerTaille(150);
  }

  void draw() {
    if (cave && life>0) {
      montrer();
      allerA(bds.x + 200, bds.y +200);

      fill(255, 255, 255); //display health bar text
      textSize(32);
      text("Liche", 400, 25);

      fill(21, 200, 0);  //display green part
      noStroke();
      rect(75, 30, life*4.3, 10);

      fill(158, 5, 1);
      noStroke();
      rect(75+life*4.3, 30, (150-life)*4.3, 10); // display red part
      
      if(frameCount % 60 == 0 && mc.life > 0){
       lAttacking = true; 
      }
      if(frameCount % 120 == 0 && life > 0){
       life+=10; 
      }
    }
    life = constrain(life, 0, 150);
    if(life <= 0) {
      d.changeText("Merci beaucoup héros ! Grâce à toi, le village est sauvée, je te suis très reconnaissante");
      d.changeAuthor("La princesse magique");
      showDialog = true;
    }
  }
}
