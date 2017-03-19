
void setup() {
  size(888, 888); 
  background(0);
}
void draw() {
  float color1=map(mouseX, 0, width, 0, 225);
  stroke(222, color1, color1);
  float num=map(mouseX, 0, width, 0, 8*PI);
  ellipse(mouseX, 333+100*sin(num), 11, 11);

  if (mousePressed) {
    stroke(color1, 222, 222);
    float num2=map(mouseX, 0, width, PI, 9*PI);
    ellipse(mouseX, 555+100*sin(num2), 11, 11);
  }
}