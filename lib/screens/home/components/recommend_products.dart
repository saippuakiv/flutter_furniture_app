import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:furniture_app/components/title_text.dart';
import 'package:furniture_app/models/Product.dart';
import 'package:furniture_app/screens/home/components/details/detail_screen.dart';
import 'package:furniture_app/screens/home/components/product_card.dart';

import '../../../contans.dart';
import '../../../size_config.dart';

class RecommendProducts extends StatelessWidget {
  const RecommendProducts({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.all(defaultSize! * 2),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                SizeConfig.orientation == Orientation.portrait ? 2 : 4,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.693),
        itemBuilder: (context, index) => ProductCard(
            product: products[index],
            press1: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailsScreen(product: products[index])));
            }),
      ),
    );
  }
}
