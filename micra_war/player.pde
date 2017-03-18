class player {
  float x, y;
  PVector go;

  player(float x0, float y0) {
    float radius=random(0, 56);
    float theta=random(0, 2*PI);
    x=x0+radius*sin(theta);
    y=y0+radius*cos(theta);
    go=new PVector(x, y);
  }

  void display() {
    PVector dis=new PVector(go.x-x, go.y-y);  
    if (dis.mag()>6) {
      dis.normalize();
      x+=dis.x;
      y+=dis.y;
    }
    noStroke();
    fill(20, 222, 0);
    ellipse(x, y, 7, 7);
    if (isChosen()) {
      noFill();
      stroke(255, 0, 0);
      strokeWeight(1);
      ellipse(x+dis.x, y+dis.y, 10, 10);
    }
  }

  boolean isChosen() {
    if (x>min(startX, endX)&&x<max(startX, endX)&&y<max(startY, endY)&&y>min(startY, endY)) {
      return true;
    }
    return false;
  }

  void mouseClicked() {
    if (mouseButton==RIGHT) {
      go=new PVector(mouseX+20*sin(random(0, 2*PI)), mouseY+20*cos(random(0, 2*PI)));
    }
  }
}