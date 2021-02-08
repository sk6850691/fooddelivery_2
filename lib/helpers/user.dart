import 'package:cloud_firestore/cloud_firestore.dart';
class UserService{
  String collection = "users";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createUser(Map<String,dynamic>values){
    String id = values["id"];
    _firestore.collection(collection).doc(id).set(values);
  }

}