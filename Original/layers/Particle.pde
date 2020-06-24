class Particle{
  PVector pos;
  PVector vel;
  PVector ste;
  PVector acc;
  Particle(float x, float y){
    pos = new PVector(x, y);
    vel = new PVector(10,0); 
    ste = new PVector();
    acc = new PVector();
  }
  
  void update(float x, float y){
    PVector target = new PVector(x, y);
    target = target.sub(pos);
    target.normalize();
    target.mult(10);
    ste = target.sub(vel);
    ste.limit(steerMax);
    
    acc.add(ste);
    
    vel.add(acc);
    
    vel.limit(5);
    
    pos.add(vel);
    acc.mult(0);
  }
  
  void show(){
    point(pos.x, pos.y);
  }
}
