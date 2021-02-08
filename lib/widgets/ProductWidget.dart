import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery_2/models/productmodel.dart';
import 'package:provider/provider.dart';
import 'package:fooddelivery_2/providers/productProvider.dart';
import 'package:transparent_image/transparent_image.dart';
class ProductWidget extends StatelessWidget {
  final ProductModel productModel;

  const ProductWidget({Key key, this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 220,
      child: Padding(
        padding: const EdgeInsets.all(8.0),

        child: ClipRRect(
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: productModel.image,
          ),
        )
      ),

    );
  }
}
