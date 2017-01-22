Mover m;
Mover[] balls = new Mover[100];
Attractor[] stars = new Attractor[1];
Attractor a;
float x;

void setup() {
  size(500,500);
  background(255);
  frameRate(100);
  a = new Attractor(50);
  x = 0;
  
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Mover(random(0.2,5), random(width), random(height));
  }
}
 
void draw() {
  //background(255);
  for (int i = 0; i < balls.length; i++) {
    PVector f = a.attract(balls[i]);
    balls[i].applyForce(f);
    balls[i].update();
    balls[i].checkEdges();
    balls[i].display();
    //a.display();
   }
   if (x > 255) {
     x = 0;
   }
   x++;
}

class Mover {
  PVector loc;
  PVector vel;
  PVector acc;
  float r,g,b;
  float mass;
  PVector prevPos;
  
  Mover(float m, float x, float y) {
    mass = m;
    loc = new PVector(x, y); 
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    r = random(200, 255);
    g = random(0, 100);
    b = random(0, 100);
    prevPos = loc;
  }
  void update() {
    acc.x=random(-1,1)*0.01;
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }
  void applyForce(PVector force) {
     PVector f = PVector.div(force, mass);
     acc.add(f);
  }
  void display() {
    stroke(x, 100);
    line(loc.x, loc.y, prevPos.x, prevPos.y);
    updatePrevPos();
  }
  void updatePrevPos() {
    prevPos.x = loc.x;
    prevPos.y = loc.y;
  }
  void checkEdges() {
   if (loc.x > width) {
      vel.x = vel.x * -1;
      loc.x = width;
    } else if (loc.x < 0) {
      vel.x = vel.x*-1;
      loc.x = 0;
    }
    if (loc.y> height) {
      vel.y = -1*vel.y;
      loc.y = height;
    }  else if (loc.y < 0) {
      vel.y*=(-1);
      loc.y = 0;
    }
  }  
}

class Attractor {
  float mass;
  PVector loc;
  float G;
  
  Attractor(float m_) {
    loc = new PVector(width/2, height/2);
    mass = m_;
    G = 0.4;
  }
  PVector attract(Mover m) {
    PVector force = PVector.sub(loc, m.loc);   // dir from one obj to the other
    float distance = force.mag();              // distance between objects
    distance = constrain(distance,5.0,25.0);
    force.normalize();
    
    float strength = (G * mass * m.mass) / (distance*distance);
    force.mult(strength);
    return force;
  }
  void display() {
    noStroke();
    fill(color(255, 170, 100), 5);
    ellipse(loc.x, loc.y, mass, mass);
  }
}