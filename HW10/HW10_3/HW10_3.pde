void setup(){
  size(800,600);
}
float a=0;
void draw(){
  background(255);
  a = map(mouseX,0,width,0,TWO_PI);
  translate(width/2, height/2);
  grass(100, a);
}
void grass(float x,float an){
  rotate(an);
  //line(0, 0, 0, -x);
  float c=random(255);
  float c1=random(255);
  float c2=random(255);
  fill(c,c1,c2,100);
  rect(0,0,x,x);
  translate(0, -x);
  
  x*=0.76;
  if(x>10){
    pushMatrix();
    rotate(an);
    grass(x, an);
    popMatrix();
    
    pushMatrix();
    rotate(-an);
    grass(x, an);
    popMatrix();
  }  
}
