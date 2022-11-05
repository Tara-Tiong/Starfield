Particle[] star = new Particle[300]; 
//Cloud[] clyde = new Cloud[10];

void setup(){
  size(800, 800);
  background(0);
  for(int i = 0; i < 5; i++)
    star[i] = new Cloud();
  for(int i = 5; i < 15; i++)
    star[i] = new Oddball();
  for(int i= 15; i< star.length; i++)
    star[i] = new Particle();
    frameRate(60);
}

void draw(){
  background(0);
 fill(0);
  for(int i = 0; i< star.length; i++){
   star[i].show();
   star[i].move();
   star[i].reset();
 }
 fill(0,0,0);
 ellipse(width/2, height/2, 240,240);
}

class Particle{
  float mySize, myX, myY;
  double myAngle, mySpeed;
  color myColor;
  Particle(){
    myX = width/2;
    myY = height/2;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*10 +2;
    mySize = (float)(Math.random()*1)+1;
    myColor = color((int)(Math.random()*100)+100,50,(int)(Math.random()*200)+56);
  }
  void move(){
    myX += Math.cos((float)myAngle)*mySpeed;
    myY += Math.sin((float)myAngle)*mySpeed;
    myAngle += 0.01;
  }
  void show(){
    fill(myColor);
    noStroke();
    float size = mySize * dist(width/2,height/2, myX, myY)/60;
    ellipse(myX, myY, size, size);
  }
  void reset(){
    if( myX > width || myY > height){
     myX = width/2;
     myY = height/2;
     myAngle = Math.random()*360;
     mySpeed = Math.random() * 7  + 2;
    }
  }
}

class Oddball extends Particle{
  Oddball(){
    myX = width/2;
    myY = height/2;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*5;
    myColor = color((int)(Math.random()*100)+156,(int)(Math.random()*256),(int)(Math.random()*256));
  }
 void show(){
   fill(255);
   int diam = 0;
    float r = 250;
    noFill();
  while(diam < 30){
    stroke(r,0,r+ (int)(Math.random()*100));
    ellipse(myX, myY,diam,diam);
    diam++;
    r-=255/30.0;
  }
 }
}

class Cloud extends Particle{
  int myHeight, myWidth, myOpacity;
  Cloud(){
    myX = width/2;
    myY = height/2;
    myAngle = Math.random()*Math.PI;
    mySpeed = Math.random()*1;
    myWidth = (int)(Math.random()*10)+500;
    myHeight = (int)(Math.random()*30)+100;
    myColor = color((int)(Math.random()*100),0,(int)(Math.random()*256));
    myOpacity = (int)(Math.random()*60) +60;
  }
  void show(){
   int diam = 0;
    float r = 250;
    noFill();
  while(diam < 30){
    stroke(r,r,r);
    ellipse(myX, myY,diam+myWidth,diam+myHeight);
    diam++;
    r-=255/30.0;
  }
  noStroke();
  fill(myColor);
  ellipse(myX, myY, 250, 250);
  }
    void move(){
    myX += Math.cos((float)myAngle)*mySpeed;
  }
   void reset(){
    if( myX < (width/2)-10 || myX > (width/2)+10){
     myX = width/2;
     myY = height/2;
    }
  }
}
