import 'package:calculator/src/calculator/calculator_function.dart';
import 'package:calculator/widgets/custom_widget/drawer.dart';
import 'package:calculator/widgets/custom_widget/keyboard.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  CalculatorFunction calculatorFunction = CalculatorFunction();

  late String answer = '0';
  late String history = '';

  void getValues() {
    setState(() {
      answer = calculatorFunction.inputNumber;
      history = calculatorFunction.history;
    });
  }

  @override
  void initState() {
    getValues();
    super.initState();
  }

  void callFunction(String keys) {
    calculatorFunction.calculate(keys);
    getValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text('Standard Calculator')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(history,
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w800),
                        )),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: FittedBox(
                      child: Text(answer,
                        style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 7,
              child: BaseKeyboard(
                letters: calculatorFunction.characters,
                getInputNumbers: callFunction,
                childAspectRatio: 1.35,
                crossAxisCount: 4,
              ),
            ),
        ],
      ),
    );
  }
}
