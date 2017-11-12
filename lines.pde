PImage img;
int linewidth = 20;
int offset = 20;
int strokedecrease = 10;
int strokesize = 40;
boolean flag = true;
int picture = 0;
float alpha = 255;
int sx = 1600;
int sy = 1000;
void setup()
{
  img = loadImage("bird.jpg");
  size(2560,1440);
  strokeWeight(strokesize);
  //noStroke();
}

void draw()
{
  if(flag)
  paint();
  if(!flag)
  {
    saveFrame("###.png");
    flag = true;
    strokedecrease = (int)random(30) + 5;
    strokesize = (int)random(50) + 30;
    alpha = 255;
    linewidth = (int)random(80) + 40;
    offset = (int)random(30) + 10;
  }
}

void paint()
{
 for(int i =0; i < 5000/(strokesize);i++)
  {
    strokeWeight(strokesize + (int)random(4));
    float x = random(2560);
    float y = random(1440);
    color c = img.pixels[(int)y*img.width+(int)x];
    float rval = red(c) + random(20);
    float bval = blue(c) + random(20);
    float gval = green(c) + random(50);
    int offsetx = (int)x;
    int offsety = (int)y;
    int linelength = (int)random(linewidth);
    //float direction = random(1);
    if(rval > gval && rval > bval)
    {
      stroke(rval,random(0,rval),random(0,rval), alpha);
    }
    else if(gval > rval && gval > bval)
    {
      stroke(random(0,gval),gval,random(0,gval), alpha);
    }
    else
    {
      stroke(random(0,bval),random(0,bval),bval,alpha);
    }
    
    //Only up and down option
    //if(direction > 0.5)
    //{
    //  line(offsetx,offsety,offsetx + linelength,offsety);
    //}
    //else
    //{
    //    line(offsetx,offsety,offsetx,offsety+linelength);
    //}
    line(offsetx+(int)random(-30,30),offsety+(int)random(-30,30),offsetx+(int)random(-30,30),offsety+linelength);
  }
  if(strokedecrease == 0)
  {
    if(strokesize>10)
    {
      //alpha = alpha*7.5/8;
      strokesize -= 5;
    }
    
    else
      strokesize -= 1;
    strokedecrease = 10;
    
  }
  if(strokesize < 1)
  {
   flag = false; 
  } 
  strokedecrease--;
}
void changePicture()
{
  
}
void mousePressed()
{
 changePicture(); 
}