class Dartboard{
  int cx;
  int cy;
  float diameter;
  float radius;
  Dartboard(float d){
    cx = width/2;
    cy = height/2;
    diameter = d;
    radius = diameter/2;
  }
  
  float distFromCenter(int x, int y){
    return dist(cx, cy, x, y);
  }
  
  float chordLength(int x, int y){
    float h = 300-distFromCenter(x, y);
    //println(distFromCenter(x,y));
    if (distFromCenter(x,y)>radius){
      //println("failed");
      return -1;
    }
    return pow(8*radius*h - 4*pow(h,2),0.5);
  }
}
