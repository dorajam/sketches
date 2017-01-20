Mover[] movers = new Mover[20];

void setup() {
  size(640,360);
  background(255);
  for (int i=0; i < 20; i++) {
     movers[i] = new Mover();
  }
}
 
void draw() {
  background(255);
  for (int i=0; i < movers.length; i++) {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}


class Mover {
  PVector loc;
  PVector vel;
  PVector acc;
  float topspeed;
 
  Mover() {
    loc = new PVector(random(width), random(height)); 
    vel = new PVector(0,0);
    topspeed = 4;
  }
  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, loc);
    dir.normalize();
    dir.mult(0.5);
    acc = dir;
    vel.add(acc);
    vel.limit(topspeed);
    loc.add(vel);
  }
  void display() {
    stroke(0, 30);
    fill(color(random(200,255), random(255), random(255)), 30);
    ellipse(loc.x, loc.y, 30, 30);
  }
  void checkEdges() {
   if (loc.x > width) {
      loc.x = 0;
    } else if (loc.x < 0) {
      loc.x = width;
    }
 
    if (loc.y > height) {
      loc.y = 0;
    }  else if (loc.y < 0) {
      loc.y = height;
    }
  }
}