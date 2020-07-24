class Mover{
  float mass;
  PVector position;
  PVector velocity;
  PVector acc;
  PVector e;
  Mover(){
    mass=1; position=new PVector(width/4, height/2);
    velocity=new PVector(0, 0);
    acc=new PVector(0,0.1);
  }
  Mover(float m, PVector p){
    mass=m;  
    acc=new PVector(0,0.1);
    velocity = new PVector(0,0);
    position=p.get();
    e=new PVector(0,0.2);
  }
  void update(){
    velocity.add(acc);
    velocity.add(e);
    velocity.mult(0.99);    
    position.add(velocity); 
    acc.mult(0);
  }
  void edge(){
    if(position.x<mass){
      position.x=mass;
      velocity.set(-velocity.x, velocity.y*0.95);
    }
    if(position.x>width-mass){
      position.x=width-mass;
      velocity.set(-velocity.x, velocity.y*0.95);
    }
    if(position.y<mass){
      position.y=mass;
      velocity.set(velocity.x, -velocity.y*0.95);
    }
    if(position.y>height-mass){
      position.y=height-mass;
      velocity.set(velocity.x, -velocity.y*0.95);
    }
  }
  boolean bedge(float x, float y, float w, float h){
    if(position.y+mass>y+h && position.y-mass<=y+h && (position.x+mass>x && position.x-mass<x+w)){
      position.y=y+h+mass;
      velocity.set(velocity.x, -velocity.y*0.95);
      return true;
    }else if(position.y-mass<y && position.y+mass>=y && (position.x+mass>x && position.x-mass<x+w)){
      position.y=y-mass;
      velocity.set(velocity.x, -velocity.y*0.95);
      return true;
    }else if(position.x-mass<x && position.x+mass>=x && (position.y+mass>y && position.y-mass<y+h)){
      position.x=x-mass;
      velocity.set(-velocity.x, velocity.y*0.95);
      return true;
    }else if(position.x+mass>x+w && position.x-mass<=x+w && (position.y+mass>y && position.y-mass<y+h)){
      position.x=x+w+mass;
      velocity.set(-velocity.x, velocity.y*0.95);
      return true;
    }
    return false;
  }
  void applyForce(PVector f){
    PVector force=f.get();
    force.div(mass);
    acc.add(f);
  }
  void display(){
    fill(255, 0, 0);
    ellipse(position.x, position.y, mass*2, mass*2);
  }
  PVector place(){
     return position.get();
  } 
}