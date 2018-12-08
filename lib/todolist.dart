import 'package:flutter/material.dart';

class ListItems extends StatelessWidget {
  final List<String> listItems;

  ListItems(this.listItems);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: listItems
          .map(
            (element) => Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/power.jpg'),
                      Text(element),
                    ],
                  ),
                ),
          )
          .toList(),
    );
  }
}
