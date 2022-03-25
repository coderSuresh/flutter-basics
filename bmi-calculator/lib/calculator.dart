import 'dart:math';

class Calculator {
  final int height;
  final int weight;
  Calculator({required this.height, required this.weight});

  double _bmi = 0;

  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getSummary() {
    if (_bmi > 25) {
      return "You have a higher than normal body weight. Try to exercise more.";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight.";
    } else {
      return "You have a lower than normal body weight. Try to gain some weight.";
    }
  }
}
