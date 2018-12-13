// This one I found to be difficult. I worked with a classmate on it. 

ArrayList<Line> lines;

float scaleFactor;
PVector[]  cubeCoords = new PVector[8];
PVector[]  icoCoords = new PVector[12];

Box box;
Line line;


void setup() {
  size(800, 800, P3D);

  int side=200;
  float Lside = 200*1.618;
  cubeCoords[0]=new PVector(+side, +side, +side);
  cubeCoords[1]=new PVector(+side, +side, -side);
  cubeCoords[2]=new PVector(+side, -side, -side);
  cubeCoords[3]=new PVector(-side, -side, -side);
  cubeCoords[4]=  new PVector(+side, -side, +side);
  cubeCoords[5]=  new PVector(-side, -side, +side);
  cubeCoords[6]=  new PVector(-side, +side, +side);
  cubeCoords[7]=  new PVector(-side, +side, -side);

  //Pass co-ordinates to the Lines ArrayList
  //for a cube: this is 8 points
  //+side,-side on each axis in every combination
  //WE CAN SPIT OUR ICOSAHEDRON COORDS INTO 3 RECTANGLES OF SIDELENGTHS: SIDE AND LSIDE
  //LSIDE = SIDE*1.618

  //GOING FROM DIAGRAM THIS IS THE RECTANGLE ALONG X AND Z AXIS
  icoCoords[0]=new PVector(+Lside, 0, +side);
  icoCoords[1]=new PVector(+Lside, 0, -side);
  icoCoords[2]=new PVector(-Lside, 0, +side);
  icoCoords[3]=new PVector(-Lside, 0, -side);

  //THIS IS THE RECTANGLE ALONG Y AND Z AXIS
  icoCoords[4]=  new PVector(0, -side, +Lside);
  icoCoords[5]=  new PVector(0, +side, +Lside);

  icoCoords[6]=  new PVector(0, +side, -Lside);
  icoCoords[7]=  new PVector(0, -side, -Lside);

  //THIS IS THE RECTANGLE ALONG X AND Y AXIS
  icoCoords[8]=  new PVector(-side, +Lside, 0);
  icoCoords[9]=  new PVector(+side, +Lside, 0);
  icoCoords[11]=  new PVector(-side, -Lside, 0);
  icoCoords[10]=  new PVector(+side, -Lside, 0);



  lines = new ArrayList<Line>();
  //ALL THE CONNECTIONS FOR CUBE.

  lines.add(new Line(cubeCoords[0], cubeCoords[1]));
  lines.add(new Line(cubeCoords[1], cubeCoords[2]));
  lines.add(new Line(cubeCoords[2], cubeCoords[3]));
  lines.add(new Line(cubeCoords[2], cubeCoords[4]));
  lines.add(new Line(cubeCoords[4], cubeCoords[5]));
  lines.add(new Line(cubeCoords[5], cubeCoords[6]));
  lines.add(new Line(cubeCoords[6], cubeCoords[7]));
  lines.add(new Line(cubeCoords[7], cubeCoords[1]));

  lines.add(new Line(cubeCoords[7], cubeCoords[3]));
  lines.add(new Line(cubeCoords[3], cubeCoords[5]));
  lines.add(new Line(cubeCoords[0], cubeCoords[4]));
  lines.add(new Line(cubeCoords[0], cubeCoords[6]));

  //ALL THE CONNECTIONS FOR ICOSAHEDRON. YOU COULD WORK THIS OUT BY CAPPING 
  //THE DISTANCE BETWEEN CONNECTIONS AND STORING WHAT CONNECTIONS HAVE ALREADY BEEN MADE
  //TO ENSURE CONNECTIONS ARE NOT MADE TWICE BUT THATS A LITTLE LONG-WINDED FOR THIS CASE. 
  //LETS JUST DO IT MANUALLY! 
  //30 CONNECTIONS BETWEEN VERTICES.
  lines.add(new Line(icoCoords[0], icoCoords[4]));
  lines.add(new Line(icoCoords[6], icoCoords[8]));
  lines.add(new Line(icoCoords[5], icoCoords[9]));
  lines.add(new Line(icoCoords[6], icoCoords[8]));
  lines.add(new Line(icoCoords[7], icoCoords[11]));
  lines.add(new Line(icoCoords[0], icoCoords[5]));
  lines.add(new Line(icoCoords[5], icoCoords[8]));
  lines.add(new Line(icoCoords[6], icoCoords[8]));
  lines.add(new Line(icoCoords[6], icoCoords[9]));
  lines.add(new Line(icoCoords[10], icoCoords[7]));
  lines.add(new Line(icoCoords[3], icoCoords[8]));
  lines.add(new Line(icoCoords[2], icoCoords[8]));
  lines.add(new Line(icoCoords[1], icoCoords[9]));
  lines.add(new Line(icoCoords[0], icoCoords[9]));
  lines.add(new Line(icoCoords[6], icoCoords[1]));
  lines.add(new Line(icoCoords[5], icoCoords[2]));
  lines.add(new Line(icoCoords[4], icoCoords[2]));
  lines.add(new Line(icoCoords[11], icoCoords[2]));
  lines.add(new Line(icoCoords[1], icoCoords[7]));
  lines.add(new Line(icoCoords[2], icoCoords[3]));
  lines.add(new Line(icoCoords[7], icoCoords[6]));
  lines.add(new Line(icoCoords[1], icoCoords[0]));
  lines.add(new Line(icoCoords[1], icoCoords[10]));
  lines.add(new Line(icoCoords[0], icoCoords[10]));
  lines.add(new Line(icoCoords[3], icoCoords[11]));
  lines.add(new Line(icoCoords[10], icoCoords[4]));
  lines.add(new Line(icoCoords[4], icoCoords[11]));
  lines.add(new Line(icoCoords[5], icoCoords[4]));
  lines.add(new Line(icoCoords[10], icoCoords[11]));
  lines.add(new Line(icoCoords[7], icoCoords[3]));
  lines.add(new Line(icoCoords[6], icoCoords[3]));
}

