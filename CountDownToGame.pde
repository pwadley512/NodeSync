// NodeSync CountDownToGame.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley



public class CountDownToGame {
  int timerStartTime;
  public CountDownToGame() {
    timerStartTime = -1;
  }

  void redrawBackground() {
    //fill(0, 0, 0); // Black
    //rect(0, 0, dispWidth, dispHeight); // Black Border
    fill(255, 255, 255); // White
    rect(0, 0, dispWidth, dispHeight); // Playing Field Colour
  }

  GameStateENUM mdraw() {
    redrawBackground();
    if (timerStartTime == -1) {
      timerStartTime = millis();
    }
    fill(0, 0, 0); 
    textSize(150);
    fill(255, 204, 204); 
    if ((millis() - timerStartTime) < 250) {
      text("3,", 35, 140);
    } else if ((millis() - timerStartTime) >= 250 && (millis() - timerStartTime) < 500) {
      text("3,2,", 35, 140);
    } else if ((millis() - timerStartTime) >= 500 && (millis() - timerStartTime) < 750) {
      text("3,2,1",35, 140);
    } else if ((millis() - timerStartTime) >= 750 && (millis() - timerStartTime) < 2000) {
      fill(255, 0, 0); 
      text("3,2,1-GO!", 35, 140);
   } else if ((millis() - timerStartTime) >= 2000 && (millis() - timerStartTime) < 4000) {
     return GameStateENUM.GAMEPLAY; 

   }
    
    return GameStateENUM.COUNTDOWNTOGAME;
  }
}