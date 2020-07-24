void setup(){
  size(800,800); 
  background(255);
  //noFill();
  translate(width/2, height/2);
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
