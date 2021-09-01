import 'package:flutter/material.dart';
import 'package:flutter_practice/models/catalog.dart';
// ignore: unused_import
import 'package:flutter_practice/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetail extends StatelessWidget {
  final Item catalog;
  const HomeDetail({Key? key, required this.catalog})
      // ignore: unnecessary_null_comparison
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl2.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(context.theme.buttonColor),
                  shape: MaterialStateProperty.all(StadiumBorder())),
              child: "Add to Cart".text.xl.make(),
            ).wh(119, 45),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(
                catalog.image,
              ).box.color(Colors.white).p12.make().card.roundedLg.make(),
            ).h32(context),
            Expanded(
              child: Scaffold(
                backgroundColor: context.canvasColor,
                body: SingleChildScrollView(
                  child: VxArc(
                    //backgroundColor: context.canvasColor,
                    height: 30,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      color: context.cardColor,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          catalog.name.text.lg.bold
                              .color(context.accentColor)
                              .xl2
                              .make(),
                          catalog.desc.text.caption(context).bold.make(),
                          10.heightBox,
                          catalog.det.text.caption(context).make().px16(),
                        ],
                      ).py64(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
