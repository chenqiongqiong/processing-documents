class ball {
  Body body;
  float radius;
  float r, g, b;

  ball(float x, float y,float r_) {
    
    radius=r_;
    do{
      r=random(0,255);
      g=random(0,255);
      b=random(0,255);
    }while(r<50&&g<50&&b<70);
    
    BodyDef bd=new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    bd.type=BodyType.DYNAMIC;
    body=box2d.createBody(bd);

    CircleShape circle=new CircleShape();
    circle.m_radius=box2d.scalarPixelsToWorld(radius);
    
    FixtureDef fd=new FixtureDef();
    fd.shape=circle;
    fd.restitution=0.21;
    fd.friction=0.5;
    fd.density=11;

    body.createFixture(fd);
    body.setAngularVelocity(random(-2,2));
  }

  void display() {
    Vec2 pos=box2d.getBodyPixelCoord(body);

    pushMatrix();
    translate(pos.x, pos.y);
    fill(r,g,b);
    noStroke();
    ellipseMode(RADIUS);
    ellipse(0,0,radius,radius);
    popMatrix();
  }
}