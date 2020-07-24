class Mover{
  float mass;
  PVector position;
  PVector velocity;
  PVector acc;
  Boolean dead=false;
  //PVector e;
  Mover(float m, PVector p){
    mass=m;  
    acc=new PVector(0,0);
    velocity = new PVector(0,0);
    position=p.get();
    //e=new PVector(0,0.2);
  }
  void setXY(PVector p){
    position=p.get();
  }
  void update(){
    velocity.add(acc);
    //velocity.add(e);
    //velocity.mult(0.99);    
    position.add(velocity); 
    acc.mult(0);
  }
  void edge(){
    if(position.x<mass){
      position.x=mass;
      velocity.set(-velocity.x, velocity.y);
    }
    if(position.x>width-150-mass){
      position.x=width-150-mass;
      velocity.set(-velocity.x, velocity.y);
    }
    if(position.y<mass){
      position.y=mass;
      velocity.set(velocity.x, -velocity.y);
    }
    if(position.y>height-mass){
      dead=true;
      //position.y=height-mass;
      //velocity.set(velocity.x, -velocity.y);
    }
  }
  boolean bedge(float x, float y, float w, float h){
    if(position.y+mass>y+h && position.y-mass<=y+h && (position.x+mass>x && position.x-mass<x+w)){
      position.y=y+h+mass;
      velocity.set(velocity.x, -velocity.y);
      return true;
    }else if(position.y-mass<y && position.y+mass>=y && (position.x+mass>x && position.x-mass<x+w)){
      position.y=y-mass;
      velocity.set(velocity.x, -velocity.y);
      return true;
    }else if(position.x-mass<x && position.x+mass>=x && (position.y+mass>y && position.y-mass<y+h)){
      position.x=x-mass;
      velocity.set(-velocity.x, velocity.y);
      return true;
    }else if(position.x+mass>x+w && position.x-mass<=x+w && (position.y+mass>y && position.y-mass<y+h)){
      position.x=x+w+mass;
      velocity.set(-velocity.x, velocity.y);
      return true;
    }
    return false;
  }
  void applyForce(PVector f){
    PVector force=f.get();
    force.div(mass);
    acc.add(force);
  }
  void display(){
    fill(255, 0, 0);
    ellipse(position.x, position.y, mass*2, mass*2);
  }
  PVector place(){
     return position.get();
  } 
  void setSpead(PVector s){
    PVector spead=s.get();
    velocity=spead;
  }
  Boolean isDead(){
     if(dead){
       return true; 
     }else{
       return false;
     }
  }
  void setDead(boolean b){
    dead=b;
  }
}