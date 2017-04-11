// NodeSync NameScreen.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley


public class NameScreen {


  public String playerInitals = "ACE";
  public NameScreen() {
  }

  GameStateENUM mdraw() {
    fill(255);
    textSize(50);

    if (playerInitals.length()==3) {
      int xNext = (int)(width*.83);
      int yNext = (int)(height*.85);
      if (overRect(xNext, yNext, 200, 70) && ((millis()-buttonBuffer) > buttonBufferDelay)) {
        fill(0, 255, 0);
        text("Next >", width*.85 + random(-1, 1)-30, height*.9 + random(-1, 1));
        fill(255); 
        if (mousePressed) {
          buttonBuffer = millis();
          return GameStateENUM.INSTRUCTIONS;
        }
      } else {
        text("Next >", width*.85 + random(-1, 1)-30, height*.9  + random(-1, 1));
      }
    }
    int xBack = (int)(width*.09);
    int yBack = (int)(height*.85);
    if (overRect(xBack, yBack, 200, 70)&&((millis()-buttonBuffer) > buttonBufferDelay)) {
      fill(255, 0, 0);
      text("< Back", width*.1+ random(-1, 1)-30, height*.9+ random(-1, 1));
      fill(255); 
      if (mousePressed) {
        return GameStateENUM.MAINMENU;
      }
    } else {
      text("< Back", width*.1+ random(-1, 1)-30, height*.9+ random(-1, 1));
    }

    fill(255);
    textSize(150);
    fill(255);
    text("Enter your initials... ", height*.2, 200);
    fill(255);
    textSize(300);
    if (playerInitals.length() == 3) {
      text(playerInitals.toUpperCase(), width/3.5, height*.6);
    } else {
      text(playerInitals.toUpperCase(), width/3.5, height*.6);
    }
    textSize(50);
    return GameStateENUM.NAME;
  }
}