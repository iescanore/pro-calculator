import 'package:calculator/src/calculator/calculator_function.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CalculatorFunction calculatorFunction = CalculatorFunction();

  group('condition and functions', (){

    test('if inputValue is not in list', (){
      // if input not in characters list
      expect(() => calculatorFunction.calculate('a'), throwsAssertionError);
    });

    test('delete', (){

      calculatorFunction.inputNumber = '125';
      calculatorFunction.history = '125+651';

      calculatorFunction.calculate('Remove');
      expect(calculatorFunction.inputNumber, '12');
      expect(calculatorFunction.history, '125+651');

    });

    test('clear inputNumber', (){

      calculatorFunction.inputNumber = '125';
      calculatorFunction.history = '125+651';

      calculatorFunction.calculate('CE');
      expect(calculatorFunction.inputNumber, '0');
      expect(calculatorFunction.history, '125+651');

    });

    test('clear ALL', (){

      calculatorFunction.inputNumber = '125';
      calculatorFunction.history = '125+651';

      calculatorFunction.calculate('C');
      expect(calculatorFunction.inputNumber, '0');
      expect(calculatorFunction.history, '');
      
    });

  });

  group('normal Calculation', () {

    test('Addition', () {
      calculatorFunction.calculate('1');
      expect(calculatorFunction.inputNumber, '1');
      expect(calculatorFunction.history, '');

      calculatorFunction.calculate('+');
      expect(calculatorFunction.inputNumber, '1');
      expect(calculatorFunction.history, '1+');

      calculatorFunction.calculate('2');
      expect(calculatorFunction.inputNumber, '2');
      expect(calculatorFunction.history, '1+');

      calculatorFunction.calculate('=');
      expect(calculatorFunction.inputNumber, '3');
      expect(calculatorFunction.history, '1+2=');
    });

    test('arithemetic calculation', () {
      calculatorFunction.calculate('5');
      expect(calculatorFunction.inputNumber, '5');
      expect(calculatorFunction.history, '');

      calculatorFunction.calculate('+');
      expect(calculatorFunction.inputNumber, '5');
      expect(calculatorFunction.history, '5+');

      calculatorFunction.calculate('4');
      expect(calculatorFunction.inputNumber, '4');
      expect(calculatorFunction.history, '5+');

      calculatorFunction.calculate('-');
      expect(calculatorFunction.inputNumber, '9');
      expect(calculatorFunction.history, '5+4-');

      calculatorFunction.calculate('9');
      expect(calculatorFunction.inputNumber, '9');
      expect(calculatorFunction.history, '5+4-');

      calculatorFunction.calculate('=');
      expect(calculatorFunction.inputNumber, '0');
      expect(calculatorFunction.history, '5+4-9=');
    });
  });

  group('Squares Calculation', (){

    test('square', (){
      calculatorFunction.calculate('5');
      expect(calculatorFunction.inputNumber, '5');
      expect(calculatorFunction.history, '');

      calculatorFunction.calculate('x²');
      expect(calculatorFunction.inputNumber, '25');
      expect(calculatorFunction.history, 'sqr(5)');

      calculatorFunction.calculate('x²');
      expect(calculatorFunction.inputNumber, '625');
      expect(calculatorFunction.history, 'sqr(sqr(5))');
    });

    calculatorFunction.deleteAll();

    test('half-square', (){
      calculatorFunction.calculate('5');
      expect(calculatorFunction.inputNumber, '5');
      expect(calculatorFunction.history, '');

      calculatorFunction.calculate('1/x');
      expect(calculatorFunction.inputNumber, '0.2');
      expect(calculatorFunction.history, '1/(5)');

      calculatorFunction.calculate('1/x');
      expect(calculatorFunction.inputNumber, '5');
      expect(calculatorFunction.history, '1/(1/(5))');
      
    });

    calculatorFunction.deleteAll();

    test('squareroot', (){
      calculatorFunction.calculate('9');
      expect(calculatorFunction.inputNumber, '9');
      expect(calculatorFunction.history, '');

      calculatorFunction.calculate('²√x');
      expect(calculatorFunction.inputNumber, '3');
      expect(calculatorFunction.history, '√(9)');

    });    

    test('overall calculation', (){
      calculatorFunction.calculate('5');
      expect(calculatorFunction.inputNumber, '5');
      expect(calculatorFunction.history, '');

      calculatorFunction.calculate('x²');
      expect(calculatorFunction.inputNumber, '25');
      expect(calculatorFunction.history, 'sqr(5)');

      calculatorFunction.calculate('+');
      expect(calculatorFunction.inputNumber, '25');
      expect(calculatorFunction.history, 'sqr(5)+');

      calculatorFunction.calculate('5');
      expect(calculatorFunction.inputNumber, '5');
      expect(calculatorFunction.history, 'sqr(5)+');

      calculatorFunction.calculate('=');
      expect(calculatorFunction.inputNumber, '30');
      expect(calculatorFunction.history, 'sqr(5)+5=');

    });

  });

}
