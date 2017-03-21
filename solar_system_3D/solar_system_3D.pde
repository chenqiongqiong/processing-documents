import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;


PeasyCam c;

planet earth,mercury,jupiter;

PImage[] surfaces;
PImage moon_surface;
int count;//行星的卫星数量

void setup() {
  size(888, 666, P3D); 
  //c=new PeasyCam(this,500);
  surfaces=new PImage[10];
  surfaces[0]=loadImage("earth.jpg");
  surfaces[1]=loadImage("moon.jpg");
  surfaces[2]=loadImage("mercury.jpg");
  surfaces[3]=loadImage("satellite.jpg");
  surfaces[4]=loadImage("jupiter.jpg");
  
  count=(int)random(4);
  earth=new planet(surfaces[1],surfaces[0], 20, 200,1);
  mercury=new planet(surfaces[3],surfaces[2], 20, 180,count);
  jupiter=new planet(surfaces[3],surfaces[4],18,140,count);
  
}


void draw() {
  background(0);
  //lights();
  earth.show();
  mercury.show();
  jupiter.show();
  
}
