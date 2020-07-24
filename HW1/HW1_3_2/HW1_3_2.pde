void setup(){
  size(600,600);
  strokeWeight(10);
  colorMode(HSB,1,1,1,1);
  noFill();
  for(float ct=0;ct<200;ct+=20){
    stroke(1-ct/200+0.1,1,0.8,0.3);
    bezier(250+ct,20,50+ct-ct,400-ct,350+ct+ct,100+ct,250+ct,580);
  }
}
