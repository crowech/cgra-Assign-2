float x, y;
float vx, vy;
float r = 30;
float xBat, yBat;
float easing = 0.5;
//Create random x and y
float xTarget = random(500);
float yTarget = random(500);
int timesTargetHit = 0;

//Creates target array list.
ArrayList<Target>targets = new ArrayList();

void setup() {
  size(500, 500);
  //initialise variables.
  x=250; 
  y=250;
  vx=10; 
  vy=2;
  frameRate(60);

  //Create targets and put them in the array list
  for (int i = 0; i<5; i++) {
    targets.add(new Target(100*i, 0, 100, 100, 0));
  }
}

void draw() {
  background(255);
  //Core code
  fill(255, 0, 0);
  stroke(128, 0, 0);
  //Draw the ball
  ellipse(x, y, r*2, r*2);

  //Sets variables
  float dx = mouseX - xBat;
  xBat += dx * easing;
  
  fill(0, 0, 255);
  stroke(0, 0, 155);
  //Draws the bat from the center
  rectMode(CENTER);
  rect(xBat, 450, 70, 20);

//Set the target colours.
  if (targets.size() > 0) {
    for (Target t : targets) {
      switch(t.getStatus()) {
      case 0:
        fill(0, 255, 0);
        stroke(0, 100, 0);
        break;
      case 1:
        fill(277, 231, 103);
        stroke(207, 211, 83);
        break;
      case 2:
        fill(255, 0, 0);
        stroke(235, 0, 0);
        break;
      }
      
      //Draw target
      rectMode(CORNER);
      rect(t.getXPos(), t.getYPos(), t.getWidth(), t.getHeight());

      //hit Code
      if (x > t.getXPos()-r && x< t.getXPos()+t.getWidth()+r && y>t.getYPos()-r && y<t.getYPos()+t.getHeight()+r) {
        vx = -vx;
        vy = -vy;
        t.updateStatus(t.getStatus()+1);
        if (t.getStatus() > 2) {
          targets.remove(t);
          break;
        }
      }
    }
  }
  
  // Increase ball position
  x+=vx;
  y+=vy;
  
  //If the ball hits anyone of the sides.
  if (x>width-r && vx>0) {
    vx=-vx;
  }
  if (x<0+r && vx<0) {
    vx=-vx;
  }
  if (y>height-r && vy>0) {
    vy=-vy;
  }
  if (y<0+r && vy<0) {
    vy=-vy;
  }
  
  //If the ball hits the bat
  if (x> xBat-35-r && x< xBat+35+r && y>450-10-r && y<450+20+r) {
    vx=-vx;
    vy=-vy;
  }
}

class Target {
  float x, y, w, h;
  int s;

  Target(float x, float y, float w, float h, int s) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.s=s;
  }

  float getXPos() {
    return this.x;
  }
  float getYPos() {
    return this. y;
  }
  float getWidth() {
    return this.w;
  }
  float getHeight() {
    return this.h;
  }
  int getStatus() {
    return this.s;
  }

  void updateStatus(int s) {
    this.s=s;
  }
}
