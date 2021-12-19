import 'package:calculator/widgets/custom_widget/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

enum Selection { A, B, C }

void main() {
  testWidgets('menu selection', (WidgetTester tester) async {
          
    Selection type = Selection.A;

    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: Center(
          child: Builder(builder: (BuildContext context) {
            return MenuSelection<Selection>(
              types: Selection.values,
              initialType: type,
              onSelected: (selected) {
                type = selected;
              },
            );
          }),
        ),
      ),
    ));

    final initialText = find.text('A');

    expect(initialText, findsOneWidget);

    await tester.tap(find.text('A'));
    await tester.pumpAndSettle();

    final widget = find.byType(PopupMenuItem);

    expect(widget, findsNWidgets(Selection.values.length));

    await tester.tap(find.text('B'));
    await tester.pumpAndSettle();

    final changedText = find.text('B');

    expect(changedText, findsOneWidget);
  });
}
