int cx, cy;

int w = 700;
int h = 500;

int borderSize = 10;

int num_balls = 10;
Ball[] balls = new Ball[num_balls];

int num_squares = 10;
Square[] squares = new Square[num_squares];

class Square {
  int x, y;
  int h, w;
  int r, g, b;
  int top, bottom, left, right;

  Square(int x_, int y_, int w_, int h_, int r_, int g_, int b_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    r = r_;
    g = g_;
    b = b_;
    top = y;
    bottom = y + h;
    left = x;
    right = x + w;
  }

  void show() {
    fill(r, g, b);
    rect(x, y, w, h);
  }
}

class Ball {

  float r;
  float speed;
  PVector position;
  PVector velocity;
  Square square;

  Ball(Square square_) {
    r = 6;
    speed = 5;
    position = new PVector(cx, cy);
    velocity = PVector.random2D();
    velocity.mult(speed);
    square = square_;
  }

  void show() {
    noStroke();
    if (square.r == 0 & square.g == 0 & square.b == 0) {
      fill(255);
    } else {
      fill(0);
    }
    ellipse(position.x, position.y, r*2, r*2);
  }

  void move() {
    position.add(velocity);

    // right
    if (position.x > square.right - r) {
      position.x = square.right - r;
      velocity.x *= -1;
    }
    // left 
    if (position.x < square.left + r) {
      position.x = square.left + r;
      velocity.x *= -1;
    }
    // top
    if (position.y < square.top + r) {
      position.y = square.top + r;
      velocity.y *= -1;
    }
    // bottom
    if (position.y > square.bottom - r) {
      position.y = square.bottom - r;
      velocity.y *= -1;
    }
  }
}

void setup() {
  size(800, 600);
  background(255);

  cx = width / 2;
  cy = height / 2;

  squares[0] = new Square(cx - w / 2, cy - h / 2, 200, 100, 255, 255, 255);
  squares[1] = new Square(cx - w / 2, cy - h / 2 + 100, 200, h - 100, 226, 200, 5);
  squares[2] = new Square(cx - w / 2 + 200, cy - h / 2, 100, h - 300, 210, 6, 2);
  squares[3] = new Square(cx - w / 2 + 200, cy - h / 2 + 200, 100, h - 400, 3, 164, 238);
  squares[4] = new Square(cx - w / 2 + 200, cy - h / 2 + 300, 100, h - 300, 255, 255, 255);
  squares[5] = new Square(cx - w / 2 + 300, cy - h / 2 + h - 100, w - 300, 100, 210, 6, 2);
  squares[6] = new Square(cx - w / 2 + 300, cy - h / 2 + h - 250, 150, 150, 0, 0, 0);
  squares[7] = new Square(cx - w / 2 + 450, cy - h / 2 + h - 250, 200, 150, 3, 164, 238);
  squares[8] = new Square(cx - w / 2 + w - 50, cy - h / 2 + h - 250, 50, 150, 255, 255, 255);
  squares[9] = new Square(cx - w / 2 + 300, cy - h / 2, 400, 250, 255, 255, 255);

  for (int i = 0; i < num_balls; i++) {
    balls[i] = new Ball(squares[i]);
  }
}

void draw() {

  fill(0);
  noStroke();
  rect(cx - w / 2 - borderSize, cy - h / 2 - borderSize, w + borderSize * 2, h + borderSize * 2);
  fill(255);
  noStroke();
  rect(cx - w / 2, cy - h / 2, w, h);


  for (int i = 0; i < num_squares; i++) {
    squares[i].show();
  }

  for (int i = 0; i < num_balls; i++) {
    balls[i].move();
    balls[i].show();
  }

  stroke(0);
  strokeWeight(8);
  strokeCap(SQUARE);
  line(cx - w / 2, cy - h / 2 + 100, cx - w / 2 + 200, cy - h / 2 + 100);
  line(cx - w / 2 + 200, cy - h / 2, cx - w / 2 + 200, cy - h / 2 + h);
  line(cx - w / 2 + 200, cy - h / 2 + 200, cx - w / 2 + 300, cy - h / 2 + 200);
  line(cx - w / 2 + 200, cy - h / 2 + 300, cx - w / 2 + 300, cy - h / 2 + 300);
  line(cx - w / 2 + 300, cy - h / 2, cx - w / 2 + 300, cy - h / 2 + h);
  line(cx - w / 2 + 300, cy - h / 2 + 400, cx - w / 2 + w, cy - h / 2 + 400);
  line(cx - w / 2 + 300, cy - h / 2 + 250, cx - w / 2 + w, cy - h / 2 + 250);
  line(cx - w / 2 + w - 50, cy - h / 2 + h - 250, cx - w / 2 + w - 50, cy - h / 2 + h - 100);
  
}
