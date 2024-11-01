import 'dart:io';


class Wallet {

  int amount = 0;
  List<PaymentItem> paymentItems = [];

  Wallet({this.amount = 0}){
    menu();
  }

  void menu(){
    String? input;
    while (true) {
      print("");
      print("---------------------------");
      print("Your balance is $amount");
      print("---------------------------");
      print("");
      print('--- Menu ---');
      print("Please choose one of the following options:");
      print("1. Top up");
      print("2. Pay");
      print("3. View payment history");
      print("4. Exit");
      print("Enter your choice: ");

      input = stdin.readLineSync();
      
      switch (input) {
        case "1":
          topUp();
          break;
        case "2":
          pay();
          break;
        case "3":
          viewPaymentHistory();
          break;
        case "4":
          exitMenu();
        default:
          print("Invalid input. Please try again.");
          break;
      }

    }
  }

  void exitMenu() {
    print("Happy saving!");
    exit(0);
  }
  
  void checkBalance(){
    print("Your balance is $amount");
  }

  void topUp(){
    print("Enter the amount you want to top up: ");
    amount += int.parse(stdin.readLineSync()!);
    print("Top up successful. Your balance is now $amount");
  }

  void pay(){
    print("Enter the payment title: ");
    String title = stdin.readLineSync()!;
    print("Enter the amount: ");
    int amountToPay = int.parse(stdin.readLineSync()!);
    paymentItems.add(PaymentItem(name: title, price: amountToPay));
    if(amount >= amountToPay){
      amount -= amountToPay;
      print("Payment successful. Your balance is now $amount");
    }else{
      print("Insufficient funds. Your balance is $amount");
    }
  }

  void viewPaymentHistory(){
    if(paymentItems.isEmpty){
      print("-------------------------");
      print("No payment history found.");
      print("-------------------------");
    }
    else{
      print("----Payment history----");
      for (PaymentItem item in paymentItems) {
        item.printInfo();
      }
    }
    print("0. Back to menu");
    print("1. Exit");
    print("Enter your choice: ");
    var input = stdin.readLineSync();
    switch (input) {
      case "1":
        exitMenu();
        break;
      default:
        menu();
        break;
    }
  }
}


class PaymentItem {

  String name;
  int price;
  DateTime dateTime;

  PaymentItem({required this.name, required this.price}): dateTime = DateTime.now();
}

extension PaymentItemExtension on PaymentItem {
  String get formattedDateTime => "${dateTime.year}-${dateTime.month}-${dateTime.day} ${dateTime.hour}:${dateTime.minute}:${dateTime.second}";
  void printInfo() {
    print("Name: $name, Price: $price, Date: $formattedDateTime");
  }
}