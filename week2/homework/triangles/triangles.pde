class Triangle {
  PVector pos;
  float rotation;


  Triangle(float x, float y) {
    pos = new PVector(x, y);
  }

  void faceTowards(float x, float y ) {

    float angle = atan2( y - pos.y, x - pos.x) + PI / 2;

    rotate(angle);
  }


  void draw() {

    // we must double translate then use the faceTowards function
    stroke(255, 0, 120);
    pushMatrix(); 
    translate(pos.x, pos.y);
    faceTowards(mouseX, mouseY);
    scale(2, 2);
    triangle(-5, 2, 5, 2, 0, -10);
    popMatrix();
  }
}
//creat new arrayList in order to add more triangles. 
ArrayList<Triangle> friends = new ArrayList<Triangle>();

void setup() {
  size(500, 500);

  int N = 10;
  int spacing = width / (N + 1);
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      friends.add(new Triangle( i * spacing + spacing, j * spacing + spacing ));
    }
  }
}

void draw() {
  background(0);

  for (Triangle t : friends) {
    t.draw();
  }
}
