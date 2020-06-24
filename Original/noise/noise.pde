float x = 0.0;
float y = 0.0;

void setup(){
  size(800,800);  
}

void draw() {
  background(204);
  for (int px = 0; px < width; px++){
    for (int py = 0; py<height; py++){
      float noiseVal = noise(px, py);
      noStroke();
      fill(map(noiseVal, 0.0, 1.0, 0, 255));
      rect(px,py,px+1,py+1);
    }
  }
  x += 0.0001;
  y += 0.0001;
}
