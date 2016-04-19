//ball thing

float x = 0;
float y = 0;
float xvel = 1;
float yvel = 1;
float mvelx = 0;
float mvely = 0;
float t = 0;

void setup() {
  size(648, 356);
}

void draw() {
  
  float mx = mouseX;
  float my = mouseY;
  t+=0.1;
  
  fill(0,0,0,40); 
  rect(0,0,width,height);
  fill(90,90,255);
  noStroke();
  ellipse(x, y, 20, 20);

  x += xvel;
  y += yvel;
  yvel += 0.1;
  xvel += 0.1;

  if (y >= height) {
    yvel = - yvel*0.85;
    y = height;
  }
  if (y <= 0) {
    yvel = -yvel*0.85;
    y = 0;
  }
  if (x >= width) {
    xvel = -xvel*0.85;
    x = width;
  }
  if (x <= 0) {
    xvel = -xvel*0.85;
    x = 0;
  }
  if(dist(x,y,mx,my) < 25 && mousePressed){
    x = mx;
    y = my;
    xvel = 0;
    yvel = 0;
    
    mvelx = mouseX - pmouseX;
    mvely = mouseY - pmouseY;
    xvel = mvelx;
    yvel = mvely;
  }else if (mousePressed && (mouseButton == RIGHT)) {
    xvel = 0;
    yvel = 0;
    x = pmouseX;
    y= pmouseY;
  }
}


// Dead code land
  //background(random(255),random(255),random(255));
  //background(0);
  //fill(255,0,0);

  //fill(255,0,0);
  //ellipse(x+sin(t)*30,y+cos(t)*30,10,10);
  //fill(0,255,0);
  //ellipse(x+sin(t+2*PI/3)*30,y+cos(t+2*PI/3)*30,10,10);
  //fill(0,0,255);
  //ellipse(x+sin(t+4*PI/3)*30,y+cos(t+4*PI/3)*30,10,10);