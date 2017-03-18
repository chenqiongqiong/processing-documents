import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;


PeasyCam cam;
PImage h;
int count;
float off;
float angle;

void setup() {
  size(888, 888, P3D);
  cam=new PeasyCam(this, 500);
  h=loadImage("heart.jpg");
  count=70;
  off=2*PI/count;
  //colorMode(HSB);
  strokeWeight(3);
  noFill();
  colorMode(HSB);
  angle=0;
}

void draw() {  
  background(0);
  stroke(255);
  
  rotateY(angle/3.7);
  rotateX(0.2*sin(angle/7.3));
  angle+=0.1;

  float r1=40+15*sin(angle);
  float r2=40+8*sin(angle);

  //beginShape();
  //texture(h);
  
  stroke(angle%255,255,255);
  for (float theta=-PI; theta<=PI; theta+=off) {  
    for (float z=-0.98; z<=0.98; z+=0.02) {
      
      float r=4*sqrt(1-sq(z))*pow(sin(abs(theta)), abs(theta));
      float x=r*sin(theta);
      float y=r*cos(theta);
      
      point(r2*x, r2*y, r1*z);
      //vertex(r2*x, r2*y, r1*z);
    }
  }
  //endShape();
}