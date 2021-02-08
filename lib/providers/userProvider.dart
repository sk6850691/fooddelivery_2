

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery_2/helpers/user.dart';
import 'package:fooddelivery_2/models/user.dart';
import 'package:fooddelivery_2/screens/loginScreen.dart';
enum Status{Uninitialized,Authenticated,Authenticating,Unauthenticated}
class UserProvider with ChangeNotifier{

FirebaseAuth _auth;
User user;
Status _status = Status.Uninitialized;

UserService _userService = UserService();
UserModel _userModel = UserModel();
FirebaseFirestore firestore = FirebaseFirestore.instance;

Status get status =>_status;

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
UserProvider.initialize(): _auth = FirebaseAuth.instance{
  _auth.userChanges().listen(_onAuthStateChanged);
}
Future<void> _onAuthStateChanged(User firebaseUser)async{

  if(firebaseUser == null){
    _status = Status.Unauthenticated;
  }
  else{
    user = firebaseUser;
    _status = Status.Authenticated;

  }
  notifyListeners();
}




Future<bool> signIn()async{


  try{
    _status = Status.Authenticating;
    await _auth.signInWithEmailAndPassword(email: email.text,password: password.text);
  return true;}catch(e){print(e);}


}
Future<bool> SignUp()async{
  try{

   await _auth.createUserWithEmailAndPassword(email: email.text,password: password.text).then((result){

      firestore.collection('users2').doc(result.user.uid).set({
        'email':email.text,
        'password':password.text,

      });});
   return true;
  }catch(e)
  {print(e);}
}
 Future signOut()async{
  await _auth.signOut();
  _status = Status.Unauthenticated;
  notifyListeners();
  return Future.delayed(Duration.zero);


}




}