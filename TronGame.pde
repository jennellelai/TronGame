//Jennelle Lai CP 1 Mods 16/17 Tron Assignment
//http://jenlcp1.net63.net/Tron1.html
int x = 20;
int y = 250;
int direction = RIGHT;
int compX = 480;
int compY = 250;
int compDirection = LEFT;
int dotSize = 3;
boolean gameOver = false;


void setup()
{
  size (500, 500);
  background(0, 0, 0);
  strokeWeight(3);
  stroke(255, 255, 255);
  line(0, 0, 0, 500);
  line(0, 0, 500, 0);
  line(500, 0, 500, 500);
  line(0, 500, 500, 500);
  frameRate = 0.2;
}

void draw()
{

  strokeWeight(0);

  if (gameOver == false)
  {
    human();
  }

  if (gameOver == false)
  {
    computer();
  }
}


void keyPressed()
{

  if (key == 'a')
  {
    direction = LEFT;
  }

  if (key == 'w')
  {
    direction = UP;
  }

  if (key == 's')
  {
    direction = DOWN;
  }

  if (key == 'd')
  {
    direction = RIGHT;
  }
}

void human()
{

  if (get(x, y) != color(0, 0, 0))

  {
    fill(255, 0, 0);
    ellipse(150, 150, 200, 200);
    fill(0);
    text("BETTER LUCK NEXT TIME!", 80, 150);
    text("Left Click to Play Again", 80, 180);
    gameOver = true;
  }

  stroke(0, 255, 0);
  //point(x,y);
  rect(x, y, 2, 2);

  if (direction == UP)
  {
    y= y - dotSize;
  }

  else if (direction == DOWN)
  {
    y= y + dotSize;
  }

  else if (direction == LEFT)
  {
    x = x -dotSize;
  }

  else if (direction == RIGHT)
  {
    x = x + dotSize;
  }
}

void computer()
{

  if (get(compX, compY) != color(0, 0, 0))

  {
    fill(255, 0, 0);
    ellipse(150, 150, 200, 200);
    fill(0);
    text("I DEMAND A REMATCH!", 80, 150);
    text("Left Click to Play Again", 80, 180);
    gameOver = true;
  }


  stroke(255, 0, 0);
  //point(compX, compY);
  rect(compX, compY, dotSize-1, dotSize-1);

  if (compDirection == UP)
  {

    if (get(compX, compY-dotSize) != color(0, 0, 0))

      compDirection = RIGHT;
  }

  else if (compDirection == DOWN)
  {

    if (get(compX, compY+dotSize) != color(0, 0, 0))

      compDirection = RIGHT;
  }

  else if (compDirection == RIGHT)
  {

    if (get(compX+dotSize, compY) != color(0, 0, 0))

      compDirection = UP;
  }

  else if (compDirection == LEFT)
  {

    if (get(compX-dotSize, compY) != color(0, 0, 0))

      compDirection = UP;
  }


  if (compDirection == LEFT)
  {
    compX = compX - dotSize;
    if (get(compX-dotSize, compY) != color(0, 0, 0))//left is blocked
    {
      if (get(compX, compY-dotSize) != color(0, 0, 0))//up is blocked
      {
        compDirection = DOWN;
      }
      else if (get(compX, compY+dotSize) != color(0, 0, 0))//down is blocked
      {
        compDirection = UP;
      }
      else if (random (1) < .5) //50/50 chance //neither is blocked 
      {
        compDirection = UP;
      }

      else
      {
        compDirection = DOWN;
      }
    }
  }

  else if (compDirection == RIGHT)
  {
    compX = compX + dotSize;
    if (get(compX+dotSize, compY) != color(0, 0, 0))//right is blocked
    {
      if (get(compX, compY-dotSize) != color(0, 0, 0))//up is blocked
      {
        compDirection = DOWN;
      }
      else if (get(compX, compY+dotSize) != color(0, 0, 0))//down is blocked
      {
        compDirection = UP;
      }
      else if (random (1) < .5) //50/50 chance //neither is blocked 
      {
        compDirection = UP;
      }

      else
      {
        compDirection = DOWN;
      }
    }
  }

  else if (compDirection == UP)
  {
    compY= compY -dotSize;
    if (get(compX, compY-dotSize) != color(0, 0, 0))//up is blocked
    {
      if (get(compX+dotSize, compY) != color(0, 0, 0))//right is blocked
      {
        compDirection = LEFT;
      }
      else if (get(compX-dotSize, compY) != color(0, 0, 0))//left is blocked
      {
        compDirection = RIGHT;
      }
      else if (random (1) < .5) //50/50 chance //neither is blocked 
      {
        compDirection = LEFT;
      }

      else
      {
        compDirection = RIGHT;
      }
    }
  }


  else if (compDirection == DOWN)
  {
    compY = compY + dotSize;
    if (get(compX, compY+dotSize) != color(0, 0, 0))//down is blocked
    {
      if (get(compX+ dotSize, compY) != color(0, 0, 0))//right is blocked
      {
        compDirection = LEFT;
      }
      else if (get(compX-dotSize, compY) != color(0, 0, 0))//left is blocked
      {
        compDirection = RIGHT;
      }
      else if (random (1) < .5) //50/50 chance //neither is blocked 
      {
        compDirection = LEFT;
      }

      else
      {
        compDirection = RIGHT;
      }
    }
  }
}



void mouseClicked()
{
  if (mouseButton == LEFT)
  {
    setup();
    gameOver = false;
    x = 20;
    y = 250;
    compX = 480;
    compY = 250;
  }
}

