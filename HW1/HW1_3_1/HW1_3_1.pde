void setup(){
  size(600,600);
  strokeWeight(10);
  colorMode(HSB,1,1,1,1);
  noFill();
  for(float ct=0;ct<200;ct+=20){
    stroke(1-ct/200+0.1,1,0.8,0.3);
    bezier(300,20,50+ct,400+ct/2,550-ct,200-ct/2,300,580);
  }
}
