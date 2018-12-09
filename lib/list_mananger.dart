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


  @override
  void initState() {
    _listItems.add(widget.existingItems);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            colorBrightness: Brightness.dark,
            onPressed: () {
              setState(() {
                _listItems.add("Hello");
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
