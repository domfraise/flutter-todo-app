import 'package:flutter/material.dart';

import './list_item.dart';

class ListItems extends StatelessWidget {
  final List<String> listItems;

  ListItems(this.listItems);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: listItems.map(
            (element) => ListItem(element),
          )
          .toList(),
    );
  }
}
