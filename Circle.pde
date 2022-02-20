class Circle
{
  // Center of circle
  float x;
  float y;
  float dx;
  float dy;
  float diameter;
  public Circle()
  {
    this.x = width / 2 + random(100) - 50;
    this.y = height / 2 + random(100) - 50;
    diameter = 100;
    int[] possibleVels = new int[]{-4, -3, -2, -1, 0, 1, 2, 3, 4};
    this.dx = possibleVels[int(random(possibleVels.length))];
    this.dy = possibleVels[int(random(possibleVels.length))];
    if (this.dx == 0 && this.dy == 0)
    {
      this.dx = possibleVels[int(random(possibleVels.length))];
      this.dy = possibleVels[int(random(possibleVels.length))];
    }
  }
  public void reset()
  {
    this.x = width / 2 + random(100) - 50;
    this.y = height / 2 + random(100) - 50;
    int[] possibleVels = new int[]{-4, -3, -2, -1, 1, 2, 3, 4};
    this.dx = possibleVels[int(random(possibleVels.length))];
    this.dy = possibleVels[int(random(possibleVels.length))];
  }
  public boolean intersectsWith(Circle other)
  {
    if (dist(this.x, this.y, other.x, other.y) < this.diameter / 2 + other.diameter /2)
    {
      return true;
    }
    return false;
  }
  public void update()
  {
    this.x += this.dx;
    this.y += this.dy;
  }
  public boolean offScreen()
  {
    if (this.x + this.diameter / 2 > width || this.x - this.diameter / 2 < 0 || this.y + this.diameter / 2 > height || this.y - this.diameter / 2 < 0)
    {
      return true;
    }
    return false;
  }
}
