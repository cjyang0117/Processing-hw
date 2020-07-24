class gear{
  //private int rad;
  //private int num;
  private float x;
  private float y;
  gear(int r, int n){
    //rad=r; num=n;
    beginShape();
    for(int i=0;i<2*n;i+=2){
      for(int j=i;j<i+2;j++){
        x=cos(j*TWO_PI/(2*n))*r;
        y=sin(j*TWO_PI/(2*n))*r;
        vertex(x,y);
      }
      for(int j=i;j<i+2;j++){
        x=cos(j*TWO_PI/(2*n)+PI/n)*(r+30);
        y=sin(j*TWO_PI/(2*n)+PI/n)*(r+30);
        vertex(x,y);
      }     
    }
    endShape(CLOSE);
    ellipse(0,0,10,10);
  }
  
  
}
