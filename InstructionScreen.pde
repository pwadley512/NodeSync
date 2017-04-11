// NodeSync InstructionScreen.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley

// Add csv file for winners

public class InstructionScreen {

  public InstructionScreen() {
  }

  GameStateENUM mdraw() {
    fill(255); // Black
    textSize(200);
    text( "Instructions", width*.2, height*.2);
    textSize(35);
    text("The objective of NodeSync is to \n   cluster nodes together using \n        the Best Choice algorithm.", width*.2, height*.3);
    textSize(25);
    text("To gain points, simpily use a 'ClusterNet' to fuse  \n    the nodes together. A priority queue will keep  \n          track of the best node set to cluster.", width*.2, height*.5);
    textSize(20);

    PImage img;
    img = loadImage("instructions.PNG");
    image(img,  width*.6, height*.3);

    //text("X: " + mouseX + " Y: " + mouseY, mouseX, mouseY);
    textSize(50);

      int xNext = (int)(width*.83);
      int yNext = (int)(height*.85);
      if (overRect(xNext, yNext, 200, 70) && ((millis()-buttonBuffer) > buttonBufferDelay)) {
        fill(0, 255, 0);
        text("Next >", width*.85 + random(-1, 1)-30, height*.9 + random(-1, 1));
        fill(255); 
        if (mousePressed) {
          return GameStateENUM.LEVELSELECT;
        }
      } else {
        text("Next >", width*.85 + random(-1, 1)-30, height*.9  + random(-1, 1));
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
        text("< Back", width*.1+ random(-1, 1)-30, height*.9+ random(-1, 1));
      }
    
    return GameStateENUM.INSTRUCTIONS;
  }
}