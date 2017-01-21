Mover m;
float xoff, yoff, incX, incY;
PVector wind;

void setup() {
  size(640,360);
  background(255);
  m = new Mover();
  xoff = 0;
  yoff = 0;
  incX = 0.001;
  incY = 0.001;
  wind = new PVector(0.001,-0.002);
}
 
void draw() {
  background(255);
  wind.x = noise(xoff, yoff);
  wind.y =  noise(yoff, xoff);
  //m.applyForce(wind);
  
  m.checkEdges();
  m.update();
  m.display();
 
  xoff+= incX;
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
    topspeed = 5;
    r = random(200,255);
    g = random(255);
    b = random(255);
  }
  void update() {
    acc.x=noise(xoff)*0.1;
    acc.y-=incX;
    vel.add(acc);
    vel.limit(topspeed);
    loc.add(vel);
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
   println(loc.x,loc.y);
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