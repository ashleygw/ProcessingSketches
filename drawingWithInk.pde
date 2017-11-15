int num = 10000;
float w, a;
PVector prevPos = new PVector(0,0);
PVector[] inkArray = new PVector[num];
float[] maxSize = new float[num];
float[] startLocation = new float[num];
float[] life = new float[num];
float[] maxLife = new float[num];
PImage backgroundImage;
int iter = 0;
color c;
color prevc;
int toAdd = 0;
float[] maxSize2 = new float[num];
float[] startLocation2 = new float[num];
PVector[] inkArray2 = new PVector[num];
float[] life2 = new float[num];
float[] maxLife2 = new float[num];
float[] noize = new float[num];
float[] noize2 = new float[num];
float nindex = 10;

void setup() {
  size(1564, 786);
  background(255);
  frameRate(60);
  backgroundImage = loadImage("brbackcrop.jpg");
  //blendMode();
  background(0);
  
  for(int i = 0; i < 400; i++)
  {
    inkArray[i] = new PVector(860, lerp(0,height,i/300.0));
    maxSize[i] = random(1000);
    startLocation[i] = lerp(0,height,i/80);
    maxLife[i] = random(10,500);
    life[i] = 0;
    noize[i] = random(0,100);
    iter++;
    //println(lerp(0,height,i/80));
  }
}
//
void updateKill(int index){
  //Use linked list if speed becomes an issue
  for(int i = index; i < iter - 1;i++)
  {
    inkArray[i] = inkArray[i+1];
    maxSize[i] = maxSize[i+1];
    startLocation[i] = startLocation[i+1];
    life[i] = life[i+1];
    maxLife[i] = maxLife[i+1];
    noize[i] = noize[i+1];
  }
  iter = iter - 1;
}
void updateAdd(){
  for(int i = 0;i < toAdd;i++){
    inkArray[iter + i] = inkArray2[i];
    maxSize[iter + i] = maxSize2[i];
    startLocation[iter + i] = startLocation2[i];
    maxLife[iter + i] = maxLife2[i];
    life[iter + i] = life2[i];
    noize[iter + i] = noize2[i];
  }
  iter = iter + toAdd;
  toAdd = 0;
}
void draw() {
  //background(255);//cool effect
  //fill(0);
  //textSize(32);
  //text(iter, 10, 30); 
  updateAdd();
  nindex += 0.01;
  float tempx;
  float tempy;
  for(int i=0; i<iter; i++) {
    prevPos.x = inkArray[i].x;
    prevPos.y = inkArray[i].y;
    prevc = backgroundImage.get((int)inkArray[i].x,(int)inkArray[i].y);
    tempx = noise(noize[i] + nindex)*10.0 - 5.0;
    tempy = noise((noize[i] + nindex) + 5.0)*10.0 - 5.0;
    if(tempx > 0 && tempy > 0)
      inkArray[i].x +=3;
    else if(tempx > 0 && tempy < 0)
      inkArray[i].x -=3;
    else if(tempx < 0 && tempy > 0)
      inkArray[i].y +=3;
    else
      inkArray[i].y -=3;
    w = map(life[i], 0, maxLife[i], 10,0);
    a = map(life[i], maxLife[i], 0, 0, 150);
    c = backgroundImage.get((int)inkArray[i].x,(int)inkArray[i].y);
    if((red(c) + green(c) + blue(c)) > 180)
    {
     stroke(c, a); 
    }
    else // kill
    {
      //life[i] = 10000;
      stroke(250,200,80,10);
    }
    strokeWeight(abs(w));
    
    if (life[i] < maxLife[i]) {
      life[i]++;
      line(prevPos.x, prevPos.y, inkArray[i].x, inkArray[i].y);
    } else {
      updateKill(i);
      i--;
    }
  }
}
void mouseDragged(){
  inkArray2[toAdd] = new PVector(mouseX, mouseY);
  maxSize2[toAdd] = random(1000);
  startLocation2[toAdd] = mouseY;
  maxLife2[toAdd] = random(10,500);
  life2[toAdd] = 0;
  noize2[toAdd] = random(0,100);
  toAdd++;
}

void keyPressed()
{
 if(key == 's')
 {
  saveFrame("###.tiff"); 
 }
}
