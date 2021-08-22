import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_practice/models/catalog.dart';
import 'package:flutter_practice/pages/main.dart';
// ignore: unused_import
import 'package:flutter_practice/widgets/drawer.dart';
// ignore: unused_import
import 'package:flutter_practice/widgets/item_widget.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:flutter_practice/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemes.creamColor,
      // appBar: AppBar(
      //   title: Text(
      //     "Catalog App",
      //   ),
      //   centerTitle: true,
      // ),
      //   body: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: (CatalogModel.items.isNotEmpty)
      //           ? GridView.builder(
      //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                   crossAxisSpacing: 12,
      //                   mainAxisSpacing: 12,
      //                   crossAxisCount: 2),
      //               itemBuilder: (context, index) {
      //                 final item = CatalogModel.items[index];
      //                 return Card(
      //                   clipBehavior: Clip.antiAlias,
      //                   shape: RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(12)),
      //                   child: GridTile(
      //                     header: Container(
      //                       child: Text(
      //                         item.name,
      //                         style: TextStyle(
      //                           color: Colors.white,
      //                         ),
      //                       ),
      //                       padding: const EdgeInsets.all(12),
      //                       decoration: BoxDecoration(
      //                         color: Colors.deepPurple,
      //                       ),
      //                     ),
      //                     child: Image.network(
      //                       item.image,
      //                       fit: BoxFit.contain,
      //                     ),
      //                     footer: Container(
      //                       child: Text(
      //                         "\$${item.price}",
      //                         style: TextStyle(
      //                           color: Colors.white,
      //                         ),
      //                       ),
      //                       padding: const EdgeInsets.all(12),
      //                       decoration: BoxDecoration(
      //                         color: Colors.black,
      //                       ),
      //                     ),
      //                   ),
      //                 );
      //               },
      //               itemCount: CatalogModel.items.length,
      //             )
      //           /*
      //           ListView.builder(
      //               itemCount: CatalogModel.items.length,
      //               itemBuilder: (context, index) {
      //                 return ItemWidget(
      //                   item: CatalogModel.items[index],
      //                 );
      //               },
      //             )
      //             */
      //           : Center(
      //               child: CircularProgressIndicator(),
      //             )),
      //   drawer: MyDrawer(),
      //
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
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
        CatalogImage(
          image: catalog.image,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.bold.color(MyThemes.darkBluish).make(),
              catalog.desc.text.caption(context).make(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyThemes.darkBluish),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Buy".text.make(),
                  ),
                ],
              ).pOnly(right: 8.5),
            ],
          ),
        )
      ],
    )).white.rounded.square(135).make().py8();
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl4.bold.color(MyThemes.darkBluish).make(),
        "Trending Products".text.xl2.color(MyThemes.darkBluish).make(),
      ],
    );
  }
}

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
