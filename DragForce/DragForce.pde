Mover m;
Liquid liquid;
Mover[] balls = new Mover[30];

float xoff, yoff, incX, incY;
PVector wind;

void setup() {
  size(640,360);
  background(255);
  liquid = new Liquid(0,height*0.6, width, height*0.6, 0.1);
  
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Mover(random(0.2,5), random(width), 20);
  }
  
  xoff = 0;
  yoff = 10000;
  incX = 0.001;
}
 
void draw() {
  background(255);  
  liquid.display();
  
  for (int i = 0; i < balls.length; i++) {
    if (balls[i].inLiquid(liquid)) {
     balls[i].drag(liquid); 
    }
    
    float m = balls[i].mass;
    PVector gravity = new PVector(0, 0.006*pow(m,2));
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
    g = random(0, 100);
    b = random(0, 100);
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
    stroke(0, 40);
    fill(color(r,g,b), 100);
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
  boolean inLiquid(Liquid l) {
   if (loc.x > l.x && loc.x < l.x+l.w && loc.y > l.y && loc.y < l.y + l.h) {
    return true;
   } 
   return false;
  }
  void drag(Liquid l) {
    float speed = vel.mag();
    float dragMag = speed * speed * l.c;
    PVector drag = vel.get();
    drag.mult(-1);
    drag.normalize();
    drag.mult(dragMag);
    applyForce(drag);
  }
}


class Liquid {
 float x,y,w,h;
 float c;
 
 Liquid(float x_, float y_, float w_, float h_, float c_) {
  x = x_;
  y = y_;
  w = w_;
  h = h_;
  c = c_;
 }
 void display() {
  noStroke();
  fill(color(10,50,200), 50);
  rect(x,y,w,h);
 }
}