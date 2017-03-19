import processing.sound.*;

ArrayList<PVector> position;
PImage img_apple;
apple a;
SoundFile eaten; 
SoundFile up;

float  xsp, ysp;
float x, y;
int speed;
int count;
int direction;
boolean pause;


void setup() {
  size(666, 666);
  pause=false;
  eaten=new SoundFile(this, "eaten.mp3");
  up=new SoundFile(this, "up.mp3");
  img_apple=loadImage("222.png");
  a=new apple();
  float rand=random(0, 1);
  speed=26;
  count=1;
  if (rand<0.25||rand==0.25) {
    xsp=speed;
    ysp=0;
    direction=2;
  } else if (rand>0.25&&rand<0.5) {
    xsp=-speed;
    ysp=0;
    direction=4;
  } else if (rand>0.5&&rand<0.75) {
    xsp=0;
    ysp=speed;
    direction=3;
  } else {
    xsp=0;
    ysp=-speed;
    direction=1;
  }

  x=width/2;
  y=height/2;
  position=new ArrayList<PVector>(); 
  position.add(new PVector(width/2, height/2));

  rectMode(CENTER);
  stroke(0);
  imageMode(CENTER);
}

void draw() {
  frameRate(difficulty());
  background(133);

  if (!pause) {
    x+=xsp;
    y+=ysp;
  }

  if (eat()) {
    eaten.play();
    count++; 
    a.x=random(15, width-15);
    a.y=random(15, height-15);
  }
  a.display();

  if (touch_wall()) {
    exit();
  }

  if (!pause) {
    if (!position.contains(new PVector(x, y))) {
      position.add(new PVector(x, y)) ;
    } else {
      exit();
    }
  }

  if (position.size()>count) {
    for (int i=0; i<position.size()-count; i++) {
      position.remove(i);
    }
  }
  for (int i=position.size()-1; i>=0; i--) {
    float col=map(i, 0, position.size(), 0, 255);
    fill(col, 255, 255-col);
    rect(position.get(i).x, position.get(i).y, 26, 26);
  }

  fill(255);
  textSize(30);
  text(count-1, 10, 30);
}

void keyPressed() {

  if (key=='p'||key=='P') {
    if (!pause) {
      pause=true;
    } else {
      pause=false;
    }
  }


  if (key==CODED) {
    if (keyCode==UP&&direction!=3) {
      xsp=0;
      ysp=-speed;
      direction=1;
    } else if (keyCode==DOWN&&direction!=1) {
      xsp=0;
      ysp=speed;
      direction=3;
    } else if (keyCode==LEFT&&direction!=2) {
      xsp=-speed;
      ysp=0;
      direction=4;
    } else if (keyCode==RIGHT&&direction!=4) {
      xsp=speed;
      ysp=0;
      direction=2;
    }
  }
}

boolean eat() {
  PVector p=position.get(position.size()-1);
  if (abs(p.x-a.x)<28&&abs(p.y-a.y)<28) {
    return true;
  } 
  return false;
}

boolean touch_wall() {
  PVector p=position.get(position.size()-1);
  if (p.x<13||p.x>(width-13)||p.y<13||p.y>(height-13)) {
    return true;
  }
  return false;
}

int difficulty() {
  if (count>0&&count<5) {
    return 2;
  } else if (count>4&&count<10) {
    return 3;
  } else if (count>9&&count<15) {
    return 4;
  } else if (count>14&&count<20) {
    return 5;
  } else if (count>19&&count<25) {
    return 6;
  } else if (count>24&&count<30) {
    return 7;
  } else if (count>29&&count<35) {
    return 8;
  } else if (count>34&&count<40) {
    return 9;
  } else {
    return 10;
  }
}
