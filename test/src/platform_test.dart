import 'package:calculator/src/platform.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  TestWidgetsFlutterBinding.ensureInitialized();

  group('$Platform', (){

    const MethodChannel channel = Platform.channel;

    final List<MethodCall> log = <MethodCall>[];

    setUp(() async {
    
     channel.setMockMethodCallHandler((MethodCall call) async {
       log.add(call);
       return ''; 
     });

     log.clear();
    });

    group('#checkMethod', (){

      test('getAppDirPathMethod', () async {

        await Platform.appDir();

        expect(log, <Matcher>[
          isMethodCall('getAppDirPath', arguments: null)
          ]);
      });

    });

    group('#getAppDirPath', () {
      test('getPath', () async {
        channel.setMockMethodCallHandler((MethodCall methodCall) async {
          if(methodCall.method == "getAppDirPath") {
            return "/AppData/store/";
          }
        });

      final String response = await Platform.appDir();
        expect(response, '/AppData/store/');
      });
    });

  });

}