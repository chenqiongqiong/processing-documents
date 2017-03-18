class tower {
  float x, y;
  
  tower(float x_,float y_){
   x=x_;
   y=y_;
  }

  void display() {
    stroke(255, 255, 0);
    strokeWeight(5);
    fill(255, 255, 255); 
    ellipse(x, y, 88, 88);
  }
  
  
  
}