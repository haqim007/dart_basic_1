import 'dart:io';
import 'dart:math';


class GuessTheNumber {

  int totalAttempts = 0;
  final random = Random();
  late int number;

  GuessTheNumber() {
    number = random.nextInt(101);
    play();
  }

  void play() {
    print("Enter you guess [1-100]:");
    String? guess = stdin.readLineSync();
    printResult(guess);
  }

  void printResult(String? guessInString) {
    late int guess;
    try {
      guess = int.parse(guessInString!);
      print("hehe $guess");
    } catch (e) {
      print('Error: "$guessInString" is not a valid integer. Please enter a number.');
      tryAgain();
      return;
    }

    if (guess > 100 || guess < 0) {
      print('please enter a number between 0 and 100');
      tryAgain();
    }
    else if (guess < number) {
      print('too low');
      totalAttempts++;
      tryAgain();
    }
    else if (guess > number) {
      print('too high');
      totalAttempts++;
      tryAgain();
    }
    else {
      print('you win');
      print("Total attempts: $totalAttempts");
      restart();
    }
  }

  void tryAgain() {
    print("Try again? (y/n)");
    String? retry = stdin.readLineSync();
    switch (retry) {
      case 'y':
        play();
        break;
      default:
        print("Thanks for playing!");
        exit(0);
    }
  }

  void restart() {
    print("Play again? (y/n)");
    String? retry = stdin.readLineSync();
    switch (retry) {
      case 'y':
        number = random.nextInt(101);
        totalAttempts = 0;
        play();
        break;
      default:
        print("Thanks for playing!");
        exit(0);
    }
  }
}
