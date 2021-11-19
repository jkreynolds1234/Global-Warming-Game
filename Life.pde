PImage life;

class Life{
  int x;
  int y;
  int startLevel3;
  int startLevel1;
  int startLevel2;
  
  Life(int tempX, int tempY){
    x=tempX;
    y=tempY;
    startLevel3=0;
    startLevel1=0;
  }
  
  void display(){
    life = loadImage("heart.png");
    life.resize(0,40);
    image(life, x, y);
  }
  
}
