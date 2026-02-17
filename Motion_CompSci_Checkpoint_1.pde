float x; 
float sx = 1;

float y;
float sy = 0;

void setup() {
  size(600, 500);
  frameRate(60);
  x = .5*width;
  y = .5*height;
}


void draw() {
  ellipse(x, y, width/20, width/20);
  println(x);
  x = x + sx;
  sx = sx + .1*(sx/abs(sx));
  y = y + sy;
  //sy = sy + .1*(sy/abs(sy));

  if (abs (x-width/2) > (3/5.0)*(width/2)) {
    x = x-sx;
    sx = (-sx/abs(sx))*.00001;
  }
}
