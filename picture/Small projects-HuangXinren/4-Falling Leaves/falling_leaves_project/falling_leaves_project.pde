PVector position;
PVector gravity, wind;
int i;
ArrayList<leaves> leaves;
PVector angle;
float w = 1;

void setup(){
  size(800,500);
  w = w + 1;
  gravity = new PVector(0, 0.08);
  wind = new PVector(-0.5*w, 0);
  
  leaves = new ArrayList<leaves>();
}

void draw(){
  background(34,30,0);
  
  for (leaves lv : leaves) {
    lv.addForce(gravity);
    lv.update();
    lv.display();
  }
  
  leaves.add(new leaves(random(-100,800), -100,
  int(random(79,155)), 102, 22));
 }

void keyPressed() {
  if (key == 'r') {
    setup();
  }
  if (key == 'w') {
    for (leaves lv : leaves){
      lv.addForce(wind);
    }
  }
}
