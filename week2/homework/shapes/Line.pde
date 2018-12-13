class Line {
  PVector start, end;
  ArrayList<Box> boxes;


  Line(PVector start_, PVector end_) {

    start=start_;
    end=end_;
    boxes = new ArrayList<Box>();
    for (int n=0; n<10; n++) {
      boxes.add(new Box(start, end, random(0, 10)/10.0));
    }
  }
  void update() {

    for (int i=0; i<boxes.size(); i++) {
      boxes.get(i).update();
    }
    for (Box b : boxes) {
      b.update();
    }
  }
  void draw() {

    for (Box b : boxes) {
      b.draw();
    }
  }
}
