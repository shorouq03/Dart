import 'dart:io';

void main() {
  while (true) {
    //  recieve user weight
    print('Enter your weight in kilograms');
    double userWeight = double.parse(stdin.readLineSync()!);

    // confirm that user weight is positive
    while (userWeight <= 0) {
      print('please, Enter weight(in kilograms) greater than 0');
      userWeight = double.parse(stdin.readLineSync()!);
    }

    // recieve user height
    print('Enter your height in meters');
    double userHeight = double.parse(stdin.readLineSync()!);

    // confirm that user height is positive
    while (userHeight <= 0) {
      print('please, Enter height(in meters) greater than 0');
      userHeight = double.parse(stdin.readLineSync()!);
    }

    // BMI Calculation
    double bodyMassIndex = userWeight / (userHeight * userHeight);

    // > BMI Interpretation & give a health advice
    // case 1 : Underweight
    if (bodyMassIndex < 18.5) {
      bodyMassIndex = double.parse(bodyMassIndex.toStringAsFixed(2));
      print(' BMI = $bodyMassIndex, case: Underweight');
      print('Health Advice: Eat more healthy foods.');
    }

    // case 2 : Normal weight
    else if (bodyMassIndex >= 18.5 && bodyMassIndex < 25) {
      bodyMassIndex = double.parse(bodyMassIndex.toStringAsFixed(2));
      print(' BMI = $bodyMassIndex, case: Normal weight');
      print('Health Advice: Keep eating well and stay active.');
    }

    // case 3 : Overweight
    else if (bodyMassIndex >= 25 && bodyMassIndex < 30) {
      bodyMassIndex = double.parse(bodyMassIndex.toStringAsFixed(2));
      print(' BMI = $bodyMassIndex, case: Overweight');
      print('Health Advice: Eat healthier and move more.');
    }

    // case 4 :  Obesity
    else {
      bodyMassIndex = double.parse(bodyMassIndex.toStringAsFixed(2));
      print(' BMI = $bodyMassIndex, case: Obesity');
      print('Health Advice: Get help with weight loss.');
    }
  }
}
