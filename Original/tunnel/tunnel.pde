int d = 10;

void setup(){
  size(600,400);
}

void draw(){
  background(0);
  noStroke();
  int numx = width/d;
  int numy = height/d;
  for (int i = 0; i <= numx; i++){
    fill(255);
    int newx = i*d;
    stroke(255);
    line(newx,0,mouseX,mouseY);
    line(newx,height,mouseX,mouseY);
    circle(i*d, 0, 8);
    circle(i*d, height, 8);
  }
  
  for (int i = 1; i < numy; i++){
    fill(255);
    int newy = i*d;
    stroke(255);
    line(0,newy,mouseX,mouseY);
    //line(0,newy+3,mouseX,mouseY);
    line(width,newy,mouseX,mouseY);
    circle(0, i*d, 8);
    circle(width, i*d, 8);
  }
}
