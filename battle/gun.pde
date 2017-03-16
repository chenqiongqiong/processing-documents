class gun {
  PShape sh;
  PVector x=new PVector(0, 10);
  PImage img = loadImage("MICAI.png");
  gun() {

    sh=createShape();
    sh.beginShape();
    sh.texture(img);
    sh.noStroke();
    sh.vertex(0, 0, 0, 0);
    sh.vertex(50, 0, 25, 0);
    sh.vertex(50, -200, 25, 50);
    sh.vertex(0, -300, 0, 50);
    sh.vertex(-50, -200, 25, 50);
    sh.vertex(-50, 0, 50, 0);
    sh.endShape();
  }

  void display() {
    
    pushMatrix();
    translate(width/2, height);
    PVector mouse=new PVector(mouseX-width/2, -mouseY+height); 
    float theta=PVector.angleBetween(mouse, x);
    if (mouseX-width/2>=0) {
      rotate(theta);
    } else {
      rotate(-theta);
    }      
    shape(sh);
    popMatrix();
  }
}