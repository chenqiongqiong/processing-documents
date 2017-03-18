import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;
float angle;

void setup() {
  size(888, 888, P3D);
  cam=new PeasyCam(this, 500);
  strokeWeight(3);
  noFill();
  colorMode(HSB);
  angle=0;
}

void draw() {
  background(0);
  //translate(444, 444);
  angle+=0.03;
  
  float r=100+50*sin(angle);
  float col=(angle*12)%255;
  
  rotateX(angle*0.71);
  rotateY(angle*1.7);
  rotateZ(angle*0.03);
  

  for (float radius=0; radius<=r; radius+=1) {

    float [] y1=new float [201];
    float [] y2=new float [201];

    for (float x=-1; x<=1; x+=0.01) {
      float y=pow(sq(x), 1.0/3.0);//***********************
      float tem=sqrt(1-sq(x));

      int i;
      if (x==-1) {
        i=(int)((1.0+x)*100);
      } else {
        i=(int)((1.0+x)*100)+1;
      }

      y1[i]=y-tem;
      y2[i]=y+tem;
    }


    beginShape();
    for (float x=-1; x<=1; x+=0.01) {
      int i;
      if (x==-1) {
        i=(int)((1.0+x)*100);
      } else {
        i=(int)((1.0+x)*100)+1;
      }
      stroke(col, 255, r+100);
      vertex(radius*x, -radius*y2[i]);
    }
    endShape();   

    beginShape();
    for (float x=-1; x<=1; x+=0.01) {
      int i;
      if (x==-1) {
        i=(int)((1.0+x)*100);
      } else {
        i=(int)((1.0+x)*100)+1;
      }
      stroke(col, 255, r+100);
      vertex(radius*x, -radius*y1[i]);
    }
    endShape();
  }
}