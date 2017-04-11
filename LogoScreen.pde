// NodeSync LogoScreen.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley


public class LogoScreen {
  int showDelay;
  PImage img;

  public LogoScreen(int a) {
    showDelay =  a;
  }

  GameStateENUM mdraw(int EngineTimer) {
    img = loadImage("uofcenglogo.png");
    image(img, width/3.5, 70);
    fill(0, 0, 0); // Black
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