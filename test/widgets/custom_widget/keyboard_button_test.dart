import 'package:calculator/widgets/custom_widget/keyboard_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  const String text = 'A';
  const Color color = Colors.teal;
  const TextStyle textStyle = TextStyle(fontSize: 32, color: Colors.black);

  testWidgets('Keyboard Button', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
       home: Builder(
         builder: (_) {
           return KeyboardButton(
             child: Text(text),
             function: (){}, 
             color: color,
             textStyle: textStyle,
             );
          }
         ),
     ),
    );

    await tester.pumpAndSettle();

    final Finder findText = find.text('A');

    final Finder buttonMaterial = find.descendant(
      of: find.byType(ElevatedButton),
      matching: find.byType(Material),
    );

    Material material = tester.widget<Material>(buttonMaterial);

     expect(findText, findsOneWidget);
     expect(material.color, color);
     expect(material.textStyle!.fontSize, textStyle.fontSize);

     /// KeyboardButton Text use accentColor as Text Color
     expect(material.textStyle!.color, isNot(textStyle.color));
   
  });

  testWidgets('Button\'s Text Color', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
       home: Builder(
         builder: (_) {
           return Theme(
             data: ThemeData(
               accentColor: Colors.black,
             ),
            child: KeyboardButton(
               child: Text(text),
               function: (){}, 
               ),
           );
          }
         ),
     ),
    );

    await tester.pumpAndSettle();

    final Finder buttonMaterial = find.descendant(
      of: find.byType(ElevatedButton),
      matching: find.byType(Material),
    );

    Material material = tester.widget<Material>(buttonMaterial);

    expect(material.textStyle!.color, Colors.black);
   
  });
}