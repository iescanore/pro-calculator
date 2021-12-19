import 'package:calculator/src/converter/type.dart';
import 'package:calculator/extension.dart';

class ConverterValues {

  static final Map<Type,Map<dynamic,num>> _convert = {
    Volume: {
      Volume.Milliliters: 1,
      Volume.Cubic_centimeters: 1,
      Volume.Liters: 1000,
      Volume.Cubic_meters: 1e+6,
      Volume.Teaspoons: 4.929,
      Volume.Tablespoons: 14.787,
      Volume.Fluid_ounces: 28.413,
      Volume.Cups: 284,
      Volume.Pints: 568,
      Volume.Quarts: 1137,
      Volume.Gallons: 4546,
      Volume.Cubic_inches: 16.387,
      Volume.Cubic_feet: 28317,
      Volume.Cubic_yards: 764555,
    },
    Length: {
      Length.Nanometers: 1,
      Length.Microns: 1000,
      Length.Millimeters: 1e+6,
      Length.Centimeter: 1e+7,
      Length.Meters: 1e+9,
      Length.Kilometers: 1e+12,
      Length.Inches: 2.54e+7,
      Length.Feet: 3.048e+8,
      Length.Yards: 9.144e+8,
      Length.Miles: 1.609344e+12,
      Length.Nautical_Miles: 1.852e+12,
    },
    Weight_and_Mass: {
      Weight_and_Mass.Carats: 1,
      Weight_and_Mass.Milligrams: 0.005,
      Weight_and_Mass.Centigrams: 0.05,
      Weight_and_Mass.Decigrams: 0.5,
      Weight_and_Mass.Grams: 5,
      Weight_and_Mass.Dekagrams: 50,
      Weight_and_Mass.Hectograms: 500,
      Weight_and_Mass.Kilograms: 5000,
      Weight_and_Mass.Metric_tonnes: 5e+6,
      Weight_and_Mass.Ounces: 141.7476,
      Weight_and_Mass.Pounds: 2267.962,
      Weight_and_Mass.Stone: 31751.47,
    },
    Energy: {
      Energy.Electron_volts: 1,
      Energy.Joules: 6.242e+18,
      Energy.KiloJoules: 9.223e+18,
      Energy.Thermal_calories: 9.223e+18,
      Energy.Food_calores: 9.223e+18,
      Energy.Foot_pounds: 8.462e+18,
    },
    Area: {
      Area.Square_millimeters: 1,
      Area.Square_centimeters: 100,
      Area.Square_meters: 1e+6,
      Area.Hectares: 1e+10,
      Area.Square_kilometers: 1e+12,
      Area.Square_inches: 645,
      Area.Square_feets: 92903,
      Area.Square_yards: 836127,
      Area.Acres: 4.047e+9,
      Area.Square_miles: 2.59e+12,
    },
    Speed: {
      Speed.Centimeters_per_second: 1,
      Speed.Meters_per_second: 100,
      Speed.Kilometers_per_hour: 27.778,
      Speed.Feet_per_second: 30.48,
      Speed.Miles_per_hour: 44.704,
      Speed.Knots: 51.444,
    },
    Time: {
      Time.Microseconds: 1,
      Time.Milliseconds: 1000,
      Time.Seconds: 1e+6,
      Time.Minutes: 6e+7,
      Time.Hour: 3.6e+9,
      Time.Days: 8.64e+10,
      Time.Weeks: 6.048e+11,
      Time.Months: 2.628e+12,
      Time.Years: 3.154e+13,
    },
    Power: {
      Power.Watts: 1,
      Power.Kilowatts: 1000,
      Power.Horspower: 746,
      Power.Foot_pounds_by_minute: 2.259697e-2,
      Power.BTUs_by_minute: 17.584,
    },
    Pressure: {
      Pressure.Atmospheres: 101325,
      Pressure.Bars: 100000,
      Pressure.Pascals: 1,
      Pressure.Pounds_per_square_inch: 6895,
      Pressure.Torr: 133,
    },
    Angle: {
      Angle.Degrees: 1,
      Angle.Radians: 57.29578,
      Angle.Gradians: 0.9,
    },
  };

  static String answer<T>(String inputValue, T typeFrom, T typeTo) {
    
    Map<dynamic,num> con = _convert[T] ?? {};
   
    num type1 = con[typeFrom] ?? 0;
    num type2 = con[typeTo] ?? 0;
    
    num value = inputValue.toNum();

    num answer = value/type2 * type1;

    return answer.toRound();
  }
}