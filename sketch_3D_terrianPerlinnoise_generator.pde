int scl;
int w, h;
int cols, rows;
float flying=0;
float [][] high;

void setup() {
  w=1000;
  h=800;
  size(1200, 900, P3D);
  scl=20;
  cols=width/scl;
  rows=height/scl;
  high=new float[cols][rows];
}

void draw() {
  background(#26CDED);
  lights();
  //fill(0,255,0);
  translate(0, height/2-150);
  rotateX(PI/3);
  //noStroke();
  flying-=0.1;
  //float yoff=0;
  float yoff=flying;
  for (int y=0; y<rows-1; y++) {
    float xoff=0;
    for (int x=0; x<cols; x++) {
      high[x][y]=map(noise(xoff, yoff), 0, 1, -40, 180);
      xoff+=0.15;
    }
    yoff+=0.15;
  }

  for (int y=0; y<rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x=0; x<cols; x++) {
      vertex(x*scl, y*scl, high[x][y]);
      vertex(x*scl, (y+1)*scl, high[x][y+1]);
    }
    endShape();
  }

  
  
  
}