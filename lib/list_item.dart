import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final String content;
  final Function removeItem;

  ListItem(this.content, this.removeItem);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListItemState();
  }
}

class ListItemState extends State<ListItem> {
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      title: Card(
        child: Row(
          children: <Widget>[
            Checkbox(
              onChanged: (value) {
                setState(() {
                  isDone = value;
                });
              },
              value: isDone,
            ),
            Expanded(
              child: Text(widget.content),
            ),
            MaterialButton(
              onPressed: () {
                widget.removeItem(widget.content);
              },
              child: Icon(
                const IconData(0xe872, fontFamily: 'MaterialIcons'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
