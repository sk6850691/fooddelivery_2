import 'package:flutter/cupertino.dart';
import 'package:fooddelivery_2/helpers/categoryservice.dart';
import 'package:fooddelivery_2/models/categorymodel.dart';

class CategoryProvider extends ChangeNotifier{
  CategoryService categoryService = CategoryService();
  List<CategoryModel> categories = [];

  CategoryProvider.initialize(){
    _loadCategories();
  }
  _loadCategories()async{
   categories =  await categoryService.getCategories();
    notifyListeners();
  }

}