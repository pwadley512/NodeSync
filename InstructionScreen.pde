// NodeSync InstructionScreen.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley

// Add csv file for winners

public class InstructionScreen {

  public InstructionScreen() {
  }

  GameStateENUM mdraw() {
    fill(0, 0, 0); // Black
    textSize(100);
    text( "How-to-play", 80, 100);
    textSize(35);
    text("The objective of NodeSync is to \n   cluster nodes together using \n        the Best Choice algorithm.", 120, 160);
    textSize(25);
    text("To gain points, simpily use a 'ClusterNet' to fuse  \n    the nodes together. A priority queue will keep  \n          track of the best node set to cluster.", 120, 330);
    textSize(20);

    PImage img;
    img = loadImage("instructions.PNG");
    image(img, 160, 425);

    //text("X: " + mouseX + " Y: " + mouseY, mouseX, mouseY);
    textSize(50);

    if (mouseX>560 && mouseX <738 && mouseY>743 && mouseY <802+10) {
      fill(0, 255, 0);
      text("Next >", (gameArenaWidth/2) + 180 + random(-1, 1)-30, (gameArenaHeight/2) +370 - 10 + random(-1, 1));
      fill(0, 0, 0); 
      if (mousePressed) {
        return GameStateENUM.LEVELSELECT;
      }
    } else {
      text("Next >", (gameArenaWidth/2) + 180 + random(-1, 1)-30, (gameArenaHeight/2) +370 - 10 + random(-1, 1));
    }

    if (mouseX>114 && mouseX <301 && mouseY>741 && mouseY <793) {
      fill(255, 0, 0);
      text("< Back", (gameArenaWidth/2) - 270 + random(-1, 1)-30, (gameArenaHeight/2) + 363 + random(-1, 1));
      fill(0, 0, 0); 
      if (mousePressed) {
        return GameStateENUM.NAME;
      }
    } else {
      text("< Back", (gameArenaWidth/2) - 270 + random(-1, 1)-30, (gameArenaHeight/2) + 363 + random(-1, 1));
    }

    return GameStateENUM.INSTRUCTIONS;
  }
}