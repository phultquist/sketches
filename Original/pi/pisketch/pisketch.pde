String digits;

void setup() {
  size(400, 900);
  String[] strings = loadStrings("digits.txt");
  printArray(strings.length);
  digits = strings[0];
  surface.setResizable(true);
  frameRate(2);
}

void draw() {
  //noLoop();
  background(0);
  int val, x, y;
  char digit;
  y = 0;
  for (int i = 2; i<digits.length(); i++) {
    digit = digits.charAt(i);
    val = int(map(int(Character.getNumericValue(digit)), 0, 9, 0, 100));
    fill(val);
    x = i%width+1;
    y = int(i/int(width)) + 1;
    noStroke();
    rect(x, y, 1, 1);
    //if (i >= width*height){
    //  return;
    //}
  }
}
