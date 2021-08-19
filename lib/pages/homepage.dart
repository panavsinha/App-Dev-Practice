import 'package:flutter/material.dart';
import 'package:flutter_practice/models/catalog.dart';
import 'package:flutter_practice/pages/main.dart';
import 'package:flutter_practice/widgets/drawer.dart';
import 'package:flutter_practice/widgets/item_widget.dart';

void main() {
  runApp(MyApp());
}

class HomePage extends StatelessWidget {
  final int days = 30;
  final String isname = "Panav";
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
