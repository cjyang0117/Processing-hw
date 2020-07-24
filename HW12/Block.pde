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
  void setColor(float r_, float g_, float b_){
    r=r_; g=g_; b=b_;
  }
  void display(){    
    pushMatrix();
    strokeWeight(3);
    fill(r, g, b);
    rect(x, y, wid, hei); popMatrix();
    strokeWeight(1);
  }
  void setDead(boolean d){
     isDead=d;
  }
  float[] place(){
    float tmp[]={x, y};
     return tmp;
  } 
  boolean isDead(){
     return isDead;
  }
  void setXY(float x_, float y_){
    x=x_; y=y_;
  }
}