void setup(){
  //size(800,800);
  fullScreen();
  //surface.setResizable(true);
}

void draw(){
  noLoop();
  background(200);
  int numx = 200;
  //translate(width/2,height/2);
  //rotate(0.01*frameCount);
  float step = parseFloat(width)/parseFloat(numx);
  float num = 0;
  for (int i = 0; i<numx;i++){
   for (int y = 0; y<numx; y++){
     num = random(1);
     //rotate(random(TWO_PI));
     if (num > 0.5){
       line(i*step,y*step,i*step+step, y*step+step);
       //line(i*step,y*step,i*step, y*step+step);
     } else {
       line(i*step+step,y*step,i*step, y*step+step);
       //line(i*step,y*step,i*step+step, y*step);
     }
    }
  }
}
