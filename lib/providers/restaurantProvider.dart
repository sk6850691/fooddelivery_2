import 'package:flutter/material.dart';
import 'package:fooddelivery_2/helpers/restaurantservice.dart';
import 'package:fooddelivery_2/models/restaurantmodel.dart';
class RestaurantProvider with ChangeNotifier{
  RestaurantService restaurantService = RestaurantService();
  List <RestaurantModel> restaurants = [];
  RestaurantProvider.initialize(){
    _loadRestaurant();
  }
  _loadRestaurant()async{
    restaurants = await restaurantService.getRestaurant();
    notifyListeners();

  }
}