import 'package:calculator/src/calculator/calculator_function.dart';
import 'package:calculator/src/converter/type.dart';
import 'package:calculator/src/keyboard_function.dart';
import 'package:calculator/src/theme.dart';
import 'package:calculator/widgets/custom_widget/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Converter Keyword', () {

    CalculatorFunction calculatorFunction = CalculatorFunction();
    final KeyboardController keyboardController = KeyboardController();
    const List<String> _numbers = ['+/-', '0', '.', '1', '2', '3', '4', '5', '6', '7', '8', '9'];


    testWidgets('widget length', (WidgetTester tester) async {
      await tester.pumpWidget(
        Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: Container(
            width: 400,
            child: BaseKeyboard(
                childAspectRatio: 1.35,
                letters: calculatorFunction.characters,
                crossAxisCount: 4,
                getInputNumbers: (String numbers) {},
                ),
              )
            ),
          ),
      );

      await tester.pumpAndSettle();

      expect(tester.renderObjectList<RenderBox>(find.byType(ElevatedButton)), hasLength(calculatorFunction.characters.length));
      expect(tester.renderObjectList<RenderBox>(find.widgetWithIcon(ElevatedButton, Icons.close_sharp)), hasLength(1));

    });

    testWidgets('widget length with generic Type', (WidgetTester tester) async {

      await tester.pumpWidget(
        Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: Container(
            width: 400,
            child: BaseKeyboard<Temperature>(
              letters: keyboardController.characters,
              getInputNumbers: (String value){},
              childAspectRatio: 1.75,
              crossAxisCount: 3,
               ),
            ),
            ),
          ),
      );

      await tester.pumpAndSettle();

      expect(tester.renderObjectList<RenderBox>(find.byType(ElevatedButton)), hasLength(13));
      expect(tester.renderObjectList<RenderBox>(find.byKey(Key('SizedBox'))), hasLength(2));
      expect(tester.renderObjectList<RenderBox>(find.widgetWithIcon(ElevatedButton, Icons.close_sharp)), hasLength(1));

    });

    testWidgets('colors', (WidgetTester tester) async {

      MyTheme.isLightMode = false;

      await tester.pumpWidget(
        Material(
         child: Directionality(
          textDirection: TextDirection.ltr,
          child: Center(
            child: Container(
              width: 400,
              child: BaseKeyboard(
                childAspectRatio: 1.35,
                letters: calculatorFunction.characters,
                crossAxisCount: 4,
                getInputNumbers: (String numbers) {},
                ),
            ),
              ),
            ),
        ),
      );
      
      await tester.pumpAndSettle();

    Material material(String index) => tester.widget<Material>(find.descendant(
      of: find.byType(ElevatedButton).at(calculatorFunction.characters.indexOf(index)),
      matching: find.byType(Material),
    ));

      for(String i in _numbers){
        expect(material(i).color,  Color(0XFF0f0f0f));
      }

      expect(material('=').color, Colors.cyan);

      for(String i in _numbers){
        expect(material(i).color,  Color(0XFF0f0f0f));
      }
      expect(material('+').color, Color(0xFF1c1c1c));

    });

    testWidgets('text update', (WidgetTester tester) async {

      String text = '';

      await tester.pumpWidget(
        Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: Container(
            width: 400,
            child: BaseKeyboard(
                childAspectRatio: 1.35,
                letters: calculatorFunction.characters,
                crossAxisCount: 4,
                getInputNumbers: (String numbers) {
                  text += numbers;
                },
                ),
              )
            ),
          ),
      );

      await tester.tap(find.text('1'));
      await tester.pumpAndSettle();
      expect(text, '1');

      await tester.tap(find.text('5'));
      await tester.pumpAndSettle();
      expect(text, '15');
    });

  });

}