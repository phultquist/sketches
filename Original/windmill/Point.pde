class Point{
  int x, y;
  int count = 0;
  Point(int px, int py){
    x = px;
    y = py;
  }
  
  void show(){
    circle(x,y,10);
    textAlign(CENTER);
    text(count, x, y-10);
  }
  
  int makeCurrent(){
    count++;
    currentPoint = this;
    
    return count;
  }
}
