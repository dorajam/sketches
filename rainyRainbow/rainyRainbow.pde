Particle p;
ArrayList<Particle> particles;
float c;
int count;

void setup() {
  size(740,360);
  p = new Particle(new PVector(width/2, 20));
  particles = new ArrayList<Particle>();
  for (int i=0; i < 50; i++) {
    particles.add(new Particle(new PVector(width/2, 20)));
  }
}
void draw() {
  background(255);
  if (count%7 == 0) {
    particles.add(new Particle(new PVector(width/2, 20)));
  }
  for (Particle p: particles) {
    p.update();
    p.display();
  }
  if (particles.size() > 200) {
     particles.remove(0); 
  }
  
  //if (p.isDead()) {
  //  background(255, 0, 0);
  // }
  count++;
}

class Particle {
  PVector loc;
  PVector acc;
  PVector vel;
  float lifeSpan = 400;
  float r,g,b;

  Particle(PVector l) {
    acc = new PVector(0, 0.006);
    vel = new PVector(random(-1,1), random(-1,1));
    loc = l.get();
  }
  void update() {
    vel.add(acc);
    loc.add(vel);
    lifeSpan -= 2;
  }
  void display() {
    r = random(200,255);
    g = random(150,255);
    b = random(150,255);
    println(c);
    stroke(color(r,g,b), lifeSpan);
    strokeWeight(2);
    fill(color(r,g,b),lifeSpan);
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