PImage pic;

class Fire{
  float x;
  float y;
  float s;
  boolean mouse;
  boolean out=false;
  
  Fire(float tempX, float tempY, float tempS){
    x=tempX;
    y=tempY;
    s=tempS;
  }
  
  void display(){
    pic = loadImage("fire.png");
    if(mouse==false || out==false){
      image(pic, x, y, s, s);
    }
    else{
      s=0;
      x=-1000;
      y=-1000;
      image(pic, x, y, s, s);
    }
  }
  
  void burn(){
    x+=random(-2,2);
    y+=random(-2,2);
  }
  
  void out(int mx, int my){
    if((mx>(x-.75*s) && mx<(x+.75*s)) && (my>(y-.75*s) && my<(y+.75*s))){
      mouse=true;
      out=true;
    }
    else{
      mouse=false; 
    }
  }
}
