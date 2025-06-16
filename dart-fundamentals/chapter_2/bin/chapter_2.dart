import 'dart:math';

void main() {
  print('Hello world!');

  // Arithmetic Operations
  /*
  2 + 6
  10 - 2
  2 * 4
  24 / 3
  22 / 7 = 3.142857142857143
  22 ~/ 7 = 3
   */

  // Math Functions
  print(sin(45 * pi / 180)); // 0.7071067811865475
  print(cos(135 * pi / 180)); // -0.7071067811865475

  print(sqrt(2)); // 1.4142135623730951
  print(max(5, 10)); // 10
  print(min(-5, -10)); // -10

  // Variables
  int number = 10;
  number = 15;
  double apple = 3.14159;

  int myInteger = 10;
  // myInteger = 3.14159; // No, no, no. That's not allowed :]

  // Type Safety
  num myNumber;
  myNumber = 10; // OK
  myNumber = 3.14159; // OK
  // myNumber = 'ten'; // No, no, no.

  // Type Inference
  // The var keyword says to Dart, “Use whatever type is
  // appropriate.”
  var someNumber = 10;
  someNumber = 15;
  // someNumber = 3.14; // Nope

  // Constants
  const myConstant = 10;
  // myConstant = 0; // Not allowed.
  final hoursSinceMidnight = DateTime.now().hour;

  // Increment and Decrement
  var counter = 0;
  counter += 1;
  // counter = 1;
  counter -= 1;
  // counter = 0;
  counter++; // 1
  counter--; // 0

  double myValue = 10;
  myValue *= 3; // myValue = 30.0;
  myValue /= 2; // myValue = 15.0;
}
