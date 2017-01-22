PVector v;
Particle p;
Particle[] particles = new Particle[200];
int scl = 20;
int cols, rows;
float xoff, yoff, zoff, inc;

PVector[] flowfield;

void setup() {
  size(600, 600);
  background(255);
  frameRate(30);
  cols = width / scl;
  rows = height / scl;
  flowfield = new PVector[cols*rows];
  xoff = 0;
  zoff = 0;
  yoff = 10000;
  inc = 0.1;
  
  for (int i=0; i < particles.length; i++) {
   particles[i] = new Particle(random(width), random(height));
  }
}

void draw() {
  yoff = 0;
  for (int j=0; j < rows; j++) {
    xoff = 0;
    for (int i=0; i < cols; i++) {
      float angle = noise(xoff, yoff, zoff) * TWO_PI*4;
      v = PVector.fromAngle(angle);
      v.setMag(0.5);
      int idx = i + j * cols;
      flowfield[idx] = v;
      xoff+=inc;
      
      stroke(0, 50);
      //pushMatrix();
      //translate(i*scl, j*scl);
      //rotate(v.heading());
      //strokeWeight(1);
      //line(0,0, scl, 0);
      //popMatrix();
      
    }
    yoff+=inc;
    zoff+=0.0003;
  }
  for (int i=0; i < particles.length; i++) { 
    particles[i].follow(flowfield);
    particles[i].update();
    particles[i].edges();
    particles[i].display();
  }
}

class Particle {
  PVector loc;
  PVector acc;
  PVector vel;
  PVector prevPos;
  float maxspeed;

  Particle(float x_, float y_) {
    loc = new PVector(x_, y_);
    acc = new PVector(0, 0);
    vel = new PVector(0,0);
    maxspeed = 2;
    
    prevPos = loc;
  }
  void update() {
    vel.add(acc);
    vel.limit(maxspeed);
    loc.add(vel);
    acc.mult(0);
    updatePrevpos();
  }
  void updatePrevpos() {
    prevPos.x = loc.x; 
    prevPos.y = loc.y; 
  }
  void applyForce(PVector force) {
    acc.add(force); 
  }
  void display() {
    stroke(0, 10);
    strokeWeight(1);
    line(loc.x, loc.y, prevPos.x, prevPos.y);
  }
  void edges() {
   if (loc.x > width) {
     loc.x = 0;
   } else if (loc.x < 0) {
     loc.x = width-1;
   }
   if (loc.y > height) {
     loc.y = 0;
   } else if (loc.y < 0) {
     loc.y = height-1;
   }
  }
  void follow(PVector[] vectors) {
   int x = floor(loc.x / scl);
   int y = floor(loc.y / scl);
   int idx = x + y * cols;
   PVector force = vectors[idx];
   applyForce(force);
  }
}