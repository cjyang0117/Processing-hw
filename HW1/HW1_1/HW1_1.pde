void setup(){
  size(300,400); 
  noFill();
  
  //mail
  strokeWeight(6);
  rect(30,50,100,60,30,30,0,0);
  rect(80,50,50,60,30,80,0,0);
  line(75,110,75,140);
  line(55,80,55,30);
  line(55,30,45,30);
  strokeWeight(14);
  point(55,80);
  
  //pencil
  strokeWeight(6);
  line(189,109,239,49);
  line(210,130,260,70);
  line(190,110,210,130);
  line(240,50,260,70);
  line(230,60,250,80);
  line(189,109,189,129);
  line(189,129,210,130);
  
  //mic
  strokeWeight(6);
  rect(60,170,30,60,200,200,200,200);
  curve(45,30,45,220,105,220,105,30);
  line(75,245,75,260);
  
  //map
  strokeWeight(6);
  bezier(220,186,170,195,220,250,220,250);
  bezier(220,186,270,195,220,250,220,250);
  ellipse(220,210,15,15);
  
  //3circle
  strokeWeight(6);
  ellipse(45,330,15,15);
  ellipse(70,350,15,15);
  ellipse(95,333,15,15);
  line(45,310,45,318);
  line(45,340,45,370);
  line(70,310,70,342);
  line(70,360,70,370);
  line(95,310,95,322);
  line(95,341,95,370);
  
  //earning
  ellipse(220,340,70,70);
  line(220,337,220,363);
  strokeWeight(10);
  point(220,325);
}
