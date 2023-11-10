import java.util.ArrayList;
import java.util.Collections;

//these are variables you should probably leave alone
int index = 0; //starts at zero-ith trial
float border = 0; //some padding from the sides of window, set later
int trialCount = 12; //this will be set higher for the bakeoff
int trialIndex = 0; //what trial are we on
int errorCount = 0;  //used to keep track of errors
float errorPenalty = 0.5f; //for every error, add this value to mean time
int startTime = 0; // time starts when the first click is captured
int finishTime = 0; //records the time of the final click
boolean userDone = false; //is the user done

final int screenPPI = 72; //what is the DPI of the screen you are using
//you can test this by drawing a 72x72 pixel rectangle in code, and then confirming with a ruler it is 1x1 inch. 

//These variables are for my example design. Your input code should modify/replace these!
float logoX = 500;
float logoY = 500;
float logoZ = 50f;
float logoRotation = 0;

private class Destination
{
  float x = 0;
  float y = 0;
  float rotation = 0;
  float z = 0;
}

ArrayList<Destination> destinations = new ArrayList<Destination>();

void setup() {
  size(1000, 800);  
  rectMode(CENTER);
  textFont(createFont("Arial", inchToPix(.3f))); //sets the font to Arial that is 0.3" tall
  textAlign(CENTER);
  rectMode(CENTER); //draw rectangles not from upper left, but from the center outwards
  
  //don't change this! 
  border = inchToPix(2f); //padding of 1.0 inches

  for (int i=0; i<trialCount; i++) //don't change this! 
  {
    Destination d = new Destination();
    d.x = random(border, width-border); //set a random x with some padding
    d.y = random(border, height-border); //set a random y with some padding
    d.rotation = random(0, 360); //random rotation between 0 and 360
    int j = (int)random(20);
    d.z = ((j%12)+1)*inchToPix(.25f); //increasing size from .25 up to 3.0" 
    destinations.add(d);
    println("created target with " + d.x + "," + d.y + "," + d.rotation + "," + d.z);
  }

  Collections.shuffle(destinations); // randomize the order of the button; don't change this.
}



void draw() {

  background(40); //background is dark grey
  fill(200);
  noStroke();

  //shouldn't really modify this printout code unless there is a really good reason to
  if (userDone)
  {
    text("User completed " + trialCount + " trials", width/2, inchToPix(.4f));
    text("User had " + errorCount + " error(s)", width/2, inchToPix(.4f)*2);
    text("User took " + (finishTime-startTime)/1000f/trialCount + " sec per destination", width/2, inchToPix(.4f)*3);
    text("User took " + ((finishTime-startTime)/1000f/trialCount+(errorCount*errorPenalty)) + " sec per destination inc. penalty", width/2, inchToPix(.4f)*4);
    return;
  }

  //===========DRAW DESTINATION SQUARES=================
  for (int i=trialIndex; i<trialCount; i++) // reduces over time
  {
    pushMatrix();
    Destination d = destinations.get(i); //get destination trial
    translate(d.x, d.y); //center the drawing coordinates to the center of the destination trial
    rotate(radians(d.rotation)); //rotate around the origin of the destination trial
    noFill();
    strokeWeight(3f);
    if (trialIndex==i)
      stroke(255, 0, 0, 192); //set color to semi translucent
    else
      stroke(128, 128, 128, 128); //set color to semi translucent
    rect(0, 0, d.z, d.z);
    popMatrix();
  }

  //===========DRAW LOGO SQUARE=================
  pushMatrix();
  translate(logoX, logoY); //translate draw center to the center oft he logo square
  rotate(radians(logoRotation)); //rotate using the logo square as the origin
  noStroke();
  fill(60, 60, 192, 192);
  rect(0, 0, logoZ, logoZ);
  popMatrix();

  //===========DRAW EXAMPLE CONTROLS=================
  fill(255);
  scaffoldControlLogic(); //you are going to want to replace this!
  text("Trial " + (trialIndex+1) + " of " +trialCount, width/2, inchToPix(.8f));
}

