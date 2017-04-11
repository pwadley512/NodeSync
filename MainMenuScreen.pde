// NodeSync MainMenuScreen.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley



public class MainMenuScreen {

  public MainMenuScreen() {
  }

  GameStateENUM mdraw() {


    fill(255); 
    textSize(200);
    text("NodeSync", width/4, 200);
    textSize(35);
    text("Eric Born & Peter James", width/2.6, height/1.1 );
    textSize(20);

    // text("X: " + mouseX + " Y: " + mouseY, mouseX, mouseY);

    text("ENCM 507 - Winter 2017", width/2.3,  height/1.05);
    textSize(50);
    int xStart = (int)(width/2.3);
    int yStart = (int)(height/2.2);
    if (overRect(xStart,yStart, 120, 50) ) { // x y w h
      fill(0, 255, 0);
      text("Start", width/2.2 + random(-1, 1)-30, height/2 + random(-1, 1));
      fill(255); 
      if (mousePressed) {
        return GameStateENUM.NAME;
      }
    } else {
      text("Start", width/2.2 + random(-1, 1)-30, height/2  + random(-1, 1));
    }
    int xQuit = (int)(width/2.3);
    int yQuit = (int)(height/1.8);
    if (overRect(xQuit,yQuit, 120, 50)) {
      fill(255, 0, 0);
      text("Quit", width/2.2 + random(-1, 1)-30, height/1.7 + random(-1, 1));
      fill(255); 
      if (mousePressed) {
        exit();
      }
    } else {
      text("Quit", width/2.2 + random(-1, 1)-30, height/1.7 + random(-1, 1));
    }
    return GameStateENUM.MAINMENU;
  }
}