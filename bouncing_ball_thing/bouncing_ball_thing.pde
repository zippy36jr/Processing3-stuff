//ball thing

float x = 0;
float y = 0;
float xvel = 1;
float yvel = 1;
float x2 = 0;
float y2 = 0;
float xvel2 = 1;
float yvel2 = 1;
float mvelx = 0;
float mvely = 0;
float t = 0;

void setup() {
  size(800, 600);
}

void draw() {

  float mx = mouseX;
  float my = mouseY;
  t+=0.1;

  fill(0, 0, 0, 40); 
  rect(0, 0, width, height);
  fill(90, 90, 255);
  noStroke();
  ellipse(x, y, 20, 20);
  ellipse(x2, y2, 20, 20);
  for (int i = 0; i < 8; i++) {
    fill(random(255), random(255), random(255));
    ellipse(x+sin(t+(2+i)*PI/3)*30, y+cos(t+(2+i)*PI/3)*30, 15, 15);
    ellipse(x2+sin(t+(2+i)*PI/3)*30, y2+cos(t+(2+i)*PI/3)*30, 15, 15);
  }
  x += xvel;
  y += yvel;
  yvel += 0.1;
  xvel += 0.1;
  x2 += xvel2;
  y2 += yvel2;
  yvel2 += 0.1;
  xvel2 += 0.1;

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

  if (y2 >= height) {
    yvel2 = - yvel2*0.85;
    y2 = height;
  }
  if (y2 <= 0) {
    yvel2 = -yvel2*0.85;
    y2 = 0;
  }
  if (x2 >= width) {
    xvel2 = -xvel2*0.85;
    x2 = width;
  }
  if (x2 <= 0) {
    xvel2 = -xvel2*0.85;
    x2 = 0;
  }

  if (dist(x, y, mx, my) < 35 && mousePressed && (mouseButton == LEFT)) {
    x = mx;
    y = my;
    xvel = 0;
    yvel = 0;

    mvelx = mouseX - pmouseX;
    mvely = mouseY - pmouseY;
    xvel = mvelx;
    yvel = mvely;
  }
  if (dist(x2, y2, mx, my) < 35 && mousePressed && (mouseButton == RIGHT)) {
    x2 = mx;
    y2 = my;
    xvel2 = 0;
    yvel2 = 0;

    mvelx = mouseX - pmouseX;
    mvely = mouseY - pmouseY;
    xvel2 = mvelx;
    yvel2 = mvely;
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

//  else if (mousePressed && (mouseButton == RIGHT)) {
//    xvel = 0;
//    yvel = 0;
//    x = pmouseX;
//    y= pmouseY;
//  }
