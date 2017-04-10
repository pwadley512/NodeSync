// NodeSync GameplayScreen.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley


public class GameplayScreen {
  int secondsTime = 59;
  int minutesTime = 2;
  int mouseTimeLeft = 200;

  public Boolean addToHighScoreList = false;
  public int minScoreHighScoreList = 0;
  public  int playerScore = 10000;

  public  int minClusterSize = 2;

  Node[] nodeSetLevelOne = {
    new Node(200, 100, sizeNode_1, 125, 0, 0, "0.7v", "A"), 
    new Node(200, 200, sizeNode_1, 125, 0, 0, "0.7v", "B"), 
    new Node(200, 300, sizeNode_1, 125, 0, 0, "0.7v", "C"), 
    new Node(200, 400, sizeNode_1, 125, 0, 0, "0.7v", "D"), 
    new Node(200, 500, sizeNode_1, 125, 0, 0, "0.7v", "E"), 
    new Node(200, 600, sizeNode_2, 125, 0, 0, "0.7v", "F"), 

  };

  GameTimer mGameTimer;
  public GameplayScreen() {
    mGameTimer = new GameTimer();
  }

  // Main Gameplay Logic Here
  GameStateENUM mdraw() {

    if ( mGameTimer.tickTimer() == GameStateENUM.HIGHSCORE) {
      addToHighScoreList = true;
      return GameStateENUM.HIGHSCORE;
    }

    textSize(60);
    fill(0, 0, 0);
    text( playerScore + " pts", 120, 75); 

    fill (0, 0, 0);
    strokeWeight(6);
    fill (0, 0, 0);
    strokeWeight(6);
    for (Node b : nodeSetLevelOne) {
      b.update();
      b.display();
      b.checkBoundaryCollision();
      for (Node bb : nodeSetLevelOne) {
        if (b==bb) continue;
        b.checkCollision(bb);
      }
    }
    noFill();
    ellipse(mouseX, mouseY, 300, 300);
    return GameStateENUM.GAMEPLAY;
  }


  void RenderPriorityQueue() {
    textSize(36);
    fill(0, 0, 0);
    text( "Priority Queue", 280, 480); 
    textSize(20);
    text( "Pair(u,v)", 300, 530); 
    text( "D(u,v)", 420, 530); 
    line(400, 500, 400, 800);
    line(300, 550, 500, 550);
  }
}