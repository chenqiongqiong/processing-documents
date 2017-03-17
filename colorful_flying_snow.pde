
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float life;
  float r=random(0,255);
  float g=random(0,255);
  float b=random(0,255);

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    life-=0.6;
  }

  void display() {
    fill(r,g,b, life);
    ellipse(location.x, location.y, 12, 12);
  }

  boolean isDead() {
    if (life<=0) {
      return true;
    } else {
      return false;
    }
  }

  Particle(PVector l) {
    location=l;
    acceleration=new PVector(0, 0.01);
    velocity=new PVector(random(-1, 1), random(-0.1, 2));
    life=225;
  }
}

int count=20;
ArrayList<Particle> parry=new ArrayList<Particle>();

void setup() {
  size(777, 777);
  for (int i=0; i<count; i++) {
    parry.add(new Particle(new PVector(225, 45)));
  }
  background(0);
  
}

void draw() {
  background(0); 
  parry.add(new Particle(new PVector(random(20, width-20), 45)));
  for(int i=parry.size()-1;i>=0;i--){
    Particle p =parry.get(i);
    p.update();
    p.display();
    if (p.isDead()) {
      parry.remove(i);
    }
  }
}