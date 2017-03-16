import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;


PeasyCam cam;
int count;
float off;
float angle;

void setup() {
  size(888, 888, P3D);
  cam=new PeasyCam(this, 500);
  count=50;
  off=2*PI/count;
  //colorMode(HSB);
  strokeWeight(3);
  noFill();
  angle=0;
}

void draw() {  
  background(0);
  stroke(255);
  
  angle+=0.05;
  float r1=18+5*sin(angle);
  float r2=10+8*cos(angle*2);

  for (float v=-PI; v<=PI; v+=off) {  
    for (float u=0; u<=2*PI; u+=off) {
      float x=cos(u)*(4+3.8*cos(v));
      float y=sin(u)*(4+3.8*cos(v));
      float z=(cos(v)+sin(v)-1)*(1+sin(v))*log(1-v/10*PI)+7.5*sin(v);
      point(r2*x, r2*y, r1*z);
    }
  }
}