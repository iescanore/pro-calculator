import 'package:calculator/src/converter/converter.dart';
import 'package:calculator/widgets/custom_widget/drawer.dart';
import 'package:calculator/widgets/custom_widget/keyboard.dart';
import 'package:calculator/src/keyboard_function.dart';
import 'package:calculator/widgets/custom_widget/popup_menu.dart';
import 'package:flutter/material.dart';

class ConverterPage<T> extends StatefulWidget {

  final List<T> converterTypes;

  const ConverterPage({required this.converterTypes});

  @override
  _ConverterPageState<T> createState() => _ConverterPageState<T>();
}

class _ConverterPageState<T> extends State<ConverterPage<T>>{

  late Converter<T> converter;

  late String value1 = converter.inputValue;
  late String value2 = converter.mainFunction();

  bool isValue1 = true;

  late T type1 = converter.typeFrom;
  late T type2 = converter.typeTo;

  KeyboardController _keyBoardController = KeyboardController();

  void changeCondition() {
    setState(() {
      isValue1 = !isValue1;
      _keyBoardController.inputNumber = '0';

      var temp = converter.typeFrom;
      converter.typeFrom = converter.typeTo;
      converter.typeTo = temp;
    });
  }

  void getText(String inputValue) {
    _keyBoardController.showNumber(inputValue);
    setState(() {
      converter.inputValue = _keyBoardController.inputNumber;
      value1 = isValue1 ? converter.inputValue : converter.mainFunction();
      value2 = isValue1 ? converter.mainFunction() : converter.inputValue; 
    });
  }

  void setType(value) {
    setState(() {
      isValue1 ? converter.typeFrom = value : converter.typeTo = value;
      showAnswer();
    });
  }

  void getType(value) {
    setState(() {
      isValue1 ? converter.typeTo = value : converter.typeFrom = value;
      showAnswer();
    });
  }

  void showAnswer() {
      if (isValue1) {
        value2 = converter.mainFunction();
      } else {
        value1 = converter.mainFunction();
      }
  }

  @override
  void initState() {
    converter = Converter<T>('0', typeFrom: widget.converterTypes[0], typeTo: widget.converterTypes[1]);
    showAnswer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(title: Text(T.toString())),
        body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: changeCondition,
                      child: FittedBox(
                        child: Text(
                          value1,
                          style: TextStyle(
                              fontSize: 56,
                              fontWeight:
                                  isValue1 ? FontWeight.bold : FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  MenuSelection(
                    types: widget.converterTypes,
                    onSelected: setType,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: changeCondition,
                      child: FittedBox(
                        child: Text(
                          value2,
                          style: TextStyle(
                              fontSize: 56,
                              fontWeight:
                                  !isValue1 ? FontWeight.bold : FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  MenuSelection(
                    types: widget.converterTypes,
                    initialType: widget.converterTypes[1],
                    onSelected: getType,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: BaseKeyboard<T>(
              letters: _keyBoardController.characters,
              getInputNumbers: getText,
              childAspectRatio: 1.75,
              crossAxisCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}
