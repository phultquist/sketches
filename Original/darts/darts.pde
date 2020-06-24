void setup(){
  size(600,600);
  //frameRate(10);
}

int count = 0;
int padding = 0;
int size = 600;
int scale = size-2*padding;

ArrayList<Integer> results = new ArrayList<Integer>();
ArrayList<Float> averages = new ArrayList<Float>();

void draw(){
  count++;
  //background(255);
  //drawAxis();
  results.add(simulate());
  float avg = calculateAverage(results);
  averages.add(avg);
  println(avg);
  
  //float vx = 0;
  //float vy = 0;
  //float yValue = 0;
  //float xValue = 0;
  
  //for (int p = 1; p < averages.size()-1; p+=1){
  //  vx = padding + (float(p-1)/float(count))*scale;
  //  vy = averages.get(p-1)*scale;
  //  xValue = padding+(float(p)/float(count))*scale;
  //  yValue = averages.get(p)*scale;
  //  line(vx, (size-padding)-vy, xValue, (size-padding)-yValue);
  //}
  
  //text(str(avg), size-padding, size-padding-avg*scale-10);
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

float calculateAverage(ArrayList<Integer> marks) {
  Integer sum = 0;
  if(!marks.isEmpty()) {
    for (Integer mark : marks) {
        sum += mark;
    }
    return float(sum) / float(marks.size());
  }
  return sum;
}

Dartboard dartboard;
int simulate(){
  int numdarts = 1;
  dartboard = new Dartboard(width);
  int px = int(random(width));
  int py = int(random(height));
  float l = dartboard.chordLength(px, py);
  while (l != -1 && !Float.isNaN(l)){
    numdarts++;
    dartboard = new Dartboard(l);
    px = int(random(width));
    py = int(random(height));
    l = dartboard.chordLength(px,py);
    //if (numdarts>100){
    //  println("numdarts: "+l);
    //  println("px: "+px);
    //  println("py: "+py);
    //  println("l: "+l);
    //  exit();
    //  return 0;
    //}
  }
  return numdarts;
}
