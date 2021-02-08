import 'package:flutter/material.dart';
import 'package:fooddelivery_2/models/categorymodel.dart';
import 'package:fooddelivery_2/models/productmodel.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
class CategoryWidget extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryWidget({Key key, this.categoryModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Center(
            child: FadeInImage.memoryNetwork(placeholder: kTransparentImage,image: categoryModel.image,)
          )
        ],
      ),
    );
  }
}
