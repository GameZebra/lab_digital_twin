import processing.serial.*; 
Serial port;
float sliderValue = 0;
int button1Pressed = 0;
int button2Pressed = 0;
int button3Pressed = 0;
int button4Pressed = 0;
int button5Pressed = 0;

int screenSize = 800;

// lab variables
int labWidth = 700;
int labHeight = 400;

// slider os variables
int sliderOsX1 = (screenSize-labWidth)/2+100;
int sliderOsY1 = (screenSize-labHeight)/2+100;
int sliderOsX2 = (screenSize-labWidth)/2+labWidth-100;
int sliderOsY2 = (screenSize-labHeight)/2+100;

// slider variables
int sliderHeight = 20;
int sliderWidth = 40;
int sliderX = sliderOsX1+int(sliderValue);
int sliderY = sliderOsY1-sliderHeight/2;

int slideRange = sliderOsX2-sliderOsX1-sliderWidth;


//button variables
int buttonRadius = 30;
int button1X = (sliderOsX2 - sliderOsX1)/2+170;
int button1Y = sliderOsY1+150;
int button2X = button1X + 50;
int button2Y = button1Y - 50;
int button3X = button2X;
int button3Y = button2Y + 100;
int button4X = button1X + 100;
int button4Y = button1Y;
int button5X = button4X + 150;
int button5Y = button4Y - 30;

void setup()
{
  // serial setup
  port = new Serial(this,"COM7",9600);
  port.bufferUntil('\n');
  
  //size(screenSize, screenSize);  // not working for some reason
  size(800,800);

}

void draw()
{
  
  //draw lab
  fill(255,255,255);
  strokeWeight(3);
  rect((screenSize-labWidth)/2, (screenSize-labHeight)/2, labWidth, labHeight, 30);
  
  
  //draw slider os
  strokeWeight(2);
  line(sliderOsX1,sliderOsY1,sliderOsX2,sliderOsY2);

  //draw slider
  sliderX = sliderOsX1+int(sliderValue);
  rect(sliderX,sliderY,sliderWidth,sliderHeight);
  
  
  //draw buttons
  if(button1Pressed == 1) {
    fill(0,0,0);
  }
  else{
    fill(255,255,255);
  }
  circle(button1X, button1Y, buttonRadius);
  if(button2Pressed == 1) {
    fill(button2Pressed,0,0);
    //TODO: change border color insted of button
  }
  else{
    fill(255,255,255);
  }
  circle(button2X, button2Y, buttonRadius);
  if(button3Pressed == 1) {
    fill(button3Pressed,0,0);
    //TODO: set color to grey
  }
  else{
    fill(255,255,255);
  }
  circle(button3X, button3Y, buttonRadius);
  if(button4Pressed == 1) {
    fill(button4Pressed,0,0);
  }
  else{
    fill(255,255,255);
  }
  circle(button4X, button4Y, buttonRadius);
  if(button5Pressed == 1) {
    fill(button5Pressed,0,0);
    //TODOL change border coor insted of button
  }
  else{
    fill(255,255,255);
  }
  circle(button5X, button5Y, buttonRadius);
  
  //TODO: finish the fill 
  // probably will require IFs
 
  //TODO: add light sesnsor
  // that changes the background color/ shade of gray
  
  
  //debug here
  
  //println(sliderValue);
  println(button2Pressed);
}

void serialEvent(Serial serial) {
  String inString = serial.readStringUntil('\n');
  // removes whitespaces
  inString = trim(inString);
  // store all the information form the serial message
  float[] data = float(split(inString, ","));

  if (data.length >=6) {
    sliderValue = map(data[0], 0, 1023, 0, slideRange);
    button1Pressed = int(map(data[1], 0, 1, 0, 255));
    button2Pressed = int(map(data[2], 0, 1, 0, 255));
    button3Pressed = int(map(data[1], 0, 1, 0, 255));
    button4Pressed = int(map(data[2], 0, 1, 0, 255));
    button5Pressed = int(map(data[1], 0, 1, 0, 255));
  }
}
