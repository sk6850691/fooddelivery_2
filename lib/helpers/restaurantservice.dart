import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fooddelivery_2/models/restaurantmodel.dart';
class RestaurantService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String collection = "restaurants";

  Future<List<RestaurantModel>> getRestaurant()async{
    return await firestore.collection(collection).get().then((result){
      List <RestaurantModel> restaurants = [];
      for(DocumentSnapshot restaurant in result.docs){
        restaurants.add(RestaurantModel.fromSnapshot(restaurant));

      }
      return restaurants;
    });
  }
}