//variables
float x; // x & y locations
float y;

float sx = 0; //speed
float sy = 0;

int Dragmode = 0;
int Mouseheld = 0;


//circle custom draw method :D

void CCircle(float r,float g,float b,float rl,float gl,float bl,float w,float x,float y,float sx,float sy) {
fill(r, g, b);
stroke(rl, gl, bl);
strokeWeight(w);
ellipse(x*width/500, y*height/500, sx*width/500, sy*height/500);
}

//*Start
void setup() {
size (500,500,P2D);
x = width/2;
y = height/2;
}

void Character (float x, float y, float d)
{
pushMatrix();
translate(x, y);
rotate(radians(d));
println(mouseX-width/2, mouseY-height/2);

stroke(255);
strokeWeight(8);
fill(0,237,168);
beginShape();
vertex(0,0);
endShape();
CCircle(0,237,168,  255,255,255,  10,    0,0,  170,200);
CCircle(0,237,168,  255,255,255,  8,    0,0,  140,200*140/170);
CCircle(96,170,0,  96,170,0,  1,    25,-28,  43,55);
CCircle(96,170,0,  96,170,0,  1,    -25,-28,  43,55);
CCircle(0,0,0,  0,0,0,  1,    25,-30,  40,50);
CCircle(0,0,0,  0,0,0,  1,    -25,-30,  40,50);
CCircle(96,170,0,  96,170,0,  1,    0,37+3.5,  68+3,28+7);
CCircle(96,170,0,  96,170,0,  1,    0,40+3.5,  60+3,20+7);
CCircle(0,0,0,  0,0,0,  1,    0,37,  68,28);
CCircle(0,0,0,  0,0,0,  1,    0,40,  60,20);
popMatrix();
}

float direction = 0;
float directionalspeed = 0;
float idealdirection = 0;


void draw() {
  fill(0,133,214,50);
  rect(0,0,width,height);
direction = direction + directionalspeed;

directionalspeed = directionalspeed * .9;

//if (directionalspeed < .1){
//directionalspeed = 0;
//}

Character (x, y, direction+90);
 
  
    if (mousePressed == true) {
      if (sqrt(sq(mouseX-x) + sq(mouseY-y)) < 85*height/500){
        
        if (Mouseheld == 0){
          Dragmode = 1;
          
        }
      };
      
      
      
      Mouseheld = 1;
      
      float speed = .5;
      
      if (Dragmode == 1){
        
        //right
        if (mouseX > x + 10*width/500*1.0) {
          if (mouseY > y) {
            sx = sx + width/500*(speed/sqrt(sq(abs(mouseX-x))+sq(abs(1*mouseY-y))))*abs(mouseX-x);
          }
          else {
             sx = sx + width/500*(speed/sqrt(sq(abs(mouseX-x))+sq(abs(y-mouseY))))*abs(mouseX-x);
          }
        }
        
        //left
        if (mouseX < x - 10*width/500*1.0) {
          if (mouseY > y) {
            sx = sx - width/500*(speed/sqrt(sq(abs(x-mouseX))+sq(abs(1*mouseY-y))))*abs(x-mouseX);
          }
          else {
            sx = sx - width/500*(speed/sqrt(sq(abs(x-mouseX))+sq(abs(y-mouseY))))*abs(x-mouseX);
          }
        }
        
        //up
        if (mouseY > y + 10*width/500*1.0) {
          if (mouseX > x) {
            sy = sy + width/500*(speed/sqrt(sq(abs(mouseY-y))+sq(abs(1*mouseX-x))))*abs(mouseY-y);
          }
          else {
            sy = sy + width/500*(speed/sqrt(sq(abs(mouseY-y))+sq(abs(x-mouseX))))*abs(mouseY-y);
          }
        }
        
        //down
        if (mouseY < y - 10*width/500*1.0) {
          if (mouseX > x) {
            sy = sy - width/500*(speed/sqrt(sq(abs(y-mouseY))+sq(abs(1*mouseX-x))))*abs(y-mouseY);
          }
          else {
            sy = sy - width/500*(speed/sqrt(sq(abs(y-mouseY))+sq(abs(x-mouseX))))*abs(y-mouseY);
          }
        }
        
        
        
        //directional changes
         
        if ((abs(mouseY-y) > 10*width/500*1.0)||(abs(mouseX-x) > 10*width/500*1.0)){
          
          idealdirection = degrees(atan2(mouseY - y, mouseX - x));

          float diff = idealdirection-direction;
        
          if (diff > 180){
            diff = diff - (1+abs(floor(diff/360)))*360;
          }
          if (diff < -180){
            diff = diff + (1+abs(floor(diff/360)))*360;
          }
          
          
          if (abs(diff)>10){
            directionalspeed = directionalspeed + diff/abs(diff);
          }
          
        }
        
      }
    }
      
  
    
    
    else{
      Dragmode = 0;
      Mouseheld = 0;
    }
   
   
   
  
  x = x + sx;

  
  y = y + sy;
  
  

  if (abs (x-width/2) > (3/5.0)*(width/2)) {
    x = x-sx;
    sx = abs(sx)*(-sx/abs(sx))*.9;
  }
  
    if (abs (y-height/2) > (3/5.0)*(height/2)) {
    y = y-sy;
    sy = abs(sy)*(-sy/abs(sy))*.9;
  }
  
  sx = sx*.9;
  sy = sy*.9;
}
