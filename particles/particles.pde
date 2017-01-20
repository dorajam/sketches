Particle p;
ArrayList<Particle> particles;

void setup() {
  size(740,360);
  p = new Particle(new PVector(width/2, 20));
  particles = new ArrayList<Particle>();
  for (int i=0; i < 10; i++) {
    particles.add(new Particle(new PVector(width/2, 20)));
  }
}
void draw() {
  background(255);
  for (Particle p: particles) {
    p.update();
    p.display();
  }

  
  if (p.isDead()) {
    background(255, 0, 0);
   }
}

class Particle {
  PVector loc;
  PVector acc;
  PVector vel;
  float lifeSpan = 200;

  Particle(PVector l) {
    acc = new PVector(0, 0.005);
    vel = new PVector(random(-1,1), random(-1,1));
    loc = l.get();
  }
  void update() {
    vel.add(acc);
    loc.add(vel);
    lifeSpan -= 2;
  }
  void display() {
    stroke(0, lifeSpan);
    strokeWeight(2);
    fill(127);
    ellipse(loc.x, loc.y, 12, 12); 
  }
  boolean isDead() {
    if (lifeSpan <= 0) {
      return true;
    } else {
      return false;
    }
  }
}