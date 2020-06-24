int n = 0;
int s = 0;

void setup(){
  size(600,680); 
  background(31);
  fill(51);
  stroke(240);
  strokeWeight(5);
  circle(width/2,height/2-40,width);
  fill(255);
  noStroke();
  while (s==0){
    throwPoint(); 
  }
}

void draw(){
  for (int i = 0; i<10000000;i++){
    throwPoint();
  }
  float r2 = pow(float(width)/2.0, 2.0);
  float rectarea = pow(float(width), 2.0);
  float ns = float(s)/float(n);
  rectMode(CORNERS);
  fill(31);
  rect(0,610,600,680);
  fill(255);
  textAlign(CENTER);
  text("π: "+(rectarea*ns)/r2, 300,650);
  text("n: "+n, 150,650);
  text("s: "+s, 450,650);
  
}

void throwPoint(){
  n++;
  float newx = int(random(width));
  float newy = int(random(height-80));
  //ellipse(newx,newy,1,1);
  //circle(newx,newy,2);
  if (dist(width/2, height/2-40, newx,newy) <= width/2){
    s++;
  }
}

boolean looping = true;

void mouseClicked(){
  if (looping){
    noLoop();
    looping = false;
  } else {
    loop();
    looping = true;
  }
}
