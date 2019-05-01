class Pudding {
  PVector position, velocity, gravityVector; 
  int sunRadius;
  float leftCloud;
  float rightCloud;
  float playerX;
  float playerY;
  float velocityY;
  float gravity;
  float ballHit;
  float ballX;
  float ballY;
  float ballSize;
  float directionX;
  float characterX ;
  float characterY;
  int score;
  float ballHitCharacter;
  boolean isInRange1;
  boolean isInRange2;
  boolean isChangePosition;
  float treeX;
  Pudding() {
    position=new PVector(10, 0);
    velocity=new PVector(random(1, 1.2), random(0.2, 1.2));
    gravityVector=new PVector(0.5, 0.5);
    ballHit=-1;
    sunRadius = 100;
    leftCloud = 450;
    rightCloud = 110;
    ballSize=20;
    treeX=100;
  }
  void move() {
    position.x += velocity.x;
    velocity.y += gravityVector.y; 
    position.y += velocity.y;
  }
  void bounce() {
    isInRange1 = position.x > mouseX - characterX; 
    isInRange2 = position.x  < mouseX + characterX;
    characterX = 40;
    characterY=40;
    fill(0);
    rectMode(CENTER);
    if (position.y>height-ballSize) { // ball hit the ground 
      velocity.y *= ballHit;
      position.y=height-ballSize/2;
      if (position.x <10 ) { // make the ball stay at the left corner of the screen
        position.x=10;
      }
    }
    //sceneBackground(); //calling the background function
    //character(); // calling the character
    if (score>100) { //display message when over 100
      textSize(34);
      text("You are nailing it", width/2, 40);
    }
    textSize(34);
    text("Score:"+score, 10, 40);// Display the score on the canvas
    //WHEN THE BALL HIT THE HAT
    if (position.y>playerY - characterY + 5 && position.y< playerY + characterY ) // check ball y position
      if (isInRange1 && isInRange2 ) { // check ball in range of the hat
        velocity.y *= ballHit; 
        score++; 
        //counting the score
        //arc(playerX, playerY+30, 15, 15, 0, PI, PIE);//mouth
        //if (isChangePosition) { //if you change the postion of the mouseX
        //  arc(playerX, playerY+30, 15, 15, 0, PI, PIE);//mouth of the character
        //  directionX = (mouseX-pmouseX);
        //  if (directionX >  3)  
        //    directionX = random(1, 3);
        //  else if (directionX < -3)  
        //    directionX = random(-3, 0);
        //}
        if (ballY > playerY - characterY + 20 ) { //change the velocity of the ball when it is under the hat
          velocityY += 0.1;
          velocityY *= ballHit;
          score--;
          ballX += directionX;
        }
      }
    if (position.x > width - ballSize/2) { // the ball hit the right wall
      velocity.x *= ballHit;
    } else if (position.x <= 0 + ballSize/2) { // the ball hit the left wall
      velocity.x *= ballHit;
    }
    //if (position.y>playerY){
    //background(255);
    //position.y=height;
    //}
  }
  void display() {
    fill(90, 155, 244);
    noStroke();
    fill(#e74c3c);
    ellipse(position.x,position.y, ballSize, ballSize) ; // the playing ball
    // if (position.y>playerY){
    //background(255);
    //position.y=height;
    //fill(255);
    //ellipse(position.x,position.y, ballSize, ballSize) ;
    //}
  }
  void ball() {
    rect(100, 100, 100, 100);
  }
  void character() {
    playerX = mouseX;
    playerY=380; 
    rectMode(CENTER);
    fill(#2c3e50);
    rect(playerX, playerY, characterX+20, characterY);//hat
    fill(210);
    rect(playerX, playerY+20, characterX, characterY);
    fill(#2c3e50);
    rect(playerX-10, playerY+60, 10, 40);//leg
    rect(playerX+10, playerY+60, 10, 40);//leg
    fill(255);
    ellipse(playerX-13, playerY+10, 6, 8);
    ellipse(playerX+13, playerY+10, 6, 8);
    fill(0);
    ellipse(playerX-13, playerY+13, 3, 3);
    ellipse(playerX+13, playerY+13, 3, 3);
    fill(#2980b9);
    rect(playerX-15, playerY+80, 25, 10);//left feet
    rect(playerX+15, playerY+80, 25, 10);//right feet
    fill(250);
    arc(playerX, playerY+30, 15, 15, -PI, 0, 0);
  }
  void sceneBackground() {
    rectMode(CORNER);
    fill(50, 210, 120);
    rect(0, 440, width, 80);
    rectMode(CENTER);//the sun and the cloud
    noStroke();
    fill(240, 240, 22);
    ellipse(200, 100, sunRadius, sunRadius);
    fill(255);
    ellipse(leftCloud, 150, 126, 97);
    ellipse(leftCloud+62, 150, 70, 60);
    ellipse(leftCloud-62, 150, 70, 60);
    ellipse(rightCloud, 130, 126, 97);
    ellipse(rightCloud+62, 130, 70, 60);
    ellipse(rightCloud-62, 130, 70, 60);
    rightCloud+=0.5;
    leftCloud+=0.75; 
    fill(196, 92, 6);
    rect(treeX, 350, 25, 230);
    fill(75, 126, 4);
    ellipse(treeX, 300, 200, 150);
    if (rightCloud - 100>width) {
      rightCloud = -150;
    }
    if (leftCloud -100 >width) {
      leftCloud = -80;
    }
    rectMode(CORNER);
    rect(width-100,height-120,200,200);
  }
}
