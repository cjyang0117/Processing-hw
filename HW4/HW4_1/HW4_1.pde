gear g1,g2,g3,g4,g5;
float r1,r2,r3,r4,r5;
void setup(){
  size(800,800); 
  r1=0; r2=0; r3=0; r4=0; r5=0;
}
void draw(){
  background(255);

  pushMatrix();
  translate(width/2, height/2);
  rotate(r1);
  fill(100);
  g1=new gear(100,6);
  r1+=0.01; popMatrix();
  
  pushMatrix();
  translate(width/2+160,height/2+160);
  rotate(r2);
  fill(50,50,100);
  g2=new gear(70,9);
  r2-=0.01; popMatrix();
  
  pushMatrix();
  translate(width/2-150,height/2-150);
  rotate(r3);
  fill(150,70,70);
  g3=new gear(50,5);
  r3-=0.02; popMatrix();  
  
  pushMatrix();
  translate(width/2+150,height/2-150);
  rotate(r4);
  fill(230,100,60);
  g4=new gear(60,15);
  r4-=0.01; popMatrix();
  
  pushMatrix();
  translate(width/2-230,height/2+50);
  rotate(r5);
  fill(150,10,150);
  g5=new gear(90,8);
  r5-=0.01; popMatrix();   
}
