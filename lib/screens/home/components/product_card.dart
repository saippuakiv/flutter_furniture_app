import 'package:flutter/material.dart';
import 'package:furniture_app/components/title_text.dart';
import 'package:furniture_app/models/Product.dart';

import '../../../contans.dart';
import '../../../size_config.dart';
import 'details/detail_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.product,
    this.press1,
  }) : super(key: key);

  final Product? product;
  final Function? press1;

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    List<Product> products;
    return GestureDetector(
        onTap: press1!(),
        child: Container(
          width: defaultSize! * 14.5,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: AspectRatio(
            aspectRatio: 0.693,
            child: Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1,
                  child: Hero(
                    tag: product!.id!,
                    child: FadeInImage.assetNetwork(
                      placeholder: "assets/spinner.gif",
                      image: product!.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultSize),
                  child: TitleText(title: product!.title!),
                ),
                SizedBox(height: defaultSize / 2),
                Text("\$${product!.price}"),
                Spacer(),
              ],
            ),
          ),
        ));
  }
}
