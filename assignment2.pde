Pudding pudding; //<>//
Pudding pudding1;
Pudding pudding2;
Pudding pudding3;
Pudding pudding4;
int gameState;
void setup() {
  gameState=1;
  size(640, 480);
  pudding= new Pudding();
  pudding1= new Pudding();
  pudding2= new Pudding();
  pudding3= new Pudding();
  pudding4= new Pudding();
}
void draw() {
  if (gameState==1) {
        gradiantBackground();
    pudding.sceneBackground();
    pudding.character();
    pudding.move();
    pudding.bounce();
    pudding.display();
    pudding1.character();
    pudding1.move();
    pudding1.bounce();
    pudding1.display();
    pudding2.character();
    pudding2.move();
    pudding2.bounce();
    pudding2.display();
    pudding3.character();
    pudding3.move();
    pudding3.bounce();
    pudding3.display();
    pudding4.character();
    pudding4.move();
    pudding4.bounce();
    pudding4.display();

      //if (pudding.position.y>=pudding.playerY) {
      //  background(255,0,0);
      //  gameState=0;
      //}
      // if (pudding1.position.y>=pudding1.playerY) {
      //  background(255,0,0);
      //  gameState=0;
      //}
      // if (pudding2.position.y>=pudding2.playerY) {
      //  background(255,0,0);
      //  gameState=0;
      //}
      // if (pudding3.position.y>=pudding3.playerY) {
      //  background(255,0,0);
      //  gameState=0;
      //}
      // if (pudding4.position.y>=pudding4.playerY) {
      //  background(255,0,0);
      //  gameState=0;
      //}
  }
}
void gradiantBackground() {
  int[] gradiant={#0114b7,#012bb7,#013db7,
#0146b7,#0155b7,#015cb7,
#0165b7,#016eb7,#0177b7,#0177b7} ;
int i=0;
  for (int y=0; y<=height; y+=50) {
    fill(gradiant[i]);
    rect(0, y, width*2, 50); 
    i++;
  }
  fill(0,255,0);
rect(0,470,width*2,50);
}
