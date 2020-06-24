import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class randomGraph extends PApplet {

int count = 0;
int size = 500;
int padding = 50;
int scale = (size-2*padding);
int num = 7;


ArrayList<Integer> values = new ArrayList<Integer>();
ArrayList<Float> percents = new ArrayList<Float>();

public void setup() {
  
  //frameRate(10);
}

public void draw() {
  count++;
  background(255); 
  drawAxis();
  values.add(PApplet.parseInt(random(num)));
  float percent = calcPercent();
  percents.add(percent);
  float py = 0;
  float px = 0;
  float yValue = 0;
  float xValue = 0;
  
  for (int p = 1; p < percents.size()-1; p+=1){
    px = padding + (PApplet.parseFloat(p-1)/PApplet.parseFloat(count))*scale;
    py = percents.get(p-1)*scale;
    xValue = padding+(PApplet.parseFloat(p)/PApplet.parseFloat(count))*scale;
    yValue = percents.get(p)*scale;
    line(px, (size-padding)-py, xValue, (size-padding)-yValue);
    //line(padding,size-padding,450,(size-padding)-(percents.get(percents.size()-1)*(scale)));
  }
  text(str(percent), size-padding, size-padding-percent*scale-10);
  
  //print(values);
}

public void drawAxis(){
  fill(0);
  line(padding,padding,padding,size-padding);
  line(padding,size-padding,size-padding,size-padding);
  textAlign(CENTER, BOTTOM);
  text(str(count), size-padding,size-padding+20);
  text("0", padding,size-padding+20);
  textAlign(LEFT, BOTTOM);
  text("1", padding-30, padding+20);
}

public float calcPercent(){
  //println(values);
  int frequency = 0;
  for (int i = 0; i < values.size(); i++){
    if(values.get(i) == 0){
      frequency++;
    }
  }
  float p = PApplet.parseFloat(frequency)/PApplet.parseFloat(count);

  return (p);
}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "randomGraph" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
