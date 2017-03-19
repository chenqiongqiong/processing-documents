class unit {
  PVector loc;
  PVector vel;
  PVector acc;
  float life=100;
  PImage ima;
  float life_speed=random(0.6,1);

  void update() {
    vel.add(acc);
    loc.add(vel);
    life-=life_speed;
  }

  void render() {
    tint(255, life);
    image(ima, loc.x, loc.y);
  }

  boolean isDead() {
    if (life<=0) {
      return true;
    } else {
      return false;
    }
  }

  unit(PImage image,PVector loca) {
    ima=image;
    acc=new PVector(0, -0.07);    
    vel=new PVector(random(-1,1),random(-0.5,1));
    loc=loca.copy();
  }
}

ArrayList<unit> units;
PImage smoke;
PVector origin;

void setup() {
  smoke=loadImage("texture.png");
  size(888,888);
  units=new ArrayList<unit>();
  origin=new PVector(width/2,700);
}

void draw() {
  background(0);
  units.add(new unit(smoke,origin));
  for(int i=units.size()-1;i>=0;i--){
    unit micro=units.get(i);
    micro.update();
    micro.render();
    if(micro.isDead()){
      units.remove(i);
    }
  }
}