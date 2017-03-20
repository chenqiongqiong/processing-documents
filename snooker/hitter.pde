class hitter {
  float radius;
  PVector location;
  PVector velocity;
  PVector acce;

  void update() {
    acce.add(go());
    acce.add(resist());
    velocity.add(acce);
    location.add(velocity);
    acce.mult(0);
  }

  PVector go() {
    PVector hit;
    if (mousePressed) {
      hit=new PVector(mouseX-location.x, mouseY-location.y);
    } else {
      hit=new PVector(0, 0);
    }
    hit.div(60);
    return hit;
  }

  PVector resist() {
    PVector res=velocity.copy();
    if (res.mag()>1) {
      res.normalize();
      res.mult(-0.1);
    } else {
      res=new PVector(0, 0);
      velocity=new PVector(0, 0);
    }
    return res;
  }

  void display() {
    fill(255);
    ellipse(location.x, location.y, radius, radius);
  }

  void edge_check() {
    if (location.x-radius<0||location.x+radius>width) {
      velocity.x*=-1;
    }
    if (location.y-radius<0||location.y+radius>height) {
      velocity.y*=-1;
    }
  }

  void run() {
    update();
    edge_check();
    display();
  }

  hitter( float r) {
    radius=r;
    location=new PVector(200, height/2);
    velocity=new PVector(0, 0);
    acce=new PVector(0, 0);
  }
}