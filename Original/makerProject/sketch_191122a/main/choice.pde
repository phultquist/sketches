class Choice{
  String q;
  String o;
  String t;
  boolean hidden = true;
  String selected;
  Button b1;
  Button b2;
  
  Choice(String question, String opt1, String opt2){
    q = question;
    o = opt1;
    t = opt2;
  }
  
  void show(){
    hidden = false;
    run();
  }
  
  void run(){ 
    //println(hidden);
    if (!hidden){
      noStroke();
      fill (51);
      rectMode(CORNERS);
      rect(w/2-200,h/2+200,w/2+200,h/2-200, 10);
      fill (255);
      textAlign(CENTER, CENTER);
      textSize(15);
      text(q,w/2 - 200,h/2-150, w/2+200, h/2-50);
      showChoices();
      updatePixels();
    }
  }
  
  void hide(){
    hidden = true;
    background(255);
    print("tried to hide");
  }
  
  void showChoices(){
    stroke(255);
    noFill();
    b1 = new Button(w/2 - 112, 530, o);
    b2 = new Button(w/2 + 112, 530, t);
    //rect(w/2-150, h/2+100,w/2-50,h/2+150);
    //rect(w/2-150, h/2+100,w/2-50,h/2+150);
  }
  
  void check(int mx, int my){
    if (b1.checkIfSelected(mx, my)){
      selected = o;
      hide();
    } else if (b2.checkIfSelected(mx, my)) {
      selected = t;
      hide();
    }
    //hide();
    //println(hidden);
    //print(selected);
  }
}

class Button{
  boolean clicked = false;
  int middleX;
  int middleY;
  int xl = 70;
  int yl = 50;
  Button(int x, int y, String text){
    stroke(255);
    noFill();
    rectMode(CENTER);
    
    middleX = x;
    middleY = y;
    
    rect(x, y, 150, 50);
    rectMode(CORNERS);
    text(text, x-xl, y+yl,x+xl,y-yl);
  }
  
  boolean checkIfSelected(int mx, int my){
    if ( ((mx > (middleX - xl)) && (mx < (middleX + xl))) && ((my > (middleY - yl) && (my < middleY + yl))) ){
      clicked = true;
      return true;
    }
    return false;
  }
}