void draw() {
  scaleFactor= sin(radians(frameCount));
  translate(width/2, height/2, -300);
  background(0);
  rotateY(frameCount/150.0);
  rotateX(frameCount/180.0);
  // rotateZ(5*sin(frameCount/500.0));
  fill(255, 250);
  stroke(255, 0, 0);
  beginShape();


  //THIS BLOCK BELOW DRAWS THE THREE GOLDEN RECTANGLES
  //for(int i=0; i<4; i++){

  // vertex(icoCoords[i].x,icoCoords[i].y,icoCoords[i].z);
  //}
  //endShape(CLOSE);
  //stroke(0,255,0);

  // fill(255,0,0,150);
  // beginShape();
  //for(int i=4; i<8; i++){

  // vertex(icoCoords[i].x,icoCoords[i].y,icoCoords[i].z);
  //}
  //endShape(CLOSE);


  // stroke(0,255,0);
  // fill(0,255,0,150);
  //  beginShape();
  // for(int i=8; i<12; i++){

  //  vertex(icoCoords[i].x,icoCoords[i].y,icoCoords[i].z);
  // }
  // endShape(CLOSE);

  //-----END OF BLOCK-----



  for (int l=0; l<lines.size(); l++) {
    if (l<12) {
      if (scaleFactor>0) {
        lines.get(l).update();
        lines.get(l).draw();
      }
    }
    if (scaleFactor<0) {
      if (l>11) {

        lines.get(l).update();
        lines.get(l).draw();
      }
    }
  }

  //This section lets me see where each number vertex is in relation to the others and work out which ones should be connected
  //noStroke();
  //for(int i=0; i< 12; i++){
  //  line(icoCoords[0].x,icoCoords[0].y,icoCoords[0].z,icoCoords[i].x,icoCoords[i].y,icoCoords[i].z);
  //  pushMatrix();
  //  translate(icoCoords[i].x,icoCoords[i].y,icoCoords[i].z);
  //   fill(255,255);
  //  text(i,0,0);
  //  fill(255,25);
  //  box(20);
  //  popMatrix();
  //}
}
