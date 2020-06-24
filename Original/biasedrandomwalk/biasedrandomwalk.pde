float bias = 0.6;

float scaleSize = 100;


float stepsize = 1;
float pos = 0;
float bottom = -scaleSize;
float top = scaleSize;
float totalWidth;
int axisLabels = 10;

float baseHeight;

int buffer = 50;

int dir;
int lastDir = 1;

int last[] = new int[12];

ArrayList<Float> values = new ArrayList<Float>();

void setup() {
  size(600, 800);
  //frameRate(15);
  float firstn = random(1);
  if (firstn < 0.5) {
    lastDir = -1;
  }
  dir = lastDir;
  pos += dir;
  textAlign(CENTER);
  totalWidth = width-2*buffer;
  surface.setTitle("First Direction: "+String.valueOf(lastDir));
  baseHeight = 40;
}

void draw() {
  background(51);
  stroke(255);
  strokeWeight(1);
  dir = getN();
  pos += stepsize*dir;
  if (pos < bottom || pos > top){
    bottom -= scaleSize;
    top += scaleSize;
  }
  
  //if (pos > bottom/2 && pos < top/2){
  //  bottom /= 2;
  //  top /= 2;
  //}
  
  line(buffer, baseHeight, width-buffer, baseHeight);

  for (int i = 0; i <= axisLabels; i++) {
    float val = map(i, 0, axisLabels, bottom, top);
    float x = buffer + map(val, bottom, top, 0, totalWidth);
    line(x, baseHeight - 5, x, baseHeight + 5);
    text(Math.round(val), x, baseHeight-15);
  }
  
  stroke(0,255,0);
  strokeWeight(10);
  point(buffer + map(pos, bottom, top, 0, totalWidth), baseHeight);
  values.add(pos);
  stroke(255);
  strokeWeight(1);
  graphValues();
  lastDir = dir;
}

void graphValues(){
  float startY = baseHeight + buffer;
  float endY = height-buffer;
  int num = values.size();
  line(buffer, startY, buffer, endY);
  line(buffer, endY, width-buffer, endY);
  text(num, width-buffer, endY + 20);
  text(0, buffer, endY+20);
  text(Math.round(bottom), buffer-20, endY);
  text(Math.round(top), buffer-20, startY);
  float v,
        nx,
        ny;
  strokeWeight(1);
  float px = buffer,
        py = endY;
  for (int p = 0; p < num; p++){
    v = values.get(p);
    nx = buffer + map(p, 0, num, 0, width-2*buffer); 
    ny = endY - map(v, bottom, top, 0, abs(endY-startY));
    //point(nx, ny);
    line(px,py,nx,ny);
    px = nx;
    py = ny;
  }
}

int getN() {
  float rannumber = random(1);
  if (rannumber < bias) return lastDir;
  return -1*lastDir;
}
