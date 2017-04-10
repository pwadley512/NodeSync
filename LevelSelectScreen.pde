// NodeSync LevelSelectScreen.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley



public class LevelSelectScreen {

  public LevelSelectScreen() {
  }

  GameStateENUM mdraw() {
    fill(0, 0, 0); 
    textSize(60);
    text("Select level below...", 100, 100);
    //text("X: " + mouseX + " Y: " + mouseY, mouseX, mouseY);

    textSize(60);
    fill(255, 204, 204);  
    if (mouseX>108 && mouseX <327 && mouseY>150 && mouseY <203) {
      fill(255, 0, 0);
      text("Level 1", 115 + random(-1, 1), 200 + random(-1, 1));
      fill(255, 204, 204);  
      if (mousePressed) {
        return GameStateENUM.COUNTDOWNTOGAME;
      }
    } else {
      text("Level 1", 115 + random(-1, 1), 200 + random(-1, 1));
    }

    if (mouseX>202 && mouseX <431 && mouseY>255 && mouseY <305) {
      fill(255, 0, 0);
      text("Level 2", 215 + random(-1, 1), 300 + random(-1, 1));
      fill(255, 204, 204);  
      if (mousePressed) {
        return GameStateENUM.COUNTDOWNTOGAME;
      }
    } else {
      text("Level 2", 215 + random(-1, 1), 300 + random(-1, 1));
    }

    if (mouseX>301 && mouseX <525 && mouseY>354 && mouseY <403) {
      fill(255, 0, 0);
      text("Level 3", 315 + random(-1, 1), 400 + random(-1, 1));
      fill(255, 204, 204);  
      if (mousePressed) {
        return GameStateENUM.COUNTDOWNTOGAME;
      }
    } else {
      text("Level 3", 315 + random(-1, 1), 400 + random(-1, 1));
    }


    if (mouseX>404 && mouseX <621 && mouseY>453 && mouseY <505) {
      fill(255, 0, 0);
      text("Level 4", 415 + random(-1, 1), 500 + random(-1, 1));
      fill(255, 204, 204);  
      if (mousePressed) {
        return GameStateENUM.COUNTDOWNTOGAME;
      }
    } else {
      text("Level 4", 415 + random(-1, 1), 500 + random(-1, 1));
    }


    if (mouseX>114 && mouseX <301 && mouseY>741-100 && mouseY <793-100) {
      fill(255, 0, 0);
      text("< Back", (gameArenaWidth/2) - 270 + random(-1, 1)-30, (gameArenaHeight/2) + 363-100 + random(-1, 1));
      fill(0, 0, 0); 
      if (mousePressed) {
        return GameStateENUM.INSTRUCTIONS;
      }
    } else {
      text("< Back", (gameArenaWidth/2) - 270 + random(-1, 1)-30, (gameArenaHeight/2) + 363-100 + random(-1, 1));
    }



    return GameStateENUM.LEVELSELECT;
  }
}