import ddf.minim.*;
Minim minim;
AudioInput in;
void setup(){
  size(800,800); 
  background(255);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);     
  
  //noFill();

}
void draw(){
  background(255);
  float magv = 0;
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    magv += in.left.get(i);
  }
  magv = abs(magv / 120);
  mill(magv / 60);  
}
float rr = 0;
float v = 0;
void mill(float a){
  v = 0.95 * (a + v);
  rr += v;
  
  
  translate(width/2, height/2);
  rotate(rr);
  ellipse(0,0,280,280);
  ellipse(0,0,240,240);
  quad(-140,0,0,140,140,0,0,-140);
  ellipse(0,0,200,200);
  quad(-120,0,0,120,120,0,0,-120);
  quad(-100,0,0,100,100,0,0,-100);
  line(-0,140,0,-140);
  line(-140,0,140,0);
  for(int i=0;i<5;i++){    
    line(-17,-25,0,-70);
    line(17,-25,0,-70);
    line(12,-39,42,-58);
    line(35,-24,42,-58);
    rotate(TWO_PI/5);
  }
  ellipse(0,0,60,60);
  ellipse(0,0,40,40);  

}  
