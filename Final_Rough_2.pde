/* SAVE THE WORLD (FROM GLOBAL WARMING)
   Final Project
   Jenna Reynolds
   DES 111
*/

// Window backgrounds and control variable
PImage w1, w2, w3, w4, w5, w6, w7, w8;
int windowStatus;

//Level 1 variables
PImage map, drop, hillsBG;
int increment=50;
int inc = 1;
int outCount=0;
int arraySize=9;
int win=arraySize;
int lifeCount=3;
int interval=3000;
int timer=1;
Fire [] fires=new Fire[arraySize];
Life [] lives= new Life[3];

//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

//Level 2 variables
PImage floor;
Person player2;
Faucet [] faucets=new Faucet[6];
Life [] lives2= new Life[3];
Wall [] walls= new Wall[8];
int lifeCount2=3;
int time=40;
int outCount2;
int startLevel3;

//Level 3 variables
PImage ocean;
Ice [] iceBlocks=new Ice[5];
Life [] lives3= new Life[3];
Bear player3;
int interval3=5000;
int newIce=0;
int count=0;
int lifeCount3=3;
int lostCount=0;

//================================================================================


void setup(){
  size(800,800);
  
  //Setup for windows
  windowStatus=0;
  w1=loadImage("windows.jpg");
  w2=loadImage("windows2.jpg");
  w3=loadImage("windows3.jpg");
  w4=loadImage("windows4.jpg");
  w5=loadImage("windows5.jpg");
  w6=loadImage("windows6.jpg");
  w7=loadImage("windows7.jpg");
  w8=loadImage("windows8.jpg");
  
  //Setup for level 1
  map = loadImage("map.png");
  drop=loadImage("water.png");
  hillsBG = loadImage("hills.jpg");
  //Lives
  for(int i=0; i<lives.length; i++){
    lives[i]=new Life(30+50*(i),75); 
  }
  // Split map into 3 rectangles, setup with 3 fires per area
  for(int i=0; i<arraySize/3; i++){
    fires[i] = new Fire(random(280,420), random(75,250), increment);
    increment+=10;
  }
  
  increment=50;
  for(int i=3; i<2*(arraySize/3); i++){
    fires[i] = new Fire(random(270,400), random(250,450), increment);
    increment+=10;
  }
  
  for(int i=6; i<3*(arraySize/3); i++){
    fires[i] = new Fire(random(420,500), random(450,660), increment);
    increment+=10;
  }
  
  //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  
  //Setup for Level 2
  //initiate player
  player2=new Person(450,750);
  faucets[0]=new Faucet(345,5);
  faucets[1]=new Faucet(750,200);
  faucets[2]=new Faucet(750,650);
  faucets[3]=new Faucet(10,400);
  faucets[4]=new Faucet(10,670);
  faucets[5]=new Faucet(545,560);
  //Display lives
  for(int i=0; i<lives2.length; i++){
    lives2[i]=new Life(30+50*(i),75); 
  }
  //Vertical walls
  walls[0]=new Wall(400,0,400,150);
  walls[1]=new Wall(400,250,400,425);
  walls[2]=new Wall(400,525,400,700);
  walls[3]=new Wall(600,400,600,700);
  //Horizontal walls
  walls[4]=new Wall(0,250,400,250);
  walls[5]=new Wall(0,525,400,525);
  walls[6]=new Wall(400,400,500,400);
  walls[7]=new Wall(575,400,800,400);
  //Import background
  floor=loadImage("wood.jpg");
  
  //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  
  //Setup for Level 3
  ocean = loadImage("ocean2.jpg");
  player3 = new Bear(50,380);
  for(int i=0; i<lives3.length; i++){
    lives3[i]=new Life(30+50*(i),75); 
  }
}

//================================================================================


void draw(){
  if(windowStatus==0){
    startGame();
    if(mousePressed){
      if(mouseX>320 && mouseX<480 && mouseY>500 && mouseY<560){
        windowStatus=1;
        lives[1].startLevel1=millis()-1000;
      }
      if(mouseX>320 && mouseX<480 && mouseY>590 && mouseY<650){
        windowStatus=6;
      }
      if(mouseX>320 && mouseX<480 && mouseY>675 && mouseY<725){
        windowStatus=7; 
      }
    }
  }
  else if(windowStatus==1){
    gameLevel1();
    if(keyPressed){
      if(key =='b'){
        windowStatus=2; 
      }
    }
  }
  else if(windowStatus==2){
    gameLevel2(); 
    if(keyPressed){
      if(key =='c'){
        windowStatus=3; 
      }
    }
  }
  else if(windowStatus==3){
    gameLevel3(); 
    if(keyPressed){
      if(key =='o'){
        windowStatus=4; 
      }
    }
  }
  else if(windowStatus==4){
    gameOver();
    if(mousePressed){
      if(mouseX>320 && mouseX<480 && mouseY>380 && mouseY<450){
        windowStatus=0; 
      }
    }
  }
  else if(windowStatus==5){
    gameWon();
    if(mousePressed){
      if(mouseX>320 && mouseX<480 && mouseY>410 && mouseY<480){
        windowStatus=0; 
      }
    }
  }
  else if(windowStatus==6){
    instructions();
    if(mousePressed){
      if(mouseX>600 && mouseX<775 && mouseY<760 && mouseY>700){
        windowStatus=0; 
      }
    }
  }
  else if(windowStatus==7){
    information();
    if(mousePressed){
      if(mouseX>600 && mouseX<775 && mouseY<760 && mouseY>700){
        windowStatus=0; 
      }
    }
  }
}


//================================================================================


void startGame(){
  background(w1);
  cursor(HAND);
  timer=1;
}


//================================================================================


