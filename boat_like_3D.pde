import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;


PeasyCam cam;
int count;
float off;

void setup() {
  size(888, 888, P3D);
  stroke(255);
  strokeWeight(2);
  cam=new PeasyCam(this,500);
  count=100;
  off=2*PI/count;
}


void draw() {
  background(0); 
  for (float u=0; u<2*PI; u+=off) {
    for (float v=0; v<2*PI; v+=off) {
      float x=(2+cos(u))*pow(cos(v), 3)*sin(v);
      float y=(2+cos(u+2.0/3.0*PI))*pow(cos(v+2.0/3.0*PI), 2)*pow(sin(v+2.0/3.0*PI), 2);
      float z=-(2+cos(u-2.0/3.0*PI))*pow(cos(v+2.0/3.0*PI), 2)*pow(sin(v+2.0/3.0*PI), 2);
      PVector vec=new PVector(x,y,z);
      vec.normalize();
      vec.mult(160);
      
      point(vec.x,vec.y,vec.z);
    }
  }
}