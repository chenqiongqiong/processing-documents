import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
ArrayList<player> players;
ArrayList<enemy> enemies;
boolean isChoose=false;
float startX, startY, endX, endY;
tower[] towers ;

void setup() {
  size(1554, 888);
  box2d=new Box2DProcessing(this);
  box2d.createWorld();
  players=new ArrayList<player>();
  enemies=new ArrayList<enemy>();
  towers=new tower[7];

  towers[0]=new tower(200, 333);
  towers[1]=new tower(200, 666);
  towers[2]=new tower(750, 200);
  towers[3]=new tower(750, 500);
  towers[4]=new tower(750, 800);
  towers[5]=new tower(1300, 333);
  towers[6]=new tower(1300, 666);
}

void draw() {
  box2d.step();
  background(0);
  chooseRect();
  towers[0].display();
  towers[1].display();
  towers[2].display();
  towers[3].display();
  towers[4].display();
  towers[5].display();
  towers[6].display();
  if (frameCount%55==1) {
    float ran=random(0, 1);
    if (ran>0.5) {
      players.add(new player(towers[0].x, towers[0].y));
      enemies.add(new enemy(towers[5].x, towers[5].y));
    } else {
      players.add(new player(towers[1].x, towers[1].y));
      enemies.add(new enemy(towers[6].x, towers[6].y));
    }
  }
  for (player p : players) {
    p.display();
    p.isChosen();
    p.mouseClicked();
  }
  for (int i=enemies.size()-1; i>=0; i--) {
    enemy e=enemies.get(i);
    for (int j=players.size()-1; j>=0; j--) {
      if (e.kill(players.get(j))) {
        enemies.remove(i);
        
        players.remove(j);
        break;
      }
      
    }
    e.display();
  }
}

void mouseClicked() {
  if (mouseButton==LEFT) {
    if (isChoose) {
      endX=mouseX;
      endY=mouseY;
      isChoose=false;
    } else {
      isChoose=true;
      startX=mouseX;
      startY=mouseY;
    }
  }
}

void chooseRect() {
  if (isChoose) {
    noFill();
    strokeWeight(3);
    stroke(233, 222, 222);
    rect(startX, startY, mouseX-startX, mouseY-startY);
  }
}
