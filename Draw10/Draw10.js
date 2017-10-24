//Draw 10
var x = 0;
var y = 0;
var spacing = 40;
var s = 255;
function setup() {
    createCanvas(400, 400);
    background(0);
    noStroke();
    frameRate(1000);
}

function draw() {
    stroke(s);
    fill(s);
    if(random(1) < 0.5){
        //rect(x,y,spacing,spacing);
        line(x,y,x+spacing,y+spacing);
    }
    else{
        line(x,y+spacing,x+spacing,y);
  }
  x = x+spacing;
  if(x > width)
  {
      x = 0;
      y = y + spacing;
  }
  if(y>height)
  {
      y = 0;
      if(s==255)
      {
          s = 0;
      }
      else
        s = 255;
  }
}