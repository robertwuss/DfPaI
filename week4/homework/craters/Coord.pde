class Coord {
  float radius ;
  float lat, lon, diams;
  float x, y, z;

  Coord(float lat, float lon ,float diams, float radius) {
    this.lat = lat;
    this.lon = lon;
    this.diams = diams;
    radius = moonRadius;
    

    
      z = cos(lon) * cos(lat) * radius;
      y = sin(lon) * cos(lat) * radius;
      x = sin(lat) * radius;
      
  }


    void draw() {

      pushMatrix();
      
      translate(x,y,z);
      //rotateZ(HALF_PI-lon);
      //rotateY(HALF_PI-lat);
      ellipse(0,0,diams, diams);
      popMatrix();
      //translate(radius, 0, 0);
    }
  }
