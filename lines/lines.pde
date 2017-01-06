int c;
int r;
int g;
int b;
int opacity;
int frameCount;

void setup() {
  size(1000,800,P2D);
  background(255);
  strokeWeight(1);
  frameRate(1);
  r = 255;
  g = 78;
  b = 88;
  opacity = 5;
  frameCount = 0;
}
void draw() {
  c = color(r, g, b, opacity);
  stroke(c);
  draw_lines();
  
}
void draw_lines() {
  int a = 0;
  int b = int(0.4 * height);
  int c = width - 1;
  int d = int(0.9 * height);
  int e = int(0.7 * width);
  int f = 0;
  int x = 0;
  int y = 0;

  for (int i=0; i < 75; i++) {
    x = int(random(width));
	y = int(random(width));
    if (i < 25) {
      line(a, b, x, y);
    }
    else if (i > 25 & i < 50) {
      line(c, d, x, y);
    }
    else {
      line(e, f, x, y);
    }
    if (frameCount%50 == 0) {
      r = r - 1;
    }
    frameCount++;
  }
}
