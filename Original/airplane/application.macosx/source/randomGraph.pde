int count = 0;
int size = 500;
int padding = 50;
int scale = (size-2*padding);
int num = 7;


ArrayList<Integer> values = new ArrayList<Integer>();
ArrayList<Float> percents = new ArrayList<Float>();

void setup() {
  size(500, 500);
  //frameRate(10);
}

void draw() {
  count++;
  background(255); 
  drawAxis();
  values.add(int(random(num)));
  float percent = calcPercent();
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
    //line(padding,size-padding,450,(size-padding)-(percents.get(percents.size()-1)*(scale)));
  }
  text(str(percent), size-padding, size-padding-percent*scale-10);
  
  //print(values);
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
  //println(values);
  int frequency = 0;
  for (int i = 0; i < values.size(); i++){
    if(values.get(i) == 0){
      frequency++;
    }
  }
  float p = float(frequency)/float(count);

  return (p);
}
