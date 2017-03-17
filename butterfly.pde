import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;


PeasyCam cam;
int count;
float off;

void setup(){
  size(888,888,P3D);
  cam=new PeasyCam(this,500);
  count=5000;
  off=24*PI/count;
  colorMode(HSB);
  strokeWeight(3);
  noFill();
  //frameRate(1);
}

void draw(){
  
  
  background(0);
  
  rotateZ(-0.5*PI);
  //translate(444,444);
  beginShape();
  for(int i=0;i<count;i++){
   float u=i*off;
    stroke(u,255,255);
    float x=cos(u)*(exp(cos(u))-2*cos(4*u)-pow(sin(u/12.0),5.0));
    float y=sin(u)*(exp(cos(u))-2*cos(4*u)-pow(sin(u/12.0),5.0));
    vertex(60*x,60*y);
  }
  endShape();
}