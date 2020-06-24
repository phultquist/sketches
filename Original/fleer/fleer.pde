int pointsX = 40,
    pointsY;

Point points[];
PImage img;

void setup() {
  size(600,600);
  pointsY = parseInt(height/(width/pointsX));
  points = new Point[pointsY*pointsX];
  img = loadImage("image.jpg");
  background(51);
  noStroke();
  img.resize(pointsX, pointsY);
  img.loadPixels();
  int pix[] = img.pixels;
  int colors[][] = new int[pointsX*pointsY][4];
  for (int i = 0; i < pix.length; i+= 4){
    //int arr[] = {pix[i],pix[i+1],pix[i+2],pix[i+3]};
    //int arr[] = {int(random(255)), int(random(255)), int(random(255)), int(random(255))};
    int arr[] = {0,0,0,255};
    printArray(arr);
    colors[i] = arr;
    //colors[i] = color(random(255), random(255), random(255));
  }
  println(colors[0]);
  Point newPoint;
  int index = 0;
  for (int r = 0; r < pointsY; r++){
    for (int c = 0; c < pointsX; c++){
      int colorp[] = colors[c+r*pointsX];
      newPoint = new Point((width/(pointsX+1)) * (c+1), (height/(pointsY+1)) * (r+1), colorp);
      newPoint.show();
      points[index] = newPoint;
      index++;
    }
  }

}

void draw() {
  //frameRate(1);
  // put drawing code here
  background(51);
  for (int p = 0; p < points.length; p++){
    points[p].flee(mouseX, mouseY);
    points[p].steer();
    points[p].update();
    points[p].show();
  }
}
