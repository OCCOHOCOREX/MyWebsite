ArrayList<Creature> creature;
int number = 100;
PVector mouseVector;

void setup() {
  size(800, 500);
  creature = new ArrayList<Creature>();
  
  for (int i = 0; i < number; i++){
    creature.add(new Creature(random(width), random(height), 
    102,134,77));
  }
  
  mouseVector = new PVector(0, 0);
}

void draw() {
  background(183,239,255);
  UpdateMouseVector(); 
  for (Creature c : creature){
    c.ApplyBehaviours(creature);
    c.update();
    c.display();
  }
}

void keyPressed(){
  if (key == 'r'){
    setup();
  }
}

void UpdateMouseVector(){
  mouseVector.set(mouseX, mouseY);
}
