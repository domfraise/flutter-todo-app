import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tutorial/model/item.dart';

class ListRepository {
  final Firestore firestore = Firestore.instance;

  Future<List<Item>> getList() async {
    var querySnapshot = await firestore
        .collection('TodoLists')
        .document('List')
        .collection("ListItems")
        .getDocuments();
    var items = querySnapshot.documents.map((snapshot) {
      return Item.withId(snapshot.documentID, snapshot.data['message'],
          snapshot.data['isDone']);
    });
    return List<Item>.from(items);
  }

  void updateList(List<String> newList) {
    firestore
        .collection("TodoLists")
        .document("List")
        .setData({"values": newList});
  }

  Future<Item> addItem(Item item) async {
    var docRef = await firestore
        .collection("TodoLists")
        .document("List")
        .collection("ListItems")
        .add({"message": item.message, "isDone": item.isDone});
    item.id = docRef.documentID;
    return item;
  }

  void updateItem(Item item) {
    firestore
        .collection("TodoLists")
        .document("List")
        .collection("ListItems")
        .document(item.id)
        .updateData({"message": item.message, "isDone": item.isDone});
  }

  Future<void> removeItem(Item item) async {
    await firestore
        .collection("TodoLists")
        .document("List")
        .collection("ListItems")
        .document(item.id)
        .delete();
  }
}
