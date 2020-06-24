//int numruns = 1000000;
int numruns = 100000;
int ymax = 2;
void setup() {
  size(600, 600);
  strokeWeight(1);
  stroke(255);
  textAlign(CENTER);
  fill(255);
  rectMode(CORNERS);
}

void draw() {
  noLoop();
  background(51);
  int buffer = 50;
  line(buffer, buffer, buffer, height-buffer);
  line(buffer, height-buffer, width-buffer, height-buffer);

  int interestedTill = 100;
  int barwidth = ((width-2*buffer) / (interestedTill));
  for (int i = 1; i <= interestedTill; i++) {
    float x = ((width-2*buffer) / (interestedTill))*(i-1) + buffer;
    //text(i, x+barwidth/2, height-buffer+20);
    float val = sim(i);
    float y = (height-2*buffer)-map(val, 0, ymax, 0, height-2*buffer);
    //text(val, x+barwidth/2, y-10);
    stroke(0);
    rect(x, height-buffer, x+barwidth, y);
  }
}

float sim(int steps) { //numruns is the number of trials //steps is the number of steps per trial

  int pointsX = 20, 
    pointsY = 20;

  PVector dir = new PVector();
  PVector home = new PVector(pointsX/2, pointsY/2);

  int px, py;
  float atOg;
  
  ArrayList<Float> data = new ArrayList<Float>();

  for (int i = 0; i < numruns; i++) 
  {
    px = (int)home.x; //pos x
    py = (int)home.y; //pos y
    atOg = 0; //times we hit origin

    for (int n = 0; n < steps; n++) 
    {
      float randnum = random(1);
      if (randnum <= 0.25) {
        dir.x = -1;
        dir.y= 0;
      } else if (randnum <= 0.5) {
        dir.x = 1;
        dir.y = 0;
      } else if (randnum <= 0.75) {
        dir.x = 0;
        dir.y = -1;
      } else if (randnum <= 1) {
        dir.x = 0;
        dir.y = 1;
      }
      px += dir.x;
      py += dir.y;
      boolean atOrigin = home.x == px && home.y == py;
      if (atOrigin) {
        atOg++;
        //break;
      }
    }
    //float dist = abs(home.x-px)+abs(home.y-py);


    data.add(atOg);
  }
  float avg = calculateAverage(data);
  //println("steps: "+steps+ "   distance: "+avg);
  println(avg);
  return avg;
}

float calculateAverage(ArrayList<Float> marks) {
  float sum = 0.0;
  if (!marks.isEmpty()) {
    for (Float mark : marks) {
      sum += mark;
    }
    return (float)((float)sum / marks.size());
  }
  return sum;
}
