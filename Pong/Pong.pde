float p1x = 0;
float p1y = 0;
float p2x = 0;
float p2y = 0;
float bx = height/2;
float by = width/2;
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
  ellipse(bx,by,10,10);
  
  
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
  
}