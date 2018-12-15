import 'package:flutter/material.dart';
import 'package:tutorial/model/item.dart';

class AddItemButton extends StatelessWidget{
  final Function addItem;
  final TextEditingController textController;

  AddItemButton(this.textController, this.addItem);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
        color: Theme.of(context).primaryColor,
        colorBrightness: Brightness.dark,
        onPressed: () {
          addItem(Item(textController.text, false));
        },
        child: Text('Add Item'),
    );
  }

}