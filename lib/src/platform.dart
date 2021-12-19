import 'package:flutter/services.dart';

class Platform {
  
  static const channel = const MethodChannel('Anas.Calculator/appDir');

  static Future<String> appDir() async {
    try {
      final directory = await channel.invokeMethod('getAppDirPath');
      return directory;
    } on PlatformException catch (e) {
      throw e;
    }
  }

}