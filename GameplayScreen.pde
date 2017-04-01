// NodeSync GameplayScreen.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley


public class GameplayScreen {
  int secondsTime = 59;
  int minutesTime = 2;
  int mouseTimeLeft = 200;
  ArrayList<ArrayList<PVector>> mouseTrails = new ArrayList<ArrayList<PVector>>();
  ArrayList<ArrayList<Node>> mouseTrailsB = new ArrayList<ArrayList<Node>>();
  
  public Boolean addToHighScore = false;
  public  int playerScore = 10000;
  Node[] NodeSet =  { 
    new Node(200, 200, Node.sizeNodeS, 125, 0, 0, "0.7v", "A"),
  new Node(300, 200, Node.sizeNodeM, 125, 0, 0, "0.7v", "B"),

  new Node(450, 200, Node.sizeNodeL, 0, 0, 125, "0.7v", "C"),
  new Node(650, 200, Node.sizeNodeXL, 0, 0, 125, "0.7v", "D"),

  new Node(200, 350, Node.sizeNodeS, 125, 0, 0, "0.9v", "E"),
  new Node(300, 350, Node.sizeNodeS, 125, 0, 0, "0.9v", "F"),

  new Node(450, 350, Node.sizeNodeS, 0, 0, 125, "0.9v", "G"),
  new Node(650, 350, Node.sizeNodeS, 0, 0, 125, "0.9v", "H"),
};

GameTimer mGameTimer;
public GameplayScreen() {
  mGameTimer = new GameTimer();
}

void redrawBackground() {
  //fill(0, 0, 0); // Black
  //rect(0, 0, dispWidth, dispHeight); // Black Border
  fill(255, 255, 255); // White
     rect(0, 0, dispWidth, dispHeight); // Playing Field Colour
}

GameStateENUM mdraw() {
  redrawBackground();
  if ( mGameTimer.tickTimer() == GameStateENUM.HIGHSCORE) {
    addToHighScore = true;
    return GameStateENUM.HIGHSCORE;
  }

  textSize(60);
  fill(0, 0, 0);
  text( playerScore + " pts", 120, 75); 


  textSize(36);
  fill(0, 0, 0);
  text( "Priority Queue", 280, 480); 
  textSize(20);
  text( "Pair(u,v)", 300, 530); 
  text( "D(u,v)", 420, 530); 
  line(400, 500, 400, 800);
  line(300, 550, 500, 550);

  //textSize(20);
  //text(  "Mouse Drag Left:", 300, 35); 


  fill (0, 0, 0);
  strokeWeight(6);
      fill (0, 0, 0);
      strokeWeight(6);
      for (Node b : NodeSet) {
        b.update();
        b.display();
        b.checkBoundaryCollision();
        for (Node bb : NodeSet) {
          if (b==bb) continue;
          b.checkCollision(bb);
        }
      }



  stroke(5);
  fill(0, 0, 0);
  for (int j=0; j<mouseTrails.size(); j++) {
    for (int i=0; i<(mouseTrails.get(j).size()-1); i++) {
      line(mouseTrails.get(j).get(i).x, mouseTrails.get(j).get(i).y, mouseTrails.get(j).get(i+1).x, mouseTrails.get(j).get(i+1).y);
    }
  }


  return GameStateENUM.GAMEPLAY;
}



void mousePressed() {

  mouseTrails.add(new ArrayList());
}

void mouseDragged() {

  mouseTimeLeft -= 0.05;
  mouseTrails.get(mouseTrails.size()-1).add(new PVector(mouseX, mouseY, 1) );
}
void mouseReleased() {


  mouseTrails.add(new ArrayList());
}
}











//   strokeWeight(20);
//if (mouseTimeLeft > 3) {
//  stroke(0, 0, 0);
//  line (300, 60, 300+20*mouseTimeLeft, 60);
//} else if (mouseTimeLeft > 1.5) {
//  stroke(255, 165, 0);
//  line (300, 60, 300+20*mouseTimeLeft, 60);
//} else {
//  stroke(255, 0, 0);
//  line (300, 60, 300+20*mouseTimeLeft, 60);
//}



//stroke(0);
//fill(0, 0, 0);
//for (int j=0; j<mouseTrails.size(); j++) {
//  for (int i=0; i<(mouseTrails.get(j).size()-1); i++) {
//    line(mouseTrails.get(j).get(i).x, mouseTrails.get(j).get(i).y, mouseTrails.get(j).get(i+1).x, mouseTrails.get(j).get(i+1).y);
//  }
//  fill(0, 0, 0);
//}
//}
//




//float bx;
//float by;
//int boxSize = 75;
//boolean overBox = false;
//boolean locked = false;
//float xOffset = 0.0; 
//float yOffset = 0.0; 

//void setup() {
//  size(640, 360);
//  bx = width/2.0;
//  by = height/2.0;
//  rectMode(RADIUS);
//}

//void draw() { 
//  background(0);

//  // Test if the cursor is over the box 
//  if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
//    mouseY > by-boxSize && mouseY < by+boxSize) {
//    overBox = true;  
//    if (!locked) { 
//      stroke(255); 
//      fill(153);
//    }
//  } else {
//    stroke(153);
//    fill(153);
//    overBox = false;
//  }

//  // Draw the box
//  rect(bx, by, boxSize, boxSize);
//}








//for (Node bb : Nodes) {
//if (b==bb) continue;
//b.checkCollision(bb);
//}
// }

//for (Node b : Nodes) {
//  b.update();
//  b.display();
//  b.checkBoundaryCollision();
//  for (Node bb : Nodes) {
//    if (b==bb) continue;
//    b.checkCollision(bb);
//  }
//}

















//Node[] Nodes =  { 
//  new Node(random(50, 600), random(50, 600), sizeNodeS, 125, 0, 23), 
//  new Node(random(50, 600), random(50, 600), sizeNodeS, 125, 0, 23), 
//  new Node(random(50, 600), random(50, 605), sizeNodeS, 125, 0, 23), 
//  new Node(random(50, 600), random(50, 650), sizeNodeS, 0, 222, 45), 
//  new Node(random(50, 600), random(50, 670), sizeNodeM, 0, 222, 45), 
//  new Node(random(50, 600), random(50, 630), sizeNodeM, 30, 0, 222), 
//  new Node(random(50, 600), random(50, 610), sizeNodeS, 30, 0, 222), 
//  new Node(random(50, 600), random(50, 545), sizeNodeL, 54, 57, 88), 
//  new Node(random(50, 600), random(50, 601), sizeNodeS, 54, 57, 88), 
//  new Node(random(50, 565), random(50, 601), sizeNodeS, 54, 57, 88)
//};