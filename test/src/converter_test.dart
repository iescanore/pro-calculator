import 'package:calculator/src/converter/converter.dart';
import 'package:calculator/src/converter/type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('Unit Conversion', () {

    Converter converter = Converter<Angle>('1', typeFrom: Angle.Degrees, typeTo: Angle.Radians);

    test('answer', (){
      expect(converter.mainFunction(), equals('0.0174532924'));
    });

    test('change inputValue', (){
      converter.inputValue = '10';

      expect(converter.mainFunction(), equals('0.1745329237'));
    });

    test('change typeFrom', (){
      converter.typeFrom = Angle.Radians;

      expect(converter.mainFunction(), equals('10'));
    });

    test('change typeTo', (){
      converter.typeTo = Angle.Degrees;

      expect(converter.mainFunction(), '572.9578');
    });

  });

  group('temperature conversion', () {

    Converter converter = Converter<Temperature>('0', typeFrom: Temperature.Celsius, typeTo: Temperature.Fahrenheit);

    test('answer', (){
      expect(converter.mainFunction(), equals('32'));
    });

    test('change inputValue', (){
      converter.inputValue = '10';

      expect(converter.mainFunction(), equals('50'));
    });

    test('change typeFrom', (){
      converter.typeFrom = Temperature.Fahrenheit;

      expect(converter.mainFunction(), equals('10'));
    });

    test('change typeTo', (){
      converter.typeTo = Temperature.Kelvin;

      expect(converter.mainFunction(), '260.92777778');
    });

  });
}