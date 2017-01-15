int increment;
int centerX;
int centerY;
PShape rectangle;
PShape[] shapes;
int len;
int count;
int c;

void setup() {
 size(500,500);
 background(255);
 strokeWeight(1);
 centerX = int(0.5 * width - 1);
 centerY = int(0.5 * width - 1);
 increment = 0; 
 frameRate(5);
 len = 200;
 shapes = new PShape[len];
 count =0;
 c = 255;
}

void draw() {
  rectMode(CENTER);
  stroke(c);
  line(centerX, centerY, random(500), random(500));
  rectangle = createShape(RECT, centerX, centerY, increment, increment);
  
  for (int i = shapes.length - 1; i > 0 ; i--) {
    shapes[i] = shapes[i-1];
  }
  shapes[0] = rectangle;
  for (int i=0; i < count; i++) {
     shape(shapes[i]);
  }  
  increment=increment+5;
  count++;
  c=c - 4;
  if (increment == width) {
    noLoop();
  }
}