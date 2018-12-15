import 'package:flutter/material.dart';
import 'package:tutorial/model/item.dart';

class ListItem extends StatefulWidget {
  final Function removeItem;
  final Item item;

  ListItem(this.item, this.removeItem);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListItemState();
  }
}

class ListItemState extends State<ListItem> {
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
                  widget.item.isDone = value;
                });
              },
              value: widget.item.isDone,
            ),
            Expanded(
              child: Text(widget.item.message),
            ),
            MaterialButton(
              onPressed: () {
                widget.removeItem(widget.item);
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
