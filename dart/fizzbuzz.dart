void main() {
  fizzBuzz(n) {
    var list = new List<int>.generate(n, (i) => i + 1);
    for (var number in list) {
      bool three = number % 3 == 0;
      bool five = number % 5 == 0;
      if (three && five) {
        print("$number. FizzBuzz");
      } else if (three) {
        print("$number. Fizz");
      } else if (five) {
        print("$number. Buzz");
      } else {
        print("$number.");
      }
    }
  }

  fizzBuzz(100);
}
