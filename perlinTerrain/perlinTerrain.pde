import peasy.*;
int cols, rows;
int scl = 20;
int w = 1000;
int h = 2000;

float flying = 0;

float[][] terrain;
color[][] colors;
PeasyCam camera;
void setup() {
  size(1900, 1000, P3D);
  cols = w / scl;
  rows = h/ scl;
  terrain = new float[cols][rows];
  colors = new color[cols][rows];
  //camera = new PeasyCam(this, 0, 0, 0, 0);
}


void draw() {

  flying -= 0.01;

  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -150, 150);
      colors[x][y] = color(map(noise(xoff+100, yoff+100), 0, 1, 0, 255),map(noise(xoff+1000, yoff+1000), 0, 1, 0, 255),map(noise(xoff, yoff), 0, 1, 0, 255));
      xoff += 0.1;
    }
    yoff += 0.1;
  }



  background(0);
  stroke(255);
  //noFill();

  translate(width/2, height/2+50);
  rotateX(PI/4);
  translate(-w/2, -h/2);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    
    //Loop into self
    //rotateX(-PI/128);
    
    for (int x = 0; x < cols; x++) {
      fill(colors[x][y]);
      vertex(x*scl, y*scl, terrain[x][y]);
      
      
      //rotateX(map(x,0,cols,-.01,.01));
      
      //Creepy Tree thing
      //rotateY(map(y,0,rows,-.01,.01));
      
      //Strips
      //rotateX(PI/64);
      
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
}