// NodeSync InstructionScreen.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley



public class InstructionScreen {

  public InstructionScreen() {
  }

  void redrawBackground() {
    //fill(0, 0, 0); // Black
    //rect(0, 0, dispWidth, dispHeight); // Black Border
    fill(255, 255, 255); // White
    rect(0, 0, dispWidth, dispHeight); // Playing Field Colour
  }

  GameStateENUM mdraw() {
    redrawBackground();
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

    text("X: " + mouseX + " Y: " + mouseY, mouseX, mouseY);
    textSize(50);

    if (mouseX>560 && mouseX <738 && mouseY>743 && mouseY <802+10) {
      fill(0, 255, 0);
      text("Next >", (dispWidth/2) + 180 + random(-1, 1)-30, (dispHeight/2) +370 - 10 + random(-1, 1));
      fill(0, 0, 0); 
      if (mousePressed) {
        return GameStateENUM.LEVELSELECT;
      }
    } else {
      text("Next >", (dispWidth/2) + 180 + random(-1, 1)-30, (dispHeight/2) +370 - 10 + random(-1, 1));
    }

    if (mouseX>114 && mouseX <301 && mouseY>741 && mouseY <793) {
      fill(255, 0, 0);
      text("< Back", (dispWidth/2) - 270 + random(-1, 1)-30, (dispHeight/2) + 363 + random(-1, 1));
      fill(0, 0, 0); 
      if (mousePressed) {
        return GameStateENUM.NAME;
      }
    } else {
      text("< Back", (dispWidth/2) - 270 + random(-1, 1)-30, (dispHeight/2) + 363 + random(-1, 1));
    }


    //    noFill();

    //    strokeWeight(4);
    //    rect(200+50, 600, 130, 130); // Black Border
    //    strokeWeight(1);
    //    fill(0, 0, 255); // Black
    //    ellipse(241+50, 641, 40, 40);
    //    fill(255, 255, 255);
    //    textSize(15);
    //    text( "0.7v", 225+50, 645);
    //    fill(0, 0, 255); // Black
    //    ellipse(300+50, 700, 40, 40);
    //    fill(255, 255, 255);
    //    textSize(15);
    //    text( "0.7v", 284+50, 703);
    //    textSize(20);
    //    fill(0, 0, 0); // Black
    //    text( "+1000pt", 250+50, 590);

    //    // Wrong colors

    //    noFill();

    //    strokeWeight(4);
    //    rect(50+50, 500, 130, 130); // Black Border
    //    strokeWeight(1);
    //    fill(255, 0, 0); // Black
    //    ellipse(91+50, 541, 40, 40);
    //    fill(255, 255, 255);
    //    textSize(15);
    //    text( "0.7v", 75, 545);
    //    fill(0, 0, 255); // Black
    //    ellipse(150+50, 600, 40, 40);
    //    fill(255, 255, 255);
    //    textSize(15);
    //    text( "0.7v", 134+50, 603);
    //    textSize(20);
    //    fill(255, 0, 0); // Black
    //    text( "-1000pt", 100+50, 490);

    //    noFill();

    //    strokeWeight(4);
    //    rect(50+50, 500, 130, 130); // Black Border
    //    strokeWeight(1);
    //    fill(255, 0, 0); // Black
    //    ellipse(91+50, 541, 40, 40);
    //    fill(255, 255, 255);
    //    textSize(15);
    //    text( "0.7v", 75+50, 545);
    //    fill(0, 0, 255); // Black
    //    ellipse(150+50, 600, 40, 40);
    //    fill(255, 255, 255);
    //    textSize(15);
    //    text( "0.7v", 134+50, 603);
    //    textSize(20);
    //    fill(255, 0, 0); // Black
    //    text( "-1000pt", 100+50, 490);

    //    noFill();

    //    strokeWeight(4);
    //    rect(200+150+50, 500, 130, 130); // Black Border
    //    strokeWeight(1);
    //    fill(0, 0, 255); // Black
    //    ellipse(241+150+50, 541, 40, 40);
    //    fill(255, 255, 255);
    //    textSize(15);
    //    text( "0.5v", 225+150+50, 545);
    //    fill(0, 0, 255); // Black
    //    ellipse(300+150+50, 600, 40, 40);
    //    fill(255, 255, 255);
    //    textSize(15);
    //    text( "0.7v", 284+150+50, 603);
    //    textSize(20);
    //    fill(255, 0, 0); // Black
    //    text( "-1000pt", 250+150+50, 490);

    return GameStateENUM.INSTRUCTIONS;
  }
}