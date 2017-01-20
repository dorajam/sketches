Mover m;
float xoff, yoff, incX, incY;
PVector wind;

void setup() {
  size(640,360);
  background(255);
  m = new Mover();
  xoff = 0;
  yoff = 0;
  incX = 0.01;
  incY = 0.001;
  wind = new PVector(0.001,-0.002);
}
 
void draw() {
  background(255);
  wind.x = noise(xoff, yoff);
  wind.y =  noise(yoff, xoff);
  m.applyForce(wind);
  
  m.checkEdges();
  m.update();
  m.display();
 
  xoff+=incX;
  yoff+= incY;
}



class Mover {
  PVector loc;
  PVector vel;
  PVector acc;
  float topspeed;
  float r,g,b;
  int size = 50;
  float mass = 10.0;
  
  Mover() {
    loc = new PVector(random(width), height-100); 
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    topspeed = 4;
    r = random(200,255);
    g = random(255);
    b = random(255);
  }
  void update() {
    vel.add(acc);
    vel.limit(topspeed);
    loc.add(vel);
    acc.mult(0);
  }
  void applyForce(PVector force) {
     PVector f = force.get();
     f.div(mass);
     acc.add(force);
  }
  void display() {
    stroke(0, 40);
    fill(color(r,g,b), 80);
    ellipse(loc.x, loc.y, size, size);
  }
  void checkEdges() {
   if (loc.x > width) {
      loc.x = 0;
    } else if (loc.x < 0) {
      loc.x = width;
    }
    if (loc.y+size/2> height) {
      vel.y*=-1;
    }  else if (loc.y-size/2 < 0) {
      vel.y*=-1;
    }
  }
}