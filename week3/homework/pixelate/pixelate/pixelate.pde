PImage img; //

void setup() {
  size(500, 500); 
  img = loadImage("hand.jpg");
}

void draw() {
  background(0);


  //loadPixels();
  img.loadPixels();
  for (int x=0; x<img.width; x=x+10) {
    for (int y=0; y<img.height; y=y+10) {
      int index = x + y*img.width;
      float r = red(img.pixels[index]);
      float g = green(img.pixels[index]);
      float b = blue(img.pixels[index]);
      color newCol= color(r, g, b);
      fill(newCol); 
      noStroke();
      rect(x, y, 10, 10);// pixelates colors into rectangle
    }
  }
} 
