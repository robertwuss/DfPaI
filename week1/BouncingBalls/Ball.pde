class Ball { 
  float radius;
  float x, y;
  PVector pos;
  PVector vel;


  Ball( float x, float y, float _radius) {
    pos = new PVector(x, y);
    vel = new PVector(random(-3, 3), random(-3, 3));
    radius = _radius;
    
    
  }

  void update() {

    pos.add (vel);

    if (pos.x < radius || pos.x > width - radius) {
      vel.x *= -1;
    }
    if (pos.y < radius || pos.y > height - radius) {
      vel.y *= -1;
    }
  }

  void draw() {
    ellipse(pos.x, pos.y, radius , radius);
    fill(random(0, 256), random(0,256), random(0,256));
    
  }
}