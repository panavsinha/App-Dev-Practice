import 'package:flutter/material.dart';
import 'package:flutter_practice/models/cart.dart';
import 'package:flutter_practice/models/catalog.dart';
import 'package:flutter_practice/pages/home_detail_page.dart';
import 'package:flutter_practice/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetail(catalog: catalog),
              )),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog})
      // ignore: unnecessary_null_comparison
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.bold.color(context.accentColor).make(),
                catalog.desc.text.caption(context).make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    AddToCart(
                      catalog: catalog,
                    ),
                  ],
                ).pOnly(right: 8.5),
              ],
            ),
          )
        ],
      ),
    ).color(context.cardColor).rounded.square(135).make().py8();
  }
}

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool Added = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Added = Added.toggle();
        final _catalog = CatalogModel();
        final _cart = Cart();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {});
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyThemes.darkBluish),
          shape: MaterialStateProperty.all(StadiumBorder())),
      child: Added ? Icon(Icons.done) : "Add to Cart".text.make(),
    );
  }
}
