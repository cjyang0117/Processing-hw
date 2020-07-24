import ddf.minim.*; //<>//
Minim minim;
AudioPlayer audoi;
Block[][] block;
Block floor;
boolean go=false, d=true, restart=false; 
float fX, fY;
Mover[] ball;
int ballNum=1;
int[] deadBall;
int deadNum=0;
int round=0;
int count=0;
int score=0;
int goal=8500;
PFont pf;
int[][] xy=new int[12][4];
int xc=0, yc=0;
int[][] sp=new int[12][4];
int[][] dp=new int[12][4];
void setup() {
  size(800, 600);
  minim = new Minim( this );
  audoi = minim.loadFile("b.wav");
  audoi.play(); 
  audoi.loop();
  pf = createFont("標楷體", 100);
  textFont(pf);
  block=new Block[10][10];
  ball=new Mover[10];
  deadBall=new int[10];
  for(int i=0;i<12;i++){
    for(int j=0;j<4;j++){
      sp[i][j]=2;
      dp[i][j]=-2;
    }
  }
  for (int i=0; i<10; i++) {
    ball[i]=new Mover(6, new PVector((width-250)/2+65, height-17)); 
    ball[i].setSpead(new PVector(2, -4));
    deadBall[i]=-1;
  }
  fX=(width-250)/2+25;
  fY=height-10;
  floor=new Block(80, 10, fX, fY);
  floor.setColor(100, 100, 255);
  for (int i=0; i<block.length; i++) {
    float c1=128+i*10, c2=42+i*10, c3=55;
    for (int j=0; j<block[i].length; j++) {
      block[i][j]=new Block((width-250)/10, 30, 50+j*((width-250)/10), 60+i*30); 
      block[i][j].setColor(c1, c2, c3);
    }
  }
  
  for(int i=0;i<12;i++){
    xy[i][0]=2+i*20;
    xy[i][1]=i*30;
    xy[i][2]=(width-208)-i*20;
    xy[i][3]=i*30;
  }
}
void draw() {
  background(0);
  pushMatrix();
  fill(255);
  rect((width-150), 0, 150, height); 
  popMatrix();
  pushMatrix();
  fill(0);
  textFont(pf, 50);
  text("打磚塊", width-150, 50);
  textFont(pf, 25);
  text("第"+(round+1)+"回合", width-150, 100);
  textFont(pf, 20);
  text("目標分數:"+String.valueOf(goal), width-150, 150);
  text("發射: 空白鍵", width-150, 350);
  text("操作: ← →", width-150, 400);
  text("重新開始: S", width-150, 450);
  fill(255,0,0);
  text("得分:"+String.valueOf(score), width-150, 200);
  text("剩餘球數:"+String.valueOf(10-deadNum), width-150, 550);
  //text("連破三關獲勝", width-150, 400);
  
  
  popMatrix();

  if (deadNum==10) {
    fill(255);
    textFont(pf, 100);
    text("Lose", (width-150)/2-85, height/2);
    restart=true;
  }else if(score>=goal){
    if(round==2){
      fill(255);
      textFont(pf, 100);
      text("Win", (width-150)/2-85, height/2);
      restart=true;
    }else{
      delay(500);
      count++;
      fill(255);
      textFont(pf, 100);
      text(4-count, (width-150)/2-30, height/2);
      if(count==4){
        begin();
        if(round==0){
          round++;
          goal=4000;
          for(int i=5;i<10;i++){
            for(int j=0;j<10;j++){
              block[i][j].setDead(true);
            }  
          }
          for (int i=0; i<5; i++) {
            float c1=128+i*10, c2=200+i*10, c3=155;
            for (int j=0; j<block[i].length; j++) {
              block[i][j].setXY(50+j*((width-250)/10), 30+i*80+random(30));
              block[i][j].setColor(c1, c2, c3);
              block[i][j].setDead(false);
            }
          }
        }else{
          round++;
          goal=2000;
          
          for (int i=0; i<block[i].length; i++) { //<>//
            float c1=128+i*10, c2=200+i*10, c3=155;
            for (int j=0; j<block[i].length; j++) {
              block[i][j].setXY(xy[xc][yc++], xy[xc][yc++]);
              if(yc==4){
                xc++;
                yc=0;
              }  
              block[i][j].setColor(c1, c2, c3);
              block[i][j].setDead(false);
              if(xc==12) break;
            }
            if(xc==12) break;
          }
        }
      }
    }
  } else {
    if(round==2){
      xc=0; yc=0;
      for(int i=0;i<block[i].length;i++){
        for (int j=0; j<block[i].length; j++) {
          if(yc==0 && (xy[xc][yc]>=325 || xy[xc][yc]<=0)){
             sp[xc][yc]*=-1;
          }else if(yc==2 && (xy[xc][yc]<=370 || xy[xc][yc]>=593)){
            dp[xc][yc]*=-1;
          }
          if(yc==0){
            xy[xc][yc]+=sp[xc][yc];  
          }else{
            xy[xc][yc]+=dp[xc][yc];
          } 
          block[i][j].setXY(xy[xc][yc++], xy[xc][yc++]);  
          if(yc==4){
                xc++;
                yc=0;
          }
          if(xc==12) break;
        }
        if(xc==12) break;
      }
    }
    count=0;
    for (int i=0; i<block.length; i++) {
      for (int j=0; j<block[i].length; j++) {
        if (!block[i][j].isDead) {
          block[i][j].display();   
          for (int k=0; k<ballNum; k++) {
            float[] tmp=block[i][j].place();
            if (ball[k].bedge(tmp[0], tmp[1], (width-250)/10, 30)) {//ball[k].bedge(50+j*((width-250)/10), 60+i*30, (width-250)/10, 30)
              block[i][j].setDead(true);
              score+=100;
            }
          }
        }
      }
    }
    if (!go) {
      ball[ballNum-1].setXY(new PVector(fX+40, fY-7)); 
      ball[ballNum-1].display();
    } else {
      for (int i=0; i<ballNum; i++) {
        if (!ball[i].isDead()) {
          ball[i].bedge(fX, fY, 80, 10);
          ball[i].update();
          ball[i].edge();
          ball[i].display();
        } else {
          int j=0;
          do {
            if (deadBall[j++]==i) {
              d=false;
              break;
            } else {
              d=true;
            }
          } while (j<deadNum);  
          if (d) {
            deadBall[deadNum]=i;
            deadNum++;
            ballNum++;
            go=false;
            break;
          }
        }
      }
    }  
    floor.display();
  }
}
void begin(){
  score=0; deadNum=0; ballNum=1; go=false; xc=0; yc=0;
  for(int i=0;i<10;i++){
    deadBall[i]=-1; 
    ball[i].setDead(false);
    ball[i].setSpead(new PVector(2, -4));
    ball[i].setXY(new PVector((width-250)/2+65, height-17));
  }
  for (int i=0; i<block.length; i++) {
    for (int j=0; j<block[i].length; j++) {
        block[i][j].setDead(true);
    } 
  }  
  fX=(width-250)/2+25;
  fY=height-10;
  floor.setXY((width-250)/2+25, height-10);
}
void keyPressed() {
  if (key == CODED && score<goal) {
    if (keyCode == LEFT && fX>=0) {
      fX-=10;
      floor.setXY(fX, fY);
    } else if (keyCode == RIGHT && fX<=650-85){
      fX+=10;
      floor.setXY(fX, fY);
    }
  }
  if (keyCode == UP && score<goal) {
    go=true;
  }
  if(key == 's' && restart){
    restart=false;
    round=0; goal=8500;
    begin();
    for (int i=0; i<block.length; i++) {
      float c1=128+i*10, c2=42+i*10, c3=55;
      for (int j=0; j<block[i].length; j++) {
        block[i][j]=new Block((width-250)/10, 30, 50+j*((width-250)/10), 60+i*30); 
        block[i][j].setColor(c1, c2, c3);
        block[i][j].setDead(false);
      }
    }     
  }
}
