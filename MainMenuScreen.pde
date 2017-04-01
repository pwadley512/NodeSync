// NodeSync MainMenuScreen.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley



public class MainMenuScreen {

  public MainMenuScreen() {
    
  }

  void redrawBackground() {
    //noStroke();
    // fill(255, 255, 255); // Black
    // rect(0, 0, dispWidth, dispHeight); // Black Border
    fill(255, 255, 255); // White
    rect(0, 0, dispWidth, dispHeight); // Playing Field Colour
  }

  GameStateENUM mdraw() {
    redrawBackground();

    fill(0, 0, 0); // Black

    textSize(100);
    text("NodeSync", 180, 140);
    textSize(35);
    text("Eric Born & Peter James", 250, 700);
    textSize(20);
    text("X: " + mouseX + " Y: " + mouseY, mouseX, mouseY);
    text("ENCM 507 - Winter 2017", 300, 740);
    textSize(50);

    if (mouseX>348 && mouseX <471 && mouseY>378-70 && mouseY <414+10-70) {
      fill(0, 255, 0);
      text("Start", (dispWidth/2) - 40 + random(-1, 1)-30, (dispHeight/2)-70 - 10 + random(-1, 1));
      fill(0, 0, 0); 
      if (mousePressed) {
        return GameStateENUM.NAME;
      }
    } else {
      text("Start", (dispWidth/2) - 40 + random(-1, 1)-30, (dispHeight/2) - 10 -70 + random(-1, 1));
    }

    if (mouseX>348 && mouseX <471 && mouseY>378+50 && mouseY <414+80) {
      fill(255, 0, 0);
      text("Quit", (dispWidth/2) - 40 + random(-1, 1)-30, (dispHeight/2) + 50 + random(-1, 1));
      fill(0, 0, 0); 
      if (mousePressed) {
        exit();
      }
    } else {
      text("Quit", (dispWidth/2) - 40 + random(-1, 1)-30, (dispHeight/2) + 50 + random(-1, 1));
    }
    return GameStateENUM.MAINMENU;
  }
}