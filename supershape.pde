import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;


PeasyCam cam;
int count;
float off1, off2;
float angle;
float m_, n1_, n2_, n3_;
boolean pause;
float[][] array;
int record;


void setup() {
  size(999, 888, P3D);
  cam=new PeasyCam(this, 500);
  pause=false;
  array=new float[100][4];

  count=70;
  off1=2*PI/count;
  off2=PI/count;
  strokeWeight(3);
  noFill();
  colorMode(HSB);
  angle=0;
  record=0;

  m_=random(0, 10);
  n1_=random(-80, 80);
  n2_=random(-80, 80);
  n3_=random(-80, 80);
  println(m_+" "+n1_+" "+n2_+" "+n3_);

  m_=4;
  n1_=21;
  n2_=-60;
  n3_=-68;
}

void draw() {  
  background(0);

  if (frameCount%110==0) {
    if (!pause) {
      m_=random(0, 10);
      n1_=random(-80, 80);
      n2_=random(-80, 80);
      n3_=random(-80, 80);
      println(m_+" "+n1_+" "+n2_+" "+n3_);
    }
  }


  rotateY(angle/3.7);
  rotateX(0.2*sin(angle/7.3));
  angle+=0.1;

  stroke(angle%255, 255, 255);

  for (float theta=-PI; theta<=PI; theta+=off1) {  
    for (float fi=-HALF_PI; fi<=HALF_PI; fi+=off2) {
      float r1=rad(theta, m_, n1_, n2_, n3_);
      float r2=rad(fi, m_, n1_, n2_, n3_);

      float x=r1*cos(theta)*r2*cos(fi);
      float y=r1*sin(theta)*r2*cos(fi);

      //float x=cos(theta)*(r1+r2*cos(fi));
      //float y=sin(theta)*(r1+r2*cos(fi));

      float z=r2*sin(fi);
      PVector v=new PVector(x, y, z);
      v.normalize();
      v.mult(160);

      point(v.x, v.y, v.z);
    }
  }
}


float rad(float ang, float m, float n1, float n2, float n3) {
  float a=1;
  float b=1;

  float r1=pow(abs((1/a)*cos((m/4)*ang)), n2);
  float r2=pow(abs((1/b)*sin((m/4)*ang)), n3);
  float r=pow(r1+r2, -(1/n1));
  return r;
}

void mouseClicked() {
  if (mouseButton==LEFT) {
    if (pause) {
      pause=false;
    } else {
      pause=true;
    }
  } else  if (mouseButton==RIGHT) {
    array[record][0]=m_;
    array[record][1]=n1_;
    array[record][2]=n2_;
    array[record][3]=n3_;
    record++;
  }
}
