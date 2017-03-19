float angle=PI/3;
float velo=0;
float acce=0;

void setup() {
  size(666, 666);
  background(0);
  frameRate(70);
  stroke(255);
}

void draw() {
  translate(width/2, height/2-200);
  background(0);
  fill(255,255,255);
  ellipse(0,0,10,10);
  PVector gravity=new PVector(0, 0.1);
  acce=0.011*gravity.get().mag();
  acce*=cos(angle);
  velo+=acce;
  angle+=velo;
  line(0,0,300*cos(angle), 300*sin(angle));
  ellipse(300*cos(angle), 300*sin(angle), 20, 20);
}