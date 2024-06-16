class leaves{
  PVector position;
  PVector velocity;
  PVector acceleration;
  float life;
  color Color;
  PVector angle;
  
  leaves(float x, float y, color z, color a, color b){
    position = new PVector(x,y);
    velocity = new PVector(random(0.7,5),random(0.1,0.4));
    acceleration = new PVector();
    //life = 200;
    //c = color(26,67,31);
    //d = color(143,132,89);
    //e = color(160,80,61);
    Color = color(z,a,b);
    angle = new PVector(x,y);
  }
  
  void addForce(PVector f){
    acceleration.add(f);
  }
  
  //boolean expired(){
  //  return life < 0;
  //}
  
  void update() {
    //life -= 2;
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    stop();
  }
  
  void display(){
    pushMatrix();
    translate(position.x, position.y);
    rotate(random(angle.x, angle.y));
    //rotate(PI/6);
    //int[] colors = {c,d,e};
    //int value = int(random(colors.length));
    fill(Color);
    stroke(Color);
    quad(0,0,25,0,35,12.5,10,12.5);
    popMatrix();
  }
  
  void stop(){
    if (position.y > height-5){
      position.y = height-5;
      velocity.x = 0;
      velocity.y = 0;
    }
  }
  
}
