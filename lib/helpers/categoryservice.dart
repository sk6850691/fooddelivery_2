import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery_2/models/categorymodel.dart';
class CategoryService{
  String collection = "categories";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future <List<CategoryModel>> getCategories()async{
    return await firestore.collection(collection).get().then((result){
      List <CategoryModel> categories = [];
      for(DocumentSnapshot category in result.docs){
        categories.add(CategoryModel.fromSnapshot(category));
      }
      return categories;
    }
    );
  }
}