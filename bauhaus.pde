// int tic = 1; // 1 second = 1 millisecond

int cx, cy;

float clockDiameter = 250;
float clockBorder = 10;

float secondsAngle = 2 * PI / 60 * second() - PI/2;
float minutesAngle = 2 * PI / 60 * minute() + 2 * PI / 3600 * second() - PI/2;
float hoursAngle = 2 * PI / (86400 / 2) * (second() + 60 * minute() + 3600 * hour())  - PI/2;

int numberOffset = 5;
int tickDistance = 100;
int tickHeight = 10;
int tickWidth = 10;

int secondsWidth = 110;
int secondsHeight = 5;

int minutesWidth = 100;
int minutesHeight = 10;

int hoursWidth = 70;
int hoursHeight = 10;


void setup() {

  size(600, 600);
  background(255, 255, 255);
  smooth(8);
  
  cx = width / 2;
  cy = height / 2;
}

void draw() {

  fill(0);
  noStroke();
  ellipse(cx, cy, clockDiameter + clockBorder, clockDiameter + clockBorder);
  fill(255);
  noStroke();
  ellipse(cx, cy, clockDiameter, clockDiameter);
  
  // text
  textSize(16);
  fill(0);
  text("swatch", cx - 25, cy - 50); 
  textSize(12);
  text("SWISS", cx - 15, cy - 37);
  
  // ticks
  fill(0);
  int number = 1;
  for (int i = 0; i < 360; i = i + 30) {
    /*
    pushMatrix();
    if (i % 90 == 0) {
      tickWidth = 20;
      tickDistance = 100;
    } else {
      tickWidth = 10;
      tickDistance = 100;
    }

    translate(cx + cos(radians(i)) * tickDistance, cy + sin(radians(i)) * tickDistance);
    rotate(radians(i));
    translate(- tickHeight / 2, - tickHeight / 2);
    rect(0, 0, tickWidth, tickHeight);
    popMatrix();
    */
    
    if (number > 10) {
      numberOffset = 15;
    } else {
      numberOffset = 5;
    }
    textSize(20);
    text(number, cx + cos(radians(i) - 2 * PI/6) * tickDistance - numberOffset, cy + sin(radians(i) - 2 * PI/6) * tickDistance + 8);
    number++;
  }

  // seconds
  fill(226, 200, 5);
  noStroke();
  pushMatrix();
  translate(cx, cy);
  rotate(secondsAngle);
  rect(secondsHeight / 2, - secondsHeight / 2, secondsWidth, secondsHeight);
  popMatrix();

  // minutes
  fill(210, 6, 2);
  noStroke();
  pushMatrix();
  translate(cx, cy);
  rotate(minutesAngle);
  rect(minutesHeight / 2, - minutesHeight / 2, minutesWidth, minutesHeight);
  popMatrix();

  // hours
  fill(3, 164, 238);
  noStroke();
  pushMatrix();
  translate(cx, cy);
  rotate(hoursAngle);
  rect(hoursHeight / 2, - hoursHeight / 2, hoursWidth, hoursHeight);
  popMatrix();

  // center
  fill(0);
  noStroke();
  ellipse(cx, cy, 15, 15); 

  // tic toc
  secondsAngle += 2 * PI / 60;
  minutesAngle += 2 * PI / 3600;
  hoursAngle += 2 * PI / 86400;

  // delay(tic);
  
  // saveFrame("./frameFiles/screen-#####.tiff");
  
}
