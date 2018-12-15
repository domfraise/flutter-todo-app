import 'package:flutter/material.dart';

import './list_item.dart';

class ListItems extends StatelessWidget {
  final List<String> listItems;
  final Function removeItem;

  ListItems(this.listItems, this.removeItem);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flexible(
      child: ListView.builder(
        itemCount: listItems.length,
        itemBuilder: (context, i) {
          return ListItem(listItems[i], removeItem);
        },
      ),
    );
  }
}
