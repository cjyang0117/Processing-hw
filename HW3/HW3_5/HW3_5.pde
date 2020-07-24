void setup(){
  size(600,600);
   x=1; y=1; a=width/2; b=height/2;
}
float x,y,a,b,q;
void draw(){
  background(255);
  
  if(mouseX-a<0){
     x=-1;
  }else{
     x=1; 
  }
  if(mouseY-b<0){
     y=-1;
  }else{
    y=1; 
  }

  translate(a,b); 
 //<>//
  q=asin((mouseX-a)/dist(mouseX-a,mouseY-b,0,0));
  //q = q * 180/3.1415926 ;
  q=degrees(q);

  if(mouseY-b>=0){
    q=180-q;
  }
  fill(0);
  text(q,32,30);      
  rotate(radians(q)); 
  
  rect(-15,0,30,40);
  triangle(0,-40,30,0,-30,0);
  a=a+x;
  b=b+y;  
}