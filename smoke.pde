ParticleSystem psRed, psWhite, psGreen;

void setup() {
  size(800, 600);
  psRed = new ParticleSystem(0, new PVector(width/2 - 200, height / 2), 255, 0, 0);
  psWhite = new ParticleSystem(0, new PVector(width/2, height / 2), 255, 255, 255);
  psGreen = new ParticleSystem(0, new PVector(width/2 + 200, height / 2), 0, 255, 0);

}

void draw() {
  background(0);

  // Calculate a "wind" force based on mouse horizontal position
  float dx = map(mouseX, 0, width, -0.5, 0.5);
  float dy = map(mouseY, 0, height, -0.5, 0.5);

  PVector wind = new PVector(dx, dy);
  psRed.applyForce(wind);
  psWhite.applyForce(wind);
  psGreen.applyForce(wind);

  psRed.run();
  psWhite.run();
  psGreen.run();

  for (int i = 0; i < 10; i++) {
    psRed.addParticle();
    psWhite.addParticle();
    psGreen.addParticle();
  }  
}


// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {

  ArrayList<Particle> particles;    // An arraylist for all the particles
  PVector origin;                   // An origin point for where particles are birthed
  
  int r, g, b;
  ParticleSystem(int num, PVector v, int _r, int _g, int _b) {
    particles = new ArrayList<Particle>();              // Initialize the arraylist
    origin = v;                                   // Store the origin point
    r = _r;
    g = _g;
    b = _b;
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(origin, r, g, b));
    }
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

  // Method to add a force vector to all particles currently in the system
  void applyForce(PVector dir) {
    // Enhanced loop!!!
    for (Particle p : particles) {
      p.applyForce(dir);
    }
  }  

  void addParticle() {
    particles.add(new Particle(origin, r, g, b));
  }
}


class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float lifespan;
  PImage img;
  int r, g, b;
  int size;

  Particle(PVector l, int _r, int _g, int _b) {
    acc = new PVector(0, 0);
    float vx = randomGaussian()*0.3;
    float vy = randomGaussian()*0.3 - 1.0;
    vel = new PVector(vx, vy);
    loc = l.copy();
    lifespan = 100.0;
    r = _r;
    g = _g;
    b = _b;
    size = 20;
  }

  void run() {
    update();
    render();
  }

  // Method to apply a force vector to the Particle object
  // Note we are ignoring "mass" here
  void applyForce(PVector f) {
    acc.add(f);
  }  

  void update() {
    vel.add(acc);
    loc.add(vel);
    lifespan -= 2.5;
    acc.mult(0); // clear Acceleration
  }

  void render() {
    fill(r, g, b, lifespan);
    noStroke();
    ellipse(loc.x, loc.y, size, size);
  }

  boolean isDead() {
    if (lifespan <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
