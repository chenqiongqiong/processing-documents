class board {
  Body body;
  float w, h;
  float x,y;

  board(float xx, float yy,float w_, float h_ ) {
    w=w_;
    h=h_;
    x=xx;
    y=yy;

    BodyDef bd=new BodyDef();
    bd.type=BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body=box2d.createBody(bd);

    PolygonShape ps =new PolygonShape();
    float b_w=box2d.scalarPixelsToWorld(w/2);
    float b_h=box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(b_w,b_h);
    
    body.createFixture(ps,1);
  }
  
  void display(){
    noStroke();
    fill(181,229,37);
    rectMode(CENTER);
    rect(x,y,w,h);
  }
}