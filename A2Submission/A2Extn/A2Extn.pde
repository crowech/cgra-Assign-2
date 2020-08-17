void setup(){
  //Sets up the screen
  size(500,500);
  frameRate(5);
  background(255);


}
void draw(){
//Create a random colour with random numbers. Colour cannot be white.
float red = random(244);
float gre = random(255);
float blu = random(230);
stroke(red,gre,blu);

//Creates a random point. The second point cant be less than 10.
float y1 = random(10,500);
float y0 = random(500);
float x1 = random(10,500);
float x0 = random(500);

//Creates the variables, using the DDA algorithm
float a = -(y1-y0);
float b = (x1-x0);
float c = (x0*y1)-(x1*y0);
int x = round(x0);
int y = round((-a*x-c)/b);
float k=a*(x+1)+b*(y+1/2)+c;

//while x is less than x1 (DDA algorithm)
while (x<round(x1)){
  point(x-1,y-1);
  point(x,y);
  point(x+1,y+1);
  
  if(k>0){
    k=k+a;
  }
  else {
   k=k+a+b;
   y=y+1;
  }
  x=x+1;
}
}
