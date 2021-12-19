import 'dart:math' as math;
import 'package:calculator/extension.dart';

class BasicPower {

  BasicPower._();

  static final BasicPower _instance = BasicPower._();

  static BasicPower get instance => _instance;

  String powerCalcualtion(String char, String inputNumber) {

    if(char == '1/x' && inputNumber == '0') {
      return 'Cannot divide by zero';
    } else {
      return _calculate(char, inputNumber).toRound();
    }

  }  

  num _calculate(String char, String inputNumber) {

    num value = num.parse(inputNumber);

    switch (char) {
      case '1/x':
        return 1 / value;
      case 'x²':
        return math.pow(value, 2);
      case '²√x':
        return math.sqrt(value);
      default:
        return value;
    }
  }

}