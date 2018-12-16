import 'package:flutter/material.dart';
import 'package:tutorial/model/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './list_item.dart';

class ListItems extends StatelessWidget {
  final List<Item> listItems;
  final Function removeItem;
  final Function updateItem;
  final Function getListStream;

  ListItems(
      this.listItems, this.removeItem, this.updateItem, this.getListStream);

  ListItem _buildListItem(context, DocumentSnapshot snapshot) {
    return ListItem(
        Item.withId(snapshot.documentID, snapshot.data['message'],
            snapshot.data['isDone']),
        removeItem,
        updateItem);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flexible(
      child: StreamBuilder(
          stream: getListStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Text("Loading...");
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, i) {
                return _buildListItem(context, snapshot.data.documents[i]);
              },
            );
          }),
    );
  }
}
