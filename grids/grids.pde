Grids grid;
int c;
Grids[] lines = new Grids[50];
int num;

void setup() {
  size(600, 600);
  grid = new Grids();
  lines[0] = grid;
  background(255);
  frameRate(10);
  c = 0;
  num = 1; // number of elements in array
}

void draw() {
  for (int i=0; i < num; i++) {
    lines[i].display();
    lines[i].move();
  }
  c+= 2;
  
  if (c%10 == 0) {
    if (num == 50) {
       num = 0; 
    }
    num++;
    grid = new Grids();
    lines[num - 1] = grid;
  }
}

class Grids {
  int x;
  int y;
  int[] lineX = new int[50];
  int[] lineY = new int[50];
  float r,g,b;

  Grids() {
    x = width/2;
    y = height/2;
    lineX[0] = x;
    lineY[0] = y;
    r = random(255);
    g = random(255);
    b = random(255);

  }
  void display() {
    r = random(255);
    g = random(255);
    b = random(255);
    noStroke();
    fill(r,g,b,c);
    ellipse(x,y,2,2);
  }
  void move() {
    // choose random direction
    x+=random(-10,10);
    y+=random(-10,10);
  }
}