import 'package:calculator/extension.dart';
import 'package:calculator/src/converter/type.dart';

class TemperatureConverter {

  static final TemperatureConverter _temperatureConverter = TemperatureConverter._internal();

  TemperatureConverter._internal();

  static TemperatureConverter get instance => _temperatureConverter;

  late Temperature _typeFrom;
  late num _values;

  String answer(String value, Temperature type1, Temperature type2) {

    _typeFrom = type1;
    _values = num.parse(value);

    switch (type2) {
      case Temperature.Celsius: return toCelsius();
      case Temperature.Fahrenheit: return toFahrenheit();
      case Temperature.Kelvin: return toKelvin();
      default:
        return '';
    }
  }

  String toCelsius() {
    return _tempType(
      fromCelsius: _values,
      fromFahrenheit: (_values - 32) * 5/9 ,
      fromKelvin: _values - 273.15,
    );
  }

  String toFahrenheit() {
    return _tempType(
      fromCelsius: (_values * 9/5) + 32,
      fromFahrenheit: _values,
      fromKelvin: (_values = 273.15) * 9/5 + 32,
    );
  } 

  String toKelvin() {
    return _tempType(
      fromCelsius: _values + 273.15,
      fromFahrenheit: (_values - 32) * 5/9 + 273.15 ,
      fromKelvin: _values,
    );
  } 

  String _tempType({required num fromCelsius,required num fromFahrenheit,required num fromKelvin}) {
    switch (_typeFrom) {
      case Temperature.Celsius: return fromCelsius.toRound();
      case Temperature.Fahrenheit: return fromFahrenheit.toRound();
      case Temperature.Kelvin: return fromKelvin.toRound();
      default:
      return '';
    }
  }

}