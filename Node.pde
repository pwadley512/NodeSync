// NodeSync Node.pde
// ENCM 507 - Winter 2017
// Alpha Test Code
// By: Eric Born & Peter Wadley

public class Node {
  float inner_rotation_radius = 10;
  float inner_Node_diameter = 8;
  float inner_Node_color = 255;
  float inner_Node_rotation_speed = 1;
  float inner_rotation_degrees;
  float inner_Node_x;
  float inner_Node_y ;
  float inner_Node_spin_dir;
  PVector position;
  PVector velocity;
  float r, m;
  float R, G, B;
  String voltage;
  int radiusInt;
  
  static final float sizeNodeS = 30;
  static final float sizeNodeM = 50;
  static final float sizeNodeL = 70;
  static final float sizeNodeXL = 90;

  String NodeID;
  Node(float x, float y, float r_, float R, float G, float B, String voltage, String NodeID) {
    position = new PVector(x, y);
    velocity = PVector.random2D();
    velocity.mult(5);
    r = r_;
    m = r*.1;
    this.R = R;
    this.G = G;
    this.B = B;
    this.voltage = voltage;
    this.radiusInt = (int) r;
    this.NodeID = NodeID;
  }

  void update() {
   
    position.add(velocity);
    
  }

  void checkBoundaryCollision() {
    if (position.x > width-r) {
      position.x = width-r;
      velocity.x *= -1;
    } else if (position.x < r) {
      position.x = r;
      velocity.x *= -1;
    } else if (position.y > height-r) {
      position.y = height-r;
      velocity.y *= -1;
    } else if (position.y < r) {
      position.y = r;
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
    noStroke();
    fill(R, G, B);
    ellipse(position.x, position.y, r*2, r*2);
    this.inner_Node_x = this.position.x+ this.inner_rotation_radius * cos(this.inner_rotation_degrees);
    this.inner_Node_y = this.position.y + this.inner_rotation_radius * sin(this.inner_rotation_degrees) + cos(this.inner_rotation_degrees);
    //this.inner_rotation_degrees -= 0.2;
    fill(255, 255, 255);
    //ellipse(this.inner_Node_x, this.inner_Node_y, this.inner_Node_diameter, this.inner_Node_diameter);
    // Print Voltage
    fill(255, 255, 255);
    textSize(15);
    text(voltage, this.position.x-15, this.position.y-6);

    switch(this.radiusInt) {
      case (30):
      text("A = 1", this.position.x-20, this.position.y+20);
      break;
      case (50):
      text("A = 2", this.position.x-20, this.position.y+20);      
      break;     
      case (70):
      text("A = 3", this.position.x-20, this.position.y+20);      
      break; 
      case (90):
      text("A = 4", this.position.x-20, this.position.y+20);      
      break; 
    default:
    }
        fill(0, 0, 0);
   // text( this.NodeID , this.position.x+(radiusInt), this.position.y+2*(radiusInt));



    stroke(0);
  }
}