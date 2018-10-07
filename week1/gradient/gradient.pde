size(800, 800);



loadPixels();

for (int x = 0; x < width; x++) {
  for (int y = 0; y < height; y++) {
    pixels[ x + y * width] = color (x/2, y/3 , y/2 );
  }
}

updatePixels();