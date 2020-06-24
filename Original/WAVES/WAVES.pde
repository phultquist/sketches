  
import processing.sound.*;
Sound s;



//SinOsc sin1 = new SinOsc(this);
//SinOsc sin2 = new SinOsc(this);

int num = 2;

SinOsc sounds[] = new SinOsc[num];

Wave baseWaves[] = new Wave[num];
Wave sum;

UnitCircle circles[] = new UnitCircle[num];

ArrayList<Float> yValues = new ArrayList<Float>();
ArrayList<Float> xValues = new ArrayList<Float>();

void setup() {
  size(1400, 800);
  //frameRate(20);
  // Play two sine oscillators with slightly different frequencies for a nice "beat".
  
  for (int g = 0; g < sounds.length; g++){
    sounds[g] = new SinOsc(this);
    sounds[g].play(200,0.5);
  }
 
  // Create a Sound object for globally controlling the output volume.
  s = new Sound(this);
  
  for (int w = 0; w < baseWaves.length; w++){
    baseWaves[w] = new Wave(65+(115)*w, "wave "+(w+1));
  }

  sum = new Wave(120+65+(115+40)*(baseWaves.length-1), "sum wave");
  
  int circleDiameter = 60;
  
  circles[0] = new UnitCircle(200, height-100, circleDiameter, random(0.05));
  for (int h = 1; h < circles.length; h++){
    circles[h] = new UnitCircle(circleDiameter, 1);
  }
}

void draw() {
  // Map vertical mouse position to volume.

  // Instead of setting the volume for every oscillator individually, we can just
  // control the overall output volume of the whole Sound library.
  
  int f2l = 30;
  int f2h = 300;
  float freq2 = map(mouseY, 0, height, f2l, f2h);
  float freq = map(mouseX, 0, width, freq2*0.95, freq2*1.25);
  
  float[] freqs = {freq, freq2, 200, 205};
  
  for (int g = 0; g < sounds.length; g++){
   sounds[g].freq(freqs[g]); 
  }

  //period = map(mouseX, width, 0, 100, 210);
  //dx = (TWO_PI / period) * xspacing;
  background(0);
  stroke(51);
  strokeWeight(4);
  //line(width*(0.05/0.3), 0, width*(0.05/0.3), height);
  
  for (int w = 0; w < baseWaves.length; w++){
    baseWaves[w].drawWave(freqs[w], false);
  }

  for (int j=0;j<sum.yvalues.length;j++){
    sum.yvalues[j] = 0;
    for (int w = 0; w < baseWaves.length; w++){
      sum.yvalues[j] += baseWaves[w].yvalues[j];
    }
    //wave1.yvalues[j]+wave2.yvalues[j];
  }
  sum.drawWave(4, true);
  textAlign(CENTER);
  text("|f1-f2| = "+nf(abs(freq-freq2),0,2), width/2, height-20);
  
  circles[0].speed = (12)/baseWaves[0].period;
  circles[0].update();
  circles[0].show();
  for (int h = 1; h < circles.length; h++){
    circles[h].speed = 12/baseWaves[h].period;
    circles[h].update(circles[h-1].point.x, circles[h-1].point.y);
    circles[h].show();
  }
  
  int startx = 300;
  
  UnitCircle lastCircle = circles[circles.length-1];
  strokeWeight(1);
  line(lastCircle.point.x, lastCircle.point.y, startx, lastCircle.point.y);
  strokeWeight(4);
  stroke(255);
  
  //point(startx+w2.point.x, w2.point.y);
  
  yValues.add(lastCircle.point.y);
  xValues.add(lastCircle.point.x);
  beginShape();
  for (int i = yValues.size()-1; i >= 0; i--){
    //vertex(startx+xValues.get(i), yValues.get(i));
    vertex(startx+yValues.size()-i, yValues.get(i));
  }
  endShape();
  if (yValues.size() > width-startx){
    yValues.remove(0);
    xValues.remove(0);
  }
}



class Wave{
  int xspacing = 1;   // How far apart should each horizontal location be spaced
  int w;              // Width of entire wave
  
  float theta = 0.0;  // Start angle at 0
  float amplitude = 30.0;  // Height of wave
  float period;  // How many pixels before the wave repeats
  float dx;  // Value for incrementing X, a function of period and xspacing
  float[] yvalues;  // Using an array to store height values for the wave
  int y;
  String text;
  Wave(int yCenter, String t){
    w = width+16;
    dx = (TWO_PI / period) * xspacing;
    yvalues = new float[w/xspacing];
    y = yCenter;
    text = t;
  }
  
  void drawWave(float freq, boolean special){
   period = 10000/freq;
   dx = (TWO_PI / period) * xspacing;
   if (!special){
     calcWave();
   }
   renderWave();
   textAlign(CENTER);
   if (!special){
     text(nf(freq,0,2)+" hz", width/2, y-42);
     textAlign(LEFT);
     text(text, 15, y-42);
   } else {
     textAlign(LEFT);
     text(text, 15, y-68);
   }
   
  }
  
  void calcWave() {
    float x = 0;
    for (int i = 0; i < yvalues.length; i++) {
      yvalues[i] = sin(x*2)*amplitude;
      x+=dx;
    }
  }

  void renderWave() {
    //noStroke();
    //fill(255);
    noFill();
    stroke(255);
    beginShape();
    // A simple way to draw the wave with a shape object
    for (int x = 0; x < yvalues.length; x++) {
      vertex(x*xspacing, y+yvalues[x]);
    }
    endShape();
  }
}

class UnitCircle{
  PVector center;
  float dia;
  float theta = 0.0;
  PVector point;
  float speed;
  UnitCircle(int cx, int cy, float s, float speed_){
    center = new PVector(cx,cy);
    point = new PVector();
    dia = s;
    speed = speed_;
  }
  
  UnitCircle(float s, float speed_){
    center = new PVector();
    point = new PVector();
    dia = s;
    speed = speed_;
  }
  
  void show(){
    strokeWeight(1);
    stroke(255,100);
    circle(center.x, center.y, dia);
    line(center.x, center.y, point.x, point.y);
    point(point.x, point.y);
  }
  
  void update(){
    calcPoint();
  }
  
  void update(float cx, float cy){
    center.x = cx;
    center.y = cy;
    calcPoint();
  }
  
  void calcPoint(){
    point.x = dia/2 * cos(theta) + center.x;
    point.y = dia/2 * sin(theta) + center.y;
    theta+=speed;
  }
}
