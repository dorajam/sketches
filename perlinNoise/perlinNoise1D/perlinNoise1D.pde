Walker w; // global var type Walker
float tx,ty;

void setup() {
  size(600,600);
  background(255);
  //frameRate(30);
  w = new Walker(); 
  tx = 0;
  ty = 10000;
}

void draw() {
  w.step();
  w.display();
}

class Walker {
  float x;
  float y;
  
  Walker () {
     x = width / 2; 
     y = height /2;
  }
  void display() {
    stroke(0);
    ellipse(x,y,4,4);
  }
  void step() {
   x = map(noise(tx),0,1,0,width);
   y = map(noise(ty),0,1,0,height);
   tx += 0.01;
   ty += 0.01;

  }
}