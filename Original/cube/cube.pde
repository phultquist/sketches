void setup()  {
  size(640, 360, P3D);
  noStroke();
  fill(204);
}

void draw()  {
  background(0);
  lights();
  //noFill();
  stroke(255);
  //if(mousePressed) {
  //  float fov = PI/3.0; 
  //  float cameraZ = (height/2.0) / tan(fov/2.0); 
  //  perspective(fov, float(width)/float(height), cameraZ/2.0, cameraZ*2.0); 
  //} else {
  ortho(-width/2, width/2, -height/2, height/2);
  //}
  translate(width/2, height/2, 0);
  //rotateX(-PI/6);

  float pz = 0;
  if(mousePressed) {
    pz = map(mouseX, 0, width, 0, TWO_PI);
    rotateY(map(mouseX, 0, width, 0, TWO_PI));
    rotateZ(pz);
  } else {
    rotateZ(pz);
    rotateY(map(mouseX, 0, width, 0, TWO_PI));
    rotateX(map(mouseY, 0, width, 0, TWO_PI));
  }
  //rotateY(PI/3); 
  box(160); 
}
