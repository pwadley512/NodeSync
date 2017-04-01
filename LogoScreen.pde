// NodeSync LogoScreen.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley


public class LogoScreen {

  // Screen Size
  int dispWidth = 850;
  int dispHeight = 850;

  // Screen border
  int topWallY = 10;
  int bottomWallY = dispHeight-20;
  int leftWallX = 10;
  int rightWallX = dispWidth-20;

  int showDelay;

  PImage img;

  public LogoScreen(int showDelay) {
    this.showDelay = showDelay;
  }

  void redrawBackground() {
    //fill(0, 0, 0); // Black
    //rect(0, 0, dispWidth, dispHeight); // Black Border
    fill(255, 255, 255); // White
    rect(0, 0, dispWidth, dispHeight); // Playing Field Colour
    img = loadImage("uofcenglogo.png");
    image(img, 180, 70);
    fill(0, 0, 0); // Black
  }


  GameStateENUM mdraw(int EngineTimer) {
    redrawBackground();
    return isLogoDone(EngineTimer);
  }

  GameStateENUM isLogoDone (int EngineTimer) {
    if ((millis()-EngineTimer)>showDelay) {
      return GameStateENUM.MAINMENU;
    } else {
      return GameStateENUM.LOGO;
    }
  }
}