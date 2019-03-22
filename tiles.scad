stamp(10) circle(5);


// tile(50, 30, 20, 5);

module tile(width, height, depth, radius) {
  translate([radius, radius, radius]) minkowski() {
    cube([width, height, depth - 2*radius]);
    sphere(radius);
  }
}

module stamp(depth) {
  translate([0, 0, -depth]){
    linear_extrude(height = 2*depth) children();
  }
}