TILE_WIDTH = 37;
TILE_HEIGHT = 24;
TILE_DEPTH = 16;
CORNER_RADIUS = 3;
STAMP_DEPTH = 3;

tile_set() circle(2*TILE_HEIGHT/3);

module tile_set() {
  xoffset = 1.2 * TILE_WIDTH;
  yoffset = 1.2 * TILE_HEIGHT;
  translate([0 * xoffset, 0 * yoffset, 0]) stamped_tile(1) children();
  translate([1 * xoffset, 0 * yoffset, 0]) stamped_tile(1) children();
  translate([0 * xoffset, 1 * yoffset, 0]) stamped_tile(1) children();
  translate([1 * xoffset, 1 * yoffset, 0]) stamped_tile(2) children();
  translate([0 * xoffset, 2 * yoffset, 0]) stamped_tile(2) children();
  translate([1 * xoffset, 2 * yoffset, 0]) stamped_tile(3) children();
  translate([0 * xoffset, 3 * yoffset, 0]) stamped_tile(3) children();
  translate([1 * xoffset, 3 * yoffset, 0]) stamped_tile(4) children();
  translate([0 * xoffset, 4 * yoffset, 0]) stamped_tile(4) children();
  translate([1 * xoffset, 4 * yoffset, 0]) stamped_tile(5) children();
}

module stamped_tile(n) {
  difference() {
    tile(TILE_WIDTH, TILE_HEIGHT, TILE_DEPTH, CORNER_RADIUS);
    translate([TILE_WIDTH/2, TILE_HEIGHT/2, TILE_DEPTH]) pattern(n) stamp(STAMP_DEPTH) children();
  }
}

module tile(width, height, depth, radius) {
  translate([radius, radius, radius]) minkowski() {
    cube([width-2*radius, height-2*radius, depth - 2*radius]);
    sphere(radius);
  }
}

module stamp(depth) {
  translate([0, 0, -depth]){
    linear_extrude(height = 2*depth) children();
  }
}

module pattern(n) {
  if (n == 1) {
    scaling = 0.5;
    scale(scaling) children();
  }
  if (n == 2) {
    scaling = 0.4;
    translate([-TILE_WIDTH/4, 0, 0]) scale(scaling) children();
    translate([ TILE_WIDTH/4, 0, 0]) scale(scaling) children();
  }
  if (n == 3) {
    scaling = 0.25;
    translate([-TILE_WIDTH/4, -TILE_HEIGHT/5, 0]) scale(scaling) children();
    translate([            0,              0, 0]) scale(scaling) children();
    translate([ TILE_WIDTH/4,  TILE_HEIGHT/5, 0]) scale(scaling) children();
  }
  if (n == 4) {
    scaling = 0.25;
    translate([-TILE_WIDTH/4,              0, 0]) scale(scaling) children();
    translate([ TILE_WIDTH/4,              0, 0]) scale(scaling) children();
    translate([            0, -TILE_HEIGHT/4, 0]) scale(scaling) children();
    translate([            0,  TILE_HEIGHT/4, 0]) scale(scaling) children();
  }
  if (n == 5) {
    scaling = 0.2;
    scale(0.5) children();
    translate([-TILE_WIDTH/4, -TILE_HEIGHT/4, 0]) scale(scaling) children();
    translate([-TILE_WIDTH/4,  TILE_HEIGHT/4, 0]) scale(scaling) children();
    translate([ TILE_WIDTH/4, -TILE_HEIGHT/4, 0]) scale(scaling) children();
    translate([ TILE_WIDTH/4,  TILE_HEIGHT/4, 0]) scale(scaling) children();
  }
}