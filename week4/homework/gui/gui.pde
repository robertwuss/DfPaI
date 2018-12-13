import controlP5.*;



ControlP5 cp5;

int r, g, b = 255;
int colour;


void setup() {

  size (500, 500);
  cp5 = new ControlP5(this);


  // add slider  
  cp5.addSlider("r")
    .setPosition(10, 100)
    .setSize(200, 20)
    .setRange(0, 255)
    .setValue(250)
    ;

  cp5.addSlider("g")
    .setPosition(10, 150)
    .setSize(200, 20)
    .setRange(0, 255)
    .setValue(250)
    ;

  cp5.addSlider("b")
    .setPosition(10, 200)
    .setSize(200, 20)
    .setRange(0, 255)
    .setValue(250)
    ;
}

void draw() {
  //control background via v1
  background(r, g, b);
}
