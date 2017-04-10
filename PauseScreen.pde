// NodeSync PauseScreen.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley


public class PauseScreen {

  public PauseScreen() {
  }

  GameStateENUM mdraw() {
    fill(0, 0, 0);
    textSize(100);
    text( "PAUSE", 270, 300);
    return GameStateENUM.GAMEPLAYPAUSED;
  }
}