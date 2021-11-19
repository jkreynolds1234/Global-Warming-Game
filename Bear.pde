PImage bear;

class Bear{
  int x;
  int y;
  
  Bear(int tempX, int tempY){
    x=tempX;
    y=tempY;
  }
  
  void display(){
    bear = loadImage("bear.png");
    bear.resize(0,60);
    image(bear, x, y);
  }
  
  void travel(){
    if(key==CODED){
      if(keyCode==LEFT){
        if(x>0){
          x-=20;
        }
      }
      if(keyCode==RIGHT){
        if(x<width-20){
          x+=20;
        }
      } 
    }
  }
  
}
