import 'package:cloud_firestore/cloud_firestore.dart';
class ListRepository{
  final Firestore firestore = Firestore.instance;

  Future<List<String>> getList() async {
    List<String> listItems = [];
    await firestore.collection('TodoLists').document('List').get().then((list) {
      listItems = List<String>.from(list.data["values"]);
    });
    return listItems;
  }

  void updateList(List<String> newList){
    firestore.collection("TodoLists").document("List").setData({"values": newList});
  }

}