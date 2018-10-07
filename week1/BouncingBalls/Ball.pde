class Ball { 
  float radius;
  float x, y;
  PVector pos;
  PVector vel;

  int col ;
  color[] colarray = new color[99];




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
    ellipse(pos.x, pos.y, radius, radius);

    // I am still trying to figure out changing each ball to a different color

    for (int i = 0; i < colarray.length; i++) {
      if (colarray[i] <100 ) {
        colarray [i] ++;
        //fill(col);
      }
    }
  }
}