class Hater
{
  PVector location;
  float max_speed;
  float angle;
  float noise_value;
  
  Hater(float x, float y)
  {
    location = new PVector(x, y);
    max_speed = 10;
    noise_value = random(10);
  }
  
  void run()
  {
    update();
    display();
  }
  
  void update()
  {
    angle = map(noise(noise_value), 0, 1, 0, 360);
    float speed = map(noise(noise_value), 0, 1, 0, max_speed);
    noise_value += 0.05;
    float x = speed * cos(radians(angle));
    float y = speed * sin(radians(angle));
    
    location.add(new PVector(x, y));
    
    if(location.x > width)
    {
      location.x = 0;
    }
    if(location.x < 0)
    {
      location.x = width;
    }
    if(location.y < 0)
    {
      location.y = height;      
    }
    if(location.y > height)
    {
      location.y = 0;
    }
  }
  
  void display()
  {
    noStroke();
    fill(255);
    
    ellipse(location.x, location.y, 10, 10);
  }
}