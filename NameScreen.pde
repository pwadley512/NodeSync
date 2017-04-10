// NodeSync NameScreen.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley


public class NameScreen {
  public String playerInitals = "ACE";
  public NameScreen() {
  }

  GameStateENUM mdraw() {
    fill(0, 0, 0); // Black
    textSize(50);

    if (playerInitals.length()==3) {
      if (mouseX>560 && mouseX <738 && mouseY>743-100 && mouseY <802+10-100) {
        fill(0, 255, 0);
        text("Next >", (gameArenaWidth/2) + 180 + random(-1, 1)-30, (gameArenaHeight/2) -100+370 - 10 + random(-1, 1));
        fill(0, 0, 0); 
        if (mousePressed) {
          return GameStateENUM.INSTRUCTIONS;
        }
      } else {
        text("Next >", (gameArenaWidth/2) + 180 + random(-1, 1)-30, (gameArenaHeight/2) +370-100 - 10 + random(-1, 1));
      }
    }

    if (mouseX>114 && mouseX <301 && mouseY>741-100 && mouseY <793-100) {
      fill(255, 0, 0);
      text("< Back", (gameArenaWidth/2) - 270 + random(-1, 1)-30, (gameArenaHeight/2) + 363-100 + random(-1, 1));
      fill(0, 0, 0); 
      if (mousePressed) {
        return GameStateENUM.MAINMENU;
      }
    } else {
      text("< Back", (gameArenaWidth/2) - 270 + random(-1, 1)-30, (gameArenaHeight/2) + 363-100 + random(-1, 1));
    }

    fill(0, 0, 0); // Black
    textSize(50);
    text("Enter your initials:", 200, 200);
    if (playerInitals.length() == 3) {
      fill(0, 0, 255);
      text(playerInitals.toUpperCase(), 350, 280);
      fill(0, 0, 0);
    } else {
      fill(0, 0, 0);
      text(playerInitals.toUpperCase(), 350, 280);
    }
    return GameStateENUM.NAME;
  }
}