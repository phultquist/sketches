//f=ma
PVector pos;
PVector vel;
PVector acc = new PVector();
Ball b;
int m = 5;

void setup(){
  b = new Ball(0,0);
  b.applyForce(new PVector(0, -9.8));
  size(600,600);
}

boolean t = false;

void draw(){
  frameRate(2);
  background(51);
  float data[] = {pos.x, pos.y, vel.x, vel.y, vel.mag(), acc.x, acc.y, acc.mag()};
  //float data[] = {pos.x, pos.y};
  stroke(255);
  strokeWeight(10);
  point(pos.x*5,(height - 40*pos.y));
  printArray(data);
  
  b.update();
  if (pos.y < 0 && !t){
    noLoop();
    t = true; 
    draw();
  }
}

class Ball{
  Ball(float x, float y){
    pos = new PVector(x, y);
    vel = new PVector(1, 1); //this is a 45 degree angle
    vel.setMag(10); //10 m/s
  }
  
  void applyForce(PVector force){
    acc.add(PVector.div(force, m));
  }
  
  void update(){
    vel.add(acc);
    pos.add(vel);
  }
}
