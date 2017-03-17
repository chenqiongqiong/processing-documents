import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
ArrayList<ball> balls;
ArrayList<board> boards;
ArrayList<unit> units;

float disX, disY;

void setup() {
  size(888, 888);
  box2d=new Box2DProcessing(this);
  box2d.createWorld();
  balls=new ArrayList<ball>();
  boards=new ArrayList<board>();
  units=new ArrayList<unit>();
  
  //show many points that get in the way of the balls 
  disX=25;
  disY=30;
  for (int i=0; i<16; i++) {
    float x0=width/2-disX*i;
    float y=70+disY*i;
    for (int j=0; j<i+1; j++) {
      float x=x0+j*disX*2;
      boards.add(new board(x, y, 8, 20));
    }
  }
  
  //*****
  float x0=45;
  for(int i=0;i<17;i++){
    float x=x0+i*50;
    units.add(new unit(x,860,40,10));
    units.add(new unit(x-25,825-110,10,300));
    if(i==16){
     x=x0+(i+1)*50;
     units.add(new unit(x-25,825-110,10,300));
    }
  }
  
}

void draw() {
  background(0);
  box2d.step();

  if (frameCount%75==1) {
    balls.add(new ball(width/2, 30, 6));
  }
  for (int i=balls.size()-1; i>=0; i--) {
    ball b=balls.get(i);
    b.display();
  }
  for (board b : boards) {
    b.display();
  }
  for(unit u:units){
   u.display(); 
  }
  
}
