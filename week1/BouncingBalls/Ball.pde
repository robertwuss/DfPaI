class Ball { 
  float radius;
  float x, y;
  PVector pos;
  PVector vel;


  Ball( float _x, float _y, float radius) {
    x= _x;
    y= _y;
    pos = new PVector(x, y);
    vel = new PVector(random(-3, 3), random(-3, 3));
    radius = 50;
  }

  void update() {

    pos.add (vel);

    if (pos.x < radius || pos.x < width - radius) {
      pos.x *= -1;
    }
    if (pos.y < radius || pos.y < height - radius) {
      pos.y *= -1;
    }
  }

  void draw() {
    ellipse(pos.x, pos.x, radius * 2, radius);
  }
}