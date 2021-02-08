import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery_2/models/categorymodel.dart';
import 'package:fooddelivery_2/providers/productProvider.dart';
import 'package:fooddelivery_2/widgets/ProductWidget.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:provider/provider.dart';

import 'DetailsScreen.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryScreen({Key key, this.categoryModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
           ClipRRect(
             child: FadeInImage.memoryNetwork(
               placeholder: kTransparentImage,
               image: categoryModel.image,
               height: 160,
               fit: BoxFit.fill,
             ),
           ),
            SizedBox(
              height: 20,
            ),
      Column(
        children: productProvider.products.map((item)=>GestureDetector(
          child: ProductWidget(productModel: item),
        )
      ).toList()

            )
          ],
        ),
      ),

    );
  }
}
