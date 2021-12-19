import 'package:calculator/extension.dart';

class BasicCalculation {

  BasicCalculation._();

  static final BasicCalculation _instance = BasicCalculation._();

  static BasicCalculation get instance => _instance;

  String? _value1;
  String? _operands;

  late String answer;

  copyWith({String? value, String? operans}) {
    if(value != null) _value1 = value;
    _operands = operans;
  }

  String airthemiticOperands(String inputNumber, String operators) {
    if (_value1 != null) {

      num value1 = _value1!.toNum();
      num value2 = inputNumber.toNum();

      return _see(inputNumber, value1, value2, operators);
    } else {

      copyWith(value: inputNumber, operans: operators);

      return inputNumber;
    }
  }

  num _operand(num v1, num v2, String operands) {
    switch (operands) {
      case '+':
        return v1 + v2;
      case '-':
        return v1 - v2;
      case 'x':
        return v1 * v2;
      case '÷':
        return v1 / v2;
      case '%':
        return v1 % v2;
      default:
        return v1;
    }
  }

  String _see(String inputNumber, num value1, num value2, String operators) {
    if ( _value1!.startsWith('0.') && inputNumber.startsWith('0.') &&
        _value1!.length == inputNumber.length ) {

      String zeros = '1' + '0' * _value1!.split('.')[1].length;
      num presicion = zeros.toNum();

      answer = (_operand(value1 * presicion, value2 * presicion, _operands!) / presicion).toRound();
      copyWith(value: answer, operans: operators);

      return answer;
    } else {

      answer = _operand(value1, value2, _operands!).toRound();
      copyWith(value: answer, operans: operators);

      return answer;
    }
  }

  void clear() {
    _value1 = null;
    _operands = null;
  }
}