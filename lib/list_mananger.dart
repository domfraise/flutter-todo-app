import 'package:flutter/material.dart';
import 'package:tutorial/firebase/list_repository.dart';
import 'package:tutorial/model/item.dart';

import './list_items.dart';
import './add_item_button.dart';
import './text_input.dart';

class ListManager extends StatefulWidget {
  final Brightness brightness;

  ListManager(this.brightness);

  @override
  State<StatefulWidget> createState() {
    return _ListManagerState();
  }
}

class _ListManagerState extends State<ListManager> {
  final ListRepository listRepository = ListRepository();
  List<Item> _listItems = [];
  String input = "";
  TextEditingController textController = TextEditingController();

  void _addItem(Item item) async {
    var itemWithId = await listRepository.addItem(item);
    setState(() {
      textController.text = "";
      _listItems.add(itemWithId);
    });
  }

  void _removeItem(Item item) {
    listRepository.removeItem(item);
    setState(() {
      _listItems.remove(item);
    });
  }

  void _updateItem(Item item) {
    listRepository.updateItem(item);
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
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              Expanded(child: TextInput(textController)),
              AddItemButton(textController, _addItem),
            ],
          ),
        ),
        ListItems(_listItems, _removeItem, _updateItem)
      ],
    );
  }
}
