import 'dart:io';

void main() {
  // counter to count the number of attempts allowed to enter the PIN
  int counter = 0;
  int correctPin = 12345;
  while (counter < 3) {
    // Recieve PIN from user
    print('Enter your PIN');
    int pinInput = int.parse(stdin.readLineSync()!);
    // if condition > to check if PIN is correct or isn't
    if (pinInput == correctPin) {
      double accountBalance = 1000;
      while (true) {
        // Display a menu of operations
        print('1.Check Balance');
        print('2.Deposit Money');
        print('3.Withdraw Money');
        print('4.Exit');
        print('Enter your choice number');
        // recieve choice number from user
        int userChoice = int.parse(stdin.readLineSync()!);
        // case 1 > Check Balance
        if (userChoice == 1) {
          // the current account balance with two decimal places.
          accountBalance = double.parse(accountBalance.toStringAsFixed(2));
          //  Display the current account balance
          print('The current account balance = $accountBalance');
        }
        // case 2 > Deposit Money
        else if (userChoice == 2) {
          print('Enter the deposit amount');
          // recieve deposit amount from user
          double depositAmount = double.parse(stdin.readLineSync()!);
          while (depositAmount <= 0) {
            // if condition > to check if deposite amount is positive or negative or zero
            if (depositAmount <= 0) {
              print('please, Enter amount greater than 0');
              // recieve another correct deposit amount
              depositAmount = double.parse(stdin.readLineSync()!);
            }
          }
          // Update the account balance after depositing
          accountBalance += depositAmount;
          print('Done');
        }
        // case 3 >  Withdraw Money
        else if (userChoice == 3) {
          print('Enter the withdraw amount');
          // recieve the withdraw amount from user
          double withdrawAmount = double.parse(stdin.readLineSync()!);
          while (withdrawAmount <= 0) {
            // if condition > to check if withdraw amount is positive or negative or zero
            if (withdrawAmount <= 0) {
              print('please, Enter amount greater than 0');
              withdrawAmount = double.parse(stdin.readLineSync()!);
            }
          }
          // if condition > to check if user can witdraw money or the account balance isn't enough to withdraw
          if (withdrawAmount <= accountBalance) {
            // Update the account balance after withdrawing
            accountBalance -= withdrawAmount;
            print('Done');
          } else {
            print('invalid amount, Please check your account balance');
          }
        }
        // case 4 >> Exit
        else if (userChoice == 4) {
          break;
        }
        // case 5 >> user enters number isn't from choice number
        else {
          print('please, Enter number from choice number down');
        }
      }
    }
    // if PIN is wrong
    else if (counter < 2) {
      print('Wrong PIN, Try again');
      counter++;
    }
    // if counter==2 >> the last attempt is wrong too
    else {
      print('wrong PIN');
      counter++;
    }
  }
  // Limit the number of failed attempts to 3 before the program exits
  if (counter == 3) {
    print(
        'You exceeded the number of attempts allowed to enter the PIN, try again tomorrow');
  }
}
