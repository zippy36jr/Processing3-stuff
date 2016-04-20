float p1x = 15;
float p1y = 5;
float p2x = width-25;
float p2y = 5;
float bx = 0;
float by = 0;
float xvel = 0;
float yvel = 0;
color ballColor = color(255, 255, 255);
color winColor = color(255, 255, 255);
String winner = "";
int paddleSpeed = 6;
int blueScore = 0;
int redScore = 0;
int winScore = 5;
int[] keys = new int[4];

void setup() {
  size(600, 300);
  bx = width/2;
  by = height/2;
  xvel = random(-1, 1);
}

void draw() {
  background(0);
  stroke(255);
  line(300, 0, 300, height);
  stroke(0);

  //player1
  fill(255, 0, 0);
  rect(15, p1y, 10, 50);
  //player2
  fill(0, 0, 255);
  rect(width-25, p2y, 10, 50);
  //ball
  fill(ballColor);
  ellipse(bx, by, 15, 15);

  bx += xvel;
  by += yvel;
  yvel += 0;
  xvel += 0;
  if (by >= height) {
    yvel = -yvel*0.85;
    by = height;
  }
  if (by <= 0) {
    yvel = -yvel*1.01;
    by = 0;
  }
  if (bx >= width/2) {
    ballColor = color(0, 0, 255);
  } else if (bx <= width/2) {
    ballColor = color(255, 0, 0);
  }
  //player1 controls
  if (keyPressed) {
    if (key == 'w' && p1y > 5) {
      keys[0] = 1;
    }
    if (key == 's' && p1y < 245) {
      keys[1] = 1;
    }
  }

  //player2 controls
  if (keyPressed) {
    if (keyCode == UP && p2y > 5) {
      keys[2] = 1;
    }
    if (keyCode == DOWN && p2y < 245) {
      keys[3] = 1;
    }
  }

  //P1 Movement
  if (keys[0] == 1 && p1y > 5) {
    p1y -= paddleSpeed;
  }
  if (keys[1] == 1 && p1y < 245) {
    p1y += paddleSpeed;
  }

  //P2 Movement
  if (keys[2] == 1 && p2y > 5) {
    p2y -= paddleSpeed;
  }
  if (keys[3] == 1 && p2y < 245) {
    p2y += paddleSpeed;
  }
  textSize(32);
  textAlign(CENTER, CENTER);
  fill(255, 0, 0);
  text(""+redScore, width/2-35, 15);
  fill(0, 0, 255);
  text(""+blueScore, width/2+35, 15);
  fill(winColor);
  text(""+winner, width/2, height/2);

  if (bx < 32.5 && by > p1y && by < p1y+50) {
    bx = 32.5;
    xvel = -xvel*1.1;
    yvel = random(-2, 2);
  }

  if (bx > width-32.5 && by > p2y && by < p2y+50) {
    bx = width-32.5;
    xvel = -xvel*1.1;
    yvel = random(-2, 2);
  }



  if (bx <= 14) {
    blueScore +=1;
    bx = width/2;
    by = height/2;
    xvel = random(-1, 1);
    yvel = random(-2, 2);
  }
  if (bx >= width - 14) {
    redScore +=1;
    bx = width/2;
    by = height/2;
    xvel = random(-1, 1);
    yvel = random(-2, 2);
  }
  if (abs(xvel) <= 1) {
    xvel = xvel/abs(xvel)*2;
  }

  if (redScore == winScore) {
    winColor = color(255, 0, 0);
    winner = "Red Wins";
    xvel = 0;
    yvel = 0;
    bx = width/2;
    by = height/2;
    ballColor = color(255, 255, 255);
  }
  if (blueScore == winScore) {
    winColor = color(0, 0, 255);
    winner = "Blue Wins";
    xvel = 0;
    yvel = 0;
    bx = width/2;
    by = height/2;
    ballColor = color(255, 255, 255);
  }
}

void keyReleased() {
  //player1 controls
  if (key == 'w') {
    keys[0] = 0;
  }
  if (key == 's') {
    keys[1] = 0;
  }

  //player2 controls
  if (keyCode == UP) {
    keys[2] = 0;
  }
  if (keyCode == DOWN) {
    keys[3] = 0;
  }
}
