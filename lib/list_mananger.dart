import 'package:flutter/material.dart';

import './list_items.dart';
import './add_item_button.dart';
import './text_input.dart';

class ListManager extends StatefulWidget {
  final String existingItems;

  ListManager(this.existingItems);

  @override
  State<StatefulWidget> createState() {
    return _ListManagerState();
  }
}

class _ListManagerState extends State<ListManager> {
  List<String> _listItems = [];
  String input = "";
  TextEditingController textController;

  void _addItem(String item){
    setState(() {
      _listItems.add(textController.text);
    });
  }

  @override
  void initState() {
    _listItems.add(widget.existingItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    textController = TextEditingController();
    return Column(
      children: <Widget>[
        TextInput(textController),
        AddItemButton(textController.text, _addItem),
        ListItems(_listItems)
      ],
    );
  }
}
