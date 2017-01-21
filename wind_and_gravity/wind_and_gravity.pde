Mover m;
Mover[] balls = new Mover[200];

float xoff, yoff, incX, incY;
PVector wind;

void setup() {
  size(640,360);
  background(255);
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Mover(random(0.2,5), width/2, 20);
  }
  
  xoff = 0;
  yoff = 10000;
  incX = 0.001;
}
 
void draw() {
  background(255);  
  for (int i = 0; i < balls.length; i++) {
    float m = balls[i].mass;
    PVector gravity = new PVector(0, 0.001*pow(m,4));
    PVector wind = new PVector(noise(xoff)*0.001, noise(yoff)*0.001);
    balls[i].applyForce(wind);
    balls[i].applyForce(gravity);
    balls[i].checkEdges();
    balls[i].update();
    balls[i].display();
  }
  xoff+= incX;
  yoff+= incX;
}

class Mover {
  PVector loc;
  PVector vel;
  PVector acc;
  float r,g,b;
  float mass;
  
  Mover(float m, float x, float y) {
    mass = m;
    loc = new PVector(x, y); 
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    r = random(200, 255);
    g = random(150, 255);
    b = random(200, 255);
  }
  void update() {
    acc.x=noise(xoff)*0.1;
    acc.y-=incX;
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }
  void applyForce(PVector force) {
     PVector f = PVector.div(force, mass);
     acc.add(f);
  }
  void display() {
    stroke(0, 40);
    fill(color(r,g,b), 80);
    ellipse(loc.x, loc.y, mass*16, mass*16);
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