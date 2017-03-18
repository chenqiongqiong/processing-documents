
float  a, b1,b2, theta1, theta2;

void setup() {
  a=random(-300, 300);
  b1=random(-300, 300);
  b2=random(-300, 300);
  theta1=random(0, 2*PI);
  theta2=random(0, 2*PI);
  size(1222, 888);
  //frameRate(27);
}

void draw() {
  background(0);
  stroke(255, 255, 0);
  translate(mouseX, mouseY);
  float x1=a*sin(theta1);
  float y1=a*cos(theta1);
  float x2=b1*(cos(theta2));
  float y2=b2*(sin(theta2));
  line(x1, y1, x2, y2);
  theta1+=0.05;
  theta2+=0.12;
  float col=random(0,255);
  for (int i=0; i<30; i++) {
   pushMatrix();
   rotate(2*PI/30*i);
   float stroke2=map(i, 0, 40, 0, col);
   stroke(255, 255-stroke2, stroke2);
   line(x1, y1, x2, y2);
   popMatrix();
  }
}