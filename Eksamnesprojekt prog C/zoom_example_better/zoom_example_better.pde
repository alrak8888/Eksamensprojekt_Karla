float zoom = 1;
final static float inc = .05;
final static short sz  = 30;

void setup() {
  size(240, 240);
  smooth();
  rectMode(CENTER);
}

void draw() {
  background(200);

  if (mousePressed)
    if      (mouseButton == LEFT)   zoom += inc;
    else if (mouseButton == RIGHT)  zoom -= inc;

  translate(width>>1, height>>1);
  scale(zoom);
  println(zoom);

  rect(0, 0, sz, sz);
}
