// NodeSync Node.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley

public class Node {
  PVector position;
  PVector velocity;
  float r, radius, m, mass;
  float Red, Green, Blue;
  String voltageLabel;
  int radiusInt;
  String nodeID;

  public Boolean heldByMouse = false;


  Node(float x, float y, float r_, float Red, float Green, float Blue, String voltageLabel, String nodeID) {
    this.position = new PVector(x, y);
    this.velocity = PVector.random2D();
    this.velocity.mult(1);
    this.radius = r_;
    this.r = radius;
    this.mass = radius*.1;
    this.m = mass;
    this.Red = Red;
    this.Green = Green;
    this.Blue = Blue;
    this.voltageLabel = voltageLabel;
    this.nodeID = nodeID;
  }

  void update() {
    position.add(velocity);
  }

  void checkBoundaryCollision() {
    if (position.x > (gameArenaWidth+gameArenaWidthStart-r)) { // right wall
      position.x = (gameArenaWidth+gameArenaWidthStart-r);
      velocity.x *= -1;
    } else if (position.x < (gameArenaWidthStart+r)) { // left wall
      position.x = gameArenaWidthStart+r;
      velocity.x *= -1;
    } else if (position.y > (gameArenaHeightStart+gameArenaHeight)-r) { // bottom wall
      position.y = (gameArenaHeightStart+gameArenaHeight)-r;
      velocity.y *= -1;
    } else if (position.y < (gameArenaHeightStart+r)) { // top wall
      position.y = (gameArenaHeightStart+r);
      velocity.y *= -1;
    }
  }

  void checkCollision(Node other) {

    // get distances between the Nodes components
    PVector bVect = PVector.sub(other.position, position);

    // calculate magnitude of the vector separating the Nodes
    float bVectMag = bVect.mag();

    if (bVectMag < r + other.r) {
      // get angle of bVect
      float theta  = bVect.heading();
      // precalculate trig values
      float sine = sin(theta);
      float cosine = cos(theta);

      /* bTemp will hold rotated Node positions. You 
       just need to worry about bTemp[1] position*/
      PVector[] bTemp = {
        new PVector(), new PVector()
      };

      /* this Node's position is relative to the other
       so you can use the vector between them (bVect) as the 
       reference point in the rotation expressions.
       bTemp[0].position.x and bTemp[0].position.y will initialize
       automatically to 0.0, which is what you want
       since b[1] will rotate around b[0] */
      bTemp[1].x  = cosine * bVect.x + sine * bVect.y;
      bTemp[1].y  = cosine * bVect.y - sine * bVect.x;

      // rotate Temporary velocities
      PVector[] vTemp = {
        new PVector(), new PVector()
      };

      vTemp[0].x  = cosine * velocity.x + sine * velocity.y;
      vTemp[0].y  = cosine * velocity.y - sine * velocity.x;
      vTemp[1].x  = cosine * other.velocity.x + sine * other.velocity.y;
      vTemp[1].y  = cosine * other.velocity.y - sine * other.velocity.x;

      /* Now that velocities are rotated, you can use 1D
       conservation of momentum equations to calculate 
       the final velocity along the x-axis. */
      PVector[] vFinal = {  
        new PVector(), new PVector()
      };

      // final rotated velocity for b[0]
      vFinal[0].x = ((m - other.m) * vTemp[0].x + 2 * other.m * vTemp[1].x) / (m + other.m);
      vFinal[0].y = vTemp[0].y;

      // final rotated velocity for b[0]
      vFinal[1].x = ((other.m - m) * vTemp[1].x + 2 * m * vTemp[0].x) / (m + other.m);
      vFinal[1].y = vTemp[1].y;

      // hack to avoid clumping
      bTemp[0].x += vFinal[0].x;
      bTemp[1].x += vFinal[1].x;

      /* Rotate Node positions and velocities back
       Reverse signs in trig expressions to rotate 
       in the opposite direction */
      // rotate Nodes
      PVector[] bFinal = { 
        new PVector(), new PVector()
      };

      bFinal[0].x = cosine * bTemp[0].x - sine * bTemp[0].y;
      bFinal[0].y = cosine * bTemp[0].y + sine * bTemp[0].x;
      bFinal[1].x = cosine * bTemp[1].x - sine * bTemp[1].y;
      bFinal[1].y = cosine * bTemp[1].y + sine * bTemp[1].x;

      // update Nodes to screen position
      other.position.x = position.x + bFinal[1].x;
      other.position.y = position.y + bFinal[1].y;

      position.add(bFinal[0]);

      // update velocities
      velocity.x = cosine * vFinal[0].x - sine * vFinal[0].y;
      velocity.y = cosine * vFinal[0].y + sine * vFinal[0].x;
      other.velocity.x = cosine * vFinal[1].x - sine * vFinal[1].y;
      other.velocity.y = cosine * vFinal[1].y + sine * vFinal[1].x;
    }
  }


  void display() {
    strokeWeight(4);
    stroke(0, 0, 0);
    //fill(127, 0, 0);
    //arc(position.x, position.y, r*2, r*2, -HALF_PI, HALF_PI);
    //fill(0, 127, 0); 
    //arc(position.x, position.y, r*2, r*2, -3*PI/2, -HALF_PI);


    // Top
    fill(255);
    arc(position.x, position.y, r*2, r*2, -PI, -PI*2/3);
    fill(0); 
    arc(position.x, position.y, r*2, r*2, -PI*2/3, -PI*1/3);
    fill(255);
    arc(position.x, position.y, r*2, r*2, -PI*1/3, 0);
    // Bottom
    fill(0);
    arc(position.x, position.y, r*2, r*2, PI*2/3, PI);
    fill(255); 
    arc(position.x, position.y, r*2, r*2, PI*1/3, PI*2/3 );
    fill(0);
    arc(position.x, position.y, r*2, r*2, 0, PI*1/3);


    fill(255); 
    //arc(position.x, position.y, r*2, r*2, (6/5)*PI, (8/5)*PI);
    fill(255);
    //arc(position.x, position.y, r*2, r*2, (8/5)*PI, 2*PI);




    // Show Node Label (A,B etc)
    //switch(this.radiusInt) {
    //  case (30):
    //  text("A = 1", this.position.x-20, this.position.y+20);
    //  break;
    //  case (50):
    //  text("A = 2", this.position.x-20, this.position.y+20);      
    //  break;     
    //  case (70):
    //  text("A = 3", this.position.x-20, this.position.y+20);      
    //  break; 
    //  case (90):
    //  text("A = 4", this.position.x-20, this.position.y+20);      
    //  break; 
    //default:
    //}
    //    fill(0, 0, 0);
    //// text( this.NodeID , this.position.x+(radiusInt), this.position.y+2*(radiusInt));



    stroke(0);
  }
}