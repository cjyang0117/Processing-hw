void setup(){
  size(800,800);
  PImage p;
  p=loadImage("1.JPG");
  image(p,0,0);
  strokeWeight(5);
   pushMatrix();
   translate(400,400);
   rotate(0.6);
   fill(0,255,0);
   beginShape();
   vertex(0, 0);
   bezierVertex(100, 125, 100, 300, 0, 300);
   bezierVertex(-100, 300, -100, 125, 0, 0);
   
   beginContour();
   vertex(0,60);
   bezierVertex(-10,70,-10,100,0,100);
   bezierVertex(10,100,10,70,0,60);
   endContour();
   
   beginContour();
   vertex(-10,105);
   vertex(-10,205);
   vertex(10,205);
   vertex(10,105);  
   endContour();
   
   endShape();
   noFill();
   bezier(0,300,0,300,-10,350,20,350); popMatrix();
   
   pushMatrix();
   translate(200,200);
   rotate(0.4);
   fill(0,255,0);
   beginShape();
   vertex(0, 0);
   bezierVertex(100, 125, 100, 300, 0, 300);
   bezierVertex(-100, 300, -100, 125, 0, 0);
   
   beginContour();
   vertex(0,60);
   bezierVertex(-10,70,-10,100,0,100);
   bezierVertex(10,100,10,70,0,60);
   endContour();
   
   beginContour();
   vertex(-10,105);
   vertex(-10,205);
   vertex(10,205);
   vertex(10,105);  
   endContour();
   
   endShape(CLOSE);
   noFill();
   bezier(0,300,0,300,-10,350,20,350); popMatrix();
   
   pushMatrix();
   translate(500,200);
   rotate(-0.4);
   fill(0,255,0);
   beginShape();
   vertex(0, 0);
   bezierVertex(100, 125, 100, 300, 0, 300);
   bezierVertex(-100, 300, -100, 125, 0, 0);
   
   beginContour();
   vertex(0,60);
   bezierVertex(-10,70,-10,100,0,100);
   bezierVertex(10,100,10,70,0,60);
   endContour();
   
   beginContour();
   vertex(-10,105);
   vertex(-10,205);
   vertex(10,205);
   vertex(10,105);  
   endContour();
   
   endShape(CLOSE);
   noFill();
   bezier(0,300,0,300,-10,350,20,350); popMatrix();
}   
