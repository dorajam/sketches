Star[] stars = new Star[200];
float speed;
void setup() {
  size(700,700);
  for (int i=0; i< stars.length; i++) {
     stars[i] = new Star(); 
  }
}
void draw() {
  speed = map(mouseX, 0, width, 0, 50);
  background(0);
  translate(width/2, height/2);
  for (int i=0; i< stars.length; i++) {
     stars[i].update();
     stars[i].show();
  }
}

class Star {
  float x;
  float y;
  float z;
  float pz;
  
  Star() {
    x = random(-width,width);
    y = random(-height,height);
    z = random(width);
    pz = z;
  }
  void update() {
    z=z-speed;
    if (z < 1) {
      z = width;
      x = random(-width, width);
      y = random(-height, height);
      pz = z;
    }
  }
  void show() {
    fill(255);
    noStroke();
    float move_x = map(x/z, 0, 1, 0, width);
    float move_y = map(y/z, 0, 1, 0, height);
    float r = map(z, 0, width, 16, 0);
    ellipse(move_x, move_y, r, r);
    
    float px = map(x/pz, 0, 1, 0, width);
    float py = map(y/pz, 0, 1, 0, height);
    
    pz = z;
    stroke(255);
    line(px, py, move_x, move_y);
  }

}