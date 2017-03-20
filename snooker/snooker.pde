
bag[] bags=new bag[6];
hitter white;
ArrayList<ball> balls=new ArrayList<ball>();

void setup() {
  size(1688, 888); 
  background(0);
  ellipseMode(RADIUS);
  fill(244, 222, 0);
  white=new hitter(30);
  for (int i=0; i<bags.length; i++) {
    float x=i%3;
    float y=i/3;
    float r=80;
    float disX=width/2;
    float disY=height;
    bags[i]=new bag(disX*x, disY*y, r);
  }
  for (int i=0; i<10; i++) {
    balls.add(new ball(new PVector(random(width/2, width-30), random(30, height-30))));
  }
}

void draw() {
  background(0);
  white.run();
  for (int i=0; i<bags.length; i++) {
    bags[i].display();
  }
  for (int i=balls.size()-1; i>=0; i--) {
    ball b=balls.get(i);
    b.run();
    for (int j=balls.size()-1; j>=0; j--) {
      if (i!=j) {
        b.acce.add(b.being_hit(balls.get(j)));
      }
    }
    for (int j=0; j<6; j++) {
      if (b.being_eat(bags[j])) {
        balls.remove(i);
      }
    }
  }
  if (balls.size()==0) {
    //background(255);//WIN!!!!!!
  }
}
