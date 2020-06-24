class Point{
  PVector position;
  PVector home;
  PVector velocity;
  PVector acceleration;
  float topSpeed;
  int ballColor[];
  Point(float x, float y, int c[]){
    position = new PVector(x,y);
    home = new PVector(position.x, position.y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    topSpeed = 50;
    ballColor = c;
  }

  void show () {
    fill(ballColor[0],ballColor[1],ballColor[2],ballColor[3]);
    //fill(random(255), random(255), random(255));
    circle(position.x, position.y, 10);
  };
  
  void steer () {
    //PVector desired = p5.Vector.sub(this.home, this.position);
    PVector desired = home.sub(position);
    PVector steer = desired.sub(velocity);
    applyForce(steer);
    
    home.add(position);
    desired.add(velocity);
    //steer.mult(5)
  };
  
  void flee(float mx, float my) {
    PVector mouse = new PVector(mx, my);
    PVector desired = mouse.sub(position);
    float distance = desired.mag();
    if (distance<50){
      desired.mult(-20);
    }else{
      return;
    }
  
    PVector fleeSteer = desired.sub(velocity);
    applyForce(fleeSteer);
  }
  
  void update () {
  
    acceleration.setMag(0.8);
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    // if(this.velocity.mag()<0.9 && this.desired.mag()<3){
    //   //this.position = this.home;
    //   this.velocity = createVector(0,0);
    // }
    position.add(velocity);
    acceleration.mult(0);
  };

  void applyForce (PVector force) {
    acceleration.add(force);
  };
}
