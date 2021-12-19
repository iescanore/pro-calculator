import 'dart:io';
import 'package:calculator/src/platform.dart';
import 'package:calculator/src/store_data.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  TestWidgetsFlutterBinding.ensureInitialized();

  group('Store Data', () {

    StoreData storeData = StoreData();
    late final Directory directory;

    setUpAll(() async {

      directory = await Directory.systemTemp.createTemp();

      Platform.channel.setMockMethodCallHandler((MethodCall methodCall) async {
        if (methodCall.method == "getAppDirPath") {
          return directory.path;
        }
      });
    });
    
    test('store Data', () async {

      bool value;

      await storeData.set(true);
      value = await storeData.value;

       expect(value, true);

      await storeData.set(false);
      value = await storeData.value;

      expect(value, false);
      
    });
  

  });
}
