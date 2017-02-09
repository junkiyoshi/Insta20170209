ArrayList<Particle> particles;
Hater h;
float _power = 100;

void setup()
{
  size(512, 512);
  frameRate(30);
  colorMode(HSB);
  blendMode(ADD);
  
  particles = new ArrayList<Particle>();

  float size = 10;
  boolean flg = false;

  for(int y = height / -5; y < height * 1.2; y += size + (size * sqrt(2) / 2))
  {
    for(int x = width / -5; x < width * 1.2; x += size * sqrt(3))
    {
      if(flg)
      {
        particles.add(new Particle(x, y, size));
      }
      else
      {
        particles.add(new Particle(x + (size * sqrt(3) / 2), y, size));
      }
    }
    flg = !flg;
  }
  
  h = new Hater(width / 2, height / 2);
}

void draw()
{
  background(0);
  
  h.run();
  
  for(Particle p : particles)
  {
    PVector mouse = new PVector(h.location.x, h.location.y);
    PVector distance = PVector.sub(mouse, p.location);
    if(distance.mag() <= _power)
    {
      p.seek_r(mouse);
    }else
    {
      p.seek(p.starting);
    }
    
    p.run();
  }
  
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 900)
  {
     exit();
  }
  */
}