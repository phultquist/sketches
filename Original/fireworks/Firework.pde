class Firework{
  Particle firework = new Particle(int(random(width)),400);
  boolean exploded = false;
  Particle particles[] = new Particle[100];
 
  void update(){
    firework.applyForce(gravity);
    firework.update(); 
    
    if (firework.vel.y >= 0){
      exploded = true;
      explode();
    }
  }
  
  void show(){
    if (!exploded){
      firework.show();
    } else {
      for (Particle p: particles){
        p.applyForce(new PVector(1, 0));
        p.applyForce(gravity);
        p.update();
        p.show();
      }
    }
  }
  
  void explode(){
    for (int p = 0; p < particles.length; p++){
      particles[p] = new Particle(int(firework.pos.x), int(firework.pos.y));
      particles[p].applyForce(new PVector(1, 0));
    }
  }
}
