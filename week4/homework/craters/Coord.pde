class Coord {
  float radius ;
  float lat, lon, diams;
  float x, y, z;

  Coord(float lat, float lon, float diams, float radius) {
    this.lat = lat;
    this.lon = lon;
    this.diams = diams;
    radius = moonRadius;


    // data converted to x,y,z
    x=radius*cos(lat)*sin(lon);
    y=radius*cos(lat)*cos(lon);
    z=radius*sin(lat);
  }


  void draw() {

    pushMatrix();
    //draw circle at x,y,z
    translate(x, y, z);
    //place on a sphere 
    rotateZ(HALF_PI-lon);
    rotateY(HALF_PI-lat);
    //box(20);
    ellipse(0, 0, diams, diams);
    popMatrix();
    //translate(radius, 0, 0);
  }
}
