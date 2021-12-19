import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef OnSelected<T> = void Function(T value);

class MenuSelection<T> extends StatefulWidget {

  final List<T> types;
  final T? initialType;
  final OnSelected onSelected;

  const MenuSelection({required this.types, this.initialType, required this.onSelected});

  @override
  _MenuSelectionState createState() => _MenuSelectionState();
}

class _MenuSelectionState<T> extends State<MenuSelection> {
  late List<PopupMenuItem<T>> items =
      List.generate(widget.types.length, (index) {
    return PopupMenuItem<T>(
      value: widget.types[index],
      child: Text(
        describeEnum(widget.types[index]).replaceAll('_', ' '),
      ),
    );
  });

  late Object newType;

  @override
  void initState() {
    super.initState();
    newType = widget.initialType ?? widget.types[0];
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (_) => items,
      onSelected: (value) {
        setState(() {
          newType = value!;
        });
        widget.onSelected(value);
      },
      shape: BeveledRectangleBorder(
          side: BorderSide(color: Colors.white.withOpacity(0.80), width: 0.75)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            describeEnum(newType).replaceAll('_', ' '),
            style: TextStyle(fontSize: 28, color: Theme.of(context).accentColor),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.5, left: 2.5),
            child: Icon(
              Icons.arrow_drop_down,
              size: 32,
            ),
          ),
        ],
      ),
      padding: EdgeInsets.all(0),
    );
  }
}
