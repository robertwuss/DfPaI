Table table; 
StringList stations;
FloatList lats;
FloatList lons;

int time = 100; // time for each box to fill color


void setup() {
  size(800, 800);
  stations = new StringList();// All three variables imported from the csv file
  lats = new FloatList();
  lons = new FloatList();

  table = loadTable("tube_stops.csv", "header");


  for (TableRow row : table.rows()) {  

    stations.append(row.getString("Station")); //Grabs the data from the csv file
    lats.append(row.getFloat("Lat"));
    lons.append(row.getFloat("Lon"));

    println(lats);
  }
}

void draw() {
  background(0);

  for (int t = 0; t < 12; t++) {
    float posX = map(lats.get(t), 51.48, 51.6, 20, width-20); //maps each point in the lats to position x
    float posY = map(lons.get(t), -0.04, -0.16, 20, height-20); // maps each poin in the lons to Y
    rectMode(CENTER);
    fill(255);
    text(stations.get(t), posX +10, posY+20); // grabs the station name

    if (frameCount%1200>time*t && frameCount%1200<time*(t+1)) {// starts the fill from first station to last
      fill(255, 0, 0);
    } else {
      fill(255);
    }
    rect(posX, posY, 10, 10);
  }
}
