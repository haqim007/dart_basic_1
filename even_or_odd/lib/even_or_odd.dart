import 'dart:io';

void check() {
  print("Enter a number:");
  String? inputString = stdin.readLineSync();
  try {
    final input = int.parse(inputString!);
    if (input % 2 == 0) {
      print('$input is Even');
    } else {
      print('$input is Odd');
    }
  } catch (e) {
    print("$inputString is invalid input");
  }
}
