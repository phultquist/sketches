Firework fireworks[] = new Firework[10];
PVector gravity;
void setup(){
  size(600,400);
  stroke(255);
  strokeWeight(4);
  for (int i = 0; i<fireworks.length; i++){
    fireworks[i] = new Firework();
  }
  gravity = new PVector(0,0.2);
}

void draw(){
  background(0);
  for (int i = 0; i<fireworks.length; i++){
    fireworks[i].update();
    fireworks[i].show();
    if (fireworks[i].firework.pos.y > height){
      fireworks[i] = new Firework();
      println("new");
    }
  }
  
}
