void setup(){
  size(1000,800);
  
  PFont fonta;
  fill(0);
  fonta=createFont("標楷體",32);
  textFont(fonta, 40);
  text("美麗的花兒", 400, 70);
  textFont(fonta, 20);
  text("楊程鈞", 470, 100);  

  PImage img,msk;
  img=loadImage("f1.tif"); 
  msk=loadImage("mask.tif");
  img.mask(msk);
  image(img, 10, 110);
  
  img=loadImage("f2.tif"); 
  msk=loadImage("mask.tif");
  img.mask(msk);
  image(img, 350, 450);
  
  img=loadImage("f3.tif"); 
  msk=loadImage("mask.tif");
  img.mask(msk);
  image(img, 690, 110);  
  
  img=loadImage("f3.tif"); 
  msk=loadImage("mask2.tif");
  img.mask(msk);
  image(img, 10, 450); 
  
  img=loadImage("f5.tif"); 
  msk=loadImage("mask2.tif");
  img.mask(msk);
  image(img, 350, 110); 
  
  img=loadImage("f6.tif"); 
  msk=loadImage("mask2.tif");
  img.mask(msk);
  image(img, 690, 450);  
  /*size(300,300);
  background(0);
  fill(255);
  quad(10,150,150,300,290,150,150,0);
  saveFrame("mask2");*/
}
