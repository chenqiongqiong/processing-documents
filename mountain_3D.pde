
int scl;
int cols, rows;
int w, h;
float high[][];
float speed;
float yoff=0;

void setup() {
  frameRate(44);
  size(1488,888, P3D); 
  w=1488;
  h=888;
  scl=20;
  cols=w/scl;
  rows=h/scl;
  background(0);
  
  high=new float[cols][rows];
  speed=0;
  
  //+++++
  
  for (int y=0; y<rows-1; y++) {
    float xoff=0;
    for (int x=0; x<cols; x++) {
      high[x][y]=map(noise(xoff, yoff), 0, 1, -100, 190);
      xoff+=0.1;
    }
    yoff+=0.1;
  }
  noStroke();
  
}

void draw() {
  //camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, speed, 0, 0, 1, 0);
  background(#69AAD1);
  lights();
  speed-=0.1;
  translate(-0, height/2.0);
  rotateX(PI/3);
  
  
  //******************
  yoff+=0.1;
  float xoff = 0;
  for(int i = rows-2;i > 0;i--){
   for(int j = 0;j < cols;j++)
     high[j][i] = high[j][i-1];
  }
  for (int x=0; x<cols; x++) {
      high[x][0]=map(noise(xoff, yoff), 0, 1, -100, 190);
      xoff+=0.1;
  }
  //******************
  for (int y=0; y<rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    
    for (int x=0; x<cols; x++) {
      float fil=map(high[x][y],-100,190,0,255);  
      fill(0,fil,0);
      vertex(x*scl, (y)*scl, high[x][y]);
      vertex(x*scl, (y+1)*scl, high[x][y+1]);
    }
    endShape();
  }
}