// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/IKB1hWWedMk

int cols, rows;
int scl = 20;
int w = 2000;
int h = 1600;

float flying = 0;

float[][] terrain;

void setup() {
  size(600, 600, P3D);
  cols = w / scl;
  rows = h/ scl;
  terrain = new float[cols][rows];
}

boolean loopState = true;
void keyPressed(){
  if (loopState){
    noLoop();
    loopState = false;
  } else {
    loop();
    loopState = true;
  }
}

void draw() {
  float speed = map(mouseY, 0, 600, 0.02, 0.2);
  //float speed = 0;
  flying -= speed;
  float jump = map(mouseX, 0, 600,0.1, 0.5);
  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += jump;
    }
    yoff += jump;
  }



  background(0);
  stroke(255);
  noFill();
  //noStroke();

  translate(width/2, height/2+50);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      fill(map(terrain[x][y], -100, 100, 0, 255));
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
}
