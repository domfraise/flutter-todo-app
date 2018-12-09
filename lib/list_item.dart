import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String content;

  ListItem(this.content);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
        title: Center(
          child: Text(content),
        ),
      );

  }
}
