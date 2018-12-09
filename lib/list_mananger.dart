import 'package:flutter/material.dart';

import './list_items.dart';

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
  TextEditingController textontroller;

  @override
  void initState() {
    _listItems.add(widget.existingItems);
    print(textontroller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    textontroller = TextEditingController();
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: TextField(
            controller: textontroller,
          ),
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            colorBrightness: Brightness.dark,
            onPressed: () {
              setState(() {
                print (textontroller);
                _listItems.add(textontroller.text);
              });
            },
            child: Text('Button'),
          ),
        ),
        ListItems(_listItems)
      ],
    );
  }
}
