float x; 
float sx = 1;

void setup() {
  size(600, 500);
  frameRate(60);
  x = .5*width;
}


void draw() {
  ellipse(x, height/2, width/20, width/20);
  println(x);
  x = x + sx;
  sx = sx + .1*(sx/abs(sx));

  if (abs (x-300) > (3/5.0)*(width/2)) {
    x = x-sx;
    sx = (-sx/abs(sx))*.00001;
  }
}
