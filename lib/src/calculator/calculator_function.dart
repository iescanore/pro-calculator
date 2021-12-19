import 'package:calculator/src/keyboard_function.dart';
import 'package:calculator/src/calculator/basic_calculation.dart';
import 'package:calculator/extension.dart';
import 'package:calculator/src/calculator/basic_power.dart';

class CalculatorFunction extends KeyboardController {

  CalculatorFunction();

  @override
  String get inputNumber => super.inputNumber;

  String history = '';

  final BasicCalculation _basicCalculation = BasicCalculation.instance;
  final BasicPower _basicPower = BasicPower.instance;

  String? _temporary;

  @override
  List<String> get characters => [
        '+/-',
        '0',
        '.',
        '=',
        '1',
        '2',
        '3',
        '+',
        '4',
        '5',
        '6',
        '-',
        '7',
        '8',
        '9',
        'x',
        '1/x',
        'x²',
        '²√x',
        '÷',
        '%',
        'CE',
        'C',
        'Remove'
      ];

  List<String> _powerOperandsList = ['1/x', 'x²', '²√x',];

  List<String> _aritmeticOperatorsList = ['+', '-', 'x', '÷', '%', '='];

  bool _resetInput = false;
  bool _signChange = false;

  CalculatorFunction? _copyWith({bool? resetInput, bool? signChange, String? histo, String? number,required String? temp}) {
     _resetInput = resetInput ?? _resetInput;
     _signChange = signChange ?? _signChange;
      history = histo ?? history;
      inputNumber = number ?? inputNumber;
      _temporary = temp;
  }

  void deleteAll() {
    _copyWith(number: '0', histo: '', temp: null);
    _basicCalculation.clear();
  }

  void calculate(String char) {

    assert(characters.contains(char));

      if (history.endsWith('=') && _aritmeticOperatorsList.contains(char)) {
        _copyWith(histo: inputNumber, temp: null);
        _basicCalculation.clear();
      }

      if(inputNumber == 'Cannot divide by zero') deleteAll();

    if (super.characters.contains(char)) {

      if (history.endsWith('=')) deleteAll();

      if (_resetInput) _copyWith(number: '0', resetInput: false, temp: _temporary);
      if(history.containsList(_inputPower) && !history.endswithList(_aritmeticOperatorsList)) {
        _copyWith(temp: _temporary, histo: '');
      }

      if (char == '+/-') _copyWith(signChange: true, temp: _temporary);

      showNumber(char);

      _temporary = inputNumber;
    } else if (_powerOperandsList.contains(char)) {

      if (history.endsWith('=')) _copyWith(histo: '', temp: inputNumber);

      _powerCalculation(char);
    } else if (char == 'C') {
      deleteAll();
    } else if (_aritmeticOperatorsList.contains(char)) {
      _arithemticCalculation(char);
    }
  }

  void _arithemticCalculation(String char) {

    if (_temporary != null) _copyWith(histo: history + _temporary!, temp: null); 

    if (history.endswithList(_aritmeticOperatorsList) && !_signChange) {
      history = history.substring(0, history.length - 1) + char;
      _basicCalculation.copyWith(operans: char);
    } else {
      history += char;
      inputNumber = _basicCalculation.airthemiticOperands(inputNumber, char);
      _copyWith(signChange: false, resetInput: true, temp: _temporary);
    }
  }

  List<String> _inputPower = ['1/', 'sqr', '√'];

  void _powerCalculation(String char) {
    
    _powersOperatorInput(char);

    inputNumber = _basicPower.powerCalcualtion(char, inputNumber);

    _copyWith(resetInput: true, temp: null);
  }

  void _powersOperatorInput(String char) {

     if(_temporary == null) _copyWith(temp: '0');

    switch (char) {
      case '1/x':
         _powerCondition('1/($history)', '1/($_temporary)');
        break;
      case 'x²':
         _powerCondition('sqr($history)', 'sqr($_temporary)');
      break;
      case '²√x':
         _powerCondition('√($history)', '√($_temporary)');
      break;
    }
  }

  void _powerCondition(String characters, String char) {
     if(history.containsList(_inputPower) && !history.endswithList(_aritmeticOperatorsList)){
          history = characters; 
     } else {
          history += char; 
     }
   }
}