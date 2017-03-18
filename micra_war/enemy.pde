class enemy {
  float x, y;
  int ran=(int)random(2, 5);
  float theta=random(0, 2*PI);
  float radius;

  enemy(float x0, float y0) {
    radius=random(0, 56);
    float theta=random(0, 2*PI);
    x=x0+radius*sin(theta);
    y=y0+radius*cos(theta);
  }

  void display() {
    move();
    fill(255, 0, 0);
    noStroke();
    ellipse(x, y, 7, 7);
  }

  boolean kill(player p) {
    if (abs(x-p.x)<10&&abs(y-p.y)<10) {
      return true;
    }
    return false;
  }

  void move() {
    PVector move=new PVector(towers[ran].x+radius/2*sin(theta), towers[ran].y+radius/2*cos(theta));
    PVector dis=new PVector(move.x-x, move.y-y);  
    if (dis.mag()>6) {
      dis.normalize();
      if (radius>38) {
        x+=dis.x;
        y+=dis.y;
      }
    }
  }


  boolean isInTower() {
    //if () {
    //  return true;

    //}
    return false;
  }
}