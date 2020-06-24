Fleet fleets[] = new Fleet[1];

float steerMax = 0.05;

int numParticlesPerFleet = 500;

boolean showAll = true;

void setup(){
  size(600,600);
  stroke(255);
  strokeWeight(8);
  for (int o = 0; o < fleets.length; o++){
    fleets[o] = new Fleet(numParticlesPerFleet,o);
  }
}

void draw(){
  background(51);
  int start = fleets.length - 1;
  if (showAll){
    start = 0;
  }
  for (int h = 0; h < fleets.length; h++){
    fleets[h].update();
  }
  for (int f = start; f < fleets.length; f++){
    stroke(map(f, 0, fleets.length, 0, 255));
    fleets[f].show();
  }
}

void keyPressed(){
  if (key == ' '){
    showAll = !showAll;
  }
}
