class mover {
  PVector location=new PVector(0, 0);
  PVector velocity=new PVector(0, 0);
  PVector acceleration=new PVector(0, 0);
  float radius;
  PVector gravity=new PVector(0, 0);
  PVector wind=new PVector(0, 0);

  void update() {
    velocity.add(acceleration);
    location.add(velocity);  
    ellipse(location.x, location.y, radius, radius);
    acceleration.mult(0);
    acceleration.add(gravity);
  }

  void display() {
    ellipse(location.x, (height-radius)/2, radius, radius);
  }

  void start() {
    velocity=new PVector(random(-2, 2), random(-3, 3));
    gravity=new PVector(0, 0.08);
  }

  void reset() {
    location=new PVector(0, 0);
    velocity=new PVector(0, 0);
    acceleration=new PVector(0, 0);
  }

  void flooded(float hei, PVector Ff) {
    if (location.y>height/2-hei) {
      acceleration.add(Ff);
    }
  }

boolean isIn(liquid l){
  if(location.y<height/2-l.hei-radius){
    return true;
  }else{
   return false; 
  }
}

  void wind() {
    acceleration.add(new PVector(0.1, 0));
  }

  void edgeCheck() {
    if (location.x>width/2-radius||location.x<-width/2+radius) {
      velocity.x*=-0.8;
    } 
    if (location.y>height/2-radius||location.y<-height/2+radius) {
      velocity.y*=-0.8;
    }
  }

  boolean ground() {
    if (location.y>=(height-radius)/2&&velocity.y<0.09&&velocity.y>-0.09) {
      return true;
    } else {
      return false;
    }
  }

  mover(float r) {
    radius=r;
  }
}
//******************************
class liquid {
  float hei=188;

  PVector Ff(float volume) {
    PVector Ffloat=new PVector(0, -0.0001*volume*volume*volume);   
    return Ffloat;
  }

  void display() {
    fill(55, 100, 100);
    rect(-width/2, height/2-hei, width, hei);
  }
}
//******************************

mover[] balls=new mover[100];
liquid water=new liquid();

void setup() {
  size(600, 600);
  frameRate(30);
  colorMode(HSB, 100);
  for (int i=0; i<balls.length; i++) {   
    balls[i]=new mover(random(5, 22));
  }
}

void draw() {
  translate(width/2, height/2);
  background(0); 
  water.display();
  for (int i=0; i<balls.length; i++) {
    fill(i, 88, 100);
    if (!balls[i].ground()) {
      balls[i].edgeCheck();     
      balls[i].update(); 
      balls[i].flooded(water.hei, water.Ff(balls[i].radius));
    } else {
      balls[i].display();
    }
  }
  if (mousePressed) {
    for (int i=0; i<balls.length; i++) {
      balls[i].start();
    }
  }
  if (keyPressed) {
    if (key=='R') {
      for (int i=0; i<balls.length; i++) {
        balls[i].reset();
      }
    }

    if (key=='F') {
      for (int i=0; i<balls.length; i++) {
        if (balls[i].isIn(water)) {
          balls[i].wind();
        }
      }
    }
  }
}

