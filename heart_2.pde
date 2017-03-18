import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;

float theta;
final float radius=100;
final int count=200;
float off=2*PI/count;

void setup() {
  size(888, 888, P3D);
  strokeWeight(5);
  stroke(255);
  cam=new PeasyCam(this, 500);
}

void draw() {
  background(0);
  lights();
  //translate(width/2, height/2);
  //rotateX(PI/3);
  
  //for (float radius=0; radius<100; radius+=5) {
    for (float i=0; i<=2*PI; i+=off) {      
      float x=radius*(1+cos(i))*cos(i);
      float y=radius*(1+cos(i))*sin(i);
      point(x, y);
    }
  //}
}