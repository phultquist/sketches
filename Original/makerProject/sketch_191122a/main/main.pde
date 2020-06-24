PImage victorImage;
int w = 1024;
int h = 768;

Choice c = new Choice("You wake up to see the monster staring at you.",
    "Run out of the house",
    "Stay and interact with the monster");

void setup(){
  size(1024,768); 
  background(255);
  //delay(3000);
  //background(255);
  

}

Victor player = new Victor();

void draw(){
 // background(255); 
  //background(200);
  //image(victorImage, 250, 250);
background(255);
  victorImage = loadImage("victor.png");
  c.show();
  updatePixels();
  delay(1000);
  background(255);
  noLoop();
}

void mousePressed() {
  int x = mouseX;
  int y = mouseY;
  
  c.check(x, y);
  //if (c.hidden) c.hide();
  
}
