// NodeSync NodeSyncAlphaBuild.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley
// Screen Size
int dispWidth = 850;
int dispHeight = 850;


int EngineTimer = 0;
// State Variables
public GameStateENUM currentState;
LogoScreen mLogoScreen;
MainMenuScreen mMainMenuScreen;
NameScreen mNameScreen;
InstructionScreen mInstructionScreen;
LevelSelectScreen mLevelSelectScreen;
CountDownToGame mCountDownToGame;
GameplayScreen mGameplayScreen;
PauseScreen mPauseScreen;
HighScoreScreen mHighScoreScreen;

// Game arena Variables
int topWallY = 10;
int bottomWallY = dispHeight-20;
int leftWallX = 10;
int rightWallX = dispWidth-20;

// Listener Variables

int explodeTimerNode1 = 3000;
int timeLetGoNode1 = MAX_INT;
int explodeTimerNode2 = 3000;
int timeLetGoNode2 = MAX_INT;


void setup()
{
  size(850, 850);
  //fullScreen();
  // smooth();
  frameRate(200);
  EngineTimer = millis();
  InitHelperObject();
}

void InitHelperObject() {
  currentState = GameStateENUM.LOGO;
  mLogoScreen = new LogoScreen(1000);
  mMainMenuScreen = new MainMenuScreen();
  mNameScreen = new NameScreen();
  mInstructionScreen = new InstructionScreen();
  mLevelSelectScreen = new LevelSelectScreen();
  mCountDownToGame = new CountDownToGame();
  mGameplayScreen = new GameplayScreen();
  mPauseScreen = new PauseScreen();
  mHighScoreScreen = new HighScoreScreen();
}

void draw()
{
  // Refresh Background
  fill(0, 0, 0); // Black
  rect(0, 0, dispWidth, dispHeight); // Black Border
  fill(255, 255, 255); // White
  rect(0, 0, dispWidth, dispHeight); // Playing Field Colour
  fill(0, 0, 0); // Black
  // Refresh Background
  
  switch(currentState) {
  case LOGO:
    currentState =  mLogoScreen.mdraw(600);
    break; 
  case MAINMENU:
    currentState = mMainMenuScreen.mdraw();
    break;
  case NAME:
    currentState = mNameScreen.mdraw();
    break;
  case INSTRUCTIONS:
    currentState = mInstructionScreen.mdraw();
    break;
  case LEVELSELECT:
    currentState = mLevelSelectScreen.mdraw();
    break;
  case COUNTDOWNTOGAME:
    currentState = mCountDownToGame.mdraw();
    //mGameplayScreen.cmin = 2;
    break;
  case GAMEPLAY:
    currentState = mGameplayScreen.mdraw();
    break;
  case GAMEPLAYPAUSED:
    mPauseScreen.mdraw();
    break;
  case HIGHSCORE:
    if (mGameplayScreen.addToHighScoreList) {
    }
    currentState =  mHighScoreScreen.mdraw(mGameplayScreen.addToHighScoreList, mGameplayScreen.playerScore, mNameScreen.playerInitals);
    break;

  default:
  }


  //if (mouseX > soloNode.position.x-soloNode.radiusInt && mouseX < soloNode.position.x+soloNode.radiusInt && mouseY > soloNode.position.y-soloNode.radiusInt && mouseY < soloNode.position.y+soloNode.radiusInt ) {
  //  if (mousePressed) {
  //    timeLetGoNode1 = MAX_INT;
  //    soloNode.position.x = mouseX;
  //    soloNode.position.y = mouseY;
  //    soloNode.velocity.x = 0;
  //    soloNode.velocity.y = 0;
  //    soloNode.heldByMouse = true;
  //  }
  //}
  //if ((millis()-timeLetGoNode1) > 5000) {
  //  soloNode.velocity.x = random(-5, 5);
  //  soloNode.velocity.y = random(-5, 5);
  //  timeLetGoNode1=MAX_INT;
  //}
  //if (mouseX > soloNode2.position.x-soloNode2.radiusInt && mouseX < soloNode2.position.x+soloNode2.radiusInt && mouseY > soloNode2.position.y-soloNode2.radiusInt && mouseY < soloNode2.position.y+soloNode2.radiusInt ) {
  //  if (mousePressed) {
  //    timeLetGoNode2 = MAX_INT;
  //    soloNode2.position.x = mouseX;
  //    soloNode2.position.y = mouseY;
  //    soloNode2.velocity.x = 0;
  //    soloNode2.velocity.y = 0;
  //    soloNode2.heldByMouse = true;
  //  }
  //}



  // Both under circle?
  //if (mouseX+150 > soloNode2.position.x+(soloNode2.radiusInt) && mouseX-150 < soloNode2.position.x-(soloNode2.radiusInt) && mouseY+150 > soloNode2.position.y+(soloNode2.radiusInt) && mouseY-150 < soloNode2.position.y-(soloNode2.radiusInt) && 
  //  (mouseX+150 > soloNode.position.x+(soloNode.radiusInt) && mouseX-150 < soloNode.position.x-(soloNode.radiusInt) && mouseY+150 > soloNode.position.y+(soloNode.radiusInt) && mouseY-150 < soloNode.position.y-(soloNode.radiusInt) )) {
  //  if (mousePressed) {
  //    soloNode = new Node(mouseX, mouseY, Node.sizeNodeM, 125, 0, 0, "0.7v", "A");
  //    soloNode.velocity.x = random(-5, 5);
  //    soloNode.velocity.y = random(-5, 5);
  //    soloNode2 = new Node(mouseX-Node.sizeNodeXL, mouseY-Node.sizeNodeXL, Node.sizeNodeM, 125, 0, 0, "0.7v", "A");
  //    soloNode2.velocity.x = random(-5, 5);
  //    soloNode2.velocity.y = random(-5, 5);
  //  }
  //}


  //if ((millis()-timeLetGoNode2) > 5000) {
  //  soloNode2.velocity.x = random(-5, 5);
  //  soloNode2.velocity.y = random(-5, 5);
  //  timeLetGoNode2=MAX_INT;
  //}
}

