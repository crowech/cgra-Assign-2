float x,y;
float vx, vy;
float r = 20;
float xBat, yBat;
float easing = 0.5;

float dx = mouseX - xBat;
//For if the bat needs to move up and down too
//float dy = mouseY - yBat;

void setup(){
 size(500,500);
 
 //Initialse variables
 x=200; y=200;
 vx=3; vy=1;
 frameRate(70);
}

void draw(){
  background(255);
  fill(255,0,0);
  stroke(128,0,0);
  
  //Draw the ball
  ellipse(x,y,r*2,r*2);
  x=x+vx;
  y=y+vy;
 
  //If the ball hits the side bonce off
  if(x>width-r && vx>0){
    vx=-vx;
  }
  //If the ball hits the side bonce off
  if(x<0+r && vx<0){
    vx=-vx;
  }
  //If the ball hits the bottom bonce off
  if(y>height-r && vy>0){
    vy=-vy;
  }
  //If the ball hits the top bonce off
  if(y<0+r && vy<0){
    vy=-vy;
  }
  

  xBat += dx * easing;
  //For if the bat needs to move up and down too
 // yBat += dy * easing;
  
  
  fill(0,0,255);
  stroke(0,0,155);
  rectMode(CENTER);
  rect(xBat, 450, 70, 20);
  
  //If the bat hits the ball
  if(x> xBat-35-r && x< xBat+35+r && y>450-10-r && y<450+20+r){
   vx=-vx;
   vy=-vy; 
  }
  
 
  
}
