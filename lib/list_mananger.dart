import 'package:flutter/material.dart';
import 'package:tutorial/firebase/list_repository.dart';

import './list_items.dart';
import './add_item_button.dart';
import './text_input.dart';

class ListManager extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ListManagerState();
  }
}

class _ListManagerState extends State<ListManager> {
  final ListRepository listRepository = ListRepository();
  List<String> _listItems = [];
  String input = "";
  TextEditingController textController;

  void _addItem(String item) {
    setState(() {
      _listItems.add(textController.text);
      listRepository.updateList(_listItems);
    });
  }

  void _removeItem(String item) {
    setState(() {
      _listItems.remove(item);
      listRepository.updateList(_listItems);
    });
  }

  @override
  void initState() {
    listRepository
        .getList()
        .then((result) => setState(() => _listItems = result));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    textController = TextEditingController();
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              Expanded(child: TextInput(textController)),
              AddItemButton(textController.text, _addItem),
            ],
          ),
        ),
        ListItems(_listItems, _removeItem)
      ],
    );
  }
}