void gameLevel1(){
  cursor(drop);
  background(hillsBG);
  map.resize(0,700);
  image(map,250,50);
  
  //Display Text
  textSize(30);
  fill(0);
  text("Timer: "+((millis()-lives[1].startLevel1)/1000), 30,30);
  text("Lives",60,60);
  
  text("Move the cursor over the fires to", 200,30);
  text("put them out!", 400, 60);
  
  //Display Lives
  for(int j=0; j<lifeCount; j++){
    lives[j].display();
  }
  
  //Display fires
  for(int i=0; i<fires.length; i++){
    if(!fires[i].out){
      fires[i].display();
      fires[i].burn();
      fires[i].out(mouseX, mouseY);
      if(fires[i].mouse==true){
        outCount+=1; 
      }
    }
  }
  
  // timer
  if((millis()-lives[1].startLevel1)/3000==timer){
    if(outCount<arraySize){
      lifeCount-=1;
      timer+=1;
    }
  }
  
  if(outCount==arraySize){
    background(0);
    textSize(75);
    fill(255);
    text("Next Level",220,400);
    delay(1);
    windowStatus=2;
    lifeCount=3;
    outCount=0;
    for(int i=0; i<fires.length; i++){
      fires[i].out=false; 
    }
    lives[1].startLevel2=millis();
  }
  
  if(lifeCount<=0){
    windowStatus=4;
    lifeCount=3;
    outCount=0;
    for(int i=0; i<fires.length; i++){
      fires[i].out=false; 
    }
  }
  
  if(keyPressed){
    if(key =='b'){
      windowStatus=2;
      lifeCount=3;
      outCount=0;
      lives[1].startLevel2=millis();
    }
  }
}


//================================================================================


void gameLevel2(){
  background(floor);
  
  noCursor();
  
  //Display Walls
  for(int j=0; j<walls.length; j++){
    walls[j].display();
  }
  
  //Display Timer
  textSize(30);
  fill(0);
  text("Timer: "+((millis()-lives[1].startLevel2)/1000), 30,30);
  //Display Text
  textSize(30);
  fill(0);
  text("Lives",60,60);
  textSize(20);
  textSize(25);
  text("Use the arrow keys to move.", 400,30);
  text("Avoid walls. Turn off faucets.", 400, 60);
 
  
  //Display Lives
  for(int j=0; j<lifeCount2; j++){
    lives2[j].display();
  }
  
  //timer
  if((millis()-lives[1].startLevel2)/1000>=time){
     lifeCount2-=1;
     time+=40;
  }
  
  //Display faucets
  for(int i=0; i<faucets.length; i++){
    faucets[i].display();
    faucets[i].off(player2.x, player2.y);
  }
  
  //Display the person
  player2.travel(walls);
  player2.display();
  
  
  if(lifeCount2<=0){
    windowStatus=4;
    lifeCount2=3;
    outCount2=0;
  }
  
  for(int j=0; j<faucets.length; j++){
    if(faucets[j].onFaucet==true){
      outCount2+=1;
    }
  }
  
  if(outCount2==faucets.length){
    background(0);
    textSize(75);
    fill(255);
    text("Next Level", 220,400);
    delay(1);
    windowStatus=3;
    lifeCount2=3;
    outCount2=0;
    time=40;
    lives2[1].startLevel3=millis();
  }
  
  if(keyPressed){
    if(key =='c'){
      windowStatus=3;
      lifeCount2=3;
      outCount2=0;
      time=40;
      lives2[1].startLevel3=millis();
    }
  }
  
}


//================================================================================


void gameLevel3(){
// Level 3
// Polar Bear
// Save the iceblocks from floating away!!
  background(ocean);
  
  noCursor();
  
  //Display Text
  textSize(30);
  fill(255);
  text("Lives",60,60);
  text("Use arrow keys to move right & left.", 200,30);
  text("Bring the ice to the left of the screen.", 200, 60);
  
  //Display Lives
  for(int j=0; j<lifeCount3; j++){
    lives3[j].display();
  }
  
  if(((millis()-lives2[1].startLevel3)/interval3)==newIce){
    iceBlocks[newIce]=new Ice(300,400,10);
    iceBlocks[newIce].display();
    newIce+=1;
    count=newIce;
    if(newIce==5){
      newIce=-1;
      count=5;
    }
  }
  
  //for the end screen
  int doneCount=0;
  
  for(int i=0; i<count; i++){
    if(!iceBlocks[i].lost){
      iceBlocks[i].display();
      if(iceBlocks[i].x<10){
        doneCount+=1;
      }
      else{
        iceBlocks[i].onIce(player3.x, player3.y);
        iceBlocks[i].travel(mouseX, mouseY);
        if(iceBlocks[i].lost){
          lifeCount3-=1; 
        }
      }
    }
    if(iceBlocks[i].lost){
      lostCount+=1; 
    }
  }
  
  //Display polar bear
  player3.travel();
  player3.display();
  
  //If lose, change screen
  if(lifeCount3<=0){
    windowStatus=4;
    lifeCount3=3;
    doneCount=0;
    lostCount=0;
  }
  
  //If win...
  if(doneCount>=4){
    windowStatus=5;
    lifeCount3=3;
    doneCount=0;
    lostCount=0;
  }
  
  // If lose by only saving 3 iceblocks
  if(lostCount>2 && doneCount==3){
    windowStatus=4;
    lifeCount3=3;
    doneCount=0;
    lostCount=0;
  }
}


//================================================================================


void gameOver(){
  background(w2);
  cursor(HAND);
}


//================================================================================


void gameWon(){
  background(w4);
  cursor(HAND);
}


//================================================================================

void instructions(){
  background(w3);
  cursor(HAND);
}


//================================================================================

void information(){
  background(w5);
  cursor(HAND);
}
