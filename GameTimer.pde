// NodeSync GameTimer.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley


public class GameTimer {
  int c; 
  public int cmin;
  public  int csec;
  int climit = -1; //1 min countdown
  public GameTimer() {
  
  }
  
GameStateENUM tickTimer() {
if (climit== -1){
climit = 1;
}
  textSize(60);
  c = climit*60*1000 - millis();
  cmin = (c/(60*1000));
  csec = (c/(1000));

  int mins = csec / 60;
  csec = csec - mins * 60;
  if (mins == 0 && csec <=30) {
    fill(255, 0, 0);
  } else {
    fill(0, 0, 0); // Black
  }

  if (csec<10) {
    text(cmin+":0"+(csec), 500, 75);
  } else {
    text(cmin+":"+(csec), 500, 75);
  }

  if (cmin == 0 && csec == 0) {
    return GameStateENUM.HIGHSCORE;
  }
  return GameStateENUM.GAMEPLAY;
}
}