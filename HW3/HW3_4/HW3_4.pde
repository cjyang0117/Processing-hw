void setup(){
  size(600,600);
  t=0; t1=0; t2=0;
}
float t,t1,t2;
void draw(){
  background(255);
  pushMatrix();
  strokeWeight(0);
  translate(width/2-100,height/2-60);
  rotate(t);
  fill(0,0,255);
  for(int i=0;i<8;i++){
    quad(-20,-80,20,-80,16,-110,-16,-110);
    rotate(TWO_PI/8);
  }
  ellipse(0,0,170,170);
  fill(255);
  ellipse(0,0,100,100);
  t+=0.01;
  popMatrix();  

  pushMatrix();
  strokeWeight(0);
  translate(width/2+80,height/2-20);
  rotate(t1);
  fill(0,255,0);
  for(int i=0;i<8;i++){
    quad(-14,-50,14,-50,10,-80,-10,-80);
    rotate(TWO_PI/8);
  }
  ellipse(0,0,120,120);
  fill(255);
  ellipse(0,0,50,50);
  t1-=0.01;
  popMatrix();
  
  pushMatrix();
  strokeWeight(0);
  translate(width/2,height/2+80);
  rotate(t2);
  fill(255,0,0);
  for(int i=0;i<6;i++){
    quad(-14,-30,14,-30,10,-50,-10,-50);
    rotate(TWO_PI/6);
  }
  ellipse(0,0,70,70);
  fill(255);
  ellipse(0,0,20,20);
  t2-=0.02;
  popMatrix();   
}
