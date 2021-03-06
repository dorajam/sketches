Rectangle rect;
int increment;
int centerX;
int centerY;
Rectangle[] shapes;
int len;
int count;
int c;

void setup() {
 size(1000, 800);
 background(255);
 strokeWeight(1);
 centerX = int(0.5 * width - 1);
 centerY = int(0.5 * width - 1);
 increment = 0; 
 frameRate(5);
 rect = new Rectangle(centerX,centerY, increment);
 len = 400;
 shapes = new Rectangle[len];
 count =0;
 c = 255;
}

void draw() {
  rectMode(CENTER);
  stroke(c);
  line(centerX, centerY, random(500), random(500));
  for (int i = shapes.length - 1; i > 0 ; i--) {
    shapes[i] = shapes[i-1];
  }
  rect = new Rectangle(centerX,centerY, increment);
  shapes[0] = rect;
  for (int i=0; i < count; i++) {
     shapes[i].display();
  }  
  increment=increment+5;
  count++;
  c=c - 4;
  if (increment == width) {
    noLoop();
  }
}

class Rectangle {
  PShape rect;
	Rectangle(int centerX, int centerY, int increment) {
    rect(centerX, centerY, increment, increment);
  }
  void display() {
    shape(rect);
  }
}