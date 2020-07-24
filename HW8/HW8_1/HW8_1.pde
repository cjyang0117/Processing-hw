import ddf.minim.*;
Minim minim;
AudioInput in;
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
  
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);   

  for(int i=0;i<7;i++){
    c[i]=new overCircle(800/7*i+60,550,40,0);
    c[i].set();
    
    r[i]=new overRect(800/7*i+40,300,40,200);
    r[i].set((float)i/10,1,1,1);
    
    y[i]=300;
  }
}

void draw(){  
  float magv = 0;
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    magv += in.left.get(i);
  }
  magv = abs(magv / 120);
  mill(magv / 20);
  
  
  for(int i=0;i<7;i++){
    if((c[i].click(mouseX,mouseY)||key==k[i])&&y[i]+200>=0){
      y[i]-=5;
      r[i].update(800/7*i+40,y[i]);
      fill(1);
      stroke(1);
      rect(800/7*i+40,y[i]+201,40,10);
      fill(255);
    }
    if(y[i]+200<0){
      r[i].set(0,0,1,1);
      
    }
    
  } 
}
float rr = 0;
float v = 0;
void mill(float a){
  v = 0.95 * (a + v);
  
  //rr += v;
  if(v>0.2&&v<0.3){
    y[0]-=5;
    r[0].update(800/7*0+40,y[0]);
    fill(1);
    stroke(1);
    rect(800/7*0+40,y[0]+201,40,10);
    fill(255);    
  }else if(v>0.3&&v<0.4){
    y[1]-=5;
    r[1].update(800/7*1+40,y[1]);
    fill(1);
    stroke(1);
    rect(800/7*1+40,y[1]+201,40,10);
    fill(255);    
  }else if(v>0.4&&v<0.5){
    y[2]-=5;
    r[2].update(800/7*2+40,y[2]);
    fill(1);
    stroke(1);
    rect(800/7*2+40,y[2]+201,40,10);
    fill(255);    
  }else if(v>0.5&&v<0.6){
    y[3]-=5;
    r[3].update(800/7*3+40,y[3]);
    fill(1);
    stroke(1);
    rect(800/7*3+40,y[3]+201,40,10);
    fill(255);    
  }else if(v>0.7&&v<0.8){
    y[4]-=5;
    r[4].update(800/7*4+40,y[4]);
    fill(1);
    stroke(1);
    rect(800/7*4+40,y[4]+201,40,10);
    fill(255);    
  }else if(v>0.8&&v<0.9){
    y[5]-=5;
    r[5].update(800/7*5+40,y[5]);
    fill(1);
    stroke(1);
    rect(800/7*5+40,y[5]+201,40,10);
    fill(255);    
  }else if(v>0.9&&v<1){
    y[6]-=5;
    r[6].update(800/7*6+40,y[6]);
    fill(1);
    stroke(1);
    rect(800/7*6+40,y[6]+201,40,10);
    fill(255);     
  }
}  
