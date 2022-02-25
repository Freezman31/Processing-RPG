class Dialog extends Sprite {
  String content, authorName;
  Dialog(String content, String authorName) {
    super("dialog", 1);
    this.content = content;
    this.authorName = authorName;
    colorDetection = false;
    allerA(400, 550);
  }

  void draw() {
    montrer();
    textLeading(0);
    textFont(robotoC);
    fill(255,255,255);
    textSize(20);
    text(authorName.toUpperCase() + " : ", x-190, y-25);
    textSize(16);
    text(content, x-190, y-15, x-15, y);
  }

  void changeText(String nt) {
    content = nt;
  }
  void changeAuthor(String na) {
    authorName = na;
  }
}
