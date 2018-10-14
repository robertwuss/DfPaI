import processing.video.*;

int numPixels;
PImage background;
PImage sunflowerBackground;
Capture capture;



void setup() {
  size(640, 480);
  sunflowerBackground = loadImage("sunflower.jpg");
  sunflowerBackground.resize(width, height);

  sunflowerBackground.loadPixels ();

  capture = new Capture(this, width, height);
  capture.start();

  numPixels = capture.width * capture.height;
  background =  null ;

  loadPixels();
}

void draw() {
  if (capture.available()) {
    capture.read();
    capture.loadPixels();

    if (background != null) {

      loadPixels();

      for (int i = 0; i < numPixels; i++) {

        
        // Fetch the current color in that location, and also the color
        // of the background in that spot
        color currColor = capture.pixels[i];
        color bkgdColor = background.pixels[i];


        // Uses Golan Levin's formula for R,G,B bit shifting to masking
        // Extract the red, green, and blue components of the current pixel's color
        int currR = (currColor >> 16) & 0xFF;
        int currG = (currColor >> 8) & 0xFF;
        int currB = currColor & 0xFF;

        // Extract the red, green, and blue components of the background pixel's color
        int bkgdR = (bkgdColor >> 16) & 0xFF;
        int bkgdG = (bkgdColor >> 8) & 0xFF;
        int bkgdB = bkgdColor & 0xFF;

        // Compute the difference of the red, green, and blue values
        int diffR = abs(currR - bkgdR);
        int diffG = abs(currG - bkgdG);
        int diffB = abs(currB - bkgdB);

        int presenceSum= diffR + diffG + diffB;


        //Thresholds the captured pixels for webcam
        if (presenceSum > 150) {

          pixels[i] = capture.pixels[i]; 
        } else {
          pixels[i] = sunflowerBackground.pixels[i];
        }
      }

      updatePixels();
    } else {
      image(capture, 0, 0);
    }
  }
}

void keyPressed() {
  background = capture.copy();
}
