class satellite {
  PShape globe;
  PImage surface;//表面图像
  float radius;//星球半径
  float r_move;//运行半径
  float rotate_speed;//公转速度
  float rotate_angle;
  float revolve_speed;//自传速度
  float revolve_angle;
  float incline;
  float tint_;

  void show() {
    rotate_angle+=rotate_speed;
    revolve_angle+=revolve_speed;
    rotateY(rotate_angle);
    translate(r_move, 0+incline*sin(rotate_angle));
    rotateY(revolve_angle);
    tint(tint_,tint_,tint_);
    shape(globe);    
  }

  satellite(PImage surface_, float r, float r_m) {
    radius=r;
    noStroke();
    globe=createShape(SPHERE, radius);
    tint_=random(255);

    surface=surface_;
    
    globe.setTexture(surface);

    r_move=r_m;  
    rotate_speed=random(-0.05, 0.05);
    revolve_speed=random(-0.05, 0.05);
    rotate_angle=random(0, 2*PI);
    revolve_angle=random(0, 2*PI);
    incline=random(-50, 50);
  }
}
