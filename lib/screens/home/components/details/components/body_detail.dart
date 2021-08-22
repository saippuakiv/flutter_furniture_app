import 'package:flutter/material.dart';
import 'package:furniture_app/models/Product.dart';
import 'package:furniture_app/screens/home/components/details/components/product_info.dart';
import 'package:furniture_app/size_config.dart';

import 'product_description.dart';

class Bodydetail extends StatelessWidget {
  final Product? product;

  const Bodydetail({Key? key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
        child: SizedBox(
      width: double.infinity,
      height: SizeConfig.orientation == Orientation.landscape
          ? SizeConfig.screenWidth
          : SizeConfig.screenHeight! - AppBar().preferredSize.height,
      child: Stack(
        children: <Widget>[
          ProductInfo(product: product!),
          Positioned(
            top: defaultSize! * 37.5,
            left: 0,
            right: 0,
            child: ProductDescription(
              product: product!,
              press: () {},
            ),
          ),
          Positioned(
            top: defaultSize * 9.5,
            right: -defaultSize * 7.5,
            child: Hero(
              tag: product!.id!,
              child: Image.network(
                product!.image!,
                fit: BoxFit.cover,
                height: defaultSize * 37.8,
                width: defaultSize * 36.4,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
