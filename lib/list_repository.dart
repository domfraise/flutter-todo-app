import 'package:cloud_firestore/cloud_firestore.dart';

class ListRepository{

  final Firestore firestore = Firestore.instance;

  Future<List<String>> getList() async {
    var response = await firestore.collection('TodoLists').document('List').get();
    return List<String>.from(response.data["values"]);
  }

  void updateList(List<String> newList){
    firestore.collection("TodoLists").document("List").setData({"values": newList});
  }

}