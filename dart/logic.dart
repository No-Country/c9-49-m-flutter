void main() {
  //Logic - If, If/Else, If else if

  // > < >= <= != ==  <-- Logical Operators

  var num = 4;

  if (num == 4) {
    print("The number is 4");
  } else if (num == 3) {
    print("The number is 3");
  } else {
    print("The number is $num");
  }

  // ?? = Si es falso agrega la parte de la izquierda. Ej:
  var x;
  print(x ?? "Hola"); // --> Hola
  x = 5;
  print(x ?? "Hola"); // --> 5
}
