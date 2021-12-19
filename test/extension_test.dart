import 'package:calculator/extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('round a number and convert it to String', () {

    const num number1 = 1;
    const num number2 = 1.0; 
    const num number3 = 1.1;
    const num number4 = 012345678912;
    const num number5 = 1.2345678912;
    const num number6 = 01234567890123;
    const num number7 = 123456789101112;
    const num number8 = 123456789.101112;
    const num number9 = 12345.10111254871;    
    const num number10 = 1.10111122111245;    

    test('to String', (){
      expect(number1.toRound(), equals('1'));
    });

    // check if num contains only one decimal points as '0' 
    // and convert it into Int
    test('As int', (){
      expect(number2.toRound(), equals('1'));
      expect(number3.toRound(), isNot('1'));
    });
    
    // check if length of num is lesser than 12,
    // It will not round and will return same number into string.
    test('max length', (){
      expect(number4.toRound(), equals(number4.toString()));
      expect(number5.toRound(), equals(number5.toString()));
      expect(number6.toRound(), isNot(number6.toString()));
    }); 

   // check if length of integer is greater than 12,
   // then the value should round to 12 digit
    test('toStringAsPrecison', (){
     expect(number7.toRound(), equals(number7.toStringAsPrecision(11)));
     expect(number8.toRound(), equals(number8.toStringAsPrecision(11)));
   });

    // check if length of number before decimal point is lesser than 12,
    // then the value should round to 12 digit using [toStringAsFixed]
    test('toStringAsFixed', (){

      // subtract the length of number before decimal point.
      expect(number9.toRound(), number9.toStringAsFixed(11 - 5));

      // subtract the length of number before decimal point.
      expect(number10.toRound(), number10.toStringAsFixed(11 - 1));
    });

  });

  group('check if String ends with of the value is in List', (){

    const List<String> list = ['+', '-', '*', '/'];

    const String val1 = '12+';
    const String val2 = '32';

    test('if its in List, return true', (){
       expect(val1.containsList(list), true);
       expect(val2.containsList(list), isNot(true));
    });

    test('if not, return false', (){
       expect(val2.containsList(list), false);
       expect(val1.containsList(list), isNot(false));
    });

  });

  group('check if String is in List', (){

    const List<String> list = ['1', '2', '3', '4'];

    const String val1 = '1';
    const String val2 = '0';

    test('if its contains, return true', (){
       expect(val1.containsList(list), true);
       expect(val2.containsList(list), isNot(true));
    });

    test('if not, return false', (){
       expect(val2.containsList(list), false);
       expect(val1.containsList(list), isNot(false));
    });

  });

  group('String to num', (){

    const String num1 = '123'; 
    const String num2 = '0.12';
    const String num3 = 'ab'; 

    test('return num', (){
      expect(num1.toNum(), 123);
      expect(num2.toNum(), 0.12);
    });

    test('throw error if number is invalid', (){
      expect(() => num3.toNum(), throwsFormatException);
    });

  });

}