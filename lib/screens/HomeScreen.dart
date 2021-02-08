import 'package:flutter/material.dart';
import 'package:fooddelivery_2/providers/categoryProvider.dart';
import 'package:fooddelivery_2/providers/productProvider.dart';
import 'package:fooddelivery_2/providers/restaurantProvider.dart';
import 'package:fooddelivery_2/providers/userProvider.dart';
import 'package:fooddelivery_2/screens/loginScreen.dart';
import 'package:fooddelivery_2/widgets/categorywidget.dart';
import 'package:fooddelivery_2/widgets/restaurantwidget.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'CategoryScreen.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override

  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
        actions: [
          IconButton(
            onPressed: userProvider.signOut,
            icon: Icon(Icons.logout),

          )

        ],

      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('signout'),
              onTap: (){
                userProvider.signOut();
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
            )
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children:<Widget> [

            Container(height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:categoryProvider.categories.length,
              itemBuilder:(context,index){
                return
                    GestureDetector(
                      onTap: ()async{
                        await productProvider.loadProducts();
                        await productProvider.loadProductsByCategory(CategoryName: categoryProvider.categories[index].name);
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>CategoryScreen(categoryModel: categoryProvider.categories[index],)));
                      },
                      child: CategoryWidget(
                        categoryModel: categoryProvider.categories[index],
                      ),
                    );
              } ,
            ),),
            SizedBox(height: 10,),
            Column(
              children:
              restaurantProvider.restaurants.map((item)=> GestureDetector(
                child: RestaurantWidget(
                  restaurant: item),)).toList()
            )
          ],
        ),
      ),
    );
  }
}
