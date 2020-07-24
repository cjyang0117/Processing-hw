class Block{
  float wid;
  float hei;
  float x;
  float y;
  boolean isDead=false;
  float r,g,b;
  Block(float w, float h, float x_, float y_){
    wid=w; hei=h; x=x_; y=y_;
    r=random(255); g=random(255); b=random(255);
  }
  void display(){
    fill(r, g, b);
     rect(x, y, wid, hei);
  }
  void setDead(){
     isDead=true;
  }
  boolean isDead(){
     return isDead;
  }
}