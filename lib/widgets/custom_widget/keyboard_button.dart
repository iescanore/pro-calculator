import 'package:flutter/material.dart';

class KeyboardButton extends StatelessWidget {

  final Widget child;
  final void Function() function;
  final Color? color;
  final TextStyle? textStyle;

  const KeyboardButton({Key? key, required this.child, required this.function, this.color, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButtonTheme(
         data: ElevatedButtonThemeData(
           style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(),
            primary: color,
            onPrimary: Theme.of(context).accentColor,
            textStyle: textStyle,
           ),
         ),
        child: ElevatedButton(
        key: super.key,
        child: child,
        onPressed: function,
      ),
    );
  }
}
