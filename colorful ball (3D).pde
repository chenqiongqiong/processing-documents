import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

float theta;
float fi;
float radius;
float scl;
float dis;
float angle;
PeasyCam cam;

void setup() {
  cam=new PeasyCam(this,500);
  size(1088, 888, P3D);
  colorMode(HSB);
  radius=170;
  scl=30.0;
  theta=2*PI/scl;
  fi=PI/scl;
  
  angle=0;
}

void draw() {  
  background(0);
  //rotateX(0.6);
  rotateY(angle/15);
  angle+=0.1;
  dis=150+60*sin(angle);
  radius=100+60*cos(1.5*angle);
  strokeWeight(4);
  //text("LOVE",0,0);
  for (float i=0; i<=PI; i+=fi ) {
    float col=map(i,0,PI,0,250);   
    for (float j=0; j<2*PI; j+=theta) {
      stroke(col,255,255);
      point(radius*sin(i)*cos(j), radius*sin(i)*sin(j), dis*cos(i));
    }
  }
}
