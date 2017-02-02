Agent[] agents = new Agent[5];

void setup() {
  size(700,700);
  for (int i=0; i < agents.length; i++) {
    agents[i] = new Agent();
  }
  
}
void draw() {
  background(255);
  PVector mouse = new PVector(mouseX, mouseY);
  
  fill(200);
  stroke(0);
  strokeWeight(2);
  ellipse(mouseX, mouseY, 40,40);
  
  for (int i=0; i < agents.length; i++) {
    agents[i].arrive(mouse);
    agents[i].update();
    agents[i].show();
  }
}

class Agent {
  PVector loc;
  PVector vel;
  PVector acc;
  float maxspeed;
  float maxforce;
  float r=6;
  
  Agent() {
    loc = new PVector(random(width), random(height));
    vel = new PVector(random(-1,1), random(-1,1));
    acc = new PVector(0,0);
    maxspeed = 2;
    maxforce = 0.1;
  }
  void arrive(PVector target) {
    PVector desired = PVector.sub(target, loc);
    float d = desired.mag();
    if (d < 100) {
      float m = map(d, 0, 100, 0, maxspeed);
      desired.setMag(m);
    } else {
      desired.setMag(maxspeed);
    }
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    applyForce(steer);
  }
  void applyForce(PVector force) {
    acc.add(force);
  }
  void update() {
    vel.add(acc);
    vel.limit(maxspeed);
    loc.add(vel);
    acc.mult(0);
  }
  void show() {
    float theta = vel.heading2D() + PI/2;
    fill(127);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-2*r, r*2);
    vertex(2*r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
}