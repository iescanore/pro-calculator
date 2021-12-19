import 'package:calculator/pages/calculator_page.dart';
import 'package:calculator/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:calculator/widgets/custom_widget/builder.dart';

void main() {
  runApp(AppBuilder(child: MyApp()));
}

class MyApp extends StatelessWidget {

   final MyTheme myTheme = MyTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: myTheme.lightTheme,
      darkTheme: myTheme.darkTheme,
      themeMode: AppBuilder.of(context)?.themeMode(),
      home: CalculatorPage()
      );
  }
}