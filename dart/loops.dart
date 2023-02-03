void main() {
  //For Loop
  var num = 5;
  for (var i = num; i > 0; i--) {
    print(i); // --> 5,4,3,2,1
  }
  //For in Loop
  var names = ["raul", "pepe", "flor"];
  for (var name in names) {
    print(name); // --> raul, pepe, flor
  }

  //While loop
  // while (num >= 1) {
  //   print(num); // --> 5,4,3,2,1
  //   num--;
  // }

  //Do while
  do {
    print(num); // --> 5
  } while (num != 5);
}
