int c;
int r;
int g;
int b;
int opacity;
int frameCount;

void setup() {
  size(600,600);
  background(255);
  strokeWeight(1);
  frameRate(1);
  opacity = 5;
  frameCount = 0;
}
void draw() {
  r = int(random(0.8, 1)*255);
  g = int(random(0.01, 0.8)*255);
  b = int(random(0.1, 0.9)*255);
  c = color(r, g, b, opacity);
  println(r,g,b);
  stroke(c);
  draw_lines();
  
}
void draw_lines() {
  int a = 0;
  int b = int(0.4 * width);
  int c = width - 1;
  int d = int(0.9 * width);
  int e = int(0.7 * width);
  int f = 0;
  int x = 0;
  int y = 0;
  
  for (int i=0; i < 75; i++) {
    if (i < 25) {
      line(a, b, x, y);
      x = int(random(width));
      y = int(random(width));
    }
    else if (i > 25 & i < 50) {
      x = int(random(width));
      y = int(random(width));
      line(c, d, x, y);
    }
    else {
      x = int(random(width));
      y = int(random(width));
      line(e, f, x, y);
    }
    if (frameCount%30 == 0) {
      r = r - 1;
    }
    frameCount++;
  }
}