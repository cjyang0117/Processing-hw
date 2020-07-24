float x,y,z,ts,th,pz,pzz;
float a[] = new float[31];
float b[] = new float[31];
PImage img,img2,img3,img4,img5,img6,img7,img8,img9,img10;
PShape bb,c,car,st;
int t=1;
void setup(){
  size(1000,900,P3D);
  ts=0; th=0; pz=0; pzz=-0.8;
  img = loadImage("grass.jpg");
  img2 = loadImage("p1.jpg");
  img3 = loadImage("p2.jpg");
  img4 = loadImage("p3.jpg");
  img5 = loadImage("p4.jpg");
  img6 = loadImage("p5.jpg");
  img7 = loadImage("p6.jpg");
  img8 = loadImage("p7.jpg");
  img9 = loadImage("p9.jpg"); 
  img10 = loadImage("p10.jpg"); 
  
  
}
void draw(){
  camera(width/2,-500,-5500,width/2,0,-1100,0,1,0);
  switch(key){
    case 'q':
      camera(width/2,0,-600,width/2,100,-1100,0,1,0);
      break;
    case 'w':
      camera(width/2,-500,-4500,width/2,1000,-1100,0,1,0);
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
  fill(255);
  
  pushMatrix();
  translate(width/2,900,-1500);
  
  scale(15,0.03,35);  
  bb=createShape(BOX, 100);
  bb.setStroke(false);
  bb.setTexture(img);
  shape(bb); popMatrix();
  
  //img2= loadImage("p1.jpg");
  for(int i=-200;i>=-2800;i-=400){
    pushMatrix();
    translate(-100,900-200,i);
    tower(30,200,img2); popMatrix();
    pushMatrix();
    translate(1100,900-200,i);
    tower(30,200,img2); popMatrix();    
  }
  //img = loadImage("p2.jpg");
  //img2 = loadImage("p3.jpg");
  for(int i=100;i<=900;i+=200){
    for(int j=-200;j>=-1000;j-=400){
      pushMatrix();
      translate(i,900-200,j);
      tree(img4,50); popMatrix();
      pushMatrix();
      translate(i,900-50,j);
      tower(10,50,img3); popMatrix();      
    }
  }
  
  pushMatrix();
  //img = loadImage("p4.jpg");
  translate(300,900-50,-1300);
  tower(250,150,img5); popMatrix();
  
  pushMatrix();
  translate(width/2,900-90,-2200);
  //img = loadImage("p5.jpg");
  scale(7,1.8,5);  
  c=createShape(BOX, 100);
  c.setStroke(false);
  c.setTexture(img6);
  shape(c); popMatrix();
  
  pushMatrix();
  translate(width/2,900-270,-2200);
  //img = loadImage("p5.jpg");
  scale(6,1.8,4);  
  c=createShape(BOX, 100);
  c.setStroke(false);
  c.setTexture(img6);
  shape(c); popMatrix();
  
  pushMatrix();
  translate(width/2,900-360,-2200);
  //img = loadImage("p7.jpg");
  scale(2.5,1.8,2);  
  c=createShape(SPHERE, 100);
  c.setStroke(false);
  c.setTexture(img8);
  shape(c); popMatrix();
  
  //img = loadImage("p5.jpg");
  //img2 = loadImage("p6.jpg");
  for(int i=-2000;i>=-2700;i-=400){
    for(int j=170;j<=920;j+=670){
       pushMatrix();
       translate(j,900-250,i);
       tower(60,250,img6); popMatrix();
       pushMatrix();
       translate(j,900-650,i);
       tree(img7,80); popMatrix();       
    }
  }
  
  pushMatrix();
  translate(width/2, 900-650, -3000);
  rotateX(TWO_PI/4);
  tower(300,70,img9);
  popMatrix();
  
  pushMatrix();
  translate(width/2, 900-650, -3000);
  rotateZ(ts);
  for(int i=0;i<8;i++){
    rotateZ(i*TWO_PI/8);    
    
    pushMatrix();
    translate(0,-200,0);
    scale(1,45,1);
    st=createShape(BOX, 10);
    st.setStroke(false);
    st.setTexture(img10);
    shape(st); popMatrix();   
    
    pushMatrix();
    translate(0,-450,0);
    car=createShape(SPHERE, 90);
    car.setStroke(false);
    car.setTexture(img10);
    shape(car);  popMatrix();   
  }
  ts+=0.01;
  popMatrix();  
  
  pushMatrix();
  translate(width/2, -300, -500);
  translate(0, 0, pz);
  bird();
  popMatrix();
  pushMatrix();
  translate(width/2-300, -500, -500);
  translate(0, 0, pz);
  bird();
  popMatrix();
  pushMatrix();
  translate(width/2+300, -500, -500);
  translate(0, 0, pz);
  bird();
  pz+=pzz;
  th+=0.3;
  popMatrix();  
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
     vertex(a[i], -h, b[i], p.width/30*i, 0);
     vertex(a[i], h, b[i], p.width/30*i, p.height);  
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
    vertex(x, y, z, p.width/100*i, 0);
    z = cos(a+TWO_PI/40) * r;
    x = sin(a+TWO_PI/40) * r;
    y = 150;
    vertex(x, y, z, p.width/100*i, img.height);
  }
  endShape();
}
void bird(){
  fill(255);
  
  pushMatrix();
  translate(20,0,0);
  rotateZ(PI/4*sin(th));  //PI/4=45度  所以-45~45
  translate(80,0,0);
  scale(4,0.1,2);   //設定box尺寸 乘上40
  box(40); popMatrix();

  pushMatrix();
  translate(-20,0,0);
  rotateZ(-PI/4*sin(th));
  translate(-80,0,0);
  scale(4,0.1,2);   //設定box尺寸 乘上40
  box(40); popMatrix();
  
  scale(0.8,0.8,2);
  box(40);
  
  fill(255,0,0);
  translate(0,0,-40);
  scale(1,1,0.5);
  box(40);
   
}
