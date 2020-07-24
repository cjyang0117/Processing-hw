class overCircle{
  int x,y,r,col;
  
  overCircle(int xp,int yp,int rp,int colp){
     x=xp;
     y=yp;
     r=rp;
     col=colp;
  }
  void set(){
    fill(col);
    ellipse(x,y,r,r); 
  }
  boolean click(int mx, int my){    
   if(mousePressed==true){ 
     if(dist(x,y,mx,my)<r/2){
       return true; 
     }
   } 
   return false;
  }  
}
