import 'dart:io';

void main() {
  stdout.write("1.Enter a number: ");
  int num = int.parse(stdin.readLineSync()!);
  if (num % 2 == 0) {
    print("The number is even");
  } else {
    print("The number is odd");
  }
  stdout.write("Enter First Number=");
  int num1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter Second Number=");
  int num2 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter Third Number=");
  int num3 = int.parse(stdin.readLineSync()!);
  if (num1 > num2 && num1 > num3) {
    print("Numberl is Greatest");
  } else if (num2 > num1 && num2 > num3) {
    print("Number2 is Greatest");
  } else {
    print("Number3 is Greatest");
  }
}
