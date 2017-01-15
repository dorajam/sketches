Walker w; // global var type Walker

void setup() {
  size(600,600);
  background(255);
  w = new Walker(); 
}

void draw() {
  w.step();
  w.display();
}

class Walker {
  int x;
  int y;
  
  Walker () {
     x = width / 2; 
     y = height / 2;
  }
  void display() {
    stroke(0);
    point(x,y);
  }
  void step() {
   int stepx = int(random(3)) - 1; //-1,0,1
   int stepy = int(random(3)) - 1;
   x += stepx;
   y += stepy;
  }
}