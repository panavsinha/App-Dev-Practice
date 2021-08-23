import 'package:flutter/cupertino.dart';
import 'package:flutter_practice/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image})
      // ignore: unnecessary_null_comparison
      : assert(CatalogImage != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.color(MyThemes.creamColor).make().p16().w32(context);
  }
}
