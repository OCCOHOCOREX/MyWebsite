void setup(){ 
  size(600,600);
  background(60,70,190);
  colorMode(HSB,360,100,100);
  translate(100,100);
}

void draw(){
  for (int y = 0; y < height + 100; y+=90){
    for (int x = 0; x < width + 100; x+=110){
      push();
      translate(random(30,70),random(30,60));
      noStroke();
      fill(210,80,random(70,100));
      ellipse(x, y, 200, 200);
      fill(210,50,random(80,100));
      ellipse(x, y, 150, 150);
      fill(210,45,random(90,100));
      ellipse(x, y, 104, 104);
      fill(210,random(10,40),100);
      ellipse(x, y, 58, 58);
      pop();
      noLoop();
    }
  }
}

void keyPressed(){
  if (key == 's'){
    save("wave.jpeg");
  }
}
