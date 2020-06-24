//Patrick Hultquist
//Nov 2019

int count = 0;
int size = 800;
int padding = 50;
int scale = (size-2*padding);
int num = 3;
int previousFrequency = 0;

ArrayList<Integer> values = new ArrayList<Integer>();
ArrayList<Float> percents = new ArrayList<Float>();

void setup() {
  size(800, 800);
  //frameRate(10);
  simulate();
}

void draw() {
  count++;
  background(255); 
  drawAxis();
  float percent;
  values.add(simulate());
  percent = calcPercent();
  percents.add(percent);
  float py = 0;
  float px = 0;
  float yValue = 0;
  float xValue = 0;
  
  for (int p = 1; p < percents.size()-1; p+=1){
    px = padding + (float(p-1)/float(count))*scale;
    py = percents.get(p-1)*scale;
    xValue = padding+(float(p)/float(count))*scale;
    yValue = percents.get(p)*scale;
    line(px, (size-padding)-py, xValue, (size-padding)-yValue);
  }
  text(str(percent), size-padding, size-padding-percent*scale-10);
}

void drawAxis(){
  fill(0);
  line(padding,padding,padding,size-padding);
  line(padding,size-padding,size-padding,size-padding);
  textAlign(CENTER, BOTTOM);
  text(str(count), size-padding,size-padding+20);
  text("0", padding,size-padding+20);
  textAlign(LEFT, BOTTOM);
  text("1", padding-30, padding+20);
}

float calcPercent(){
  int frequency = previousFrequency;
  if (values.get(values.size()-1) == 1) {
    frequency++;
  }
  float p = float(frequency)/float(count);

  previousFrequency = frequency;
  return (p);
}

//ArrayList<Integer> spots = new ArrayList<Integer>();
int numSeats = 100;

int spots[] = new int[numSeats];

int numPeople = numSeats;

int simulate(){
  int k;
  int j;
  for (int o = 0; o < numPeople; o++){
    spots[o] = -1;
  }
  spots[int(random(numPeople))] = 0;
  for (k = 1; k < numPeople; k++){
    if (spots[k]!=-1){
      j = int(random(numPeople));
      while (spots[j]!=-1){
        j = int(random(numPeople));
      }
      spots[j] = k;
    } else {
      spots[k] = k;
    }
  }
  if (spots[numSeats - 1] == numSeats - 1) {return 1;}
  return 0;
}

boolean looping = true;

void mousePressed(){
  if (looping){
    noLoop();
    looping = false;
  } else {
    loop();
    looping = true;
  }
  
}
