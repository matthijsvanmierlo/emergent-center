/*
Emergent Circles from Center
 -----------------------
 Matthijs van Mierlo
 2/19/2022
 */

class LineData
{
  float x1;
  float x2;
  float y1;
  float y2;
  public LineData(float x1, float y1, float x2, float y2)
  {
    this.x1 = x1;
    this.x2 = x2;
    this.y1 = y1;
    this.y2 = y2;
  }
}

ArrayList<Circle> circles = new ArrayList<>();
ArrayList<LineData> lines = new ArrayList<>();

void setup()
{
  size(1125, 750);
  background(255);
  frameRate(30);
  for (int i = 0; i < 250; i++)
  {
    circles.add(new Circle());
  }
}

void draw()
{
  background(255);
  for (Circle c : circles)
  {
    c.update();
    if (c.offScreen())
    {
      c.reset();
    }
  }
  for (int i = 0; i < circles.size(); i++)
  {
    for (int j = 0; j < circles.size(); j++)
    {
      Circle one = circles.get(i);
      Circle two = circles.get(j);
      if (one.intersectsWith(two))
      {
        lines.add(new LineData(one.x, one.y, two.x, two.y));
      }
    }
  }
  for (LineData l : lines)
  {
    color c = #66A097;
    stroke(c, 10);
    fill(c, 10);
    line(l.x1, l.y1, l.x2, l.y2);
  }
  if (lines.size() > 7500)
  {
    int currSize = lines.size();
    for (int i = 0; i < currSize - 7500; i++)
    {
      if (lines.size() > 0)
      {
        lines.remove(0);
      }
    }
  }
  //if (frameCount < 1000)
  //{
  //  // Saves each frame as line-000001.png, line-000002.png, etc.
  //  //saveFrame("/gif-images/emergent-######.tif");
  //  //println(frameCount);
  //}
}
