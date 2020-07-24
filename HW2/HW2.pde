overCircle[] c;
overRect[] r;
int[] y;
char[] k={'c','d','e','f','g','a','b'};
void setup(){
  size(800,600);
  background(255);
  y=new int[7];
  c=new overCircle[7];
  r=new overRect[7];
  

  for(int i=0;i<7;i++){
    c[i]=new overCircle(800/7*i+60,550,40,0);
    c[i].set();
    
    r[i]=new overRect(800/7*i+40,300,40,200);
    r[i].set((float)i/10,1,1,1);
    
    y[i]=300;
  }
}

void draw(){
  
  for(int i=0;i<7;i++){
    if((c[i].click(mouseX,mouseY)||key==k[i])&&y[i]+200>=0){
      y[i]-=5;
      r[i].update(800/7*i+40,y[i]);
      fill(1);
      stroke(1);
      rect(800/7*i+40,y[i]+201,40,10);
    }
    if(y[i]+200<0){
      r[i].set(0,0,1,1);
      
    }
    
  }
  
  
}
