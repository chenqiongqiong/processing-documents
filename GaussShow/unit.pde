class unit {
  Body body;
  float x, y;
  float w1,h1;

  unit(float x_,float y_,float w,float h) {
    w1=w;
    h1=h;
    
    x=x_;
    y=y_;
    
    BodyDef bd=new BodyDef();
    bd.type=BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body=box2d.createBody(bd);
    
    PolygonShape ps1=new PolygonShape();
    float b_w1=box2d.scalarPixelsToWorld(w1/2);
    float b_h1=box2d.scalarPixelsToWorld(h1/2);
    ps1.setAsBox(b_w1,b_h1);
       
    body.createFixture(ps1,1);
    
  }
  
  void display(){
    rectMode(CENTER);
    fill(30,214,229);
    rect(x,y,w1,h1);
    
  }
}