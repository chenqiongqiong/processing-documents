class  enemy {
  
  float x, y;
  PShape japanese, head, body, arm1, arm2, leg1, leg2;

  enemy() {
    x=random(44, width-44);
    y=random(70, height-370);
    japanese=createShape(GROUP);
    head=createShape(ELLIPSE, x, y-15, 30, 30); 
    head.setFill(color(255, 0, 0));
    body=createShape(TRIANGLE, x, y, x+30, y+50, x-30, y+50);
    body.setFill(color(2, 255, 2));
    arm1=createShape(LINE, x+10, y+15, x+50, y+44);
    arm1.setStroke(color(225));

    arm1.setStrokeWeight(6);
    arm2=createShape(LINE, x-10, y+15, x-50, y+44);
    arm2.setStroke(color(222));
    arm2.setStrokeWeight(6);
    leg1=createShape(LINE, x+15, y+45, x+15, y+110);
    leg1.setStroke(color(225));
    leg1.setStrokeWeight(6);
    leg2=createShape(LINE, x-15, y+45, x-15, y+110);
    leg2.setStroke(color(225));
    leg2.setStrokeWeight(6);

    japanese.addChild(head);
    japanese.addChild(body);
    japanese.addChild(arm1);
    japanese.addChild(arm2);
    japanese.addChild(leg1);
    japanese.addChild(leg2);
  }
  void display() {
    shape(japanese);
  }

  boolean isShot(bullet b) {
    PVector dis=new PVector(b.location.x-x, b.location.y-(y-15));
    if (dis.mag()<24) {
      return true;
    } else {
      return false;
    }
  }

  boolean isShot() {
    return true;
  }

}

class boss extends enemy {
  int strong=0;
  
  boss() {
    super();
    body.setFill(color(#D51DF2));
  }

  boolean isShot(bullet b) {   
    PVector dis=new PVector(b.location.x-x, b.location.y-(y-15));
    if (dis.mag()<24) {
      strong++;
      return true;
    } else {
      return false;
    }
  }

  boolean isShot() {  
    if (strong==3) {
      return true;
    } else {
      return false;
    }
  }
  
}