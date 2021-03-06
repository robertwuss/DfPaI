Ball ball;


Ball [] balls = new Ball[100];


void setup() {
  size(900, 900);



  for (int i = 0; i < balls.length; i++) {
    float radius = random(5, 10);
    float x = random(radius, width - radius);
    println(x);
    float y = random(radius, height - radius);
    println(y);
    balls[i] = new Ball(x, y, radius);
  }
}



void draw() {
  background(0);


  for (Ball b : balls) {
    b.update();
    b.draw();
  }
  for (Ball b : balls) {
    b.handleCollisions(balls);
  }
}
