class Fleet{
  Particle particles[];
  int layer;
  int n;
  Fleet(int num, int l_){
    layer = l_;
    n = num;
    particles = new Particle[num];
    for (int x = 0; x < particles.length; x++){
      particles[x] = new Particle(random(width), random(height));
    }
  }
  
  void update(){
    if (layer == 0){
      for (int i = 0; i < particles.length; i++){
        particles[i].update(mouseX, mouseY);
      }
    } else {
      for (int i = 0; i < particles.length; i++){
        Particle c = findClosest(layer - 1, particles[i].pos);
        particles[i].update(c.pos.x, c.pos.y);
      }
    }
  }
  
  void show(){
    for (int i = 0; i < particles.length; i++){
      particles[i].show();
    }
  }
}

Particle findClosest(int lay, PVector pos){
  Fleet f = fleets[lay];
  float closest = f.particles[0].pos.dist(pos);
  int closestIndex = 0; 
  for (int j = 1; j < f.particles.length; j++){
    float d = f.particles[j].pos.dist(pos);
    if (closest >= d){
      closest = d;
      closestIndex = j;
    }
  }
  return f.particles[closestIndex];
}
