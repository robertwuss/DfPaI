import peasy.*;

Table table;
Coord coord;
PeasyCam cam;
float moonRadius = 1737.1; // in kmTable table;
float lat, lon;
float radius;

ArrayList <Coord> coords = new ArrayList <Coord>();

void setup() {
  size(640, 640, P3D);
  stroke(255);
  noFill();

  cam = new PeasyCam(this, 2000);

  table = loadTable ("moon_crater_coords.csv", "header");

  //organize incoming data from csv
  for (int i = 0; i < table.getRowCount(); i++) {
    float lat = table.getFloat(i, "lat");
    float lon = table.getFloat(i, "lon");
    float diams = table.getFloat(i, "diams");
    //println(lat + ", " + lon);

    coords.add (new Coord(lat, lon, diams, radius));
    //println (coords.size());
  }
  println (coords.size());
}

void draw() {
  background(0);


  for (Coord coords : coords) {
    //coords.update();
    coords.draw();
  }
}
