class Wall{
  int x1;
  int x2;
  int y1;
  int y2;
  
  Wall(int tempx1, int tempy1, int tempx2, int tempy2){
    x1=tempx1;
    x2=tempx2;
    y1=tempy1;
    y2=tempy2;
  }
  
  void display(){
    stroke(#c7c6c5);
    strokeWeight(8);
    line(x1,y1,x2,y2);
  }
  
}
