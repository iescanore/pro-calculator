import 'package:calculator/widgets/custom_widget/drawer.dart' as drawer;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('Drawer', (){

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    late BuildContext savedContext;

    testWidgets('Open and Close drawer using icon', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (context) {

            savedContext = context;

            return Scaffold(
            key: scaffoldKey,
            drawer: drawer.MyDrawer(),
            body: SizedBox(),
          );
          },
        ),
      ),);

      await tester.pump();

      expect(find.text('Temperature'), findsNothing);

      scaffoldKey.currentState!.openDrawer();

      await tester.pumpAndSettle();

      expect(find.text('Temperature'), findsOneWidget);

      Navigator.pop(savedContext);

      await tester.pumpAndSettle();

      expect(find.text('Temperature'), findsNothing);

    });

  });

}