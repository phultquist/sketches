int nx = 20,
    ny = 20;
    
float theta = 0;


ArrayList<Area> areas = new ArrayList<Area>();
void setup(){
  size (600,600);
  for (int i = 0; i < nx; i++){
    for (int j = 0; j< ny; j++){
      areas.add(new Area(i, j));
    }
  }
  noFill();
  stroke(255);
  strokeWeight(10);
}

void draw(){
  theta += map(mouseX, 0, width, 0, 0.05);
  background(51);
  PVector k;
  beginShape();
  for (int p = 0; p < areas.size(); p++){
    //areas.get(p).circ();
    k = areas.get(p).poi();
    //vertex(k.x, k.y);
  }
  endShape();
}

class Area{
  int x, y;
  Area(int x_, int y_){
    x = x_;
    y = y_;
  }
  
  void circ(){
    circle(map(x, -1, nx, 0, width), map(y, -1, ny, 0, height), map(nx, 1, 50, 50, 1));
  }
  
  PVector poi(){
    float r = map(nx, 1, 50, 50, 1);
    float xoff = cos(map(x, 0, nx, 0, TWO_PI)+theta*x*1.1)*r/2;
    float yoff = sin(map(y, 0, ny, 0, TWO_PI)+theta*x*1.1)*r/2;
    PVector pos = new PVector(map(x, -1, nx, 0, width)+xoff,map(y, -1, ny, 0, height)+yoff); 
    
    point(pos.x, pos.y);
    
    return pos;
  }
}
