int stepsperrun = 50;

int pointsX = 20,
    pointsY = 20;

int px, py;

int dx, dy;

PVector dir;
PVector home;
void setup(){
  size(600,600);
  frameRate(2);
  dx = width/pointsX;
  dy = height/pointsY;
  px = width/2;
  py = height/2;
  point(px,py);
  dir = new PVector();
  home = new PVector(width/2, height/2);
}

void draw(){
  float randnum = random(1);
  if (randnum <= 0.25){
    dir.x = -1;
    dir.y= 0;
  } else if (randnum <= 0.5){
    dir.x = 1;
    dir.y = 0;
  } else if (randnum <= 0.75){
    dir.x = 0;
    dir.y = -1;
  } else if (randnum <= 1){
    dir.x = 0;
    dir.y = 1;
  }
  if (frameCount % stepsperrun == 0){
    println("restart");
    px = width/2;
    py = height/2;
    dir.x = 0;
    dir.y = 0;
  }
  
  background(51);
  stroke(255);
  strokeWeight(1);
  noFill();
  for (int c = 0; c<pointsX; c++){
    for (int r = 0; r<pointsY; r++){
      rect(c*dx, r*dy, dx, dy);
    }
  }
  stroke(0,255,0,150);
  strokeWeight(15);
  px += dir.x * dx;
  py += dir.y * dy;
  point(px, py); 
  stroke(255,0,0,150);
  point(width/2, height/2);
  float dist = (abs((home.x-px)/dx)+abs((home.y-py)/dy));
  surface.setTitle("Distance: "+String.valueOf(dist));
}
