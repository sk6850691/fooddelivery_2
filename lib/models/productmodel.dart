import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel{

  static const ID = "id";
  static const IMAGE = "image";
  static const Name = "name";
  static const RESTAURANTID = "restaurantid";
  static const CATEGORY = "category";


  String _id;
  String _image;
  String _name;
  String _restaurantid;
  String _category;

  get image =>_image;
  get id => _id;
  get name => _name;
  get restaurantid => _restaurantid;
  get category => _category;


  ProductModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot[ID];
    _image = snapshot[IMAGE];
    _name = snapshot[Name];
    _restaurantid = snapshot[RESTAURANTID];
    _category = snapshot[CATEGORY];


  }
}