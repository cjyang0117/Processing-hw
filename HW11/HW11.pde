Mover ball;
Block[][] block;
boolean go=false;
void setup(){
  size(800, 600);
  background(0);
  ball=new Mover(6, new PVector(50, 550));
  block=new Block[7][5];
  for(int i=0;i<7;i++){
    for(int j=0;j<5;j++){
      block[i][j]=new Block(40,20,400+j*60, 300+i*40); 
    }
  }
}
void draw(){
  background(0);
  pushMatrix();
  translate(20, 566);
  rotate(-PI/4);
  fill(255,255,0);
  rect(0 , 0, 40, 20); popMatrix();
  for(int i=0;i<7;i++){
    for(int j=0;j<5;j++){
      if(!block[i][j].isDead){
        block[i][j].display();   
        if(ball.bedge(400+j*60, 300+i*40, 40, 20)){
           block[i][j].setDead();
        }
      }  
    }
  }  
  if(go){
    ball.update();
    ball.edge();
  }  
  ball.display();
}
void mouseClicked(){
   PVector tmp=ball.place(); 
   PVector f=new PVector((mouseX-tmp.x)/50,(mouseY-tmp.y)/30);   
   ball.applyForce(f);
   go=true;
}