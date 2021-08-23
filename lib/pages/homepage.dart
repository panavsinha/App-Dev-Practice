import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_practice/models/catalog.dart';
import 'package:flutter_practice/pages/main.dart';
// ignore: unused_import
import 'package:flutter_practice/widgets/drawer.dart';
import 'package:flutter_practice/widgets/home_widgets/catalog_header.dart';
// ignore: unused_import
import 'package:flutter_practice/widgets/item_widget.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:flutter_practice/widgets/themes.dart';
import 'package:flutter_practice/widgets/home_widgets/catalog_list.dart';

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
          padding: Vx.m16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                CatalogList().py4().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
