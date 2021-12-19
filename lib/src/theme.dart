import 'package:flutter/material.dart';

class MyTheme {

   final ThemeData lightTheme = ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme().copyWith(elevation: 0),
        primaryColor: Color(0xFFE0E0E0),
        textTheme: TextTheme().copyWith(headline6: TextStyle(color: Colors.black)),
        scaffoldBackgroundColor: Color(0xFFE0E0E0), 
        canvasColor: Color(0xFFE0E0E0),
        popupMenuTheme: PopupMenuThemeData(
          elevation: 0,
          color: Color(0xFFE0E0E0),
          textStyle: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w300),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            primary: Colors.black
          ),
        ),
        accentColor: Colors.black,
        dividerColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
      );

  final ThemeData darkTheme = ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          color: Color(0xFFF2C2F33),
          elevation: 0, 
        ),
        scaffoldBackgroundColor: Color(0xFFF2C2F33), 
        canvasColor: Color(0xFFF2C2F33),
        popupMenuTheme: PopupMenuThemeData(
          color: Color(0xFFF2C2F33),
          textStyle: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w300),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            primary: Colors.white
          ),
        ),
        textTheme: TextTheme().copyWith(bodyText2: TextStyle(color: Colors.black)),
        accentColor: Colors.white,
        dividerColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.white)
      );

     static bool isLightMode = true;

}



