import 'dart:io';
import 'package:calculator/src/platform.dart';
import 'package:flutter/material.dart';

class StoreData {

  Future<File> get _createFile async {
    final String path = await Platform.appDir();
    return File('$path/calculator.txt');
  }

  Future<File>  set(bool value) async {
  final file = await _createFile;
  // Write the file.
   return file.writeAsString(value.toString());
  }

  Future<bool> get value async {
  try {
    final file = await _createFile;
    String contents = await file.readAsString();

    return contents.toLowerCase() == 'true' ? true : false;
  } catch (e) {
    return ThemeMode.system == ThemeMode.light;
  }
}

}