PImage iceBlock;

class Ice{
  float x;
  float y;
  float s;
  boolean on;
  boolean lost;
  
  Ice(float tempX, float tempY, float tempS){
    x=tempX;
    y=tempY;
    s=tempS;
    lost=false;
  }
  
  void display(){
    iceBlock = loadImage("Ice.png");
    iceBlock.resize(0,50);
    image(iceBlock, x, y);
  }
  
  void travel(int posX, int posY){
    if(x<width && on==true){
      x-=s;
    }
    else{
      x+=s;
    }
    if(x>width){
      lost=true; 
    }
  }
  
  void onIce(int bposX, int bposY){
    if((bposX>(x-100) && bposX<(x+100)) && (bposY>(y-100) && bposY<(y+100))){
      on=true;
    }
    else{
      on=false; 
    }
  }
  
  
}
