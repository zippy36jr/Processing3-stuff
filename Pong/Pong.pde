float p1x = 0;
float p1y = 0;
float p2x = 0;
float p2y = 0;
float bx = height/2;
float by = width/2;
float xvel = 1;
float yvel = 1;
color BallColor = color(255,255,255);
int PaddleSpeed = 5;

void setup(){
  size(600,300);
}

void draw(){
  background(0);
  fill(255);
  rect(300-2,0,2,height);
  
  //player1
  fill(255,0,0);
  rect(15,p1y,10,50);
  //player2
  fill(0,0,255);
  rect(width-25,p2y,10,50);
  //ball
  fill(BallColor);
  ellipse(bx,by,15,15);
  
  bx += xvel;
  by += yvel;
  yvel += 0.05;
  xvel += 0.05;
  if (by >= height) {
    yvel = - yvel*0.90;
    by = height;
  }
  if (by <= 0) {
    yvel = -yvel*0.90;
    by = 0;
  }
  if (bx >= width) {
    xvel = -xvel*0.90;
    bx = width;
  }
  if (bx <= 0) {
    xvel = xvel*0.90;
  }
  if(bx <= 0){
    bx = 0;
  }
  if(bx >= width/2){
    BallColor = color(0,0,255);
  }else if(bx <= width/2){
    BallColor = color(255,0,0);
  }
 //player1 controls
 if(keyPressed){
   if(key == 'w' || key == 'W'){
     p1y -= PaddleSpeed;
   }
   if(key == 's' || key == 'S'){
     p1y += PaddleSpeed;
   }
 }
  
 //player2 controls
 if(keyPressed){
   if(keyCode == UP){
     p2y -= PaddleSpeed;
   }
   if(keyCode == DOWN){
     p2y += PaddleSpeed;
   }
 }
  if (mousePressed && (mouseButton == RIGHT)) {
    xvel = 0;
    yvel = 0;
    bx = pmouseX;
    by= pmouseY;
  }
}