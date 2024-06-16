class leavessystem{
  PVector origin;
  ArrayList<leaves> leaves;
  color Color;
  
  leavessystem(float x, float y, int c){
    origin = new PVector(x,y);
    leaves = new ArrayList<leaves>();
  }
  
  void addForce(PVector f){
    for (int i = 0; i < leaves.size(); i=i+1){
      leaves.get(i).addForce(f);
    }
  }
  
  void update(){
    leaves.add(new leaves(origin.x, origin.y,
    int(random(59,135)), 82, 17));
    //stop();
    
    //for (int i = leaves.size()-1; i >=0; i--){
    //  if (leaves.get(i).expired()){
    //    leaves.remove(i);
    //  }
    //}
    
    for (int i = 0; i < leaves.size(); i++){
      leaves l = leaves.get(i);
      l.update();
    }
  }
  
  void display(){
    for (int i = 0; i < leaves.size(); i++){
      leaves l = leaves.get(i);
      l.display();
    }
  }
  
  //void stop(){
  //  if (origin.y > 100){
  //    origin.y = 100;
  //  }
  //}
}
