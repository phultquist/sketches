int numClean = 10;

ArrayList<Lover> clean = new ArrayList<Lover>();

ArrayList<Lover> infected = new ArrayList<Lover>();

void setup(){
  size(500,500);
  for (int i = 0; i < 5; i++){
    infected.add(new Lover(random(width), random(height)));  
  }
  for (int i = 0; i < numClean; i++){
    clean.add(new Lover(random(width), random(height)));
  }
  strokeWeight(8);
}

void draw(){
  background(51);
  for (int i = 0; i < clean.size(); i++){
    float closest = dist(infected.get(0).pos.x, infected.get(0).pos.y, clean.get(i).pos.x, clean.get(i).pos.y);
    int closestIndex = 0; 
    for (int j = 1; j < infected.size(); j++){
      float d = dist(infected.get(j).pos.x, infected.get(j).pos.y, clean.get(i).pos.x, clean.get(i).pos.y);
      if (closest >= d){
        closest = d;
        closestIndex = j;
      }
    }
    clean.get(i).update(infected.get(closestIndex).pos.x, infected.get(closestIndex).pos.y);
    stroke(0,255,0);
    clean.get(i).show();
  }
  stroke(255);
  for (int k = 0; k < infected.size(); k++){
    infected.get(k).update(mouseX, mouseY);
    infected.get(k).show();
  }
}

class Lover{
  PVector pos;
  PVector vel;
  PVector ste;
  PVector acc;
  Lover(float x, float y){
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
    ste.limit(0.1);
    
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
