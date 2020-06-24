class Particle{
  PVector pos;
  PVector vel;
  PVector acc;
  Particle(int px, int py){
    pos = new PVector(px, py);
    vel = new PVector(0, random(-13,-8));
    acc = new PVector(0, 0);
  }
  
  void applyForce(PVector force){
    acc.add(force);
  }
  
  void update(){
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }
  
  void show(){
    point(pos.x, pos.y);
  }
}
