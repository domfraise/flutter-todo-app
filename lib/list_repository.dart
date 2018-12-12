import 'package:cloud_firestore/cloud_firestore.dart';
class ListRepository{
  Future<List<String>> getList() async {
    List<String> listItems = [];

    await Firestore.instance.collection('TodoLists').document('List').get().then((list) {
      listItems = List<String>.from(list.data["values"]);
    });
    return listItems;
  }

}