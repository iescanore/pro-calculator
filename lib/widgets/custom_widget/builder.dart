import 'package:calculator/src/store_data.dart';
import 'package:calculator/src/theme.dart';
import 'package:flutter/material.dart';

class AppBuilder extends StatefulWidget {

  final Widget child;

  const AppBuilder({Key? key,required this.child}) : super(key: key);

  static AppBuilderState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_InheritedAppBuilder>()?.data;
  }

  @override
  AppBuilderState createState() => AppBuilderState();
}

class AppBuilderState extends State<AppBuilder> {

  final StoreData storeData = StoreData();

  ThemeMode themeMode() {

    storeData.value.then((value) {
      MyTheme.isLightMode = value;
    });

     return MyTheme.isLightMode ? ThemeMode.light : ThemeMode.dark;
  }

  void changeToDarkMode() {
    setState(() {
      MyTheme.isLightMode = false;
      storeData.set(MyTheme.isLightMode);
    });
  }

  void changeToLightMode() {
    setState(() {
      MyTheme.isLightMode = true;
      storeData.set(MyTheme.isLightMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: storeData.value,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {

          MyTheme.isLightMode = snapshot.data ?? ThemeMode.system == ThemeMode.light;

          if (snapshot.hasData) {
            return _InheritedAppBuilder(
            data: this,
             child: widget.child,
            );
          } else {
            return Container(color: Colors.white);
          } 
        },
    );
  }
}

class _InheritedAppBuilder extends InheritedWidget {

  final AppBuilderState data;
   
  _InheritedAppBuilder({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedAppBuilder old) => true;
}