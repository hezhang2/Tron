//Helen Zhang, 8th Block, Tron
//URL

int aXP = 40;
int aYP = 242;

int dXP = 450;
int dYP = 250;

int direction = LEFT;
int directionD = LEFT;

boolean gameOver = false;
boolean win = false;
boolean start = true;

void setup()
{
  frameRate(10);
  smooth();
  size(500, 496);
  background(150, 170, 200);
}

void draw()
{
  if (gameOver==false && win==false)
  {
    devil();
    angel();
  }

  if (gameOver==true)
  {
    //Imagine text that says GAME OVER 
    noStroke();
    fill(120, 120, 120, 50);
    rect(0, 225, 500, 50);
  }
  if (win==true)
  {
    //IMAGINE text that says YOU WIN
    noStroke();
    fill(240, 240, 180, 50);
    rect(0, 225, 500, 50);
  }
}


void keyPressed()
{
  aKeys();
}

void mousePressed()
{
  if (mousePressed == true)
  {
    start = false;
  }
}



void angel()
{
  if ( gameOver == false )
  {
    noStroke();
    fill(200, 230, 230);
    rect(aXP, aYP, 20, 16);
    noFill();
    stroke(240, 240, 180);
    strokeWeight(1);
    ellipse(aXP+10, aYP-7, 15, 5);

    aDirections();
  }
}

void aDirections()
{
  if (direction == UP)
  {
    aYP-=16;
    if ( get(aXP+10, aYP) != color(150, 170, 200) )
    {
      gameOver = true;
    }
  } else if ( direction == DOWN)
  {
    aYP+=16;
    if ( get(aXP+10, aYP) != color(150, 170, 200) )
    {
      gameOver = true;
    }
  } else if ( direction == LEFT)
  {
    aXP+=20;
    if ( get(aXP, aYP+8) != color(150, 170, 200) )
    {
      gameOver = true;
    }
  } else if ( direction == RIGHT)
  {
    aXP-=20;
    if ( get(aXP, aYP+8) != color(150, 170, 200) )
    {
      gameOver = true;
    }
  }
}

void aKeys()
{
  if (key == 'w')
  {
    direction = UP;
  } else if (key == 's')
  {
    direction = DOWN;
  } else if (key == 'd')
  {
    direction = LEFT;
  } else if (key == 'a')
  {
    direction = RIGHT;
  }
}




void devil()
{
  if (win == false)
  {
    noStroke();
    fill(100);
    triangle(dXP-10, dYP-5, dXP-6, dYP-13, dXP-4, dYP-5);
    triangle(dXP+10, dYP-5, dXP+6, dYP-13, dXP+4, dYP-5);
    fill(214, 90, 90);
    rect(dXP-10, dYP-8, 20, 16);

    devilDir();
  }
}

void devilDir()
{

  if (directionD == UP)
  {
    dYP-=16;
    if ( get(dXP, dYP) != color(150, 170, 200) )
    {
      win = true;
    }
    if ( get(dXP, dYP-17) != color(150, 170, 200) ) //up blocked
    {
      if ( get(dXP-21, dYP) != color(150, 170, 200)) //left blocked
      {
        directionD = RIGHT;
      } else if ( get(dXP+21, dYP) != color(150, 170, 200)) //right blocked
      {
        directionD = LEFT;
      } else
      {
        int r = int(random(2));
        if (r == 1)
        {
          directionD = RIGHT;
        } else
        {
          directionD = LEFT;
        }
      }
    }
  } else if ( directionD == DOWN)
  {
    dYP+=16;
    if ( get(dXP, dYP) != color(150, 170, 200) )
    {
      win = true;
    }
    if ( get(dXP, dYP+17) != color(150, 170, 200) )//down blocked
    {
      if ( get(dXP-21, dYP) != color(150, 170, 200)) //left blocked
      {
        directionD = RIGHT;
      } else if ( get(dXP+21, dYP) != color(150, 170, 200)) //right blocked
      {
        directionD = LEFT;
      } else
      {
        int r = int(random(2));
        if ( r == 1)
        {
          directionD = LEFT;
        } else 
        {
          directionD = RIGHT;
        }
      }
    }
  } else if ( directionD == LEFT)
  {
    dXP-=20;
    if ( get(dXP, dYP) != color(150, 170, 200) )
    {
      win = true;
    }
    if ( get(dXP-21, dYP) != color(150, 170, 200) )//left blocked
    {
      if ( get(dXP, dYP-17) != color(150, 170, 200) )//up blocked
      {
        directionD = DOWN;
      } else if ( get(dXP, dYP+17) != color(150, 170, 200) )//down blocked
      {
        directionD = UP;
      } else
      {
        int r = int(random(2));
        if (r == 1)
        {
          directionD = UP;
        } else
        {
          directionD = DOWN;
        }
      }
    }
  } else if ( directionD == RIGHT)
  {
    dXP+=20;
    if ( get(dXP, dYP) != color(150, 170, 200) )
    {
      win = true;
    }
    if ( get(dXP+21, dYP) != color(150, 170, 200) )//right blocked
    {
      if ( get(dXP, dYP-17) != color(150, 170, 200) )//up blocked
      {
        directionD = DOWN;
      } else if ( get(dXP, dYP+17) != color(150, 170, 200) )//down blocked
      {
        directionD = UP;
      } else
      {
        int r = int(random(2));
        if ( r == 1)
        {
          directionD = DOWN;
        } else 
        {
          directionD = UP;
        }
      }
    }
  }
}


