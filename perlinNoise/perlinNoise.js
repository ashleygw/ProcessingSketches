//Perlin Noise
//INSANELY cool and useful
var xoff1 = 0;
var xoff2 = 10000;
var xoff = 0;
var inc= 0.01;
var start = 0;

function setup() {
    createCanvas(400, 400);
    pixelDensity(1);
}

function draw() {
    //3 2d perlin noise
    // var yoff = 0;
    // loadPixels();
    // for(var y = 0;y < height;y++)
    // {
    //     var xoff = 0;
    //     for(var x = 0;x < width;x++)
    //     {
    //         var index = (x+y*width)*4;
    //         var r = noise(xoff,yoff)*255;
    //         pixels[index] = r;
    //         pixels[index+1] = r;
    //         pixels[index+2] = r;
    //         pixels[index+3] = 255;
            
    //         xoff+=inc;
    //     }
    //     yoff +=inc;
    // }
    // updatePixels();

    //1
//   //var x = random(width);
//   var x = map(noise(xoff1),0,1,0,width);
//   var y = map(noise(xoff2),0,1,0,height);
  
//   xoff1+=0.01;
//   xoff2+=0.01;
//ellipse(x,y,24,24);

    //2 one d noise visualization with movement
background(51);
beginShape();
stroke(255);
noFill();
xoff = start;
for(var x = 0;x < width;x++)
{
    stroke(255);
    // var y = random(height);
    var y = noise(xoff)*(height);
    vertex(x,y);
    xoff+=inc;
    
}
start+=inc;
endShape();
//noLoop();
}