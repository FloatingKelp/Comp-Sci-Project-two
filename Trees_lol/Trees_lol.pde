//Treeeeeeeeeeeeeeeeeee :]

void setup(){
  size(1200,700,P3D);
}

//set up ig
float repeat = 0;
float repeatMini = 0;
float repeatLol = 0;
float Xpos[] = new float [100000];
float numBranches = 0;
float Ypos[] = new float [100000];
float Zpos[] = new float [100000];
float size[] = new float [100000];
float numOpenBranchs = 0;
float OpenBranchs[] = new float [10000];
float miniX;
float miniY;
float miniZ;

void GenTwig (boolean iniTree, float refX, float refY, float refZ, float num, float Thickness, float fade, float directY, float directvara){
  
  repeat = 0;
  repeatMini = 0;
  
  
  while (repeat <= num){
    //if previous branch don't exist, point in direction 0
    float branchThickness = Thickness * random(.7, 1.3);
    if (iniTree == true) { 
      float SegmentDirectX = 0;
      float SegmentDirectY = 0;
    }
    else {
      float SegmentDirectX = atan2(xpos[xpos.length];
      float SegmentDirectY = ;
    }
    
    numBranches += 1;
    miniX = refX;
    miniY = refY;
    miniZ = refZ;
      branchThickness = branchThickness / (fade * random(.7, 1.3));
    //point in direction previous branch
    //move one sgement in direction previous branch until random var met
    
    repeat += 1;
  }
  
}




//Animation begin :D
void draw(){

cursor(CROSS);
pushMatrix();
translate(1200/2,700/2,0); 
background(178,255,239);
rotateY(radians(map(mouseX-600,-600,600,-90,90)));
rotateX(radians(map(mouseY-350,-350,350,-90,90)));


//the default axis XYZ
strokeWeight(3);
stroke (255,0,0);
fill (255,0,0);
line (-500, 0, 0, 500, 0, 0); //x axis

beginShape(TRIANGLE);
  vertex(-500, 7, 0); 
  vertex(-500, -7, 0); 
  vertex(-(500+15), 0, 0);
endShape();

beginShape(TRIANGLE);
  vertex(500, 7, 0); 
  vertex(500, -7, 0); 
  vertex((500+15), 0, 0);
endShape();


stroke (0,0,225);
fill (0,0,225);
line (0, -500, 0, 0, 500, 0); //y axis

beginShape(TRIANGLE);
  vertex(7,-500, 0); 
  vertex(-7, -500, 0); 
  vertex(0, -(500+15), 0);
endShape();

beginShape(TRIANGLE);
  vertex(7,500, 0); 
  vertex(-7, 500, 0); 
  vertex(0, (500+15), 0);
endShape();


stroke (0,225,0);
fill (0,225,0);
line (0, 0, -500, 0, 0, 500); //z axis

beginShape(TRIANGLE);
  vertex(7, 0, -500); 
  vertex(-7, 0, -500); 
  vertex(0, 0, -(500+15));
endShape();

beginShape(TRIANGLE);
  vertex(7, 0, 500); 
  vertex(-7, 0, 500); 
  vertex(0, 0, (500+15));
endShape();

popMatrix();
strokeWeight(1);
//end of axis
}
