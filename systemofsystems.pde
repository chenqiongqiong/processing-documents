class particle {
  PVector acce;
  PVector velocity;
  PVector location;
  float life=225;
  float g=random(0,255);
  float b=random(0,255);
  float r=random(0,255);

  void update() {
    velocity.add(acce);
    location.add(velocity);
    life-=2;
  }

  void display() {
    noStroke();
    fill(r,g,b,life);
    ellipse(location.x, location.y, 10, 10);
  }

  boolean isDead() {
    if (life<0||location.x<0||location.x>width||location.y>height) {
      return true;
    } else {
      return false;
    }
  }

  particle(PVector l) {
    location=l.copy();
    velocity=new PVector(random(-1, 1), random(-1, 1));
    acce=new PVector(0, 0.1);
  }
}

class particles {
  ArrayList<particle> system;
  PVector origin;

  particles(PVector l) {
    origin=l.copy();
    system=new ArrayList();
  }

  void addParticle() {
    system.add(new particle(origin));
  }

  void run() {
    for (int i=system.size()-1; i>=0; i--) {
      particle p=system.get(i);
      p.update();
      p.display();
      if(p.isDead()){
       system.remove(i); 
      }
    }
  }
}

ArrayList<particles> ps;

void setup() {
  size(666, 666);
  ps=new ArrayList();
}

void mousePressed() {
  ps.add(new particles(new PVector(mouseX, mouseY)));
}

void draw() {
  background(0);
  for (int i=ps.size()-1; i>=0; i--) {
    particles p=ps.get(i);
    p.addParticle();
    p.run();
  }
}
