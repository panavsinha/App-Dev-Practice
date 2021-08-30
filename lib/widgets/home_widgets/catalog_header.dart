import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_practice/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App"
            .text
            .center
            .xl4
            .bold
            .color(context.theme.accentColor)
            .make(),
      ],
    );
  }
}
