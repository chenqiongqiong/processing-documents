class apple{
  float x,y;
  
  apple(){
   x=random(30,width-30);
   y=random(30,height-30);
  }
  
  
  
  void display(){
    image(img_apple,x,y);
  }
}