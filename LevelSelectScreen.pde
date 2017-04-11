// NodeSync LevelSelectScreen.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley



public class LevelSelectScreen {

  public LevelSelectScreen() {
  }

  GameStateENUM mdraw() {
    fill(255); 
    textSize(150);
    text("Select level below...", width*.05, height*.2);
    //text("X: " + mouseX + " Y: " + mouseY, mouseX, mouseY);

    textSize(50);
    fill(255);  
    int x1 = (int)(width*.2);
    int y1 = (int)(height*.35);
    if (overRect(x1, y1, 470, 70)) {
      fill(255, 0, 0);
      text("Level 1 (5 Nodes)", width*.2 + random(-1, 1), height*.4 + random(-1, 1));
      fill(255, 204, 204);  
      if (mousePressed) {
        levelState = levelENUM.LEVEL1;
        return GameStateENUM.COUNTDOWNTOGAME;
      }
    } else {
      fill(255);
      text("Level 1 (5 Nodes)", width*.2 + random(-1, 1), height*.4 + random(-1, 1));
    }

    int x2 = (int)(width*.3);
    int y2 = (int)(height*.45);
    if (overRect(x2, y2, 470, 70)) {
      fill(255, 0, 0);
      text("Level 2 (7 Nodes)", width*.3 + random(-1, 1), height*.5 + random(-1, 1));
      if (mousePressed) {
        levelState = levelENUM.LEVEL2;
        return GameStateENUM.COUNTDOWNTOGAME;
      }
    } else {
      fill(255);
      text("Level 2 (7 Nodes)", width*.3 + random(-1, 1), height*.5 + random(-1, 1));
    }

    int x3 = (int)(width*.4);
    int y3 = (int)(height*.55);
    if (overRect(x3, y3, 470, 70)) {
      fill(255, 0, 0);
      text("Level 3 (9 Nodes)", width*.4 + random(-1, 1), height*.6 + random(-1, 1));
      if (mousePressed) {
        levelState = levelENUM.LEVEL3;
        return GameStateENUM.COUNTDOWNTOGAME;
      }
    } else {
      fill(255);
      text("Level 3 (9 Nodes)", width*.4 + random(-1, 1), height*.6 + random(-1, 1));
    }

    int x4 = (int)(width*.5);
    int y4 = (int)(height*.65);
    if (overRect(x4, y4, 470, 70)) {
      fill(255, 0, 0);
      text("Level 4 (11 Nodes)", width*.5 + random(-1, 1), height*.7 + random(-1, 1));
      if (mousePressed) {
        levelState = levelENUM.LEVEL4;
        return GameStateENUM.COUNTDOWNTOGAME;
      }
    } else {
      fill(255);
      text("Level 4 (11 Nodes)", width*.5 + random(-1, 1), height*.7 + random(-1, 1));
    }


    int xBack = (int)(width*.09);
    int yBack = (int)(height*.85);
    if (overRect(xBack, yBack, 200, 70) && ((millis()-buttonBuffer) > buttonBufferDelay)) {
      fill(255, 0, 0);
      text("< Back", width*.1+ random(-1, 1)-30, height*.9+ random(-1, 1));
      fill(255); 
      if (mousePressed) {
        buttonBuffer = millis();
        return GameStateENUM.NAME;
      }
    } else {
      fill(255);
      text("< Back", width*.1+ random(-1, 1)-30, height*.9+ random(-1, 1));
    }



    return GameStateENUM.LEVELSELECT;
  }
}