PImage img;

void setup() {
  img = loadImage("universe.jpg");
  size(800,500, P2D);
}
//
void draw() {
  loadPixels();
  img.loadPixels();
  for (int x=0; x < width; x++) {
    for (int y=0; y < height; y++) {
      int idx = width * y + x;
      float d = dist(x,y, width/2, height/2);
      pixels[idx] = img.pixels[idx] / 2;
    }
  }
  updatePixels();
}