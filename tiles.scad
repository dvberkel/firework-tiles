tile(50, 30, 20, 5);

module tile(width, height, depth, radius) {
  translate([radius, radius, radius]) minkowski() {
    cube([width, height, depth - 2*radius]);
    sphere(radius);
  }
}