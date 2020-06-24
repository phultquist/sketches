Point[] points = new Point[9];
float theta = 0.0;
Point currentPoint;
Point lastPoint;
void setup(){
  size(600,400);
  //fullScreen();
  fill(255, 255, 255, 100);
  stroke(255);
  for (int i = 0; i<points.length;i++){
    points[i] = new Point(int(random(width)), int(random(height)));
    points[i].show();
    println("POINT. index: "+i+" x: "+points[i].x+" y: "+points[i].y);
  }
  //smooth();
  
  points[0].makeCurrent();
  //currentPoint = points[0];
  //currentPoint.count ++;
  frameRate(10000);
}

void draw(){
  int x = 0;
  while (x < 5){
    theta += 0.0001;
    background(0);
    
    for (int i = 0; i<points.length;i++){
      points[i].show();
    }
    pushMatrix();
      translate(currentPoint.x, currentPoint.y);
      rotate(PI-theta);
      line(0,-1000,0,1000);
    popMatrix();
    
    for (int i = 0; i<points.length;i++){
      Point testpoint = points[i];
      if (currentPoint == testpoint) continue;
      if (testpoint == lastPoint) continue;
      float m = tan(PI/2-theta);
      float d = m*(testpoint.x - currentPoint.x) - testpoint.y + currentPoint.y;
      //println("slope: "+m);
      if (abs(d) < 1){
        if (testpoint.x > width/2 && d<0){
          continue;
        } else if (testpoint.x < width/2 && d>0){
          continue; 
        }
        lastPoint = currentPoint;
        testpoint.makeCurrent();
        return;
      }
    }
    x++;
  }
}

void keyPressed(){
  if (key == ' '){
    frameCount = -1;
  }
}
