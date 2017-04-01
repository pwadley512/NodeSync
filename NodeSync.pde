// NodeSync NodeSyncAlphaBuild.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley
// Screen Size
int dispWidth = 850;
int dispHeight = 850;
// MOVE ALL LISTENERS TO THIS FILE
// Game arena
int topWallY = 10;
int bottomWallY = dispHeight-20;
int leftWallX = 10;
int rightWallX = dispWidth-20;

int EngineTimer = 0;
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
Node soloNode; 
void setup()
{
  size(850, 850);
  smooth();
  frameRate(60);
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
  soloNode = new Node(200, 200, Node.sizeNodeS, 125, 0, 0, "0.7v", "A");
}

void draw()
{


  switch(currentState) {

  case LOGO:
    currentState =  mLogoScreen.mdraw(EngineTimer);
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
    if (mGameplayScreen.addToHighScore) {
    }
    currentState =  mHighScoreScreen.mdraw(mGameplayScreen.addToHighScore, mGameplayScreen.playerScore, mNameScreen.playerInitals);
    break;

  default:
  }
  soloNode.update();
  soloNode.display();
  soloNode.checkBoundaryCollision();
}

void keyPressed() {

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