public void mouseReleased() {
  //if (currentState == GameStateENUM.GAMEPLAY) {

  //if (soloNode.heldByMouse) {
  //  timeLetGoNode1 = millis();
  //  soloNode.heldByMouse = false;
  //}

  //if (soloNode2.heldByMouse) {
  //  timeLetGoNode2 = millis();
  //  soloNode2.heldByMouse = false;
  //}
  //}
}


public void keyPressed() {

  if (currentState == GameStateENUM.LEVELSELECT) {
    if (keyCode == ENTER || keyCode == RIGHT) {
      currentState = GameStateENUM.COUNTDOWNTOGAME;
    } else if (keyCode == LEFT) {
      currentState = GameStateENUM.INSTRUCTIONS;
    }
  } else if (currentState == GameStateENUM.INSTRUCTIONS) {
    if (keyCode == ENTER|| keyCode == RIGHT) {
      currentState = GameStateENUM.LEVELSELECT;
    } else if (keyCode == LEFT) {
      currentState = GameStateENUM.NAME;
    }
  } else if (currentState == GameStateENUM.MAINMENU) {
    if (keyCode == ENTER|| keyCode == RIGHT) {
      currentState = GameStateENUM.NAME;
    }
  } else  if (currentState == GameStateENUM.NAME) {
    if (keyCode == BACKSPACE) {
      if (mNameScreen.playerInitals.length() > 0) {
        mNameScreen.playerInitals = mNameScreen.playerInitals.substring(0, mNameScreen.playerInitals.length()-1);
      }
    } else if (keyCode == DELETE) {
      mNameScreen.playerInitals = "";
    } else   if ((keyCode == ENTER || keyCode == RIGHT)&& mNameScreen.playerInitals.length()==3) {
      currentState = GameStateENUM.INSTRUCTIONS;
    } else if (keyCode == LEFT) {
      currentState = GameStateENUM.MAINMENU;
    } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && keyCode != ENTER && mNameScreen.playerInitals.length()<3) {
      mNameScreen.playerInitals = mNameScreen.playerInitals + key;
    }
  } else if (currentState == GameStateENUM.GAMEPLAY) {
    if (key == ' ' ) {
      // must tell gameplay to stop timer and stuff
      currentState = GameStateENUM.GAMEPLAYPAUSED;
    }
  } else if (currentState == GameStateENUM.GAMEPLAYPAUSED) {
    if (key == ' ' ) {
      // must tell gameplay to stop timer and stuff
      currentState = GameStateENUM.GAMEPLAY;
    }
  }
}