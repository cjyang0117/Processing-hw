//float offset=50;
//float scaleVal=20;
//float angleInc=PI/36;
float angle=0, angle1=0,angle3=0,angle4=0,angle5=0,angle6=0;
void setup(){
  size(700,200);
  

}
void draw(){
  background(255);
  delay(100); 
  noFill();
  
  pushMatrix();
  beginShape();  
  for(int x=0;x<=width;x+=5){
    float y=50+(sin(angle)*20);
    vertex(x,y);    
    angle+=PI/36;
  }
  endShape(); popMatrix();
  
  pushMatrix();
  beginShape();  
  for(int x=0;x<=width;x+=5){
    float y=40+(cos(angle1)*20);
    vertex(x,y);    
    angle1+=PI/36;
  }
  endShape(); popMatrix();
  
  pushMatrix();
  beginShape();  
  for(int x=0;x<=width;x+=5){
    float y=150+(sin(angle3)*20);
    vertex(x,y);    
    angle3+=PI/36;
  }
  endShape(); popMatrix();
  
  pushMatrix();
  beginShape();  
  for(int x=0;x<=width;x+=5){
    float y=140+(cos(angle4)*20);
    vertex(x,y);    
    angle4+=PI/36;
  }
  endShape(); popMatrix();  
 
  pushMatrix();
  beginShape();  
  for(int x=0;x<=width;x+=5){
    float y=90+(sin(angle5)*20);
    vertex(x,y);    
    angle5+=PI/36;
  }
  endShape(); popMatrix();
  
  pushMatrix();
  beginShape();  
  for(int x=0;x<=width;x+=5){
    float y=80+(cos(angle6)*20);
    vertex(x,y);    
    angle6+=PI/36;
  }
  endShape(); popMatrix();    
}
