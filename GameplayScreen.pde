// NodeSync GameplayScreen.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley


public class GameplayScreen {
  public int secondsTime = 59;
  public int minutesTime = 2;
  public int mouseTimeLeft = 200;

  public Boolean addToHighScoreList = false;
  public int minScoreHighScoreList = 0;
  public  int playerScore = 10000;
  public  int minClusterSize = 2;

  GameTimer mGameTimer;

  Node[] nodeSetLevelOne = {
    new Node(200, 100, sizeNode_1, 125, 0, 0, "0.7v", "A"), 
    new Node(200, 200, sizeNode_2, 125, 0, 0, "0.7v", "B"), 
    new Node(200, 300, sizeNode_1, 125, 0, 0, "0.7v", "C"), 
    new Node(200, 400, sizeNode_1, 125, 0, 0, "0.7v", "D"), 
    new Node(200, 500, sizeNode_3, 125, 0, 0, "0.7v", "E"), 
    new Node(200, 600, sizeNode_1, 125, 0, 0, "0.7v", "F"), 

  };
  Node[] nodeSetLevelTwo = {
  };
  Node[] nodeSetLevelThree = {
  };
  Node[] nodeSetLevelFour = {
  };


  public GameplayScreen() {
    mGameTimer = new GameTimer();
  }

  // Main Gameplay Logic Here
  GameStateENUM mdraw() {
    RenderScoreText();
    RenderPriorityQueue();
    RenderNodes();
    RenderClusterTool();
    return CheckTimeLeft();
  }

  void RenderNodes() {
    for (Node b : nodeSetLevelOne) {
      b.update();
      b.display();
      b.checkBoundaryCollision();
      for (Node bb : nodeSetLevelOne) {
        if (b==bb) continue;
        b.checkCollision(bb);
      }
    }
  }

  int ClusterToolRadius = 150;
  void RenderClusterTool() {
    strokeWeight(1);
    noFill();

    // Top Corner Case
    if (((mouseX) > (gameArenaWidth+gameArenaWidthStart-ClusterToolRadius)) && ((mouseY) < (gameArenaHeightStart+ClusterToolRadius))) {
      ellipse((gameArenaWidth+gameArenaWidthStart-ClusterToolRadius), gameArenaHeightStart+ClusterToolRadius, 2*ClusterToolRadius, 2*ClusterToolRadius);
    } else if ((mouseX) > (gameArenaWidth+gameArenaWidthStart-ClusterToolRadius) && (mouseY)> (gameArenaHeightStart+gameArenaHeight-ClusterToolRadius)) {
      ellipse((gameArenaWidth+gameArenaWidthStart-ClusterToolRadius), gameArenaHeightStart+gameArenaHeight-ClusterToolRadius, 2*ClusterToolRadius, 2*ClusterToolRadius);
    } else if ((mouseX) < (gameArenaWidthStart+ClusterToolRadius) && (mouseY) < (gameArenaHeightStart+ClusterToolRadius)) {
      ellipse((gameArenaWidthStart+ClusterToolRadius), gameArenaHeightStart+ClusterToolRadius, 2*ClusterToolRadius, 2*ClusterToolRadius);
    } else if (((mouseX) < (gameArenaWidthStart+ClusterToolRadius)) && ((mouseY) > (gameArenaHeightStart+gameArenaHeight-ClusterToolRadius))) {
      ellipse((gameArenaWidthStart+ClusterToolRadius), gameArenaHeightStart+gameArenaHeight-ClusterToolRadius, 2*ClusterToolRadius, 2*ClusterToolRadius);
    } else if ((mouseX) > (gameArenaWidth+gameArenaWidthStart-ClusterToolRadius)) {
      ellipse((gameArenaWidth+gameArenaWidthStart-ClusterToolRadius), mouseY, 2*ClusterToolRadius, 2*ClusterToolRadius);
    } else if ((mouseX) < (gameArenaWidthStart+ClusterToolRadius)) {
      ellipse((gameArenaWidthStart+ClusterToolRadius), mouseY, 2*ClusterToolRadius, 2*ClusterToolRadius);
    } else if ((mouseY) < (gameArenaHeightStart+ClusterToolRadius)) {
      ellipse(mouseX, (gameArenaHeightStart+ClusterToolRadius), 2*ClusterToolRadius, 2*ClusterToolRadius);
      mouseY = gameArenaHeightStart+ClusterToolRadius;
    } else if ((mouseY) > (gameArenaHeightStart+gameArenaHeight-ClusterToolRadius)) {
      ellipse(mouseX, (gameArenaHeightStart+gameArenaHeight-ClusterToolRadius), 2*ClusterToolRadius, 2*ClusterToolRadius);
    } else {
      ellipse(mouseX, mouseY, 2*ClusterToolRadius, 2*ClusterToolRadius);
    }

    //
    //void checkBoundaryCollision() {
    //  if (position.x > (gameArenaWidth+gameArenaWidthStart-r)) { // right wall
    //    position.x = (gameArenaWidth+gameArenaWidthStart-r);
    //    velocity.x *= -1;
    //  } else if (position.x < (gameArenaWidthStart+r)) { // left wall
    //    position.x = gameArenaWidthStart+r;
    //    velocity.x *= -1;
    //  } else if (position.y > (gameArenaHeightStart+gameArenaHeight)-r) { // bottom wall
    //    position.y = (gameArenaHeightStart+gameArenaHeight)-r;
    //    velocity.y *= -1;
    //  } else if (position.y < (gameArenaHeightStart+r+70)) { // top wall
    //    position.y = (gameArenaHeightStart+r+70);
    //    velocity.y *= -1;
    //  }
    //}
  }


  void RenderPriorityQueue() {
    textSize(36);
    fill(127, 127, 127);
    text( "Priority Queue", screenWidth-300, 80);   // x,y
    textSize(25);
    text( "u,v", screenWidth-250, 125); 
    text( "d", screenWidth-130, 125); 
    stroke(127, 127, 127);
    line(screenWidth-300, 150, screenWidth-20, 150);
    line(screenWidth-170, 100, screenWidth-170, 600);
  }
  void RenderScoreText() {
    textSize(40);  
    fill (127, 127, 127);
    text( playerScore + " pts", 120, 75); 
    fill (0, 0, 0);
    strokeWeight(6);
  }

  GameStateENUM CheckTimeLeft() {
    // Check time.. go to High Score Screen if out of time
    if ( mGameTimer.tickTimer() == GameStateENUM.HIGHSCORE) {
      addToHighScoreList = true; // if score > min score list
      return GameStateENUM.HIGHSCORE;
    } else {
      return GameStateENUM.GAMEPLAY;
    }
  }
}