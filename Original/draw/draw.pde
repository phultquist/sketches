int size = 8;

void setup(){
  size(600, 400);
}

void draw(){
  drawDot();
}

void mousePressed(){
  size = 90;
}
void mouseReleased(){
  size = 8;
}

void drawDot(){
  noStroke();
  float r = map(mouseX, 0, width, 0, 255);
  float b = map(mouseY, 0, height, 0, 255);
  fill(r,50,b);
  circle(mouseX, mouseY, size);
  reflectDot(mouseX, mouseY);
}

void reflectDot(int x, int y){
  int newx = width - x;
  int newy = height - y;
  circle(newx, newy, size);
}
