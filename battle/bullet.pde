class bullet {
  PVector location;
  PVector velocity=new PVector(0, 0);
  PVector acce=new PVector(mouseX-width/2, mouseY-height);
  PVector acce2=PVector.div(acce, 1000);
  PShape s, outer, inner;
  PVector x=new PVector(0, 10);
  PVector mou=new PVector(mouseX-width/2, -mouseY+height); 
  float theta=PVector.angleBetween(mou, x);

  bullet() {
    mou.normalize();
    mou.mult(300);
    location=new PVector(width/2+mou.x, height-mou.y);
  }

  boolean isDead() {
    if (location.x<0||location.x>width||location.y<0) {      
      return true;
    } else {
      return false;
    }
  }

  boolean isShot() {
    color c=get((int)(location.x), (int)(location.y));   
    float red=red(c);    
    if (red==255) {
      return true;
    } else {
      return false;
    }
  }

  void update() {    
    velocity.add(acce2);
    location.add(velocity);   
    s=createShape(GROUP);

    outer=createShape(ELLIPSE, location.x, location.y, 20, 20);
    outer.setFill(color(0, 255, 233));

    inner=createShape();
    inner.setStroke(color(255));
    inner.setStrokeWeight(5);
    inner.beginShape();

    inner.noFill();
    inner.vertex(location.x-4, location.y-4);
    inner.vertex(location.x+4, location.y-4);
    inner.vertex(location.x+4, location.y+4);
    inner.vertex(location.x-4, location.y+4);


    inner.endShape(CLOSE);

    //s.addChild(outer);
    s.addChild(inner);
  }

  void display() {
    pushMatrix();
    //rotate(theta);
    shape(s);
    popMatrix();
  }
}