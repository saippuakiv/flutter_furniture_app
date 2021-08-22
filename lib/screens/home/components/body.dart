import 'package:flutter/material.dart';
import 'package:furniture_app/components/title_text.dart';
import 'package:furniture_app/models/Product.dart';
import 'package:furniture_app/services/fetchCategories.dart';
import 'package:furniture_app/services/fetchProducts.dart';
import 'package:furniture_app/size_config.dart';

import 'categories.dart';
import 'recommend_products.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(defaultSize! * 2),
              child: TitleText(title: "Browse by Categories"),
            ),
            FutureBuilder(
              future: fetchCategories(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) =>
                  snapshot.hasData
                      ? Categories(
                          categories: snapshot.data,
                        )
                      : Center(child: Image.asset("assets.ripple.gif")),
            ),
            Divider(height: 5),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: TitleText(title: "Recommends For You"),
            ),
            FutureBuilder(
                future: fetchProducts(),
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  print(snapshot.data);
                  return snapshot.hasData
                      ? RecommendProducts(
                          products: snapshot.data,
                        )
                      : Center(child: Image.asset("assets/ripple.gif"));
                })
          ],
        ),
      ),
    );
  }
}
