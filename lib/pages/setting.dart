import 'package:calculator/src/theme.dart';
import 'package:calculator/widgets/custom_widget/builder.dart';
import 'package:flutter/material.dart';

enum Mode { Light_Mode, Dark_Mode}

class Setting extends StatefulWidget {

  const Setting();

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  Mode? mode = MyTheme.isLightMode ? Mode.Light_Mode : Mode.Dark_Mode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 4),
            child: Text('Theme', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400, color: Theme.of(context).accentColor),),
          ),
          Divider(indent: 10, endIndent: 10, height: 20,),
          ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('Light Mode'),
          leading: Radio(
            value: Mode.Light_Mode,
            groupValue: mode,
            onChanged: (Mode? value) {
              setState(() {
                mode = value;
                AppBuilder.of(context)?.changeToLightMode();
              });
            },
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Dark Mode'),
          leading: Radio(
            value: Mode.Dark_Mode,
            groupValue: mode,
            onChanged: (Mode? value) {
              setState(() {
               mode = value;
              AppBuilder.of(context)?.changeToDarkMode();
              });
            },
          ),
        ),
        ],
      ),
    );
  }
}