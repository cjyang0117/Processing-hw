class overRect{
  int x,y,w,h;
  float c1,c2,c3,c4;

  overRect(int xp, int yp, int wp, int hp){
    colorMode(HSB,1,1,1,1);
    x=xp;
    y=yp;
    w=wp;
    h=hp;
  }
  void update(int xp,int yp){
     fill(c1,c2,c3,c4);
     stroke(0);
     rect(xp,yp,w,h);
  }
  void set(float c1p, float c2p, float c3p, float c4p){
    c1=c1p; c2=c2p; c3=c3p; c4=c4p;
    stroke(0);
    fill(c1,c2,c3,c4);
    rect(x,y,w,h); 
  }
}
