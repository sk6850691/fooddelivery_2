import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fooddelivery_2/models/productmodel.dart';

class ProductService{
  String collection = "products";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<ProductModel>> getProducts()async{
    return await firestore.collection(collection).get().then((result){
      List<ProductModel> products = [];
      for (DocumentSnapshot product in result.docs){
      products.add(ProductModel.fromSnapshot(product));
      }
      return products;

    });

  }

  Future <List<ProductModel>>getProductsByRestaurant({String id})async{
   return await firestore.collection(collection).where("restaurantId", isEqualTo: id).get().then((result){
      List<ProductModel> products = [];
      for(DocumentSnapshot product in result.docs){
        products.add(ProductModel.fromSnapshot(product));
      }
      return products;
    });
  }

  Future getProductsofCategory({String category})async{
    return await firestore.collection(collection).where("category", isEqualTo: category).get().then((result){
      List<ProductModel> products = [];
      for(DocumentSnapshot product in result.docs){
        products.add(ProductModel.fromSnapshot(product));
      }
      return products;
    });
  }

  Future searchProducts({String productName})async{

    String searchKey = productName[0].toUpperCase()+ productName.substring(1);
    return await firestore.collection(collection).orderBy("name").
    startAt([searchKey]).endAt([searchKey + '\uf8ff']).get().then((result){
      List<ProductModel>products = [];
      for(DocumentSnapshot product in result.docs){
        products.add(ProductModel.fromSnapshot(product));
      }

    });
}

}