PImage waterFaucet;

class Faucet{
  float x;
  float y;
  boolean onFaucet;
  
  Faucet(float tempX, float tempY){
    x=tempX;
    y=tempY;
  }
  
  void display(){
    waterFaucet = loadImage("faucet.png");
    if(onFaucet==false){
      waterFaucet.resize(0,100);
      image(waterFaucet, x, y);
    }
    else{
      x=-1000;
      y=-1000;
      waterFaucet.resize(0,100);
      image(waterFaucet, x, y);
    }
  }
  
  void off(int mx, int my){
    if((mx>(x-50) && mx<(x+50)) && (my>(y-50) && my<(y+50))){
      onFaucet=true;
      
    }
    else{
      onFaucet=false; 
    }
  }
  
  
}
