// NodeSync NodeSyncAlphaBuild.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley
// Screen Size
public static long buttonBuffer;
public static long buttonBufferDelay = 500;
public static levelENUM levelState = levelENUM.LEVEL1;
public int gameArenaWidthStart = 20;
public int gameArenaHeightStart = 90;
public int gameArenaWidth = 1200;
public int gameArenaHeight = 800;
public int screenWidth = width;
public int screenHeight = height;

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
int topWallY = gameArenaWidthStart;
int bottomWallY = gameArenaHeight;
int leftWallX = gameArenaHeightStart;
int rightWallX = gameArenaWidth;

// Listener Variables

int explodeTimerNode1 = 3000;
int timeLetGoNode1 = MAX_INT;
int explodeTimerNode2 = 3000;
int timeLetGoNode2 = MAX_INT;


void setup()
{
  // size(1200, 920); // w,h1200,920
  fullScreen();
  // smooth();
  frameRate(200);
  EngineTimer = millis();
  InitHelperObject();
  screenWidth = width;
  screenHeight = height;
  buttonBuffer = millis();
}

void InitHelperObject() {
  currentState = GameStateENUM.LOGO;
  mLogoScreen = new LogoScreen(1);
  mMainMenuScreen = new MainMenuScreen();
  mNameScreen = new NameScreen();
  mInstructionScreen = new InstructionScreen();
  mLevelSelectScreen = new LevelSelectScreen();
  mCountDownToGame = new CountDownToGame();
  mPauseScreen = new PauseScreen();
  mHighScoreScreen = new HighScoreScreen();
  cursor(HAND);
}
// Refresh Background
void greyBackground() {
  background(30, 30, 30);
}

void whiteBackground() {
  background(255);
}
void draw()
{

  switch(currentState) {
  case LOGO:
    whiteBackground();
    currentState =  mLogoScreen.mdraw(EngineTimer);
    break; 
  case MAINMENU:
    greyBackground();
    currentState = mMainMenuScreen.mdraw();
    break;
  case NAME:
    greyBackground();
    currentState = mNameScreen.mdraw();
    break;
  case INSTRUCTIONS:
    greyBackground();
    currentState = mInstructionScreen.mdraw();
    break;
  case LEVELSELECT:
    greyBackground();
    currentState = mLevelSelectScreen.mdraw();
    break;
  case COUNTDOWNTOGAME:
    greyBackground();
    currentState = mCountDownToGame.mdraw();
    if (currentState == GameStateENUM.GAMEPLAY) {
      mGameplayScreen = new GameplayScreen();
    noCursor();
    // MUST KEEP MOUSE BOUND TO BOX - RADIUS GRABBER
  }
    break;
  case GAMEPLAY:
    greyBackground();
    fill(127, 127, 127);
    rect(gameArenaWidthStart, gameArenaHeightStart, gameArenaWidth, gameArenaHeight); // Arena Border
    currentState = mGameplayScreen.mdraw();

    break;
  case GAMEPLAYPAUSED:
    greyBackground();
    mPauseScreen.mdraw();
    break;
  case HIGHSCORE:
    cursor(HAND);
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
      // must tell gameplay to stop timer and movement
      currentState = GameStateENUM.GAMEPLAYPAUSED;
    }
  } else if (currentState == GameStateENUM.GAMEPLAYPAUSED) {
    if (key == ' ' ) {
      // must tell gameplay to start timer
      currentState = GameStateENUM.GAMEPLAY;
    }
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}