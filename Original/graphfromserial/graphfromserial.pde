import processing.serial.*;

int[] counts = {0,0,0,0,0,0};
String[] names = {"red", "orange", "yellow", "green", "purple", "blank"};
int[][] colors = {{255,0,0},{255,100,0},{255,255,0},{0,255,0},{150,0,255},{255,255,255}};

Serial port;
String val;

void setup() {
  fullScreen();

  String portName = Serial.list()[0];
  port = new Serial(this, portName, 9600);
  
} // end setup
void draw() {
  //sets location for each bar, 50 units apart
  background(0);
  int padding = 50;
  int x = padding;
  int spacing = 100;
  int max = max(counts);
  float h;
  float w;
  for (int c = 0; c < counts.length; c++) {
    //println(x);
    //creates a counter for each of the values in the array
    //draws the rectangle for each of the values in the array to corresponding height
    h = (parseFloat(counts[c])/max)*(height-padding);
    w = parseFloat((width-2*padding))/(counts.length) - spacing;
    fill(colors[c][0], colors[c][1], colors[c][2]);
    rect (
      x+spacing/2, 
      height - h,
      w,
      h+10,3
    );
    textAlign(CENTER);
    fill(255);
    text(counts[c], x+spacing/2 + w/2, height-h-10);
    
    x += (width-2*padding)/(counts.length);
  }
  
  counts[int(random(counts.length))]++;
  delay(100);
  noLoop();
  if ( port.available() > 0) 
  {  // If data is available,
  val = port.readStringUntil('\n');         // read it and store it in val
  } 
//println(val); //print it out in the console
} // end draw
