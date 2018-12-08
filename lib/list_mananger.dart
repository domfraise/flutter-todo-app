import 'package:flutter/material.dart';

import './todolist.dart';

class ListManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListManagerState();
  }
}

class _ListManagerState extends State<ListManager> {
  List<String> _listItems = ['Item 1'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
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
