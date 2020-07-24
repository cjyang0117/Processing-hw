float x,y,z;
float a[] = new float[31];
float b[] = new float[31];
PImage img,img2;
PShape bb,c;
int t=1;
void setup(){
  size(1000,900,P3D);
}
void draw(){
  switch(key){
    case 'q':
      camera(width/2,0,-600,width/2,100,-1100,0,1,0);
      break;
    case 'w':
      camera(width/2,-500,-4000,width/2,1000,-1100,0,1,0);
      break;
    case 'e':
      camera(300,100,1000,width/2,500,-200,0,1,0);
      break;
    case 'r':
      camera(300,-2000,-1500,width/2,500,-1500,0,1,0);
      break;
  }
  /*if(mousePressed == true&& t==1){
    t++;
    camera(width/2,0,-600,width/2,100,-1100,0,1,0);
  }else if(mousePressed == true&& t==2){
    t++;
    camera(width/2,-500,-4000,width/2,1000,-1100,0,1,0);
  }else if(mousePressed == true&& t==3){
    t++;
    camera(300,100,1000,width/2,500,-200,0,1,0);
  }else if(mousePressed == true&& t==4){
    t=1;
    camera(300,-2000,-1500,width/2,500,-1500,0,1,0);
  }*/

  background(0);
  lights();
  noStroke();
  
  pushMatrix();
  translate(width/2,900,-1500);
  
  img = loadImage("grass.jpg");
  scale(15,0.03,30);  
  bb=createShape(BOX, 100);
  bb.setStroke(false);
  bb.setTexture(img);
  shape(bb); popMatrix();
  
  img = loadImage("p1.jpg");
  for(int i=-200;i>=-2800;i-=400){
    pushMatrix();
    translate(-100,900-200,i);
    tower(30,200,img); popMatrix();
    pushMatrix();
    translate(1100,900-200,i);
    tower(30,200,img); popMatrix();    
  }
  img = loadImage("p2.jpg");
  img2 = loadImage("p3.jpg");
  for(int i=100;i<=900;i+=200){
    for(int j=-200;j>=-1000;j-=400){
      pushMatrix();
      translate(i,900-200,j);
      tree(img2,50); popMatrix();
      pushMatrix();
      translate(i,900-50,j);
      tower(10,50,img); popMatrix();      
    }
  }
  
  pushMatrix();
  img = loadImage("p4.jpg");
  translate(300,900-50,-1300);
  tower(250,150,img); popMatrix();
  
  pushMatrix();
  translate(width/2,900-90,-2200);
  img = loadImage("p5.jpg");
  scale(7,1.8,5);  
  c=createShape(BOX, 100);
  c.setStroke(false);
  c.setTexture(img);
  shape(c); popMatrix();
  
  pushMatrix();
  translate(width/2,900-270,-2200);
  img = loadImage("p5.jpg");
  scale(6,1.8,4);  
  c=createShape(BOX, 100);
  c.setStroke(false);
  c.setTexture(img);
  shape(c); popMatrix();
  
  pushMatrix();
  translate(width/2,900-360,-2200);
  img = loadImage("p7.jpg");
  scale(2.5,1.8,2);  
  c=createShape(SPHERE, 100);
  c.setStroke(false);
  c.setTexture(img);
  shape(c); popMatrix();
  
  img = loadImage("p5.jpg");
  img2 = loadImage("p6.jpg");
  for(int i=-2000;i>=-2700;i-=400){
    for(int j=170;j<=920;j+=670){
       pushMatrix();
       translate(j,900-250,i);
       tower(60,250,img); popMatrix();
       pushMatrix();
       translate(j,900-650,i);
       tree(img2,80); popMatrix();       
    }
  }
}
void tower(float r, float h, PImage p){
  for( int i = 0; i < 31; i++){
      a[i] = r*sin(TWO_PI/30*i+PI);
      b[i] = r*cos(TWO_PI/30*i+PI);
  }
  beginShape(QUAD_STRIP);
  texture(p);
  textureMode(IMAGE);
  for( int i = 0; i < 31; i++){
     vertex(a[i], -h, b[i], img.width/30*i, 0);
     vertex(a[i], h, b[i], img.width/30*i, img.height);  
  }
  endShape();
}
void tree(PImage p, int r){
  beginShape(TRIANGLE_STRIP);
  texture(p);
  textureMode(IMAGE);  
  for( float i = 0; i <= 100; i += 5){
    float a = map(i, 0, 100, 0, TWO_PI);
    z = cos(a) * 5;
    x = sin(a) * 5;
    y = 0;
    vertex(x, y, z, img.width/100*i, 0);
    z = cos(a+TWO_PI/40) * r;
    x = sin(a+TWO_PI/40) * r;
    y = 150;
    vertex(x, y, z, img.width/100*i, img.height);
  }
  endShape();
}
