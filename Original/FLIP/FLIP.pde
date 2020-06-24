import gab.opencv.*;
import java.awt.Rectangle;
OpenCV opencv;
Rectangle[] faces;
PImage img;

void setup() {
  opencv = new OpenCV(this, "patrick.jpg");
  size(1080, 720);

  opencv.loadCascade(OpenCV.CASCADE_NOSE);  
  faces = opencv.detect();
}

void draw() {
  noLoop();
  img = opencv.getInput();
  image(opencv.getInput(), 0, 0);

  noFill();
  stroke(255, 255, 255, 40);
  strokeWeight(3);
  Rectangle main = faces[0];
  for (int i = 0; i < faces.length; i++) {
    //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    text(i, faces[i].x, faces[i].y - 10);
  }
  
  loadPixels();
  int startindex = main.x + main.y * width;
  int oldpixels[] = img.pixels;
  for (int col = 0; col < main.width; col++){
    for (int row = 0; row < main.height; row++){
      int oldindex = startindex + col + (row)*(width);
      int newindex = startindex + col + (main.height-row)*width;
      //pixels[newindex] = oldpixels[oldindex];
      pixels[newindex] = oldpixels[oldindex];
    }
  }
  updatePixels();
}