//my example design for control, which is terrible
void scaffoldControlLogic()
{
  //rotate counterclockwise
  stroke(0);
  fill(255);
  rect(800-inchToPix(.4f), height-inchToPix(.4f), 100, 50, 10);
  textSize(20);
  fill(40);
  text("CCW", 800-inchToPix(.4f), 780);
  if (mousePressed && overRect(795-inchToPix(.4f), height-inchToPix(.4f), 100, 50))//dist(800, height, mouseX, mouseY)<inchToPix(.8f))
    logoRotation--;

  //rotate clockwise
  stroke(0);
  fill(255);
  rect(900-inchToPix(.4f), height-inchToPix(.4f), 100, 50, 10);
  textSize(20);
  fill(40);
  text("CW", 900-inchToPix(.4f), 780);
  if (mousePressed && overRect(895-inchToPix(.4f), height-inchToPix(.4f), 100, 50))//dist(900, height, mouseX, mouseY)<inchToPix(.8f))
    logoRotation++;

  //decrease Z
  stroke(0);
  fill(255);
  rect(150-inchToPix(.4f), height-inchToPix(.4f), 100, 50, 10);
  textSize(20);
  fill(40);
  text("-", 150-inchToPix(.4f), 780);
  if (mousePressed && overRect(145-inchToPix(.4f), height-inchToPix(.4f), 100, 50))//dist(150, height, mouseX, mouseY)<inchToPix(.8f))
    logoZ = constrain(logoZ-inchToPix(.02f), .01, inchToPix(4f)); //leave min and max alone!

  //increase Z
  stroke(0);
  fill(255);
  rect(250-inchToPix(.4f), height-inchToPix(.4f), 100, 50, 10);
  textSize(20);
  fill(40);
  text("+", 250-inchToPix(.4f), 780);
  if (mousePressed && overRect(245-inchToPix(.4f), height-inchToPix(.4f), 100, 50))// dist(250, height, mouseX, mouseY)<inchToPix(.8f))
    logoZ = constrain(logoZ+inchToPix(.02f), .01, inchToPix(4f)); //leave min and max alone! 

  //move left
  stroke(0);
  fill(255);
  rect(428-inchToPix(.4f), 775-inchToPix(.4f), 100, 50, 10);
  textSize(20);
  fill(40);
  text("left", 428-inchToPix(.4f), 755);
  if (mousePressed && overRect(423-inchToPix(.4f), 775-inchToPix(.4f), 100, 50))// dist(400, 775, mouseX, mouseY)<inchToPix(.8f))
    logoX-=inchToPix(.02f);

  //move right
  stroke(0);
  fill(255);
  rect(629-inchToPix(.4f), 775-inchToPix(.4f), 100, 50, 10);
  textSize(20);
  fill(40);
  text("right", 629-inchToPix(.4f), 755);
  if (mousePressed && overRect(624-inchToPix(.4f), 775-inchToPix(.4f), 100, 50))//dist(635, 775, mouseX, mouseY)<inchToPix(.8f))
    logoX+=inchToPix(.02f);

  //move up
  stroke(0);
  fill(255);
  rect(width/2, 750-inchToPix(.4f), 100, 50, 10);
  textSize(20);
  fill(40);
  text("up", width/2, 730);
  if (mousePressed && overRect(495, 750-inchToPix(.4f), 100, 50))//dist(width/2, 750, mouseX, mouseY)<inchToPix(.8f))
    logoY-=inchToPix(.02f);

  //move down
  stroke(0);
  fill(255);
  rect(width/2, height-inchToPix(.4f), 100, 50, 10);
  textSize(20);
  fill(40);
  text("down", width/2, 780);
  if (mousePressed && overRect(495, height-inchToPix(.4f), 100, 50))//dist(480, height, mouseX, mouseY)<inchToPix(.8f))
    logoY+=inchToPix(.02f);
  
  //button labels
  textSize(20);
  fill(255);
  text("Scale", 175, 737);
  text("Translate", width/2, 682);
  text("Rotate", 825, 737);
}

void mousePressed()
{
  if (startTime == 0) //start time on the instant of the first user click
  {
    startTime = millis();
    println("time started!");
  }
}

void mouseReleased()
{
  //check to see if user clicked middle of screen within 3 inches, which this code uses as a submit button
  if (dist(width/2, height/2, mouseX, mouseY)<inchToPix(3f))
  {
    if (userDone==false && !checkForSuccess())
      errorCount++;

    trialIndex++; //and move on to next trial

    if (trialIndex==trialCount && userDone==false)
    {
      userDone = true;
      finishTime = millis();
    }
  }
}

//probably shouldn't modify this, but email me if you want to for some good reason.
public boolean checkForSuccess()
{
  Destination d = destinations.get(trialIndex);	
  boolean closeDist = dist(d.x, d.y, logoX, logoY)<inchToPix(.05f); //has to be within +-0.05"
  boolean closeRotation = calculateDifferenceBetweenAngles(d.rotation, logoRotation)<=5;
  boolean closeZ = abs(d.z - logoZ)<inchToPix(.1f); //has to be within +-0.1"	

  println("Close Enough Distance: " + closeDist + " (logo X/Y = " + d.x + "/" + d.y + ", destination X/Y = " + logoX + "/" + logoY +")");
  println("Close Enough Rotation: " + closeRotation + " (rot dist="+calculateDifferenceBetweenAngles(d.rotation, logoRotation)+")");
  println("Close Enough Z: " +  closeZ + " (logo Z = " + d.z + ", destination Z = " + logoZ +")");
  println("Close enough all: " + (closeDist && closeRotation && closeZ));

  return closeDist && closeRotation && closeZ;
}

//utility function I include to calc diference between two angles
double calculateDifferenceBetweenAngles(float a1, float a2)
{
  double diff=abs(a1-a2);
  diff%=90;
  if (diff>45)
    return 90-diff;
  else
    return diff;
}

//utility function to convert inches into pixels based on screen PPI
float inchToPix(float inch)
{
  return inch*screenPPI;
}

//mouse clicks the rectangle button
boolean overRect(float x, float y, int width, int height)
{
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
