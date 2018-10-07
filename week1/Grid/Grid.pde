void mySmiley(int x, int y) {

  fill(255, 255, 0);
  ellipse(x * 25 +10, y * 25+10, 20, 20);
  fill(0);
  ellipse(x * 25 +6, y * 25 +6, 3, 3);
  ellipse(x * 25 +15, y * 25 + 6, 3, 3);
  ellipse(x * 25 +10, y * 25 +15, 5, 5);

}

void setup() {
  size (500, 500);
  background(0);
}
void draw() {

  for (int y= 0; y <30; y++) {
    for (int x=0; x < 30; x++) {
      mySmiley( x, y);
    }
  }
}