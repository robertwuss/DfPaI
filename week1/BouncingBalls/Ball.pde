class Ball { 
  float radius;
  float x, y;
  PVector pos;
  PVector vel;
  int r, g, b;
  float maxVel = 2;





  Ball( float x, float y, float _radius) {
    pos = new PVector(x, y);
    vel = new PVector(random(-1, 1), random(-1, 1));
    radius = _radius;
    r= int (random(255));
    g = int (random(255));
    b = int (random(255));
  }

  void update() {

    pos.add (vel);

    //checking for walls
    if (pos.x < radius || pos.x > width - radius) {
      vel.x *= -1;
    }
    if (pos.y < radius || pos.y > height - radius) {
      vel.y *= -1;
    }
    
    // move ball to location when mouse pressed
    if (mousePressed) {
      PVector newVel= new PVector(mouseX - pos.x, mouseY-pos.y);
      newVel.normalize();
      vel.add(newVel);
    }
    
     // limit speed of balls
    vel.limit(maxVel);
  }

  //double loop to handle the ball collissions. I am checking for the check of two radius's then creating a new velocity to bounce them off each other

  void handleCollisions(Ball[] balls) {
    for (Ball b : balls) {
      if (b != this) {
        if (pos.dist(b.pos) < radius + b.radius)
        {
          PVector reaction = PVector.sub(pos, b.pos);
          float len = vel.mag();
          reaction.setMag(len);
          vel.x = reaction.x;
          vel.y = reaction.y;
        }
      }
    }
  }

  void draw() {
    ellipse(pos.x, pos.y, radius*2, radius*2);
    fill(r, g, b);
  }
}
