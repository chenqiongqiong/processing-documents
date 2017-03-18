import peasy.*;


PeasyCam cma;
ArrayList<PVector> points;

float dx, dy, dz;
float x, y, z;
float dt;
float a, b, c;
float col;
float rotate;
boolean x_y;

void setup() {
  size(888, 888, P3D);  
  x_y=false;
  cma=new PeasyCam(this, 500);
  points=new ArrayList<PVector>();
  a=5;
  b=28;
  c=8.0/3.0;
  dt=0.022;

  rotate=0;

  x=0.1;
  y=6.5;
  z=1.6;

  colorMode(HSB);
  strokeWeight(4);
  stroke(225);
}

void draw() {
  background(0);
  //text(points.size(),-200,-200);
  
  rotate+=0.04;
  if (x_y) {  
    rotateY(rotate+3*sin(rotate));
  } else {
    rotateY(0.4);
    rotateX(rotate+3*sin(rotate));
  }
  
  if (points.size()<1000) {
    dx=a*(y-x)*dt;
    dy=(x*(b-z)-y)*dt;
    dz=(x*y-c*z)*dt;
    x+=dx;
    y+=dy;
    z+=dz;
    points.add(new PVector(x, y, z));
  } else {
    for (int i=points.size()-1; i>=0; i--) {
      points.remove(i);
    }
    a+=0.5;
    if(x_y){
      x_y=false;
    }else{
      x_y=true;
    }
  }

  col=0;
  for (PVector v : points) {    
    col+=0.2;
    stroke(col, 255, 255);
    if (col>255) {
      col=0;
    }
    point(v.x, v.y, v.z);
  }
}