// NodeSync CountDownToGame.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley



public class CountDownToGame {
  int timerStartTime;
  public CountDownToGame() {
    timerStartTime = -1;
  }

  GameStateENUM mdraw() {
    if (timerStartTime == -1) {
      timerStartTime = millis();
    }
    fill(0, 0, 0); 
    textSize(150);
    fill(255);
    if ((millis() - timerStartTime) < 250) {
      text("3 ,", width*0.2, height*.4);
    } else if ((millis() - timerStartTime) >= 250 && (millis() - timerStartTime) < 500) {
      text("3 , 2 ,", width*0.2, height*.4);
    } else if ((millis() - timerStartTime) >= 500 && (millis() - timerStartTime) < 750) {
      text("3 , 2 , 1 ", width*0.2, height*.4);
    } else if ((millis() - timerStartTime) >= 750 && (millis() - timerStartTime) < 1000) {
      fill(255, 0, 0);
      text("3 , 2 , 1 !", width*0.2, height*.4);
    } else if ((millis() - timerStartTime) >= 1000 && (millis() - timerStartTime) < 1500) {   
      fill(255, 0, 0);
      text("3 , 2 , 1 ! !", width*0.2, height*.4);
    } else {
      return GameStateENUM.GAMEPLAY;
    }

    return GameStateENUM.COUNTDOWNTOGAME;
  }
}