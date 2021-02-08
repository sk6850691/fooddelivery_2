import 'package:flutter/cupertino.dart';
import 'package:fooddelivery_2/helpers/products.dart';
import 'package:fooddelivery_2/models/productmodel.dart';

class ProductProvider with ChangeNotifier{

  ProductService productService = ProductService();
  List <ProductModel> products = [];
  List <ProductModel> productByCategory = [];
  List <ProductModel> productByRestaurant = [];
  List <ProductModel> productsSearched = [];

  ProductProvider.initialize(){
    loadProducts();
  }
  loadProducts()async{
    products = await productService.getProducts();
    notifyListeners();

  }
  Future loadProductsByCategory({String CategoryName})async{
    productByCategory = await productService.getProductsofCategory(category: CategoryName);
    notifyListeners();



  }
  Future loadProductByRestaurant({String restaurantId})async{
    productByRestaurant = await productService.getProductsByRestaurant(id: restaurantId);
    notifyListeners();

}
Future search({String productName})async{
    productsSearched = await productService.searchProducts(productName: productName);
    notifyListeners();

}

}