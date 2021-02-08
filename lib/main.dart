import 'package:flutter/material.dart';
import 'package:fooddelivery_2/providers/categoryProvider.dart';
import 'package:fooddelivery_2/providers/productProvider.dart';
import 'package:fooddelivery_2/providers/restaurantProvider.dart';

import 'package:fooddelivery_2/providers/userProvider.dart';
import 'package:fooddelivery_2/providers/userProvider.dart';
import 'package:fooddelivery_2/screens/HomeScreen.dart';
import 'package:fooddelivery_2/screens/RegistrationScreen.dart';
import 'package:fooddelivery_2/screens/Splash.dart';
import 'package:fooddelivery_2/screens/loginScreen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(
          providers:
      [
       ChangeNotifierProvider.value(value: UserProvider.initialize()),
       ChangeNotifierProvider.value(value: RestaurantProvider.initialize(),),
        ChangeNotifierProvider.value(value: CategoryProvider.initialize(),),
        ChangeNotifierProvider.value(value: ProductProvider.initialize(),)
      ],



      child: MaterialApp(
        home: ScreenController()
       )));
}
class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);
    switch(auth.status){
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return HomeScreen();
      default:
        return LoginScreen();
    }
  }
}






