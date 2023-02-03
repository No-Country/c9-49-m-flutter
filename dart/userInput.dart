import "dart:io";

void main() {
  print("Enter your name");
  //Prompt del user
  String? name = stdin.readLineSync();

  print("HELLO $name");

  //User input type conversion

  print("enter a num");

  var num = stdin.readLineSync();

  var num2 = int.parse(num ?? '0') + 10;

  print(num2);
}
