class planet {
  PShape globe;
  PImage surface;//表面图像
  PImage moon_surface;
  float radius;//星球半径
  float r_move;//运行半径
  float rotate_speed;//公转速度
  float rotate_angle;//公转角度
  float revolve_speed;//自转速度
  float revolve_angle;//自转角度
  float incline;//与公转平面的垂直倾斜量
  
  
  //satellite satellite;
  ArrayList<satellite> satellites=new ArrayList<satellite>();//卫星列表

  void show() {
    pushMatrix();
    translate(width/2, height/2);
    rotate_angle+=rotate_speed;
    revolve_angle+=revolve_speed;
    rotateY(rotate_angle);//公转
    translate(r_move,0+incline*sin(rotate_angle) );//变换公转位置 
    rotateY(revolve_angle);//自传
    shape(globe);
    for(satellite s:satellites){
      s.show();
    }
    popMatrix();
  }

  planet(PImage s_surface,PImage surface_, float r, float r_m,int count) {
    radius=r;
    noStroke();
    globe=createShape(SPHERE, radius);

    surface=surface_;
    globe.setTexture(surface);

    r_move=r_m;  
    rotate_speed=random(-0.05, 0.05);
    revolve_speed=random(-0.1, 0.1);
    rotate_angle=random(0, 2*PI);
    revolve_angle=random(0, 2*PI);
    incline=random(-100, 100);
    
   
    
    
    for(int i=0;i<count;i++){
      satellites.add(new satellite(s_surface,random(10,30),30));
    }
  }
}
