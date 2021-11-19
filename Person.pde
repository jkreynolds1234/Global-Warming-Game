PImage player;

class Person{
  int x;
  int y;
  int sp;
  
  Person(int tempX, int tempY){
    x=tempX;
    y=tempY;
    sp=40;
  }
  
  void display(){
    player = loadImage("person.png");
    player.resize(0,40);
    image(player, x, y);
  }
  
  void travel(Wall[]wallArray){
    boolean canMove=true;
    if(key==CODED){
      if(keyCode==LEFT){
        for(int i=0; i<wallArray.length; i++){
          //If wall vertical
          if(wallArray[i].x1==wallArray[i].x2){
            if (x>=wallArray[i].x1 && x-sp<wallArray[i].x1){
              if(y>=wallArray[i].y1 && y<=wallArray[i].y2){
                canMove=false;
              }
            }
          }
        }
        if(canMove==true){
          if(x>sp){
            x-=sp;
          }
        }
      }
      if(keyCode==RIGHT){
        for(int i=0; i<wallArray.length; i++){
          //if wall vertical
          if(wallArray[i].x1==wallArray[i].x2){
            if(x<=wallArray[i].x1 && x+sp>wallArray[i].x1){
              if(y>=wallArray[i].y1 && y<=wallArray[i].y2){
                canMove=false;
              }
            }
          }
        }
        if(canMove==true){
          if(x<width-sp){
            x+=sp;
          }
        }
      } 
      if(keyCode==UP){
        for(int i=0; i<wallArray.length; i++){
            //If wall vertical
            if(wallArray[i].y1==wallArray[i].y2){
              if (y>=wallArray[i].y1 && y-20<wallArray[i].y1){
                if(x>=wallArray[i].x1 && x<=wallArray[i].x2){
                  canMove=false;
                }
              }
            }
          }
          if(canMove==true){
            if(y>sp){
              y-=sp;
            }
          }
      }
      if(keyCode==DOWN){
         for(int i=0; i<wallArray.length; i++){
          //if wall horizontal
          if(wallArray[i].y1==wallArray[i].y2){
            if(y<=wallArray[i].y1 && y+sp>wallArray[i].y1){
              if(x>=wallArray[i].x1 && x<=wallArray[i].x2){
                canMove=false;
              }
            }
          }
        }
        if(canMove==true){
          if(y<height-sp){
            y+=sp;
          }
        }
      }
    }
  }
}
