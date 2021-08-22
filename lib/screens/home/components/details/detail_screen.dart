import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/contans.dart';
import 'package:furniture_app/models/Product.dart';
import 'package:furniture_app/size_config.dart';

import 'components/body_detail.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: buildAppBar(context),
      body: Bodydetail(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          icon: SvgPicture.asset("assets/icons/arrow-long-left.svg"),
          onPressed: () {
            Navigator.of(context).pop();
          }),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/bag.svg"),
          onPressed: () {},
        ),
        SizedBox(width: SizeConfig.defaultSize),
      ],
    );
  }
}
