class Box {

  float amt;
  PVector position;

  PVector start, end;
  Box(PVector start_, PVector end_, float amt_ ) {

    start=start_;

    end=end_;

    amt=amt_;
  }
  void update() {
    position = new PVector();
    position.x=lerp(start.x, end.x, amt%1.0);
    position.y=lerp(start.y, end.y, amt%1.0);
    position.z=lerp(start.z, end.z, amt%1.0);
    amt+=0.001;
  }
  void draw() {
    pushMatrix();
    stroke(255, 50);
    translate(scaleFactor*position.x, scaleFactor*position.y, scaleFactor*position.z);
    noStroke();
    fill(255, 30);

    box(10);

    popMatrix();
  }
}
