int n = 40;
int groups = 2;
float scale;
int houses[][] = new int[n][n];

void setup(){
  size(800,800);
  background(0);
  stroke(255);
  scale = width/n;
  fill(0,0, 255, 0, 0);
  createBoard();
}

void fill(int row, int col, int r, int g, int b){
  rectMode(CORNERS);
  fill(r, g, b);
  rect(row*scale,col*scale, (row+1)*scale,(col+1)*scale);
}

void draw(){
  //background(0);
  //frameRate(10);
  //fill(int(random(n)), int(random(n)), 255, 0, 0);
  int r = 0;
  int g = 0;
  int b = 0;
  for (int row = 0; row<n; row++){  
    for (int col = 0;col<n; col++){  
      if (houses[row][col] == 0){
        r = 255;
        g = 0;
        b = 0;
      } else if (houses[row][col] == 1){
        r = 0;
        g = 255;
        b = 0;
      } else if (houses[row][col] == 2){
        r = 0;
        g = 0;
        b = 255;
      } else {
        r = 0;
        g = 0;
        b = 0;
      }
      fill(row, col, r, g, b);
    }
  }
  //
  int nd = 10;
  for(int s=0;s<nd;s++){
    seek();
  }
  moveOut(nd);
}

int score(int row, int col, int value){
  int top;
  int bottom;
  int left;
  int right;
  int tr;
  int tl; 
  int bl;
  int br;
  if (row == 0){
    top = 1;
  } else {
    top = houses[row-1][col];
  }
  
  if (row == n-1){
    bottom = 1;
  } else {
    bottom = houses[row+1][col];
  }
  
  if (col == 0){
    left = 1;
  } else {
    left = houses[row][col-1];
  }
  
  if (col == n-1){
    right = 1;
  } else {
    right = houses[row][col+1];
  }
    
  int[] d = {top, bottom, left, right};
  int score = 0;
  for (int j = 0; j<d.length; j++){
    if (d[j] == value) score++;
  }
  return score;
}

void createBoard(){
  for (int row = 0; row<n; row++){  
    for (int col = 0;col<n; col++){  
      line(row*scale, col*scale, (row)*scale, (col+1)*scale);
      line(row*scale, (col+1)*scale, (row+1)*scale, (col+1)*scale);
      houses[row][col] = int(random(2));
    }
  }
  
  moveOut(20);
}

void moveOut(int number){
  for (int k = 0; k<number;k++){
    int drow = int(random(n));
    int dcol = int(random(n));
    houses[drow][dcol] = -1;
  }
}

void seek(){
  int type = int(random(groups));
  int bestRow = 0;
  int bestCol = 0;
  int bestScore = 0;
  int numEmpty = 0;
  for (int row = 0; row<n; row++){  
    for (int col = 0;col<n; col++){  
      if (houses[row][col] == -1){
        numEmpty++;
        if (score(row, col, type) >= bestScore){
          bestRow = row;
          bestCol = col;
          bestScore = score(row, col, type);
        }
      }
    }
  }
  
  if (numEmpty==0){
    return;
  }
  
  houses[bestRow][bestCol] = type;
  //fill(bestRow, bestCol, )
}
