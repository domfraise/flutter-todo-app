import 'package:flutter/material.dart';

class AddItemButton extends StatelessWidget{
  final Function addItem;
  final String text;

  AddItemButton(this.text, this.addItem);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
        color: Theme.of(context).primaryColor,
        colorBrightness: Brightness.dark,
        onPressed: () {
          addItem(text);
        },
        child: Text('Add Item'),
    );
  }

}