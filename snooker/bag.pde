class bag {
  float radius;
  float posX, posY;

  void display() {
    fill(0, 222, 0);
    ellipse(posX, posY, radius, radius);
  }

  bag(float x, float y, float r) {
    radius=r;
    posX=x;
    posY=y;
  }
}