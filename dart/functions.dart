void main() {
  myFunc() {
    print("Hello"); //--> Declaration
  }

  myFunc2() {
    return "Hello2"; // --> I need print the return
  }

  myFunc(); // --> Invocation = "Hello"
  print(myFunc2()); // --> Invocation = "Hello2"

  welcome(name, [lastname]) {
    // The second parameter is optional
    return "Hello $name $lastname"; // --> Hello andres null
  }

  var thing = welcome("andres"); // Saving the return in a variable
  print(thing);

  welcome2(String name, {name2 = "perez"}) {
    print("Hi $name $name2");
  }

  welcome2("pato"); // --> Hi pato perez
  welcome2("pedro", name2: "gonzalez"); // --> Hi pedro gonzalez
}
