void setup(){
  size(600,600);
  stroke(255);
}

void draw(){
  float num = int(map(mouseX, 0, width, 1, 30));
  background(51);
  float step = width/2/num;
  for (int i = 0; i < num; i++){
    line(0,height/2+i*step, i*step, height);
  }
  for (int i = 0; i < num; i++){
    line(width,height/2+i*step, width-i*step, height);
  }
  for (int i = 0; i < num; i++){
    line(width, i*step, width/2+i*step, 0);
  }
  for (int i = 0; i < num; i++){
    line(0, i*step, width/2-i*step, 0);
  }
}
