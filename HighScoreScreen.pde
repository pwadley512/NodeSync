// NodeSync HighScoreScreen.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley




public class HighScoreScreen {

  public HighScoreScreen() {
  }

  void redrawBackground() {
    //fill(0, 0, 0); // Black
    //rect(0, 0, dispWidth, dispHeight); // Black Border
    fill(255, 255, 255); // White
    rect(0, 0, dispWidth, dispHeight); // Playing Field Colour
  }

  GameStateENUM mdraw(Boolean addToHighScore, int playerScore, String playerInitals) {
    redrawBackground();
    fill(0, 0, 0);
    textSize(50);
    text("GAME OVER!\nHIGH SCORES", 270, 100);
    textSize(40);
    //text("\n\nACE    140,300 pt\nLEE      44,000 pt\nGTA    1,000,040 pt", 80, 250);
    if (addToHighScore){
         text("\n\n"+playerInitals + "    " + playerScore + " pt", 80, 250);
    }
  
    
    return GameStateENUM.HIGHSCORE;
  }
}