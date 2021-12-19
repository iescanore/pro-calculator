import 'package:calculator/src/converter/type.dart';
import 'package:calculator/src/keyboard_function.dart';
import 'package:calculator/src/theme.dart';
import 'package:calculator/widgets/custom_widget/keyboard_button.dart';
import 'package:flutter/material.dart';

class BaseKeyboard<T> extends StatelessWidget {

  final GetInputNumbers getInputNumbers;
  final List<String> letters;
  final double? childAspectRatio;
  final int crossAxisCount;

  const BaseKeyboard({Key? key, required this.getInputNumbers, required this.letters, this.childAspectRatio, required this.crossAxisCount}) : super(key: key); 

  bool sign() {
    switch (T) {
      case Temperature:
      case Power:
      case Angle:
        return true;
      default:
        return false;
    }
  }

   Widget buttons(int index) {
    if (letters[index] == '' || (letters[index] == '+/-' && sign())) {
      return SizedBox(key: Key('SizedBox'));
    } else {
      return KeyboardButton(
         child: letters[index] == 'Remove' ? Icon(Icons.close_sharp, size: 32) : Text(letters[index]),
         function: () => getInputNumbers(letters[index]),
         color: color(index),
         textStyle: textStyle(index),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(2.5),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: childAspectRatio ?? 1.0,
        mainAxisSpacing: 2.5,
        crossAxisSpacing: 2.5,
        crossAxisCount: crossAxisCount,
      ),
     children: List.generate(letters.length, 
       (index) {
         return buttons(index);
       }),
       reverse: true,
    );
  }

  static const List<String> _numbers = ['+/-', '0', '.', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  Color color(int index) {

    if(letters[index] == '=') {
      return Colors.cyan;
    } else if (_numbers.contains(letters[index])) {
      return MyTheme.isLightMode ? Color(0xFFE8E8E8) : Color(0XFF0f0f0f);
    } else {
      return MyTheme.isLightMode ? Color(0xFFD8D8D8) : Color(0xFF1c1c1c);
    }
  } 

  TextStyle textStyle(int index) {
    if (_numbers.contains(letters[index])) {
      return TextStyle(fontSize: 32, fontWeight: FontWeight.w600,);
    } else {
      return TextStyle(fontSize: 32, fontWeight: FontWeight.w400);
    }
  } 

}