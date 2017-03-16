import processing.sound.*;

SoundFile warning;
SoundFile tututu;
SoundFile wow;
SoundFile pong;
SoundFile dead;
gun weapon;
ArrayList<enemy> japans;
ArrayList<bullet> attacks;
int shot_enemy, miss;
float mills,stop,reset;
boolean isDead;

void setup() { 
  textSize(30);
  shot_enemy=0;
  miss=0;
  stop=0;
  reset=0;
  size(1377, 777, P2D);
  isDead=true;
  weapon=new gun();
  japans=new ArrayList<enemy>();
  attacks=new ArrayList<bullet>();
  warning=new SoundFile(this, "warning.mp3");
  tututu=new SoundFile(this, "tututu.mp3");
  wow=new SoundFile(this, "wow.mp3");
  pong=new SoundFile(this, "pong.mp3");
  dead=new SoundFile(this, "dead.mp3");
}

void mouseClicked() {
  attacks.add(new bullet());
  tututu.play();
}

boolean enemy_full() {
  int life=japans.size();
  if (life*4>width-1000) {
    return true;
  } else {
    return false;
  }
}

boolean bullet_empty() {
  if (width-1000-(shot_enemy+miss)<0) {
    return true;
  } else {
    return false;
  }
}

void reset() {
  for (int i=japans.size()-1; i>=0; i--) {
    japans.remove(i);
  }
  shot_enemy=0;
  miss=0;
}

void warning_play() {
  if ((frameCount%2700-reset)==1) {
    warning.play();
  }
}

void draw() {
  mills=millis();
  warning_play();

  background(0);
  weapon.display();
  int life=japans.size();
  float r=random(0, 10); 
  if (r<0.38) {
    if (r<0.06) {
      japans.add(new boss());
    }
    japans.add(new enemy());
  }

  for (int i=japans.size()-1; i>=0; i--) {
    enemy j=japans.get(i);
    j.display();
    for (int n=attacks.size()-1; n>=0; n--)
      if (j.isShot(attacks.get(n))) {
        shot_enemy++;
        attacks.remove(n);
        if (j.isShot()) {
          japans.remove(i);
          wow.play();
        }
      }
  }

  for (int i=attacks.size()-1; i>=0; i--) {
    bullet b=attacks.get(i);
    b.update();
    b.display();
    if (b.isDead()) {
      miss++;
      attacks.remove(i);
      pong.play();
    }
  }

  if (keyPressed) {
    if (key=='M') {
      for (int i=japans.size()-1; i>=0; i--) {
        japans.remove(i);
      }
    }
  }

  fill(255);
  text("current enemies:"+japans.size(), 100, 650);
  text("shot:"+shot_enemy, 100, 700);
  text("miss:"+miss, 100, 750);
  text("warning!", 850, 760);
  text("bullet", 850, 660);

  fill(255);
  rect(1000, 720, width-1000, height-720);
  fill(255, 0, 0);
  rect(1000, 720, life*4, 57);

  fill(255);
  rect(1000, 620, width-1000, height-720); 
  fill(#310FF7);
  rect(1000, 620, width-1000-(shot_enemy+miss), 57);

  if (enemy_full()||bullet_empty()) {
    warning.stop();
    if (isDead) {
      stop=frameCount;
      isDead=false;
    }
    if((frameCount-stop)%425==0){
      dead.play();
    }
    if (frameCount%60>30) {
      background(255, 0, 0);
    } else {
      background(255, 255, 0);
    }
    if (keyPressed) {
      if (key=='R') {
        dead.stop();        
        reset();
        reset=frameCount;
      }
    }
  }
}
