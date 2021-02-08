import 'package:flutter/material.dart';
import 'package:fooddelivery_2/models/restaurantmodel.dart';
import 'package:transparent_image/transparent_image.dart';
class RestaurantWidget extends StatelessWidget {
  final RestaurantModel restaurant;

  const RestaurantWidget({Key key, this.restaurant}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,

                    ),
                  ),
                  Center(
                    child: FadeInImage.memoryNetwork(placeholder: kTransparentImage,image: restaurant.image)
                  )
                ],
              ),
            ),          )
        ],
      ),
    );
  }
}
