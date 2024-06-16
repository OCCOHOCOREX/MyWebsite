class Creature{
  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector rotation;
  color one;
  color two;
  float maxspeed = 4.0;
  float maxforce = 0.4;
  
  Creature(float x, float y, float a, float b, float c){
    position = new PVector(x,y);
    velocity = new PVector();
    acceleration = new PVector();
    one = color(a,b,c);
    //two = color(100,20,120);
  }
  
  void applyForce(PVector force) {
     acceleration.add(force);
  }
  
  PVector separate(ArrayList<Creature> allcreature) {
    float SepRadius = 50;
    PVector t = new PVector();
    int amount = 0;
    
    for(Creature mouse: allcreature){
      float distance = PVector.dist(position, mouseVector);
      // && = and, logically
      if(distance > 0 && distance < SepRadius){
        PVector difference = PVector.sub(position, mouseVector);
        difference.normalize();
        t.add(difference);
        amount++;
      }
    }        
    
    if(amount > 0){
      one = color(51,71,25);
      t.div(amount);
      t.normalize();
      t.mult(maxspeed);
      PVector steer = PVector.sub(t, velocity);
      steer.limit(maxforce);
      return steer;
    }
    else{
      return new PVector();
    }
  }
  
  PVector attract(ArrayList<Creature> allcreature){
    float AttRadius = 170;
    PVector s = new PVector();
    int amount2 = 0;
    
    for(Creature mouse: allcreature){
      float distance = PVector.dist(position, mouseVector);
      if(mousePressed && distance > 0 && distance < AttRadius){
        PVector difference = PVector.sub(mouseVector, position);
        difference.normalize();
        s.add(difference);
        amount2++;
      }
    }
    
    if(amount2 > 0){
       one = color(94,81,29);
       s.div(amount2);
       s.normalize();
       s.mult(maxspeed);
       PVector steer = PVector.sub(s, velocity);
       steer.limit(maxforce);
       return steer;
    }
    else{
      //one = color(200);
      return new PVector();
    }
  }
  
  void ApplyBehaviours(ArrayList<Creature> creature){
    PVector SepForce = separate(creature);
    PVector AttForce = attract(creature);
    
    SepForce.mult(2);
    AttForce.mult(2);
    
    applyForce(SepForce);
    applyForce(AttForce);
    
  }
  
  void update(){
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    position.add(velocity);
    acceleration.mult(0);
  }
  
  void display(){
    fill(one);
    noStroke();
    pushMatrix();
    translate(position.x, position.y);
    rotate(velocity.heading());
    //rotate(random(PI/5,PI/3));
    rect(10,10,30,30,0,100,0,100);
    popMatrix();
  }
}
