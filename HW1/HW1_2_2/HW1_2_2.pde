void setup(){
  size(600,600);
  colorMode(HSB,1,1,1,1);
  strokeWeight(10);
  float x=50;
  for(float i=0;i<=1;i+=0.1){
    fill(i,0.8,1,0.3);
    stroke(0.1,1,i,1);
    rect(x,x,250,250);
    x+=30;
  }
}
