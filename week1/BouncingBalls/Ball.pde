class Ball { 
  float radius;
  float x, y;
  PVector pos;
  PVector vel;
  int r,g,b;





  Ball( float x, float y, float _radius) {
    pos = new PVector(x, y);
    vel = new PVector(random(-3, 3), random(-3, 3));
    radius = _radius;
    r= int (random(255));
    g = int (random(255));
    b = int (random(255));
    
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
    ellipse(pos.x, pos.y, radius, radius);
    fill(r,g,b);


      }
    }