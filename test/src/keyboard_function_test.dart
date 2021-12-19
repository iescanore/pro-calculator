import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/src/keyboard_function.dart';

void main() {

  group('Keyboard function', () {

    test('return text', (){

    KeyboardController keyboardController = KeyboardController();

    expect(keyboardController.inputNumber, '0');

    keyboardController.showNumber('1');
    expect(keyboardController.inputNumber, '1');

    keyboardController.showNumber('2');
    expect(keyboardController.inputNumber, '12');

    keyboardController.showNumber('.');
    expect(keyboardController.inputNumber, '12.');

    keyboardController.showNumber('.');
    expect(keyboardController.inputNumber, '12.');

    keyboardController.showNumber('3');
    expect(keyboardController.inputNumber, '12.3');

    keyboardController.showNumber('+/-');
    expect(keyboardController.inputNumber, '-12.3');

    keyboardController.showNumber('+/-');
    expect(keyboardController.inputNumber, '12.3');

    keyboardController.showNumber('Remove');
    expect(keyboardController.inputNumber, '12.');

    keyboardController.inputNumber = '0123456789100';
    keyboardController.showNumber('1');
    expect(keyboardController.inputNumber, '0123456789100');

    keyboardController.showNumber('CE');
    expect(keyboardController.inputNumber, '0');

  });

  test('dot', (){

    KeyboardController keyboardController = KeyboardController();

    keyboardController.showNumber('.');
    expect(keyboardController.inputNumber, '0.');

    keyboardController.showNumber('.');
    expect(keyboardController.inputNumber, '0.');

    keyboardController.showNumber('1');
    expect(keyboardController.inputNumber, '0.1');

    keyboardController.showNumber('CE');
    keyboardController.showNumber('1');
    keyboardController.showNumber('.');
    expect(keyboardController.inputNumber, '1.');

    keyboardController.showNumber('.');
    expect(keyboardController.inputNumber, '1.');

    keyboardController.showNumber('1');
    expect(keyboardController.inputNumber, '1.1');

    keyboardController.showNumber('+/-');
    expect(keyboardController.inputNumber, '-1.1');  

    keyboardController.showNumber('Remove');
    expect(keyboardController.inputNumber, '-1.');  

    keyboardController.showNumber('Remove');
    expect(keyboardController.inputNumber, '-1');

  });

  test('sign', (){

    KeyboardController keyboardController = KeyboardController();

    keyboardController.showNumber('+/-');
    expect(keyboardController.inputNumber, '-0');

    keyboardController.showNumber('1');
    expect(keyboardController.inputNumber, '-1');

    keyboardController.showNumber('+/-');
    expect(keyboardController.inputNumber, '1');

    keyboardController.showNumber('.');
    keyboardController.showNumber('1');
    expect(keyboardController.inputNumber, '1.1');

    keyboardController.showNumber('+/-');
    expect(keyboardController.inputNumber, '-1.1');

    keyboardController.showNumber('Remove');
    expect(keyboardController.inputNumber, '-1.');

    keyboardController.showNumber('Remove');
    expect(keyboardController.inputNumber, '-1');

    keyboardController.showNumber('Remove');
    expect(keyboardController.inputNumber, '0');

    keyboardController.showNumber('+/-');
    expect(keyboardController.inputNumber, '-0');

    keyboardController.showNumber('.');
    expect(keyboardController.inputNumber, '-0.');

    keyboardController.showNumber('1');
    expect(keyboardController.inputNumber, '-0.1');

    keyboardController.showNumber('+/-');
    expect(keyboardController.inputNumber, '0.1');

  });

  test('delete', (){

    KeyboardController keyboardController = KeyboardController();

    expect(keyboardController.inputNumber, '0');

    keyboardController.showNumber('Remove');
    expect(keyboardController.inputNumber, '0');

    keyboardController.showNumber('1');
    keyboardController.showNumber('2');
    keyboardController.showNumber('Remove');
    expect(keyboardController.inputNumber, '1');

    keyboardController.showNumber('CE');

    keyboardController.showNumber('.');
    keyboardController.showNumber('1');
    keyboardController.showNumber('Remove');
    expect(keyboardController.inputNumber, '0.');

    keyboardController.showNumber('CE');

    keyboardController.showNumber('1');
    keyboardController.showNumber('+/-');
    keyboardController.showNumber('1');
    keyboardController.showNumber('Remove');
    expect(keyboardController.inputNumber, '-1');

    keyboardController.showNumber('CE');

    keyboardController.showNumber('1');
    keyboardController.showNumber('+/-');
    keyboardController.showNumber('Remove');
    expect(keyboardController.inputNumber, '0');

  });

  test('clear all', (){

    KeyboardController keyboardController = KeyboardController();

    expect(keyboardController.inputNumber, '0');

    keyboardController.showNumber('CE');
    expect(keyboardController.inputNumber, '0');

    keyboardController.showNumber('1');
    keyboardController.showNumber('2');
    expect(keyboardController.inputNumber, '12');
    keyboardController.showNumber('CE');
    expect(keyboardController.inputNumber, '0');

    keyboardController.showNumber('.');
    keyboardController.showNumber('1');
    expect(keyboardController.inputNumber, '0.1');
    keyboardController.showNumber('CE');
    expect(keyboardController.inputNumber, '0');

    keyboardController.showNumber('1');
    keyboardController.showNumber('+/-');
    expect(keyboardController.inputNumber, '-1');
    keyboardController.showNumber('CE');
    expect(keyboardController.inputNumber, '0');

  });

  });

}